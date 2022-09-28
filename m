Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2FA56
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 08:36:52 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id f20so16311007edf.6
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 01:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uXGCeCEAXm7WShuxFsGAnc4TEA0foi/qCDefq62rLtE=;
        b=dfPmt210cXwB+x6AA22pSGoZuGSh4iWi+xj3hLrVytXB1xQzCGEJgtvWgxKdxNbU6m
         uh1aNUAolvsFMm1BwZ/+NIMYHI2C8z7s8hyNsn/vX7XIVoAkSwEindW0qmgOfOKD/Gf1
         aY8jfEWG1X2GEgvWoNn9es7ovNDpNScbsbwv2ltpQrMtEyW4uMBlYSkGHlUHtGE1DTWE
         kuYGqXHGoUCeH/Qvg6t8ktkQCU3wOMgJHW8vzyjwtiaRNSFucc/DqToTka+uD5OXl8ao
         smhdkTLHAxhJ0v2+2FJhL/+uuYvZF/kuiKdYbVS1SXHtO+leyme+Qw8SJvZBqEfqovYk
         IfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uXGCeCEAXm7WShuxFsGAnc4TEA0foi/qCDefq62rLtE=;
        b=0SzYIfWiDztaR/n4DczQIMJQXY5AqUoz+I2R1DGnQ+67vdxWbocx4z8Q9Q2iRtVFYf
         nyNtyottTvIWJnH/hCd4cQluEPl7KWyW99yoDUceNibDQngPXxEv2mV5gzVkWJP3rZPs
         c81vFhgHEYwjrXkU6v3ptpJT2S2nl/Mu2T7OR/EiCFVt868fvWOxkaSnSG/JxeFaioBq
         XzU4jskAZiFCbJ1ieufs82Xf9LeitR7YA+1OCvzrJFKs3G5+fNMtQN0RRnBHO6+pDb0j
         hTom9KrBvDwyuKWpldK5YMkVIwfEqpjmKzB8kYgaMDx2UVet5X70MnkKNvhJ0PW3v7c6
         CIOQ==
X-Gm-Message-State: ACrzQf0TqSDpzmOWnvvBQSsMgerweaKci8DDkRNzP6um2meBys9UusXR
	kHoPWdxreyanPOopcGUTYHA=
X-Google-Smtp-Source: AMsMyM61Zc1csNqRtaf/3/POuEYcEKQPL8bsZ4ixUbSYOVRgUX0R8MLfqa64HQ7Wp47QzgX5f3mFDQ==
X-Received: by 2002:a05:6402:27ca:b0:451:7b58:1b01 with SMTP id c10-20020a05640227ca00b004517b581b01mr32830416ede.61.1664354211104;
        Wed, 28 Sep 2022 01:36:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id gy23-20020a170906f25700b00730b3bdd8d7sm2024526ejb.179.2022.09.28.01.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 01:36:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove PHY_RF6052_Config8188E()
Date: Wed, 28 Sep 2022 10:36:40 +0200
Message-Id: <20220928083641.8275-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928083641.8275-1-straube.linux@gmail.com>
References: <20220928083641.8275-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function PHY_RF6052_Config8188E() is just a wrapper around
phy_RF6052_Config_ParaFile(). Remove the wrapper.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c |  2 +-
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 13 +------------
 drivers/staging/r8188eu/include/rtl8188e_rf.h |  2 +-
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index a435ec65d4b1..cb2788bc383b 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -512,7 +512,7 @@ int PHY_RFConfig8188E(struct adapter *Adapter)
 	int		rtStatus = _SUCCESS;
 
 	/*  RF config */
-	rtStatus = PHY_RF6052_Config8188E(Adapter);
+	rtStatus = phy_RF6052_Config_ParaFile(Adapter);
 	return rtStatus;
 }
 
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 237232432f37..0dc902b0abae 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -366,7 +366,7 @@ rtl8188e_PHY_RF6052SetOFDMTxPower(
 	}
 }
 
-static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
+int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 {
 	struct bb_reg_def *pPhyReg;
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
@@ -404,14 +404,3 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 
 	return rtStatus;
 }
-
-int PHY_RF6052_Config8188E(struct adapter *Adapter)
-{
-	int rtStatus = _SUCCESS;
-
-	/*  */
-	/*  Config BB and RF */
-	/*  */
-	rtStatus = phy_RF6052_Config_ParaFile(Adapter);
-	return rtStatus;
-}
diff --git a/drivers/staging/r8188eu/include/rtl8188e_rf.h b/drivers/staging/r8188eu/include/rtl8188e_rf.h
index 04556496baad..63ac0acc68fd 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_rf.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_rf.h
@@ -8,7 +8,7 @@
 #define		RF6052_MAX_REG			0x3F
 #define		RF6052_MAX_PATH			2
 
-int	PHY_RF6052_Config8188E(struct adapter *Adapter);
+int phy_RF6052_Config_ParaFile(struct adapter *Adapter);
 void rtl8188e_PHY_RF6052SetBandwidth(struct adapter *Adapter,
 				     enum ht_channel_width Bandwidth);
 void	rtl8188e_PHY_RF6052SetCckTxPower(struct adapter *Adapter, u8 *level);
-- 
2.37.3

