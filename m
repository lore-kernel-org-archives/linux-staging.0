Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807131FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:53:52 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99bcf3c8524so71843666b.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617230; x=1691222030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jZTouIE3bYlS4ML1ECutlOlFs3Ssf3ayt3aS6iRC8mI=;
        b=SNnlPt/BeIx4nHo/DW+/WEZl95UmgkWw3HxVw3ohC1u6I2aqHINyLLSeQ8FuJPf6lT
         ky/AmSBcFUMTCeThqK3KbKQS+Ppwup1zwP9H+ymvjtMkJDpG4pZyZ+T3VbmZoUYaaVS+
         70czk8zHc0kQaL3kUlchsLIwDROJv/69OAo9gcUPRhDXelRk/TCk9GZvab/9WkdU/kwo
         rzJHD2IYkGQuzPXwI4BFjxCApj7Baw8ox86sDJEl/RPpEQyZ9x2CncBWksBr/xaS1tgX
         Ndq2qgWj5IjnSZN7wwOqrhnz9LVDZxhVWkyTy+ctTAuuzZUmlmgoXGfElD9MfoEu75yB
         wGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617230; x=1691222030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZTouIE3bYlS4ML1ECutlOlFs3Ssf3ayt3aS6iRC8mI=;
        b=MfyoqtpWOe0kuL3EyWVJtNi3mEhFZvYYstDK4uP8CkwklY1RGfXQw6P7BurMeLeqWO
         qj3CTsikmzqNhkKG388uRKuUdcrYmlUk1I9WWlE6AipoUTqoI9tv4ctBheW1g6uZUq6E
         2RiyFE/rYhVzLuiQhF/2jWMJEec+e8Vdeeu0dOLizm03qZazlMTJZvv7xxgYEpr1cRTL
         n3Ow/gRBopjODaDlscJCnIgkwb88vPedPk5Hd9Mqta4TvZqHTMsEBAMEjO3AgUsezi3w
         XvQQw0AcHpZVAhV41hMhG/acW5FiDVaU/5q1bi1epkqcq4KYyCfmdo5BnuHYoCHQeJ/M
         wNug==
X-Gm-Message-State: ABy/qLajnMMORIvRNgHGDDKgtHfUdhmIkpVbmWzPY89VGmuKGmP+CUzh
	zdH3ZHBDBTgpJqry78trnd0=
X-Google-Smtp-Source: APBJJlEqTfqQQaB5nHCL80qYQsgm6XnYbcOdq+GVp2sJzulq6utdzf5i+PTL+RkDXqFEwmVkK/g4vw==
X-Received: by 2002:a17:906:73dd:b0:998:bac1:3bdd with SMTP id n29-20020a17090673dd00b00998bac13bddmr1353725ejl.2.1690617230519;
        Sat, 29 Jul 2023 00:53:50 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id i10-20020a170906250a00b0099304c10fd3sm2982067ejb.196.2023.07.29.00.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:53:50 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:53:48 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] staging: rtl8192e: Remove is_mesh from rtl92e_set_swcam
Message-ID: <5d324977054f3a27b89c5c73da82e9c01c6dca45.1690615475.git.philipp.g.hortmann@gmail.com>
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

Function rtl92e_set_swcam() has parameter is_mesh which is in all calls 0.
Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 16 +++++++---------
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c  | 10 ++++------
 3 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index 6d9e5c27017d..f9ddb8384752 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -50,7 +50,7 @@ void rtl92e_enable_hw_security_config(struct net_device *dev)
 
 void rtl92e_set_swcam(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 		      u16 KeyType, const u8 *MacAddr, u8 DefaultKey,
-		      u32 *KeyContent, u8 is_mesh)
+		      u32 *KeyContent)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_device *ieee = priv->rtllib;
@@ -58,14 +58,12 @@ void rtl92e_set_swcam(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 	if (EntryNo >= TOTAL_CAM_ENTRY)
 		return;
 
-	if (!is_mesh) {
-		ieee->swcamtable[EntryNo].bused = true;
-		ieee->swcamtable[EntryNo].key_index = KeyIndex;
-		ieee->swcamtable[EntryNo].key_type = KeyType;
-		memcpy(ieee->swcamtable[EntryNo].macaddr, MacAddr, 6);
-		ieee->swcamtable[EntryNo].useDK = DefaultKey;
-		memcpy(ieee->swcamtable[EntryNo].key_buf, (u8 *)KeyContent, 16);
-	}
+	ieee->swcamtable[EntryNo].bused = true;
+	ieee->swcamtable[EntryNo].key_index = KeyIndex;
+	ieee->swcamtable[EntryNo].key_type = KeyType;
+	memcpy(ieee->swcamtable[EntryNo].macaddr, MacAddr, 6);
+	ieee->swcamtable[EntryNo].useDK = DefaultKey;
+	memcpy(ieee->swcamtable[EntryNo].key_buf, (u8 *)KeyContent, 16);
 }
 
 void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
index 1ebd92e27441..fcfde5f6cf2f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
@@ -20,7 +20,7 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 		    u32 *KeyContent);
 void rtl92e_set_swcam(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 		      u16 KeyType, const u8 *MacAddr, u8 DefaultKey,
-		      u32 *KeyContent, u8 is_mesh);
+		      u32 *KeyContent);
 void rtl92e_cam_restore(struct net_device *dev);
 
 #endif
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 74747348b573..644762f925b7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -712,7 +712,7 @@ static int _rtl92e_wx_set_enc(struct net_device *dev,
 			rtl92e_set_key(dev, key_idx, key_idx, KEY_TYPE_WEP104,
 				       zero_addr[key_idx], 0, hwkey);
 			rtl92e_set_swcam(dev, key_idx, key_idx, KEY_TYPE_WEP104,
-					 zero_addr[key_idx], 0, hwkey, 0);
+					 zero_addr[key_idx], 0, hwkey);
 		} else {
 			netdev_info(dev,
 				    "wrong type in WEP, not WEP40 and WEP104\n");
@@ -857,21 +857,19 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 			if (ext->key_len == 13)
 				ieee->pairwise_key_type = alg = KEY_TYPE_WEP104;
 			rtl92e_set_key(dev, idx, idx, alg, zero, 0, key);
-			rtl92e_set_swcam(dev, idx, idx, alg, zero, 0, key, 0);
+			rtl92e_set_swcam(dev, idx, idx, alg, zero, 0, key);
 		} else if (group) {
 			ieee->group_key_type = alg;
 			rtl92e_set_key(dev, idx, idx, alg, broadcast_addr, 0,
 				       key);
-			rtl92e_set_swcam(dev, idx, idx, alg, broadcast_addr, 0,
-					 key, 0);
+			rtl92e_set_swcam(dev, idx, idx, alg, broadcast_addr, 0, key);
 		} else {
 			if ((ieee->pairwise_key_type == KEY_TYPE_CCMP) &&
 			     ieee->ht_info->bCurrentHTSupport)
 				rtl92e_writeb(dev, 0x173, 1);
 			rtl92e_set_key(dev, 4, idx, alg,
 				       (u8 *)ieee->ap_mac_addr, 0, key);
-			rtl92e_set_swcam(dev, 4, idx, alg,
-					 (u8 *)ieee->ap_mac_addr, 0, key, 0);
+			rtl92e_set_swcam(dev, 4, idx, alg, (u8 *)ieee->ap_mac_addr, 0, key);
 		}
 	}
 
-- 
2.41.0

