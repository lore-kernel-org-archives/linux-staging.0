Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0053C5682
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 18:16:19 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso13837265wms.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 10:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRI/8f4x1/QMBaZh6y3RspGVRS7CNQfcVSPIlmfTuKk=;
        b=CEHDaKlFnjq8eOJ7jtg6rh8X1kLNTaq4jOzDRjY7pMD9YLrZzZLETWcVbasFEIYNW+
         L50fI+ldxT5HOZoDJtuiN3igNjiWmxJx5AaxyeV/s9xgvZ7/6NjtYFueV8q6iW8YjeeH
         cu1Qu+fAMZ9Sv6+6WIMoZEYlU7/qPXs6FsCi9LqqGzGN9VeBY4g2gdo9foAyzBQI50dG
         8+4lvw6R0dPITSGRzJgPLegkQ8eir6GXNVRcvOArfWkZWMZY/Cda5W4l6qRGFzFb/KoM
         PsLbrLUclqnGvpv3wdjMsnomwPSYNNuTtlfLx7bvwBXyO4xEJFLJ1gGLbe+jtLTN/jDu
         SEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRI/8f4x1/QMBaZh6y3RspGVRS7CNQfcVSPIlmfTuKk=;
        b=xveuAXz1w+wAtvVYgjlWAp/z/xPL322nB4Ph9GqGkgz89x+2XXh4+HjeRwLS8B0VND
         yXIHxtjGar1e/SxH+hXqNkDuYkTro2CUAwWzQKji0ck6e/f1IGiLGz3ouGAdefhfSJ+0
         THK4iQc5o/BSmm34Hn2U3HOfIVMEx87B7efASq/wAfWL2mkWzkjmcV3Xa+w/vMWs7usu
         Zwm77UAdPjb4YGsDWhrhrw5vBPYAGpIdXslyOiGpVtxK880AVjdHdHW5gYEktp7Pw8P4
         DNdLmYNCmPoDQJlG+dpLAncsPsXQ7fRu4xp9dR2HE0wTTgK4GLq2JWpcIeKQ1C0P6ZJ+
         RWyQ==
X-Gm-Message-State: AO0yUKVy+ep4z1ocDp7/aK8G4ZwtVZRPubEipkZ3fw+uMSSxYMGPLOY1
	T7mEnsO4Nwy1KMTqHtuFrR0=
X-Google-Smtp-Source: AK7set+B67Bh1dRfeNspsTlJQnRrz9pcEn3pM31L9206j4TGSDjPGmt8U8EHphPWUTTF8vtMoA5vzQ==
X-Received: by 2002:a05:600c:35c5:b0:3d2:231a:cb30 with SMTP id r5-20020a05600c35c500b003d2231acb30mr5182214wmq.3.1675793778171;
        Tue, 07 Feb 2023 10:16:18 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id hg15-20020a05600c538f00b003df7b40f99fsm17363729wmb.11.2023.02.07.10.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 10:16:17 -0800 (PST)
Date: Tue, 7 Feb 2023 19:16:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] staging: rtl8192e: Rename AcmHw_ViqEn, AcmHw_VoqEn and
 ANAPAR_FOR_8192PciE
Message-ID: <ecdb350dcd9b1860496c1835980d34c5bca0d39e.1675792435.git.philipp.g.hortmann@gmail.com>
References: <cover.1675792435.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675792435.git.philipp.g.hortmann@gmail.com>

Rename constants AcmHw_ViqEn to ACM_HW_VIQ_EN and AcmHw_VoqEn to
ACM_HW_VOQ_EN and ANAPAR_FOR_8192PciE to ANAPAR_FOR_8192PCIE to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h  | 6 +++---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index dc6e694840af..cb455969f5dc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -225,11 +225,11 @@ void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val)
 				break;
 
 			case AC2_VI:
-				AcmCtrl |= AcmHw_ViqEn;
+				AcmCtrl |= ACM_HW_VIQ_EN;
 				break;
 
 			case AC3_VO:
-				AcmCtrl |= AcmHw_VoqEn;
+				AcmCtrl |= ACM_HW_VOQ_EN;
 				break;
 			}
 		} else {
@@ -239,7 +239,7 @@ void rtl92e_set_reg(struct net_device *dev, u8 variable, u8 *val)
 				break;
 
 			case AC2_VI:
-				AcmCtrl &= (~AcmHw_ViqEn);
+				AcmCtrl &= (~ACM_HW_VIQ_EN);
 				break;
 
 			case AC3_VO:
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index c3b573090d39..1546bb575293 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -144,8 +144,8 @@ enum _RTL8192PCI_HW {
 #define CPU_GEN_NO_LOOPBACK_SET	0x00080000
 	ACM_HW_CTRL		= 0x171,
 #define	ACM_HW_BEQ_EN		BIT1
-#define	AcmHw_ViqEn		BIT2
-#define	AcmHw_VoqEn		BIT3
+#define	ACM_HW_VIQ_EN		BIT2
+#define	ACM_HW_VOQ_EN		BIT3
 	RQPN1			= 0x180,
 	RQPN2			= 0x184,
 	RQPN3			= 0x188,
@@ -250,6 +250,6 @@ enum _RTL8192PCI_HW {
 
 #define GPI 0x108
 
-#define	ANAPAR_FOR_8192PciE				0x17
+#define	ANAPAR_FOR_8192PCIE	0x17
 
 #endif
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index cbda027656dc..c6cbdea6d5b2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -1273,7 +1273,7 @@ void rtl92e_set_rf_off(struct net_device *dev)
 	rtl92e_set_bb_reg(dev, rOFDM1_TRxPathEnable, 0xf, 0x0);
 	rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter1, 0x60, 0x0);
 	rtl92e_set_bb_reg(dev, rFPGA0_AnalogParameter1, 0x4, 0x0);
-	rtl92e_writeb(dev, ANAPAR_FOR_8192PciE, 0x07);
+	rtl92e_writeb(dev, ANAPAR_FOR_8192PCIE, 0x07);
 
 }
 
-- 
2.39.1

