/*
 *************************************
 * Created by IntelliJ IDEA          *
 * User: Nhat                     *
 * Email: nhatnpa2508@gmail.com      *
 * Date: 6/25/2019                     *
 * Time: 5:05 PM                     *
 *************************************
 */

package service.user;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class Hashing {
    public Hashing() {
    }

    public byte[] createSalt() {
        byte[] bytes = new byte[7];
        SecureRandom random = new SecureRandom();
        random.nextBytes(bytes);
        return bytes;
    }

    public String generateHash(String password, byte[] salt) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("MD5");
        digest.reset();
        digest.update(salt);
        byte[] hash = digest.digest(password.getBytes());
        return bytesToStringHex(hash);
    }

    private final char[] hexArray = "0123456789ABCDEF".toCharArray();

    private String bytesToStringHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        for (int i = 0; i < bytes.length; i++) {
            int j = bytes[i] & 0xFF;
            hexChars[i * 2] = hexArray[j >>> 4];
            hexChars[i * 2 + 1] = hexArray[j & 0x0F];
        }
        return new String(hexChars);
    }

    public String byteToString(byte[] bytes) {
        String string = new String(bytes);
        return string;
    }

    public byte[] stringToByte(String string) {
        byte[] bytes = string.getBytes();
        return bytes;
    }
}