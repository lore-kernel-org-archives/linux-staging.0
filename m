Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0F22FB1
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:10:19 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id i94so23585939wri.4
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7a1RBDBYhuIJn1PW20GeA3uF2Znuq27Dnh+SWYloe64=;
        b=A/EomCwhG/jVcazg9uARSbsGmPAKruM8Q7V0C/BW1clHJRqVXo/dqZuydG1DQ66eYk
         YkmfbXvXFTSrQh0cdbv5nm58ABK48UtwFKLdxl3clZvH4o7tCjmuIsqGQZfKR6j74F5G
         vc0PZEmYTfbmpt5HMd+k70Dk9kAANk5ZF/K4IkDkEGeEhhH1xWYGkxyNV6wjElvttA2Q
         qS1DlPpqKzmgEdWhTYQUaRLUj9gzM//VW+2VbIb0CD5sNEQT3TTjGh2xGqxvdiTfcUVV
         /SGyFX+sxrBl0J81Ki7ok2HnWnb6+DGtne3HheohYCXQfS5GjkmEfwp+xYMDGQN6COJS
         i9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7a1RBDBYhuIJn1PW20GeA3uF2Znuq27Dnh+SWYloe64=;
        b=Rt3aRB6ynV8dwQYI2xHD+krFmKLTiBIZYSxln9LQ/edXSsBQUi1O6Jo6K3JG7T+91y
         zIVAHp9ZRDqUNu48mlXVQcqVF1J0lPC1bJY69c4kY8VW/d1BTb/Uj9s6hYyMLWmaKiNb
         G9p8/MRl13N/fb/oayH2eCI0mSENYQ13041OSXhMofoc9ZcfT7EzEUfxfV2xkx7GhQbY
         cm0BxgD4RdrAsno72pUYOoRislPVtrCQcay1q3CNeSHRaEOXeZNw8uneEXKHMruOHQGQ
         KPxuIXSI3OnTPQZE7l6pb4vdwmWgUunkeILhMFftORS1FaDQEJl0eoYqGPMzzl8wJSzl
         Ox/w==
X-Gm-Message-State: AOAM532sPDFyIFNdRVtZt1DgwGswyXkFPlKuH69cbwZa15U1B6Y74Hb/
	CLLVYufXVMBzQCTa4amCByjzNT6Z5LfI2w==
X-Google-Smtp-Source: ABdhPJzzH68OrY+mS7+jQ93CL8vts/+hhGRAhHHx0mdZTKtaC8vaw5Be3HvG/SQpI+oN71JWtSPEhQ==
X-Received: by 2002:a5d:5919:: with SMTP id v25mr4570391wrd.319.1624367418504;
        Tue, 22 Jun 2021 06:10:18 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id w9sm15630625wru.3.2021.06.22.06.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:10:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/17] staging: rtl8723bs: remove some unused 5Ghz macro definitions
Date: Tue, 22 Jun 2021 15:09:54 +0200
Message-Id: <8d2933555170e5f206b9198a203e8a31ee2b7702.1624367071.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624367071.git.fabioaiuto83@gmail.com>
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove some unused 5Ghz macro definitions. Fix
comments accordingly.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h                | 1 -
 drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h | 2 --
 drivers/staging/rtl8723bs/include/hal_com_reg.h    | 1 -
 drivers/staging/rtl8723bs/include/hal_pg.h         | 2 --
 4 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 788fc1c068b5..afb36de7a4e5 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -628,7 +628,6 @@ struct fat_t { /* _FAST_ANTENNA_TRAINNING_ */
 	u32 MinMaxRSSI;
 	u8 idx_AntDiv_counter_2G;
 	u8 idx_AntDiv_counter_5G;
-	u32 AntDiv_2G_5G;
 	u32 CCK_counter_main;
 	u32 CCK_counter_aux;
 	u32 OFDM_counter_main;
diff --git a/drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h b/drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
index 4b3a7c051630..aad962548278 100644
--- a/drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
+++ b/drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
@@ -558,7 +558,6 @@
 
 #define		b3WireRFPowerDown			0x1	/*  Useless now */
 /* define bHWSISelect				0x8 */
-#define		b5GPAPEPolarity				0x40000000
 #define		b2GPAPEPolarity				0x80000000
 #define		bRFSW_TxDefaultAnt			0x3
 #define		bRFSW_TxOptionAnt			0x30
@@ -577,7 +576,6 @@
 #define		bRFSI_ANTSW				0x100
 #define		bRFSI_ANTSWB				0x200
 #define		bRFSI_PAPE					0x400
-#define		bRFSI_PAPE5G				0x800
 #define		bBandSelect					0x1
 #define		bHTSIG2_GI					0x80
 #define		bHTSIG2_Smoothing			0x01
diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index b14585cb0233..b2f179b48019 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -717,7 +717,6 @@ Default: 00b.
 /*        BW_OPMODE bits				(Offset 0x603, 8bit) */
 /*  */
 #define BW_OPMODE_20MHZ			BIT2
-#define BW_OPMODE_5G				BIT1
 
 /*  */
 /*        CAM Config Setting (offset 0x680, 1 byte) */
diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 0b7a8adf5c74..2d8ccc9ddebb 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -16,10 +16,8 @@
 
 /*  For VHT series TX power by rate table. */
 /*  VHT TX power by rate off setArray = */
-/*  Band:-2G&5G = 0 / 1 */
 /*  RF: at most 4*4 = ABCD = 0/1/2/3 */
 /*  CCK = 0 OFDM = 1/2 HT-MCS 0-15 =3/4/56 VHT =7/8/9/10/11 */
-#define TX_PWR_BY_RATE_NUM_BAND			2
 #define TX_PWR_BY_RATE_NUM_RF			4
 #define TX_PWR_BY_RATE_NUM_RATE			84
 #define MAX_RF_PATH_NUM				2
-- 
2.20.1

