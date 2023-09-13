Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3199018C2D
	for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 11:53:22 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68fc9e0e22eso2490329b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Sep 2023 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694606002; x=1695210802; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txo6BrtzsDRNaEZGpUrtKI7Bla2kdgHJ0hJV7p2Zrw0=;
        b=gU14l2Tpw4eb+iKiajexNhzV5LbhXkDXq5d5s3LAiTgOG8tAlScnqddSRt+lpuufcm
         pCxqZDuW7t7elwBvmwXbsbAvZjegQ3OPLHwm/ZUOi/o1yqO44uUCaHHGsFw3zKDUKRmW
         jQy26wkSa2puH8KiKSD60IF6dlwdOcDHuix6OQDUlrB35YRuKxTVVALYr7gUZGDLHz9O
         mQgvumy9mIJQ2Fx0kaFwM511pXz6WLQexxV199psq/0pQETpIQNpneRJIo+7APiReOmX
         M6CYMoniF3iGUNB+vDYOBMVUXgijs+2dkCKKoMXlh2cc7whUV83x3KozcEklT9widW3+
         gpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694606002; x=1695210802;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txo6BrtzsDRNaEZGpUrtKI7Bla2kdgHJ0hJV7p2Zrw0=;
        b=w8WtAqsfI66XzyzZ6kaj6wRTKenTM2BCRs3U0N+MIduufM8fdVzGd/DqUCgFNkBByK
         fNF9UlMh4QQnDlGypBwLu+F+SAh0SOF5q8meSTjj0+galdPZ7ZpOAbCXlR/tC82q4Xst
         x0FLhwYlzr7JL4mN2Y3yX1kByUh6JVTIq5zRl2OVsilby/DuBEGiHPOU5oZCuc4psQjE
         T5FmZsvbKckjDel7JEhHMGsvSmArBTQXB27F1ThgNPO0voCKcwfb/uW3Fqr2cJjh5qdR
         0SvAPMqS6MBINh+h0quPuWuHKvgdn4ShGF5bBN76YUCmMmiqx/MA81L6TXKrfT0NNA8e
         aR5w==
X-Gm-Message-State: AOJu0YzVBxJ5NxKK40g3vDqKp8YxujUUhmEpgguxDX55SE5t/e19s9vJ
	ZvEIR7ILQlzgK0DbMZWMPlc=
X-Google-Smtp-Source: AGHT+IGbgoTo2RvBzKjh9GfwnT9NZRJ9a9RTK6ZJEujchnEVcUAKSI7fxMTZQPzPHLo8Tpk1veoFlQ==
X-Received: by 2002:a05:6a00:1747:b0:68e:3b0b:8192 with SMTP id j7-20020a056a00174700b0068e3b0b8192mr2793651pfc.21.1694606002311;
        Wed, 13 Sep 2023 04:53:22 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([106.205.101.29])
        by smtp.gmail.com with ESMTPSA id j22-20020a62e916000000b006870ed427b2sm9211275pfh.94.2023.09.13.04.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:53:22 -0700 (PDT)
Date: Wed, 13 Sep 2023 17:23:12 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5] staging: vt6655: Type encoding info dropped from array
 name "byVT3253B0_"
Message-ID: <ZQGiqA2GoDp/WiPK@ubuntu.myguest.virtualbox.org>
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

v3 -> v4: changelog modified as per patch submission guidelines

v4 -> v5: sent previouse version of patch twice by mistake.this is to
          avoid confusion.nothing is changed

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

