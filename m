Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2E93FC2
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286460; cv=none; b=Q/XD9sa+xCQd+8MDBztUM7nhFfiuiq22XwRkYR7DG78uKK3BEq4JAwCUSFWgvFbsailNIgyjtDeNWago3QiILlvnngihTS/ospRZFeR2Lld9lOvKLWIgd+wx3BfjUwoerl4IzM5oJDY5qjuhdfyDUiyPGaGe/usMtFYGrnMfekk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286460; c=relaxed/simple;
	bh=2LX/K8CY2AbfGo3cY0PsvK8XB6qi10XqO1W22X7aOpc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gX00Gd3EPr625LkfHcfrED1nO7TPO9M0qWTNbuYIEe+cxlP3MF5wfG+rqp/9MOxGEGbr7hw2/0AhpbChg5h2wYUm8d94GiLCYBTaQ2LILPFd9Rbm3e7nqEZd13GnKnKb7W0bOwPILAGfeFEIrwBCjqTg1Xd/bJPkvT17MrFRcQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3+s7CwK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3+s7CwK"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7141285db14so236117b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286458; x=1724891258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VvazKeNS87POsZjbzgnWrQjc2jlgCDlAmlWZn8lGc8=;
        b=e3+s7CwKNWhZSZ6ch7s6VEFexDEuaX2dnSOjHyBLb6VOdt7N9yUB/It0vYLxdYgDOm
         Tf4dLWAB4JM9yFbp4K9o9gRKYBEbLaavilwICgwT90g/pHXp8hhTpBs5FMZzRxPZlt7j
         +pFVzST+Ab5wxz5rk01rfIUO5lZ6jnnkhSybo1095rIUvyVlxIvd4/xx2nXMbOjdffhg
         +Q6WZxP3ho3R0TS6oYc3EfblDqyA6f/9e8J17uivf5VRkqSaWtfM340cgp66ofqjCup0
         9DaIM03j2gxeTOhtID4QnTIl44ghEU4TLWkL8DA+UmUJ/EnHafkt/BkRZvAoM78EAGLZ
         N1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286458; x=1724891258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VvazKeNS87POsZjbzgnWrQjc2jlgCDlAmlWZn8lGc8=;
        b=ulKqYS15GUVcIbkZEC3V7+hJGcgq0OsxknsKfkPWYVDKfxKKelm5+jAAPK9GdiJZHd
         l4/uNfISMzuIdzYGI+59d3CkrNa+D7t/B97g1LzlWbaC31u57OZH/v6aWFHwUHUJQbOq
         bCpNYry9yjCfK/hmtCftp2rpCaI9L327HwoTxiIE0Q3lTGl3kdw1l+l0RT6pimUUy7sy
         IlZ4e4J2O6YFuQmpwy33Tlj0liUuRsLYO2R0LDp1499GpDOzJmMgWw1pFdhgcjsdXfUk
         JB/ikKjcSkE/gGr9R3qJiLOaHUbe2sTe9Wy2KlZZu6RIu+On0+eh4RiB3cFk4qgxXHAR
         AGLg==
X-Forwarded-Encrypted: i=1; AJvYcCUdBxx46dpIYZbwlg84kpQ7N/2WtphQek3ZoeFFsmNFy0Qlwj0FahGvsd1ppjjIge7Rpeh0HLMfbfR5tK8i@lists.linux.dev
X-Gm-Message-State: AOJu0YwnCGhPxR+Ezc8q2mQTC6qn4J/pmfD28WVTjYUrJ9VRk8qLa03z
	DfPFWFoP+004QIkD6UeYwuJGGxaG6JM9zbTFi8GWhMNiQNtKcO9C
X-Google-Smtp-Source: AGHT+IGaGGsV7BXmQQJULorN9P/rSXT1FSVvbtxDUj38t4SlU6FZ57Yf3OdCTam3xiTdAEQznR+Jvg==
X-Received: by 2002:a05:6a21:2d0a:b0:1c4:9cec:ea0a with SMTP id adf61e73a8af0-1caeb3055camr284724637.37.1724286458175;
        Wed, 21 Aug 2024 17:27:38 -0700 (PDT)
Received: from fedora.unicamp.br ([2801:8a:c811:1:c43d:98d0:4d68:4b77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342555eesm236661b3a.56.2024.08.21.17.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:27:37 -0700 (PDT)
From: Gustavo Montenari Pechta <mrpechta@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix camel case
Date: Wed, 21 Aug 2024 21:27:30 -0300
Message-ID: <20240822002733.27609-1-mrpechta@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix camel case on variable name to match style convention

Signed-off-by: Gustavo Montenari Pechta <mrpechta@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 6ef38f4ca17c..14e50acb40b5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -240,7 +240,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 	const u8 bMac_Tmp_Addr[ETH_ALEN] = {0x00, 0xe0, 0x4c, 0x00, 0x00, 0x01};
 	u8 tempval;
 	u8 ICVer8192, ICVer8256;
-	u16 i, usValue, IC_Version;
+	u16 i, us_value, IC_Version;
 	u16 EEPROMId;
 
 	EEPROMId = rtl92e_eeprom_read(dev, 0);
@@ -256,12 +256,12 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		priv->eeprom_vid = rtl92e_eeprom_read(dev, EEPROM_VID >> 1);
 		priv->eeprom_did = rtl92e_eeprom_read(dev, EEPROM_DID >> 1);
 
-		usValue = rtl92e_eeprom_read(dev,
+		us_value = rtl92e_eeprom_read(dev,
 					     (EEPROM_Customer_ID >> 1)) >> 8;
-		priv->eeprom_customer_id = usValue & 0xff;
-		usValue = rtl92e_eeprom_read(dev,
+		priv->eeprom_customer_id = us_value & 0xff;
+		us_value = rtl92e_eeprom_read(dev,
 					     EEPROM_ICVersion_ChannelPlan >> 1);
-		IC_Version = (usValue & 0xff00) >> 8;
+		IC_Version = (us_value & 0xff00) >> 8;
 
 		ICVer8192 = IC_Version & 0xf;
 		ICVer8256 = (IC_Version & 0xf0) >> 4;
@@ -288,9 +288,9 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		u8 addr[ETH_ALEN];
 
 		for (i = 0; i < 6; i += 2) {
-			usValue = rtl92e_eeprom_read(dev,
+			us_value = rtl92e_eeprom_read(dev,
 				 (EEPROM_NODE_ADDRESS_BYTE_0 + i) >> 1);
-			*(u16 *)(&addr[i]) = usValue;
+			*(u16 *)(&addr[i]) = us_value;
 		}
 		eth_hw_addr_set(dev, addr);
 	} else {
@@ -321,10 +321,10 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 
 		if (priv->epromtype == EEPROM_93C46) {
 			if (!priv->autoload_fail_flag) {
-				usValue = rtl92e_eeprom_read(dev,
+				us_value = rtl92e_eeprom_read(dev,
 					  EEPROM_TxPwDiff_CrystalCap >> 1);
-				priv->eeprom_ant_pwr_diff = usValue & 0x0fff;
-				priv->eeprom_crystal_cap = (usValue & 0xf000)
+				priv->eeprom_ant_pwr_diff = us_value & 0x0fff;
+				priv->eeprom_crystal_cap = (us_value & 0xf000)
 							 >> 12;
 			} else {
 				priv->eeprom_ant_pwr_diff =
@@ -335,20 +335,20 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 
 			for (i = 0; i < 14; i += 2) {
 				if (!priv->autoload_fail_flag)
-					usValue = rtl92e_eeprom_read(dev,
+					us_value = rtl92e_eeprom_read(dev,
 						  (EEPROM_TxPwIndex_CCK + i) >> 1);
 				else
-					usValue = EEPROM_Default_TxPower;
+					us_value = EEPROM_Default_TxPower;
 				*((u16 *)(&priv->eeprom_tx_pwr_level_cck[i])) =
-								 usValue;
+								 us_value;
 			}
 			for (i = 0; i < 14; i += 2) {
 				if (!priv->autoload_fail_flag)
-					usValue = rtl92e_eeprom_read(dev,
+					us_value = rtl92e_eeprom_read(dev,
 						(EEPROM_TxPwIndex_OFDM_24G + i) >> 1);
 				else
-					usValue = EEPROM_Default_TxPower;
-				*((u16 *)(&priv->eeprom_tx_pwr_level_ofdm24g[i])) = usValue;
+					us_value = EEPROM_Default_TxPower;
+				*((u16 *)(&priv->eeprom_tx_pwr_level_ofdm24g[i])) = us_value;
 			}
 		}
 		if (priv->epromtype == EEPROM_93C46) {
-- 
2.46.0

