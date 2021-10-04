Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503E13FFB
	for <linux-staging@lists.linux.dev>; Mon,  4 Oct 2021 22:32:36 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z20so19245077edc.13
        for <linux-staging@lists.linux.dev>; Mon, 04 Oct 2021 15:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wzNZ2IbZ4ScoAaBO4PSlWZv4iZNspxOsGS530q7pF78=;
        b=aipVdx9ypIbv4SmYFz0HpFxIz3A2QIX9iDK6Txxi5gg0vDu4KlSd2GNlgOkRmv9PhU
         MYRhK8ns2QiJvAt8gtufTH7hNg7qlzdXu6vYbhRMgGHwgVASnulwswAMm4wacTi+gtau
         2dRWCLspvO7pciC8lNQBPZBxF6O7ifYbHudF39jfp/zxo/xcVUElSN641fMoNQEgMQ8P
         o+A7FLu7wK8MKSLc/IqEvezZaZMWpIBK/ZcpDAB94l1iaOqZ/bmENWOH1ZufUpL+eFnb
         dCN4RYheCggVuKeqCWx36VMw3d5nZADrZvLPH1PxFtjGN7c1tE8Im0DvQjytlvO/E9cs
         EAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wzNZ2IbZ4ScoAaBO4PSlWZv4iZNspxOsGS530q7pF78=;
        b=UI/j4ESIH9ggCwi+k5jXzbkYdbBkd2z6h+qi41KccXPaBcawcmkW1hBzrQxps31ppd
         UvZHVqTrI5wNbj99kCHSi07ppnenziq1LA37KELAMBxlIUglKXDyZHeSUqjdrUG0SR+S
         8/ZVspi9g3ZHNcUstsQRtin+6Z2s3x+AVibf2YPkM5mS4yGl9uzpN5SRWQEDK2kDF3+8
         OgsECZngZAe+ks+sFBn+fjeKFyZKTpHMcw3nRGBEiopFPI05hB6AaCzg6tc3FSzQU/o+
         Rz5YC545vywYKV+PBht+ZvsviYD2AFxsVzJrrLQCBOm/CfJ4g9WwI2u9ZEs9LEgwx/6i
         g7IQ==
X-Gm-Message-State: AOAM530vkqgD8rOX68ElOjLYKInYEbqeIrCsXz/UOvSRv/HAZV7tkYZG
	zi9eGX5SznypuxwqtiBkXnU=
X-Google-Smtp-Source: ABdhPJz3DphMwmJAdquhUOPTmHfmHtWqq3BF3re8Tuzt+NsW1c+HIh5wx/DwzAq4vqlLTR5+UR0rDw==
X-Received: by 2002:a17:906:a94b:: with SMTP id hh11mr20355793ejb.85.1633386754691;
        Mon, 04 Oct 2021 15:32:34 -0700 (PDT)
Received: from tom-desktop.station (net-2-42-54-217.cust.vodafonedsl.it. [2.42.54.217])
        by smtp.gmail.com with ESMTPSA id dc8sm7780919edb.28.2021.10.04.15.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 15:32:33 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Yujia Qiao <rapiz@foxmail.com>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] staging: vt6655: fix camelcase in ldBmThreshold
Date: Tue,  5 Oct 2021 00:31:57 +0200
Message-Id: <20211004223200.70524-3-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004223200.70524-1-tomm.merciai@gmail.com>
References: <20211004223200.70524-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camel case variable ldBmThreshold with snake case
variable dbm_threshold. ldBmThreshold is in hungarian notation, where
"l" is for long and "dbm" is for decibel-milliwatt (signal strenght).
This variable contain's signal strenght threshold in dbm.

References:
 - https://en.wikipedia.org/wiki/Hungarian_notation
 - https://www.rapidtables.com/electric/dBm.html

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v5:
 - Fix variable name dbm_threshold instead of ld_bm_threshold
 - Add more details in commit message

Changes since v4:
 - Make the commit body message more clearer

Changes since v3:
 - Fix patch changelog

Changes since v2:
 - Add patch changelog

Changes since v1:
 - Make the commit message more clearer

 drivers/staging/vt6655/baseband.c    | 48 ++++++++++++++--------------
 drivers/staging/vt6655/device.h      |  4 +--
 drivers/staging/vt6655/device_main.c |  2 +-
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 491cf4d8bc6c..7ae6ae984e2d 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2021,10 +2021,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x0A;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -70;
-		priv->ldBmThreshold[1] = -50;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->dbm_threshold[0] = -70;
+		priv->dbm_threshold[1] = -50;
+		priv->dbm_threshold[2] = 0;
+		priv->dbm_threshold[3] = 0;
 	} else if ((by_rf_type == RF_AIROHA) || (by_rf_type == RF_AL2230S)) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_AIROHA2230; ii++)
 			result &= bb_write_embedded(priv,
@@ -2039,10 +2039,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x10;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -70;
-		priv->ldBmThreshold[1] = -48;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->dbm_threshold[0] = -70;
+		priv->dbm_threshold[1] = -48;
+		priv->dbm_threshold[2] = 0;
+		priv->dbm_threshold[3] = 0;
 	} else if (by_rf_type == RF_UW2451) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_UW2451; ii++)
 			result &= bb_write_embedded(priv,
@@ -2061,10 +2061,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x0A;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -60;
-		priv->ldBmThreshold[1] = -50;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->dbm_threshold[0] = -60;
+		priv->dbm_threshold[1] = -50;
+		priv->dbm_threshold[2] = 0;
+		priv->dbm_threshold[3] = 0;
 	} else if (by_rf_type == RF_UW2452) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_UW2451; ii++)
 			result &= bb_write_embedded(priv,
@@ -2107,10 +2107,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x0A;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -60;
-		priv->ldBmThreshold[1] = -50;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->dbm_threshold[0] = -60;
+		priv->dbm_threshold[1] = -50;
+		priv->dbm_threshold[2] = 0;
+		priv->dbm_threshold[3] = 0;
 		/* }} RobertYu */
 
 	} else if (by_rf_type == RF_VT3226) {
@@ -2127,10 +2127,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x10;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -70;
-		priv->ldBmThreshold[1] = -48;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->dbm_threshold[0] = -70;
+		priv->dbm_threshold[1] = -48;
+		priv->dbm_threshold[2] = 0;
+		priv->dbm_threshold[3] = 0;
 		/* Fix VT3226 DFC system timing issue */
 		MACvSetRFLE_LatchBase(iobase);
 		/* {{ RobertYu: 20050104 */
@@ -2161,10 +2161,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->abyBBVGA[1] = 0x10;
 		priv->abyBBVGA[2] = 0x0;
 		priv->abyBBVGA[3] = 0x0;
-		priv->ldBmThreshold[0] = -70;
-		priv->ldBmThreshold[1] = -48;
-		priv->ldBmThreshold[2] = 0;
-		priv->ldBmThreshold[3] = 0;
+		priv->dbm_threshold[0] = -70;
+		priv->dbm_threshold[1] = -48;
+		priv->dbm_threshold[2] = 0;
+		priv->dbm_threshold[3] = 0;
 		/* }} RobertYu */
 	} else {
 		/* No VGA Table now */
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 49e3d09480f2..e74372263e14 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -215,7 +215,7 @@ struct vnt_private {
 
 	bool bEncryptionEnable;
 	bool bLongHeader;
-	bool short_slot_time;
+	bool bShortSlotTime;
 	bool bProtectMode;
 	bool bNonERPPresent;
 	bool bBarkerPreambleMd;
@@ -253,7 +253,7 @@ struct vnt_private {
 	unsigned char byBBVGANew;
 	unsigned char byBBVGACurrent;
 	unsigned char abyBBVGA[BB_VGA_LEVEL];
-	long                    ldBmThreshold[BB_VGA_LEVEL];
+	long                    dbm_threshold[BB_VGA_LEVEL];
 
 	unsigned char byBBPreEDRSSI;
 	unsigned char byBBPreEDIndex;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 52c2a6651bc9..ff6c59e198a4 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -986,7 +986,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 	RFvRSSITodBm(priv, (u8)priv->uCurrRSSI, &dbm);
 
 	for (i = 0; i < BB_VGA_LEVEL; i++) {
-		if (dbm < priv->ldBmThreshold[i]) {
+		if (dbm < priv->dbm_threshold[i]) {
 			priv->byBBVGANew = priv->abyBBVGA[i];
 			break;
 		}
-- 
2.25.1

