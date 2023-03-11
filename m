Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6CE7B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 21:50:59 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id ek18so3321744edb.6
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 13:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678571458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZRztXr+yi1+VTQciICFP+x1t1LeLTBQI5V0a9mBDUU=;
        b=jrsv3JVCjkddk3WtVccMKFPD0rBNEkDOReh9EgvbeGHtlx4u4dBVST9TGLsYnSrik1
         fCGRem74PcYWnMSFww/ZBYYkad9whVFjreKmBsKE3WvetcmhfYkkJOMHC3eBVkd3O2/e
         C/QWu25lRH9Llr0/i8kkw9F1f74a5VveDwjZItIUksclQQNdeUhV4b/wfOZUb6Y6tIgT
         Ii+SL6IDbR2NS2TuxJmjZsfVhQpFn+UMrBk50894jQRsuplBSocTwjAVWcGTFTBTveVI
         eHmMGOI9H4LGUV2PxLU2yMFpWhCKCmAJfN8rrOvZ4rKMFZtoZdM8r8i4shwg9Z9k4E86
         YTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZRztXr+yi1+VTQciICFP+x1t1LeLTBQI5V0a9mBDUU=;
        b=o6Jyd0XBfLaKBGIaqeSRCipHAjzrvRN3IWhG5EYUY7SSesmNBdTQD55Mt0fApn2dxX
         PkYEucjbLo2uVokoUP0geSRkvZskMUSW/zzhDrdif/BZUyhEs1Utmpo849yBtSm+AzaZ
         yNISMwAyRzSeaN/JF+ZcdEMowkzm36D9hO1VIS4dtAy31j7TY/irM4GUUzGNasBdV2hr
         Pn0fCBZ4yDlMZ0JVS/JYK/yPX8k/KW1zgdiIG8gILTWm1Dnp0J1Wal6wE7n5hN9tmV3c
         B6khJbp5w7IM0na7MuUSxESHmrl6d6UrhH35IYtD595p6NstU9zM+BduBrsFpSOn2Xxn
         4yVg==
X-Gm-Message-State: AO0yUKXbK68HlvcadyNoLBvn8XiBMTk+9F5R3gezhUlMjFYsK6tdwPHf
	qqo4apxFLxZ0jzF/HNoxiZ8=
X-Google-Smtp-Source: AK7set+ZhZVUGQysFESJVoq6vJY3frd1ZVHwPO/IGJVBnFykg9eG0tx3wxoLTR87kSNaAYx3KLH9Pw==
X-Received: by 2002:a17:906:d4:b0:878:5fa4:7443 with SMTP id 20-20020a17090600d400b008785fa47443mr5803546eji.3.1678571458319;
        Sat, 11 Mar 2023 13:50:58 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id nb17-20020a1709071c9100b00925867d821fsm125242ejc.120.2023.03.11.13.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 13:50:57 -0800 (PST)
Date: Sat, 11 Mar 2023 22:50:56 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] staging: rtl8192e: Remove unused variable rfintfi
Message-ID: <f251186fe59855eee3dd465954700a1d0ec50f53.1678569965.git.philipp.g.hortmann@gmail.com>
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

Remove unused variable rfintfi because it is just once set and not used.
Remove unused constants as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h    | 1 -
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c    | 5 -----
 drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h | 2 --
 3 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index ac192254a4bb..adedcea5824e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -103,7 +103,6 @@ enum rf_optype {
 
 struct bb_reg_definition {
 	u32 rfintfs;
-	u32 rfintfi;
 	u32 rfintfo;
 	u32 rfintfe;
 	u32 rf3wireOffset;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 94b23cb53c36..19fdf56e5e91 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -359,11 +359,6 @@ static void _rtl92e_init_bb_rf_reg_def(struct net_device *dev)
 	priv->phy_reg_def[RF90_PATH_A].rfintfs = rFPGA0_XAB_RFInterfaceSW;
 	priv->phy_reg_def[RF90_PATH_B].rfintfs = rFPGA0_XAB_RFInterfaceSW;
 
-	priv->phy_reg_def[RF90_PATH_A].rfintfi = rFPGA0_XAB_RFInterfaceRB;
-	priv->phy_reg_def[RF90_PATH_B].rfintfi = rFPGA0_XAB_RFInterfaceRB;
-	priv->phy_reg_def[RF90_PATH_C].rfintfi = rFPGA0_XCD_RFInterfaceRB;
-	priv->phy_reg_def[RF90_PATH_D].rfintfi = rFPGA0_XCD_RFInterfaceRB;
-
 	priv->phy_reg_def[RF90_PATH_A].rfintfo = rFPGA0_XA_RFInterfaceOE;
 	priv->phy_reg_def[RF90_PATH_B].rfintfo = rFPGA0_XB_RFInterfaceOE;
 	priv->phy_reg_def[RF90_PATH_C].rfintfo = rFPGA0_XC_RFInterfaceOE;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
index 616a4b62d4b9..5a47b232945f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
@@ -80,8 +80,6 @@
 #define rFPGA0_XC_LSSIReadBack		0x8a8
 #define rFPGA0_XD_LSSIReadBack		0x8ac
 #define rFPGA0_PSDReport		0x8b4
-#define rFPGA0_XAB_RFInterfaceRB	0x8e0
-#define rFPGA0_XCD_RFInterfaceRB	0x8e4
 
 /* Page 9 - RF mode & OFDM TxSC */
 #define rFPGA1_RFMOD			0x900
-- 
2.39.2

