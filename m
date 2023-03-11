Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00987B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 21:52:17 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ek18so3328519edb.6
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 13:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678571537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TdvdZcJwqOxSED82BHJ454QJEkvE45rumYb+PdMANhk=;
        b=KbQE9gQ4W/aLSm2gJ9USlzEK9E5MDzHVSJHAzEOumHqjyaHmrM59p+IYOJgO7jdKSm
         qwQ0OUWtQCq3/rXRCkuAeu6ui3MnC5M9DjyoEU+Kp30A6XtKcoZvKMeWmkE1wXdCs6Os
         t7GPCYMc9kG+/WxxB2zZ8Ruvc3gIKQTCQaSWHAcT3pmiy0OQJhCzlQtAYjrXgVIQukDq
         SeO2uy1SnpMT0BfpQr8xFWfHl265T10CNW5NF7eOF/bKBKV/JwF/Z3roY5XKGSleAf0o
         Eus6x+poIQCGeCNzd1AVlJuBcWIVappwUB3CoWYw+nUl//NtlkmGXTQzmebaTuPkGIAD
         NKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdvdZcJwqOxSED82BHJ454QJEkvE45rumYb+PdMANhk=;
        b=Ugk8iv6xZUGYREfelUock+GQmDb1a8pfs9zvRqsy3tiIjtoR8gfEPhD8XBkIA+bQQR
         W8EF0nJurNfcRSEFNCl45A+/NRHVp9g16+MAuggKjJ7OAbMZVJTWWL1GVyZSaW1msHIu
         NSVNzkvmCbaqLrYdsQHJNTwzwItk/sGI3+CmBP2zeeww0Pzos5ZJSEEPMBk19Jam6eL/
         Li8KZzBFE0Kx3hH7PsNr1L8ESB7vEkxuZ9K86bkZZ169f2kgUQDAKxgXu5MwQjZec54U
         jDNK5VLucQU4wXU9sbFIvgkoR6Lagjq336ZfJP9/MF41YWUz14ZPA+slnBaFSh0d15uQ
         S8tA==
X-Gm-Message-State: AO0yUKVFDpjY1MDlYQRbSB0Urp07PTYSWf1nLERGTnBWrvdBzTsOEuRo
	xIoJVyt8W0AktvUYDAnj8J0=
X-Google-Smtp-Source: AK7set/9/649wHsySz4J19RJ3v5gomkREh8afFzkaSUa9/qY3LFUVpM1jnwTCAC10MlTMWFU1ohPSA==
X-Received: by 2002:a17:906:7493:b0:878:4bda:2011 with SMTP id e19-20020a170906749300b008784bda2011mr6174866ejl.4.1678571537333;
        Sat, 11 Mar 2023 13:52:17 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id bg4-20020a170906a04400b008b1797b77b2sm1503688ejb.221.2023.03.11.13.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 13:52:16 -0800 (PST)
Date: Sat, 11 Mar 2023 22:52:15 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] staging: rtl8192e: Remove unused variable
 rfRxIQImbalance and rfRxAFE
Message-ID: <1d578fc962c938e76bc0df529a3c24bba7abe049.1678569965.git.philipp.g.hortmann@gmail.com>
References: <cover.1678569965.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678569965.git.philipp.g.hortmann@gmail.com>

Remove unused variable rfRxIQImbalance and rfRxAFE because they are just
once set and not used. Remove unused constants with commenting line.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h    |  2 --
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c    | 10 ----------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h |  9 ---------
 3 files changed, 21 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index a5d99891688d..a5c2ff5b4260 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -107,8 +107,6 @@ struct bb_reg_definition {
 	u32 rfintfe;
 	u32 rf3wireOffset;
 	u32 rfHSSIPara2;
-	u32 rfRxIQImbalance;
-	u32 rfRxAFE;
 	u32 rfTxIQImbalance;
 	u32 rfTxAFE;
 	u32 rfLSSIReadBack;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 32806bcc953a..5b63b9eac090 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -373,16 +373,6 @@ static void _rtl92e_init_bb_rf_reg_def(struct net_device *dev)
 	priv->phy_reg_def[RF90_PATH_C].rfHSSIPara2 = rFPGA0_XC_HSSIParameter2;
 	priv->phy_reg_def[RF90_PATH_D].rfHSSIPara2 = rFPGA0_XD_HSSIParameter2;
 
-	priv->phy_reg_def[RF90_PATH_A].rfRxIQImbalance = rOFDM0_XARxIQImbalance;
-	priv->phy_reg_def[RF90_PATH_B].rfRxIQImbalance = rOFDM0_XBRxIQImbalance;
-	priv->phy_reg_def[RF90_PATH_C].rfRxIQImbalance = rOFDM0_XCRxIQImbalance;
-	priv->phy_reg_def[RF90_PATH_D].rfRxIQImbalance = rOFDM0_XDRxIQImbalance;
-
-	priv->phy_reg_def[RF90_PATH_A].rfRxAFE = rOFDM0_XARxAFE;
-	priv->phy_reg_def[RF90_PATH_B].rfRxAFE = rOFDM0_XBRxAFE;
-	priv->phy_reg_def[RF90_PATH_C].rfRxAFE = rOFDM0_XCRxAFE;
-	priv->phy_reg_def[RF90_PATH_D].rfRxAFE = rOFDM0_XDRxAFE;
-
 	priv->phy_reg_def[RF90_PATH_A].rfTxIQImbalance = rOFDM0_XATxIQImbalance;
 	priv->phy_reg_def[RF90_PATH_B].rfTxIQImbalance = rOFDM0_XBTxIQImbalance;
 	priv->phy_reg_def[RF90_PATH_C].rfTxIQImbalance = rOFDM0_XCTxIQImbalance;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index d0ea7e06f0f7..78e90bf5d79f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -98,15 +98,6 @@
 #define rOFDM0_TRxPathEnable		0xc04
 #define rOFDM0_TRMuxPar			0xc08
 #define rOFDM0_TRSWIsolation		0xc0c
-/* RxIQ DC offset, Rx digital filter, DC notch filter */
-#define rOFDM0_XARxAFE			0xc10
-#define rOFDM0_XARxIQImbalance		0xc14 /* RxIQ imbalance matrix */
-#define rOFDM0_XBRxAFE			0xc18
-#define rOFDM0_XBRxIQImbalance		0xc1c
-#define rOFDM0_XCRxAFE			0xc20
-#define rOFDM0_XCRxIQImbalance		0xc24
-#define rOFDM0_XDRxAFE			0xc28
-#define rOFDM0_XDRxIQImbalance		0xc2c
 #define rOFDM0_RxDetector1		0xc30 /* PD, BW & SBD */
 #define rOFDM0_RxDetector2		0xc34 /* SBD */
 #define rOFDM0_RxDetector3		0xc38 /* Frame Sync */
-- 
2.39.2

