Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524801FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:53:57 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bcf3c8524so71844566b.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617235; x=1691222035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/cWNXtNWkZB1EXNrbyq7/j6lsC1SsNmw/WUGK+ol4U4=;
        b=OP8cB46YwORbeq8DePcyMkG0DslF+lYefcJarWenP3neEwdqUPNgikMAU2QkMTDHBA
         5lNgMpt8x00OfxhxD4bch2EUVEhGro0yi1/a8xhAvIXFbK/a9qNgGGU7Niivv1TCKpvg
         WKY7A2m27wZngPMys4ZMQD0j/1aIhSsABSk0skhkUcjtwpRzuBsmGtW0ZId2tlOap+FA
         5sgRAgKh8H43i3MetGvuB8744b4PsxHbugfd3j474TDLsrbzt8TOVKys1SsvUZe76C4I
         WzeKbLdrZSoS1VLrDKWlUvrOChP3AYvkiuitG19OtxaP0RA8jYtDMlCJucg4d0+F27RJ
         YWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617235; x=1691222035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cWNXtNWkZB1EXNrbyq7/j6lsC1SsNmw/WUGK+ol4U4=;
        b=NROj+7U1h7jagk9hp4eRIaTY/n/iyg2n2KwnVj/gFt03sPfh/HpnUXqXrHwpq9hSMT
         Txo0A4iLuCBjPhkeREzK6weHjzEHu7O7nt7AyJp0ObuKDD6z0g+zHIG5azuLWwuRe93v
         L3xuwajJY8TntigV7At2HybiIdIkZ4XJGuWxdOdTRBkbn4uAo3Yppwbo/XUP2x5A4ad+
         HIH4ZdpEZYmm4A3bLjJhc6qUYnlvtfUiyq9UMaYejLE/Tfm2lPSrVI8EKuqfVH3fmCNR
         UJeRaQrUz9EeRHz0nyMcChaVK3kXnj9DzhKWjuReurQFGHH6uceIfWXxzvDPYaLCnzSI
         br7w==
X-Gm-Message-State: ABy/qLZbz3ah9go+44zI/B1Lg5wLGbozQBmUBF+FpdbqPzU6eCOjRyxb
	D33mSQ2cO5rI1Sl7g+pN84FLtn2BCMI=
X-Google-Smtp-Source: APBJJlEy1d3dMdMhZQIrxMTC2h/2G5mapgplcTZ5OPNc0ppw6M0covT6fayqx1AvveNGYEpq3ygd0g==
X-Received: by 2002:a17:906:6489:b0:993:d88e:41e3 with SMTP id e9-20020a170906648900b00993d88e41e3mr1297335ejm.4.1690617235540;
        Sat, 29 Jul 2023 00:53:55 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id qq5-20020a17090720c500b009882e53a42csm2994460ejb.81.2023.07.29.00.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:53:55 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:53:53 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] staging: rtl8192e: Remove DefaultKey from
 rtl92e_set_swcam
Message-ID: <9390014fe045028ac2a32ce7c9745c7cddbd4adf.1690615475.git.philipp.g.hortmann@gmail.com>
References: <cover.1690615475.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690615475.git.philipp.g.hortmann@gmail.com>

Function rtl92e_set_swcam() has parameter DefaultKey which is in all calls
0. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 5 ++---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h | 3 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c  | 8 ++++----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index f9ddb8384752..944cc73fb2b6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -49,8 +49,7 @@ void rtl92e_enable_hw_security_config(struct net_device *dev)
 }
 
 void rtl92e_set_swcam(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
-		      u16 KeyType, const u8 *MacAddr, u8 DefaultKey,
-		      u32 *KeyContent)
+		      u16 KeyType, const u8 *MacAddr, u32 *KeyContent)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_device *ieee = priv->rtllib;
@@ -62,7 +61,7 @@ void rtl92e_set_swcam(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 	ieee->swcamtable[EntryNo].key_index = KeyIndex;
 	ieee->swcamtable[EntryNo].key_type = KeyType;
 	memcpy(ieee->swcamtable[EntryNo].macaddr, MacAddr, 6);
-	ieee->swcamtable[EntryNo].useDK = DefaultKey;
+	ieee->swcamtable[EntryNo].useDK = 0;
 	memcpy(ieee->swcamtable[EntryNo].key_buf, (u8 *)KeyContent, 16);
 }
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
index fcfde5f6cf2f..bd33ef105107 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
@@ -19,8 +19,7 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 		    u16 KeyType, const u8 *MacAddr, u8 DefaultKey,
 		    u32 *KeyContent);
 void rtl92e_set_swcam(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
-		      u16 KeyType, const u8 *MacAddr, u8 DefaultKey,
-		      u32 *KeyContent);
+		      u16 KeyType, const u8 *MacAddr, u32 *KeyContent);
 void rtl92e_cam_restore(struct net_device *dev);
 
 #endif
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 644762f925b7..189798852568 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -712,7 +712,7 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
 			rtl92e_set_key(dev, key_idx, key_idx, KEY_TYPE_WEP104,
 				       zero_addr[key_idx], 0, hwkey);
 			rtl92e_set_swcam(dev, key_idx, key_idx, KEY_TYPE_WEP104,
-					 zero_addr[key_idx], 0, hwkey);
+					 zero_addr[key_idx], hwkey);
 		} else {
 			netdev_info(dev,
 				    "wrong type in WEP, not WEP40 and WEP104\n");
@@ -857,19 +857,19 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 			if (ext->key_len == 13)
 				ieee->pairwise_key_type = alg = KEY_TYPE_WEP104;
 			rtl92e_set_key(dev, idx, idx, alg, zero, 0, key);
-			rtl92e_set_swcam(dev, idx, idx, alg, zero, 0, key);
+			rtl92e_set_swcam(dev, idx, idx, alg, zero, key);
 		} else if (group) {
 			ieee->group_key_type = alg;
 			rtl92e_set_key(dev, idx, idx, alg, broadcast_addr, 0,
 				       key);
-			rtl92e_set_swcam(dev, idx, idx, alg, broadcast_addr, 0, key);
+			rtl92e_set_swcam(dev, idx, idx, alg, broadcast_addr, key);
 		} else {
 			if ((ieee->pairwise_key_type == KEY_TYPE_CCMP) &&
 			     ieee->ht_info->bCurrentHTSupport)
 				rtl92e_writeb(dev, 0x173, 1);
 			rtl92e_set_key(dev, 4, idx, alg,
 				       (u8 *)ieee->ap_mac_addr, 0, key);
-			rtl92e_set_swcam(dev, 4, idx, alg, (u8 *)ieee->ap_mac_addr, 0, key);
+			rtl92e_set_swcam(dev, 4, idx, alg, (u8 *)ieee->ap_mac_addr, key);
 		}
 	}
 
-- 
2.41.0

