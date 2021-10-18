Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6657A2C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 08:20:57 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id w19so67480422edd.2
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoA1Yn8aH9TCjRrBoEN0Rv/9mSQgefs3J4mUTn03mx8=;
        b=XN5jcUuOsK2t3ZiIgA+J6ntqeRK9k7zU487nY3lPfZfpZ4EWvGw9Y/rqgqaTxsguPR
         B16tK0SeXYHkULuO5lriJVae4YrJqF/lRjWVFBwaOD2RGKilHNO96TxWg8Bb5Ii5Z67B
         tHZy7gHZ6hBRWmflTDf9acfyPg/7M3StxHA7Ndj9G3xGTSjZY4d1mTVXUAf0eRAmZIgh
         tpLoysSpxj5P5FLwKbD6LO7o1E9kWVTNUyEfwDpYSB0tbeuffOL2g4z+VfrfmEHdZ1ri
         PJOSLeurdLoePdfd/Np0Tv/pKt4m7equkFDk6iuBRd62gH3R1wfH+UyQHVKaMC10RzEH
         1NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoA1Yn8aH9TCjRrBoEN0Rv/9mSQgefs3J4mUTn03mx8=;
        b=Hmmv/JVlk6xHvzwJ3drWsAh/EBjxjy1GYagMzks49E+ZDVx27eDLYnM7qKOh/VmRbe
         2bjDVBXRQ18UGdPJ8pf+grVhnikkqaFRWsEqlYWkG41hWXPI2EVoHrh8zXOnwK8qG7YQ
         GZi0K5o2sl9/i6P3nnzn9+4CaNYyhD51nqv26D1X3pGOKZzMz4ZeVh/cvmdEEX6oN2WX
         YW3wCD+I7gFi3udNpMb72ncIb8D52uaiZieSYdMaIgcDnVnBftZ6ABxaypjN3cWOTlOA
         IS4BtKr8y9UkqAHZb+yBIbKQe9IrkQOqX1biNl0b/If0meVPizeVnaDEgl+ydbpjRRRe
         RpGw==
X-Gm-Message-State: AOAM533SGnDtsFjV4l3gdSORYsEz1kFQhjXVFPUVyG68JrQHe+dSKcP2
	z7lysAismeHe6Ixnp9uFurk=
X-Google-Smtp-Source: ABdhPJyNsVxXVstuxbVwkGRmTFbLj38JGAhNYRuOZ0hLeghkMx3ZeP0v03ggiLjSGrOJn4EqsJOu7A==
X-Received: by 2002:aa7:cd13:: with SMTP id b19mr1642125edw.219.1634545254126;
        Mon, 18 Oct 2021 01:20:54 -0700 (PDT)
Received: from tom-ThinkBook-14-G2-ARE.seco.it ([89.42.6.254])
        by smtp.gmail.com with ESMTPSA id h7sm10803457ede.19.2021.10.18.01.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 01:20:53 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: fix camelcase byData in card.c
Date: Mon, 18 Oct 2021 10:20:40 +0200
Message-Id: <20211018082042.15814-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camelcase variable byData in card.c

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/staging/vt6655/card.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 26e08fec6e6a..fac2d0566d2e 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -183,7 +183,7 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 	unsigned char bySlot = 0;
 	unsigned char bySIFS = 0;
 	unsigned char byDIFS = 0;
-	unsigned char byData;
+	unsigned char data;
 	int i;
 
 	/* Set SIFS, DIFS, EIFS, SlotTime, CwMin */
@@ -194,15 +194,15 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 			priv->abyBBVGA[0] = 0x20;
 			priv->abyBBVGA[2] = 0x10;
 			priv->abyBBVGA[3] = 0x10;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x1C)
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x1C)
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 
 		} else if (priv->byRFType == RF_UW2452) {
 			MACvSetBBType(priv->port_offset, BB_TYPE_11A);
 			priv->abyBBVGA[0] = 0x18;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x14) {
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x14) {
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 				bb_write_embedded(priv, 0xE1, 0x57);
 			}
@@ -220,14 +220,14 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 			priv->abyBBVGA[0] = 0x1C;
 			priv->abyBBVGA[2] = 0x00;
 			priv->abyBBVGA[3] = 0x00;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x20)
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x20)
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 
 		} else if (priv->byRFType == RF_UW2452) {
 			priv->abyBBVGA[0] = 0x14;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x18) {
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x18) {
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 				bb_write_embedded(priv, 0xE1, 0xD3);
 			}
@@ -243,14 +243,14 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 			priv->abyBBVGA[0] = 0x1C;
 			priv->abyBBVGA[2] = 0x00;
 			priv->abyBBVGA[3] = 0x00;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x20)
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x20)
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 
 		} else if (priv->byRFType == RF_UW2452) {
 			priv->abyBBVGA[0] = 0x14;
-			bb_read_embedded(priv, 0xE7, &byData);
-			if (byData == 0x18) {
+			bb_read_embedded(priv, 0xE7, &data);
+			if (data == 0x18) {
 				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
 				bb_write_embedded(priv, 0xE1, 0xD3);
 			}
@@ -798,12 +798,12 @@ bool CARDbGetCurrentTSF(struct vnt_private *priv, u64 *pqwCurrTSF)
 {
 	void __iomem *iobase = priv->port_offset;
 	unsigned short ww;
-	unsigned char byData;
+	unsigned char data;
 
 	MACvRegBitsOn(iobase, MAC_REG_TFTCTL, TFTCTL_TSFCNTRRD);
 	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
-		VNSvInPortB(iobase + MAC_REG_TFTCTL, &byData);
-		if (!(byData & TFTCTL_TSFCNTRRD))
+		VNSvInPortB(iobase + MAC_REG_TFTCTL, &data);
+		if (!(data & TFTCTL_TSFCNTRRD))
 			break;
 	}
 	if (ww == W_MAX_TIMEOUT)
-- 
2.33.1

