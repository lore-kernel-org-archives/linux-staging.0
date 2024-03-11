Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB6E55E4A;
	Mon, 11 Mar 2024 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710180483; cv=none; b=UDJ2UJNbzxE4DLRtgsLVuuh/PqA/g53RRBGOtqVH8rCuvm6/8xMuJD7ZvuSx2axNliDWXGoDYRn9Ndf43dqvuMfDygrXFaofvxr+l8V17YgOIYMwchhLfZyuWv2le/LEy0RMjWv96K64ico++AKAXZbITycq+xjyqeRqJ0YFSck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710180483; c=relaxed/simple;
	bh=TtjcSFJzD1ZaiKH3GMBWqMzWiUymwQvzGYA6LQYJsms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vGhaiQQowQDwRVScobZ8KaIf3A+PyxuFGStWCCdsz2R/f5wp4mO5ItKC2bKRFVaXnAELloHZ4X63R+nFTcenCZKwBtq6vqkbASpHsUZZishuMBk3FRiWEcOaFzu/SayIQruIlzDF5mGNCtzqoovorE1FJi6Rkv+pY/fBbM7ptg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ5WLZtj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ5WLZtj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33e7946bddfso2506658f8f.0;
        Mon, 11 Mar 2024 11:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710180480; x=1710785280; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiTdgp2i9o6Qc3jLXuNAJ1XZ4ZXjWbgbhcsi2rEm3y0=;
        b=kJ5WLZtjNSEnCC4txB69w0FzYYRNhKGB4nRywtXryEROGviFobTapEZbN7JcM0gh90
         6vfUQtuYyxuE6S4r6Pbc+7D4AIO1xuzizYVWmuCAVczRmC00wUTv6J8C/NiIjptA+ld5
         blERycl9iZXBU20G76iDu1Bqa5TgEPMYBydBLvBITfIb/cl2u3Veol+NmLXGZxlRl3a1
         vwXISpRk8W6U0mzkf1xs8j1BZhYsJk0gETuaZhM7IqakgpkbuHyvqfqnudkiro44fFqO
         xj5rO0KGhC5UEr2CL3r8PbTCcFZinTt7V9FnZatR6Jvyw+2vfHfK2qLt0Khfk0hs/osb
         xKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710180480; x=1710785280;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiTdgp2i9o6Qc3jLXuNAJ1XZ4ZXjWbgbhcsi2rEm3y0=;
        b=iyvh6XI6MAsFUlOaq9VDevgn3aHbPrCWa6pf+b1XV0lSwXQX6ClpTck9FwsHdc3oTZ
         YmjPbQH13TBYmOQgQR43XwdNwgzFUvQZscCxLJ5uRbMG81LBnEG0wV+syLmHZdTbzBBf
         uU8Yb++XC+HmBLqtXDhpHTWpfK63f63lqptTzUoQvRXTULIBVQdK4jjyTskKazgjbwkv
         pGAphN6xz/uBoDKo2x6vJ30eHqE8YrU7bxQYNOBHHOrR0ja3g6v2ADf/pU6OTL+RNU9F
         F1biYNu7vLi+9zRosGa3477ivzUMQQvcyHOzb4w6eyeTnk+V0R6GX3Z+E/cVR+ut5i/S
         WDvw==
X-Forwarded-Encrypted: i=1; AJvYcCVXy/w3lBOk9xPbEMf0ZnOKPB0Lk9umnXTvOKb5RFoVNKbmCQIDGo19TrSJ1/QyPq/x7fuZT0yAe4cORQiKcJoCkXg3XD5n78ju8jxYag==
X-Gm-Message-State: AOJu0YzS17iat2WDWVe2FdoMeiYg6OFidOOTixDCQm5NddVoDuLlhzo0
	VeQYiujdFRP8EoeSQ+u/oo3+bmBVZEyVh8ibz/jbav+HmKKCAxLfW35Y4UjEZUfKZg==
X-Google-Smtp-Source: AGHT+IEnSAYRCmjpdDdukAm/E4JgNytzywkoKx5MGmmJG1cRliuHLBwk00Weun696vg1kCPJvzepTg==
X-Received: by 2002:a5d:4e90:0:b0:33e:9311:5fda with SMTP id e16-20020a5d4e90000000b0033e93115fdamr3637250wru.29.1710180479454;
        Mon, 11 Mar 2024 11:07:59 -0700 (PDT)
Received: from MOLeToid ([129.0.78.235])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b0033e91fed625sm4343811wrb.23.2024.03.11.11.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 11:07:58 -0700 (PDT)
Date: Mon, 11 Mar 2024 19:07:55 +0100
From: "Felix N. Kimbu" <felixkimbu1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: p80211conv: Rename local foo to decrypt_check
Message-ID: <Ze9Ie67PCSvBU+og@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This change renames the local variable foo to decrypt_check in functions
skb_ether_to_p80211(...) and skb_p80211_to_ether(...), giving intuitive
meaning to the identifier.

It also indents the parameters to match the the opening parentheses.

Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
---
 drivers/staging/wlan-ng/p80211conv.c | 30 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211conv.c b/drivers/staging/wlan-ng/p80211conv.c
index 8336435eccc2..a0413928a843 100644
--- a/drivers/staging/wlan-ng/p80211conv.c
+++ b/drivers/staging/wlan-ng/p80211conv.c
@@ -93,7 +93,7 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
 	struct wlan_ethhdr e_hdr;
 	struct wlan_llc *e_llc;
 	struct wlan_snap *e_snap;
-	int foo;
+	int decrypt_check;
 
 	memcpy(&e_hdr, skb->data, sizeof(e_hdr));
 
@@ -185,14 +185,14 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
 		p80211_wep->data = kmalloc(skb->len, GFP_ATOMIC);
 		if (!p80211_wep->data)
 			return -ENOMEM;
-		foo = wep_encrypt(wlandev, skb->data, p80211_wep->data,
-				  skb->len,
-				  wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
-				  p80211_wep->iv, p80211_wep->icv);
-		if (foo) {
+		decrypt_check = wep_encrypt(wlandev, skb->data, p80211_wep->data,
+				  					skb->len,
+									wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
+									p80211_wep->iv, p80211_wep->icv);
+		if (decrypt_check) {
 			netdev_warn(wlandev->netdev,
 				    "Host en-WEP failed, dropping frame (%d).\n",
-				    foo);
+				    decrypt_check);
 			kfree(p80211_wep->data);
 			return 2;
 		}
@@ -265,7 +265,7 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 	struct wlan_llc *e_llc;
 	struct wlan_snap *e_snap;
 
-	int foo;
+	int decrypt_check;
 
 	payload_length = skb->len - WLAN_HDR_A3_LEN - WLAN_CRC_LEN;
 	payload_offset = WLAN_HDR_A3_LEN;
@@ -305,15 +305,15 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
 				   "WEP frame too short (%u).\n", skb->len);
 			return 1;
 		}
-		foo = wep_decrypt(wlandev, skb->data + payload_offset + 4,
-				  payload_length - 8, -1,
-				  skb->data + payload_offset,
-				  skb->data + payload_offset +
-				  payload_length - 4);
-		if (foo) {
+		decrypt_check = wep_decrypt(wlandev, skb->data + payload_offset + 4,
+									payload_length - 8, -1,
+									skb->data + payload_offset,
+									skb->data + payload_offset +
+									payload_length - 4);
+		if (decrypt_check) {
 			/* de-wep failed, drop skb. */
 			netdev_dbg(netdev, "Host de-WEP failed, dropping frame (%d).\n",
-				   foo);
+				   decrypt_check);
 			wlandev->rx.decrypt_err++;
 			return 2;
 		}
-- 
2.34.1

