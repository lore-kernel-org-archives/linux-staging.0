Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70136FAE
	for <linux-staging@lists.linux.dev>; Thu,  7 Sep 2023 13:10:32 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bc0d39b52cso7305265ad.2
        for <linux-staging@lists.linux.dev>; Thu, 07 Sep 2023 06:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694092232; x=1694697032; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5s7dP/467ayuNbwseHDZNpW6f/FXrHQn/xG7mdHTFw=;
        b=X3lvV91lEAON83IWuCibZQGmLznXg2b/A9lK6p/UDD8D9bbiYA8/95nvqxWaLDzW14
         X04+3MocL13mrfYg+nZy8ku8dMwKV4EnRD0eAb55+FdK7mwtjnJZAzLtotOrBS+HQEGP
         1izQKBk1qjstwtV04RlplFCUDzjDe2/Sw7+1d8JZ4HwwoNgJlpoG8DpzMv3e4j2piEKm
         1MlKGBnZqOSH8DhV9mUAqHiVPMfcFer77IcmOj3lTeIQrvVBTAP8m3/dcUzDtHWY30l8
         CrhDH294A7ZmOd1XMJGNniHFWNFPRfVxT4TmP8AZlt2D0p+k3eiKyTD6oyOwc2+kBLUD
         zzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694092232; x=1694697032;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5s7dP/467ayuNbwseHDZNpW6f/FXrHQn/xG7mdHTFw=;
        b=jwDtylB4bjlD9cgQ/d1uHnt9QYLQAo+XkZsa9qrm+srR3NuhcjGF7CcXDIBgivPV5K
         +uPYg7IdOIUC5f+lv4P2LCKZIBLf027p2bPbsagSOp3r4CbUff9c3OStDfDreYISIKkV
         f0nukFAVAr/yeYonWLqJDYOT6fdAFXRoY+S2vK3wrhTneuEAefgsBlPBl6oj2MtXxrIm
         Ywqg0VG33dEkkdGvnyfvKYwEF3z5YK9lDHamyRCVKANiUEm32rpP5vh126sdHSwUWVXt
         bcnx6s0mdALDoBDFxMJPVIg9DJzgkPiz2UwEDDBwWB8ucYiOODRpHQe2FeMaVCwJl2aX
         vjPQ==
X-Gm-Message-State: AOJu0YyX5WtI1ZiW3EApaLxqLbpqUhykCycHwnKUzDxmbiGmcByZN2YI
	1XtvsSN1IgDMpnOeew+dymI=
X-Google-Smtp-Source: AGHT+IHWLQsE90vf68sFqBp5ASDgOSjrW13RN3R3Ry8rG3Cv2AwZ7QAy/csTDJei8Xz+vJqSQ+G0Kw==
X-Received: by 2002:a17:903:22cb:b0:1c3:749f:6a5c with SMTP id y11-20020a17090322cb00b001c3749f6a5cmr1453874plg.12.1694092231970;
        Thu, 07 Sep 2023 06:10:31 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([223.178.252.251])
        by smtp.gmail.com with ESMTPSA id y21-20020a170902ed5500b001bb7a736b4csm12789595plb.77.2023.09.07.06.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 06:10:31 -0700 (PDT)
Date: Thu, 7 Sep 2023 18:40:27 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: vt6655: Type encoding info dropped from array
 name "byVT3253B0_"
Message-ID: <ZPnLw+njcL/D391S@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Below array names updated as per coding guidelines:

   1.byVT3253B0_AGC4_RFMD2959
   2.byVT3253B0_AIROHA2230
   3.byVT3253B0_UW2451
   4.byVT3253B0_AGC

   Conversions performed:
   a.type encoding info dropped from names
   b.names replaced by snakecase

   Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 v1 -> v2: Name of the tool added in the body of explanation,
           which found this issue

 v2 -> v3: subject modified to more specific detail
 
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

