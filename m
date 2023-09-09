Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F46C30F89
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 09:57:45 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68bed8de5b9so2399718b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 02:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694253464; x=1694858264; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XD+8pYxUi+ogRHv4AC7gYe0Zq88ppHoOhVnzae3sPE=;
        b=eUgutMhxRArVyWKBppvj1xpNIDI/dhb8CAta+kK6mF1vyWlogvFP/C9AzJqgcFB2V4
         RbW/rHVPHoYEZ6aHKPvQRJyNxzVZY7+zWBziGbk7E9ltDF+aeg+UbMeUheqZt98WLDIe
         GFJYOBe2ZInkOgNWaxEISaWYn+Zzi1Nk+2GgWgsjHi2flngoRZJg5b7oBni5NbWZat3d
         yZ5l8u4tPy75tw9ORTk+FK+jr7GHyXSF9QjBRFqkAUerhmdvuuRuFbog7Kq/6OYnbtAT
         8A3d7V+p844HI1GBvUst2pRx07dYKFhKC+fdsbBTCUkO2/jgieOIHY7pK4pBD3Y8bkE+
         JnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694253464; x=1694858264;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XD+8pYxUi+ogRHv4AC7gYe0Zq88ppHoOhVnzae3sPE=;
        b=LIoe3IACZ0RGBpF/Yy+Oe1SvfS7h4/Xruj8yL1gX0w+L2VcK9yzJd+KLG5J+dKptbZ
         IqiBFnbMQAeKqmhJkoTJ6bzFsEQKiMpxCSsyQ/Y3r8WRH+0qGGxXiwljpg1Gx+WaAOv3
         5isy22/IQTNdC4fWfV3AatL425RB+X1npH+1f5wf01DvQpcIFXaGhU1Mxbq4A4wiuyF0
         5VS6segAJd4Rn4pk7v4wGYBlk5ahi3sbth/4H2DLrBwRs5Et/ebFmgdmKMSL1amB4xZT
         RlPyHw/gM/Q9lxDSZs6IqYr21VZUHnxPz4IpMwGgJgYPi39eG1eqGu8T69eBzpF6zwPq
         /ofg==
X-Gm-Message-State: AOJu0Yxo2ZQ0/CfoSJgJtKcnQVYgngIHWfDWd+vP7cO96WmoS9z1k8zF
	Jcn1MMh4a2iXJ5BWt5DMSmA=
X-Google-Smtp-Source: AGHT+IHmTxXaOnLWPjRC22e3VrJ6vLDOa5LDhi++Th5Mt7HyB2rRUET0Dhzo+UO65cQrppH2zg0oEg==
X-Received: by 2002:a05:6a20:7f81:b0:13a:ccb9:d5b7 with SMTP id d1-20020a056a207f8100b0013accb9d5b7mr5531917pzj.41.1694253464534;
        Sat, 09 Sep 2023 02:57:44 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([223.178.252.251])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902c11100b001b8a1a25e6asm2922397pli.128.2023.09.09.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 02:57:44 -0700 (PDT)
Date: Sat, 9 Sep 2023 15:27:40 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: vt6655: Type encoding info dropped from array
 name "byVT3253B0_"
Message-ID: <ZPxBlBG7ObqsDMOS@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Array names starting with "byVT3253B0_" updated like below:

a.type encoding info dropped from names
b.camelcase names replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 v1 -> v2: Name of the tool added in the body of explanation,
            which found this issue

 v2 -> v3: subject modified to more specific detail
 
 v3 -> v4: changelog modified to fix indentation and breif description

 drivers/staging/vt6655/baseband.c | 32 +++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 696d4dd03aa2..55224918794b 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -761,7 +761,7 @@ static const unsigned char vt3253b0_rfmd[CB_VT3253B0_INIT_FOR_RFMD][2] = {
 #define CB_VT3253B0_AGC_FOR_RFMD2959 195
 /* For RFMD2959 */
 static
-unsigned char byVT3253B0_AGC4_RFMD2959[CB_VT3253B0_AGC_FOR_RFMD2959][2] = {
+unsigned char vt3253b0_agc4_rfmd2959[CB_VT3253B0_AGC_FOR_RFMD2959][2] = {
 	{0xF0, 0x00},
 	{0xF1, 0x3E},
 	{0xF0, 0x80},
@@ -962,7 +962,7 @@ unsigned char byVT3253B0_AGC4_RFMD2959[CB_VT3253B0_AGC_FOR_RFMD2959][2] = {
 #define CB_VT3253B0_INIT_FOR_AIROHA2230 256
 /* For AIROHA */
 static
-unsigned char byVT3253B0_AIROHA2230[CB_VT3253B0_INIT_FOR_AIROHA2230][2] = {
+unsigned char vt3253b0_airoha2230[CB_VT3253B0_INIT_FOR_AIROHA2230][2] = {
 	{0x00, 0x31},
 	{0x01, 0x00},
 	{0x02, 0x00},
@@ -1223,7 +1223,7 @@ unsigned char byVT3253B0_AIROHA2230[CB_VT3253B0_INIT_FOR_AIROHA2230][2] = {
 
 #define CB_VT3253B0_INIT_FOR_UW2451 256
 /* For UW2451 */
-static unsigned char byVT3253B0_UW2451[CB_VT3253B0_INIT_FOR_UW2451][2] = {
+static unsigned char vt3253b0_uw2451[CB_VT3253B0_INIT_FOR_UW2451][2] = {
 	{0x00, 0x31},
 	{0x01, 0x00},
 	{0x02, 0x00},
@@ -1484,7 +1484,7 @@ static unsigned char byVT3253B0_UW2451[CB_VT3253B0_INIT_FOR_UW2451][2] = {
 
 #define CB_VT3253B0_AGC 193
 /* For AIROHA */
-static unsigned char byVT3253B0_AGC[CB_VT3253B0_AGC][2] = {
+static unsigned char vt3253b0_agc[CB_VT3253B0_AGC][2] = {
 	{0xF0, 0x00},
 	{0xF1, 0x00},
 	{0xF0, 0x80},
@@ -2010,8 +2010,8 @@ bool bb_vt3253_init(struct vnt_private *priv)
 
 			for (ii = 0; ii < CB_VT3253B0_AGC_FOR_RFMD2959; ii++)
 				result &= bb_write_embedded(priv,
-					byVT3253B0_AGC4_RFMD2959[ii][0],
-					byVT3253B0_AGC4_RFMD2959[ii][1]);
+					vt3253b0_agc4_rfmd2959[ii][0],
+					vt3253b0_agc4_rfmd2959[ii][1]);
 
 			iowrite32(0x23, iobase + MAC_REG_ITRTMSET);
 			vt6655_mac_reg_bits_on(iobase, MAC_REG_PAPEDELAY, BIT(0));
@@ -2027,12 +2027,12 @@ bool bb_vt3253_init(struct vnt_private *priv)
 	} else if ((by_rf_type == RF_AIROHA) || (by_rf_type == RF_AL2230S)) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_AIROHA2230; ii++)
 			result &= bb_write_embedded(priv,
-				byVT3253B0_AIROHA2230[ii][0],
-				byVT3253B0_AIROHA2230[ii][1]);
+				vt3253b0_airoha2230[ii][0],
+				vt3253b0_airoha2230[ii][1]);
 
 		for (ii = 0; ii < CB_VT3253B0_AGC; ii++)
 			result &= bb_write_embedded(priv,
-				byVT3253B0_AGC[ii][0], byVT3253B0_AGC[ii][1]);
+				vt3253b0_agc[ii][0], vt3253b0_agc[ii][1]);
 
 		priv->abyBBVGA[0] = 0x1C;
 		priv->abyBBVGA[1] = 0x10;
@@ -2045,13 +2045,13 @@ bool bb_vt3253_init(struct vnt_private *priv)
 	} else if (by_rf_type == RF_UW2451) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_UW2451; ii++)
 			result &= bb_write_embedded(priv,
-				byVT3253B0_UW2451[ii][0],
-				byVT3253B0_UW2451[ii][1]);
+				vt3253b0_uw2451[ii][0],
+				vt3253b0_uw2451[ii][1]);
 
 		for (ii = 0; ii < CB_VT3253B0_AGC; ii++)
 			result &= bb_write_embedded(priv,
-				byVT3253B0_AGC[ii][0],
-				byVT3253B0_AGC[ii][1]);
+				vt3253b0_agc[ii][0],
+				vt3253b0_agc[ii][1]);
 
 		iowrite8(0x23, iobase + MAC_REG_ITRTMSET);
 		vt6655_mac_reg_bits_on(iobase, MAC_REG_PAPEDELAY, BIT(0));
@@ -2067,12 +2067,12 @@ bool bb_vt3253_init(struct vnt_private *priv)
 	} else if (by_rf_type == RF_VT3226) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_AIROHA2230; ii++)
 			result &= bb_write_embedded(priv,
-				byVT3253B0_AIROHA2230[ii][0],
-				byVT3253B0_AIROHA2230[ii][1]);
+				vt3253b0_airoha2230[ii][0],
+				vt3253b0_airoha2230[ii][1]);
 
 		for (ii = 0; ii < CB_VT3253B0_AGC; ii++)
 			result &= bb_write_embedded(priv,
-				byVT3253B0_AGC[ii][0], byVT3253B0_AGC[ii][1]);
+				vt3253b0_agc[ii][0], vt3253b0_agc[ii][1]);
 
 		priv->abyBBVGA[0] = 0x1C;
 		priv->abyBBVGA[1] = 0x10;
-- 
2.34.1

