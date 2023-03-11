Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC027B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 21:51:53 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ek18so3326216edb.6
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 13:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678571511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3lz0rCujQhVibf0Ri4YpJvVDSlapNGCLqwJwhuUj9iY=;
        b=g1XROsxLntlHnDJmSTz0qt7nem4Tid9+eF8wErcrgZHZhL1eIYgs9nYN/R8tlQbXPj
         v8Kx2VhvaP7UK2z3UI8ahK/Lgj62VHFBDaSpIZrwidgWgGxn2fPOCmhjna9aK82KBrHZ
         YJoFx7d/mvdbbIfpcd1B6dN8oO6mQvLzqzFzR/TA3rnWP3+6A2yTonlUNfGrDBcIeA34
         5XFKybm6Ys16llD/wpa/Le9dpfNgbUbIET9gdOZ6M2ppL/8VHXA4W/mwLNxr0UKkdCFQ
         hEIML6UWRMCblTRLFXYP2UwlCV2QzDEWq0bCzmFTQoBUkBecP8TlkoLTeIqYNPS5MgG3
         VDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lz0rCujQhVibf0Ri4YpJvVDSlapNGCLqwJwhuUj9iY=;
        b=N1LGT1/8pJnvmGttTSox+wUuFecOADPXo9WH/lzLxWyWDmfgIzjM7xljmvLaooQdYZ
         BONnLoblT1lYqnEq5A8nSllk4L3mOjhUFNFq5BZeKSllxrKenK6VxIIkztPE++uFMHGC
         XNDPJUVu4o2aJQYgcE8zM+ivmfaIEEKJBxUVx+DHl/kqeYe7TJeLkfry/uXF7/iDg7km
         ARucO4wZNxXyjtu4osGtK7I0KXpZpWcToOFMghxcW9njaMY8s7+awGvF21bqeYgsHycd
         7a4veExFCavbxX9hRfaz1ps6ADTlIPu+CkBGZ8ErXfMq5fhdiw3pWgApzVM7JtoiLmcH
         I8mw==
X-Gm-Message-State: AO0yUKV2c6fOycede+Blgd6AKCdQK7g4IK4Z1yl2HKIcl8q5WPHkeEX5
	NkmMIJdQK1EOxPSCjv/f9A8=
X-Google-Smtp-Source: AK7set9AZWxbuta0wo1kYU6KhCXTkFmoJ1saYc/52/4fbe7kyUJgiPxYbrNgI/MDuhWs4ZbIZFuY0A==
X-Received: by 2002:a17:906:d4:b0:878:5fa4:7443 with SMTP id 20-20020a17090600d400b008785fa47443mr5804894eji.3.1678571511297;
        Sat, 11 Mar 2023 13:51:51 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id q21-20020a170906389500b008b907006d5dsm1522934ejd.173.2023.03.11.13.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 13:51:50 -0800 (PST)
Date: Sat, 11 Mar 2023 22:51:49 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] staging: rtl8192e: Remove unused variable rfHSSIPara1
 and rfSwitchControl
Message-ID: <5f13420ce5598d447aaad0fe43b807467e0a15bb.1678569965.git.philipp.g.hortmann@gmail.com>
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

Remove unused variable rfHSSIPara1 and rfSwitchControl because they are
just once set and not used. Remove unused constants as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h    |  2 --
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c    | 10 ----------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h |  6 ------
 3 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index 2236c1aaf335..d42eac4b6012 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -106,9 +106,7 @@ struct bb_reg_definition {
 	u32 rfintfo;
 	u32 rfintfe;
 	u32 rf3wireOffset;
-	u32 rfHSSIPara1;
 	u32 rfHSSIPara2;
-	u32 rfSwitchControl;
 	u32 rfAGCControl1;
 	u32 rfAGCControl2;
 	u32 rfRxIQImbalance;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 87f28718e732..add3de156e09 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -368,21 +368,11 @@ static void _rtl92e_init_bb_rf_reg_def(struct net_device *dev)
 	priv->phy_reg_def[RF90_PATH_A].rf3wireOffset = rFPGA0_XA_LSSIParameter;
 	priv->phy_reg_def[RF90_PATH_B].rf3wireOffset = rFPGA0_XB_LSSIParameter;
 
-	priv->phy_reg_def[RF90_PATH_A].rfHSSIPara1 = rFPGA0_XA_HSSIParameter1;
-	priv->phy_reg_def[RF90_PATH_B].rfHSSIPara1 = rFPGA0_XB_HSSIParameter1;
-	priv->phy_reg_def[RF90_PATH_C].rfHSSIPara1 = rFPGA0_XC_HSSIParameter1;
-	priv->phy_reg_def[RF90_PATH_D].rfHSSIPara1 = rFPGA0_XD_HSSIParameter1;
-
 	priv->phy_reg_def[RF90_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;
 	priv->phy_reg_def[RF90_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;
 	priv->phy_reg_def[RF90_PATH_C].rfHSSIPara2 = rFPGA0_XC_HSSIParameter2;
 	priv->phy_reg_def[RF90_PATH_D].rfHSSIPara2 = rFPGA0_XD_HSSIParameter2;
 
-	priv->phy_reg_def[RF90_PATH_A].rfSwitchControl = rFPGA0_XAB_SwitchControl;
-	priv->phy_reg_def[RF90_PATH_B].rfSwitchControl = rFPGA0_XAB_SwitchControl;
-	priv->phy_reg_def[RF90_PATH_C].rfSwitchControl = rFPGA0_XCD_SwitchControl;
-	priv->phy_reg_def[RF90_PATH_D].rfSwitchControl = rFPGA0_XCD_SwitchControl;
-
 	priv->phy_reg_def[RF90_PATH_A].rfAGCControl1 = rOFDM0_XAAGCCore1;
 	priv->phy_reg_def[RF90_PATH_B].rfAGCControl1 = rOFDM0_XBAGCCore1;
 	priv->phy_reg_def[RF90_PATH_C].rfAGCControl1 = rOFDM0_XCAGCCore1;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index b68e84dd003f..5062be507a30 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -48,20 +48,14 @@
 #define rFPGA0_TxGainStage		0x80c
 #define rFPGA0_RFTiming1		0x810
 #define rFPGA0_RFTiming2		0x814
-#define rFPGA0_XA_HSSIParameter1	0x820
 #define rFPGA0_XA_HSSIParameter2	0x824
-#define rFPGA0_XB_HSSIParameter1	0x828
 #define rFPGA0_XB_HSSIParameter2	0x82c
-#define rFPGA0_XC_HSSIParameter1	0x830
 #define rFPGA0_XC_HSSIParameter2	0x834
-#define rFPGA0_XD_HSSIParameter1	0x838
 #define rFPGA0_XD_HSSIParameter2	0x83c
 #define rFPGA0_XA_LSSIParameter		0x840
 #define rFPGA0_XB_LSSIParameter		0x844
 #define rFPGA0_RFWakeUpParameter	0x850
 #define rFPGA0_RFSleepUpParameter	0x854
-#define rFPGA0_XAB_SwitchControl	0x858
-#define rFPGA0_XCD_SwitchControl	0x85c
 #define rFPGA0_XA_RFInterfaceOE		0x860
 #define rFPGA0_XB_RFInterfaceOE		0x864
 #define rFPGA0_XAB_RFInterfaceSW	0x870
-- 
2.39.2

