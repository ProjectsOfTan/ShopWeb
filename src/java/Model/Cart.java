/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import static Controller.DetailProduct.withLargeIntegers;
import dal.ProductDAO;
import jakarta.servlet.http.Cookie;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wth0z
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    private Item getItemByID(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    private Item getItemByIDandSize(int id, String size) {
        for (Item i : items) {
            if (i.getProduct().getId() == id && i.getSize().equals(size)) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id, String size) {
        return getItemByIDandSize(id, size).getQuantity();
    }

    public int getTotalQuantity() {
        int i = 0;
        for (int j = 0; j < items.size(); j++) {
            i += items.get(j).getQuantity();
        }
        return i;
    }

    public void addItem(Item t) {
        if (getItemByID(t.getProduct().getId()) != null) {
            Item m = getItemByID(t.getProduct().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            items.remove(getItemByID(id));
        }
    }

    public String getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            String temp = i.getProduct().getUnit_price().replace(".", "");
            String dis = i.getProduct().getDiscount();
            if (i.getProduct().getDiscount().equals(0)) {
                t += (i.getQuantity() * Integer.parseInt(temp));
            } else {
                int n = (Integer.parseInt(temp) - Integer.parseInt(temp) * Integer.parseInt(dis) / 100);
                n = n / 1000;
                t += (i.getQuantity() * n * 1000);
            }
        }
        String total = String.valueOf(withLargeIntegers(t)).replace(",", ".");
        return total;
    }

    public String getMoneyPerItem(int id) {
        double t = 0;
        ProductDAO pdb = new ProductDAO();
        Product p = pdb.getProductById(id);
        String temp = p.getUnit_price().replace(".", "");
        String dis = p.getDiscount();
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                if (p.getDiscount().equals(0)) {
                    t += (i.getQuantity() * Integer.parseInt(temp));
                    break;
                } else {
                    int n = (Integer.parseInt(temp) - Integer.parseInt(temp) * Integer.parseInt(dis) / 100);
                    n = n / 1000;
                    t += (i.getQuantity() * n * 1000);
                    break;
                }
            }
        }
        String total = String.valueOf(withLargeIntegers(t)).replace(",", ".");
        return total;
    }

    private Product getProductById(int id, List<Product> list) {
        for (Product i : list) {
            if (i.getId() == id) {
                return i;
            }
        }
        return null;
    }

    public static String withLargeIntegers(double value) {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(value);
    }

    public Cart(String txt) {
        items = new ArrayList<>();
        List<Item> it = new ArrayList<>();
        ProductDAO pdb = new ProductDAO();
        try {
            if (txt != null && !txt.isEmpty()) {
                if (txt.contains(":")) {
                    String[] s = txt.split(":");
                    for (String i : s) {
                        String[] n = i.split("-");
                        int id = Integer.parseInt(n[0]);
                        int quantity = Integer.parseInt(n[1]);
                        String size = n[2];
                        Product p = pdb.getProductById(id);
                        String temp = p.getUnit_price().replace(".", "");
                        int price = Integer.parseInt(temp);
                        String price_str = "";
                        if (!p.getDiscount().equals("0")) {
                            int discount = Integer.parseInt(p.getDiscount());
                            int sum = (price - (price * discount / 100)) / 1000;
                            sum *= 1000 * quantity;
                            price_str = String.valueOf(withLargeIntegers(sum)).replace(",", ".");
                        } else {
                            int sum = price * quantity;
                            price_str = String.valueOf(withLargeIntegers(sum)).replace(",", ".");
                        }
                        Item t = new Item(p, quantity, price_str, size);
                        it.add(t);
                    }
                    int i = 0;
                    while (!it.isEmpty()) {
                        items.add(it.get(0));
                        it.remove(0);
                        for (int j = 0; j < it.size();) {
                            if (it.get(j).getProduct().getId()
                                    == items.get(i).getProduct().getId()
                                    && it.get(j).getSize().equals(items.get(i).getSize())) {
                                items.get(i).setQuantity(it.get(j).getQuantity() + items.get(i).getQuantity());
                                it.remove(j);
                                if (j == 0) {
                                    j = 0;
                                } else {
                                    j--;
                                }
                            } else {
                                j++;
                            }
                        }
                        i++;
                    }
                } else {
                    String[] n = txt.split("-");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    String size = n[2];
                    Product p = pdb.getProductById(id);
                    String temp = p.getUnit_price().replace(".", "");
                    int price = Integer.parseInt(temp);
                    String price_str = "";
                    if (!p.getDiscount().equals("0")) {
                        int discount = Integer.parseInt(p.getDiscount());
                        int sum = (price - (price * discount / 100)) / 1000;
                        sum *= 1000 * quantity;
                        price_str = String.valueOf(withLargeIntegers(sum)).replace(",", ".");
                    } else {
                        int sum = price * quantity;
                        price_str = String.valueOf(withLargeIntegers(sum)).replace(",", ".");
                    }
                    Item t = new Item(p, quantity, price_str, size);
                    items.add(t);
                }

            } else {
                items = null;
            }
        } catch (Exception e) {
            System.out.println("cart:" + e);
        }
    }
}
