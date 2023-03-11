Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E97B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 21:52:35 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y4so4994713edo.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 13:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678571554; x=1681163554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CLM1DMdObV7hO1p/r6vG5OZBTBXPbt7jRsRiNLFKp3Q=;
        b=T3xGwj5RM/C7sIBdSZr6qko+CotZEUqpuXLdHlUU30M5k1DtpX2ScKCKB43OVJShpM
         hVUV3zXE9JenvAJeLuudpAPpVUzxHHemqjhwy3yU9ASaL/6YibrYcwVhspxPqNnVxDrd
         URhtMCxfvzchF60wLwYiHgope0zVDZIVMEDS3wt6w1FGEKoOQG42u+KOcsc/gtGKmc6G
         +Eezl5BobgE/+whQPiZTzPcmiN+mQAOn4a3t1jaPgHZhsQJh9jdxG41rrwWHd0LXMV1a
         xXt7wHA1H91Jxj5SDEFBYOpwqNQ3yZyI4ZQYafgaqWPGITgQxzjO7kj5uSYF8ho5Zg1H
         9BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571554; x=1681163554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLM1DMdObV7hO1p/r6vG5OZBTBXPbt7jRsRiNLFKp3Q=;
        b=Bmo7UmV0eKKd3npCGdgjC8+fprhE/LJMYGFPnkARbXv/GyCtLD4ExF1V1rYwCns5ow
         HI5pRABK43to03YcM5SFPn3Mcv3iC2nn4p4gQS7DXTo8dBImg3vmZVu3gQE5sLySLeqA
         Ap8NwSpUygwRMl3ITER2UsReUVFyGDQOXxgnObP+LI6SItbks8KZcDy9WxDUcyhpIEZh
         nqPPOp0EljBuS1o8jUFm8b1LHMQjKPIPdT/trd1hMUynDE1q06GKijiAHC4lQgGsEFkO
         QYgUZhnYJp1cdhLwSRBfEPoNF+h5tll1Wn7GdDQm0Wuqp9o4Urj9SUN3+wiIq8aX/zoM
         C9cQ==
X-Gm-Message-State: AO0yUKVbYdhDnhzkvpxZH7hmQkg3Y43jGzX8fnts4J23k7OTzboKkrWq
	uBxIbufmj/hx8pso3GTt+1U=
X-Google-Smtp-Source: AK7set/qZf77ad1RUfZHDcBWbLvREMofsCiPAcIhbCVLCTbsOdpZzxchCSPIe7Q1lCsWiE0V/a9Ldw==
X-Received: by 2002:a05:6402:42cf:b0:4af:7bdc:1888 with SMTP id i15-20020a05640242cf00b004af7bdc1888mr12085566edc.4.1678571554119;
        Sat, 11 Mar 2023 13:52:34 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id ks14-20020a170906f84e00b008ec43ae626csm1504972ejb.167.2023.03.11.13.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 13:52:33 -0800 (PST)
Date: Sat, 11 Mar 2023 22:52:31 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] staging: rtl8192e: Remove unused variable
 rfTxIQImbalance and rfTxAFE
Message-ID: <62453061bcf1858c23ba57bf1f279999b37b4cc3.1678569965.git.philipp.g.hortmann@gmail.com>
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

Remove unused variable rfTxIQImbalance and rfTxAFE because they are just
once set and not used. Remove unused constants.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h    |  2 --
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c    | 10 ----------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h |  5 -----
 3 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index a5c2ff5b4260..385cca79f484 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -107,8 +107,6 @@ struct bb_reg_definition {
 	u32 rfintfe;
 	u32 rf3wireOffset;
 	u32 rfHSSIPara2;
-	u32 rfTxIQImbalance;
-	u32 rfTxAFE;
 	u32 rfLSSIReadBack;
 	u32 rfLSSIReadBackPi;
 };
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 5b63b9eac090..fe12df93bc60 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -373,16 +373,6 @@ static void _rtl92e_init_bb_rf_reg_def(struct net_device *dev)
 	priv->phy_reg_def[RF90_PATH_C].rfHSSIPara2 = rFPGA0_XC_HSSIParameter2;
 	priv->phy_reg_def[RF90_PATH_D].rfHSSIPara2 = rFPGA0_XD_HSSIParameter2;
 
-	priv->phy_reg_def[RF90_PATH_A].rfTxIQImbalance = rOFDM0_XATxIQImbalance;
-	priv->phy_reg_def[RF90_PATH_B].rfTxIQImbalance = rOFDM0_XBTxIQImbalance;
-	priv->phy_reg_def[RF90_PATH_C].rfTxIQImbalance = rOFDM0_XCTxIQImbalance;
-	priv->phy_reg_def[RF90_PATH_D].rfTxIQImbalance = rOFDM0_XDTxIQImbalance;
-
-	priv->phy_reg_def[RF90_PATH_A].rfTxAFE = rOFDM0_XATxAFE;
-	priv->phy_reg_def[RF90_PATH_B].rfTxAFE = rOFDM0_XBTxAFE;
-	priv->phy_reg_def[RF90_PATH_C].rfTxAFE = rOFDM0_XCTxAFE;
-	priv->phy_reg_def[RF90_PATH_D].rfTxAFE = rOFDM0_XDTxAFE;
-
 	priv->phy_reg_def[RF90_PATH_A].rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
 	priv->phy_reg_def[RF90_PATH_B].rfLSSIReadBack = rFPGA0_XB_LSSIReadBack;
 	priv->phy_reg_def[RF90_PATH_C].rfLSSIReadBack = rFPGA0_XC_LSSIReadBack;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index 78e90bf5d79f..fe05a94561e8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -117,12 +117,7 @@
 #define rOFDM0_HTSTFAGC			0xc7c
 #define rOFDM0_XATxIQImbalance		0xc80
 #define rOFDM0_XATxAFE			0xc84
-#define rOFDM0_XBTxIQImbalance		0xc88
-#define rOFDM0_XBTxAFE			0xc8c
 #define rOFDM0_XCTxIQImbalance		0xc90
-#define rOFDM0_XCTxAFE			0xc94
-#define rOFDM0_XDTxIQImbalance		0xc98
-#define rOFDM0_XDTxAFE			0xc9c
 #define rOFDM0_RxHPParameter		0xce0
 #define rOFDM0_TxPseudoNoiseWgt		0xce4
 #define rOFDM0_FrameSync		0xcf0
-- 
2.39.2

