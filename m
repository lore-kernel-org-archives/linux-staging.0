Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC7328EA
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 09:52:08 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-947a47eb908so16058666b.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 02:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680429128; x=1683021128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S93CG6AlbKMkphzwNXa0JGigafN4J3sDtR60tP0Iyzc=;
        b=BJQE7ANH3TiEiq8wKmFaXIUoNuo92b0CHpEetEDbHu2ZgYuYW3JUfJFQWAyMX67xYU
         ZG5xX1JAvgY/jHoOJBWLBILwWJPzk1tNKupr6RAWHKNhkBBgi/eIKMJ+u1YziMPBuM3j
         lxxYXs1r87oV4F5ZW/bDRasox9c+51LTKZvV01MayxVPfVSxr4uB4VJOkWsRoqGKKCJH
         nm3Gq3QIft/el+6tgE43X/AaANGHNXflTSgaKcMFElA7kxNBSGMZ3EAQNn/ryZ8SBx91
         RMBVuziShC/rLOLjrHm/XJ47eAj4EczrYsqxrbZG1Y+SdYNS9TDMtIlI8xhbF+5m+jq1
         zPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680429128; x=1683021128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S93CG6AlbKMkphzwNXa0JGigafN4J3sDtR60tP0Iyzc=;
        b=De7+p9c0qPX/RYTOapCOPHymovQqhbtgJI2fJtWqVkpOwxWJ1NE5EMhsFx7cNSsmTh
         j6Zj9ecIP9xuivFAm7nJX9mqYKJgKRrACihywjwTXkHBssCrAGgP9Nglk7Yj4KGITi48
         EQLIo2Pgk+HctCYg2Osc9TW3qJw+BGd97HHW5ZZ9ykJTYJkd3RKYdGTouCeQvpnNZEth
         +UjEa0JBVnxBD3V6Rk4buawepsllm6iZeq5tOWXq05luj8AjjZezhC/m/1HcMBkQi9hQ
         eChIdFwpqyVK+IZ5QgvPKqyvVamgHhMPYHgWd76BF/MBO/9Qbgj4RSEIukXYDV4uclsr
         xo3A==
X-Gm-Message-State: AAQBX9eZ3bR/Igk0lDeZWcCC1nabXQZs4rBH3O3Q2rjAwjZLrcoeTeDx
	hlEA+0eqwd35RP5tjM4BcDeFd0hKdWc=
X-Google-Smtp-Source: AKy350ZFqFI5fGPRi2gn6daBAO5qPda3KZp8VbbEqiSGZyXV/sirXSpl6Fr/emOX0oYoBNTCdvfrfQ==
X-Received: by 2002:a17:906:224e:b0:92c:fc0:b229 with SMTP id 14-20020a170906224e00b0092c0fc0b229mr10688924ejr.0.1680429127797;
        Sun, 02 Apr 2023 02:52:07 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id 20-20020a170906101400b00947732c6521sm3061047ejm.79.2023.04.02.02.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 02:52:07 -0700 (PDT)
Date: Sun, 2 Apr 2023 11:52:05 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] staging: rtl8192e: Remove case customer_id =
 RT_CID_819x_CAMEO, ..
Message-ID: <b546933897acc20a6ac5be2bd5ef5ad979599c66.1680427945.git.philipp.g.hortmann@gmail.com>
References: <cover.1680427945.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680427945.git.philipp.g.hortmann@gmail.com>

customer_id is initialize to zero. Changing customer_id to
RT_CID_819x_CAMEO, RT_CID_819x_RUNTOP, RT_CID_Nettronix or RT_CID_PRONET
would not change the program execution as there is no equation for
RT_CID_819x_CAMEO, RT_CID_819x_RUNTOP, RT_CID_Nettronix or RT_CID_PRONET.
Remove useless code lines to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: No changes
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 12 ------------
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h  |  4 ----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  4 ----
 3 files changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index cbe66b4a6ad9..df8de35cbe0e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -435,12 +435,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 	case EEPROM_CID_DEFAULT:
 		priv->customer_id = RT_CID_DEFAULT;
 		break;
-	case EEPROM_CID_CAMEO:
-		priv->customer_id = RT_CID_819x_CAMEO;
-		break;
-	case  EEPROM_CID_RUNTOP:
-		priv->customer_id = RT_CID_819x_RUNTOP;
-		break;
 	case EEPROM_CID_NetCore:
 		priv->customer_id = RT_CID_819X_NETCORE;
 		break;
@@ -451,12 +445,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		else
 			priv->chnl_plan = 0x0;
 		break;
-	case EEPROM_CID_Nettronix:
-		priv->customer_id = RT_CID_Nettronix;
-		break;
-	case EEPROM_CID_Pronet:
-		priv->customer_id = RT_CID_PRONET;
-		break;
 
 	case EEPROM_CID_WHQL:
 		break;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 706d024bcfd1..4ee78b7a558e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -31,12 +31,8 @@ enum baseband_config {
 #define EEPROM_TxPwIndex_OFDM_24G	0x3A
 
 #define EEPROM_CID_DEFAULT			0x0
-#define EEPROM_CID_CAMEO				0x1
-#define EEPROM_CID_RUNTOP				0x2
 #define EEPROM_CID_TOSHIBA				0x4
 #define EEPROM_CID_NetCore				0x5
-#define EEPROM_CID_Nettronix			0x6
-#define EEPROM_CID_Pronet				0x7
 #define EEPROM_CID_WHQL					0xFE
 enum _RTL8192PCI_HW {
 	MAC0			= 0x000,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 91d634f5d3e7..2b2d8af4cf6e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -129,12 +129,8 @@ enum dcmg_txcmd_op {
 
 enum rt_customer_id {
 	RT_CID_DEFAULT	  = 0,
-	RT_CID_819x_CAMEO       = 6,
-	RT_CID_819x_RUNTOP      = 7,
 	RT_CID_TOSHIBA	  = 9,
 	RT_CID_819X_NETCORE     = 10,
-	RT_CID_Nettronix	= 11,
-	RT_CID_PRONET	   = 13,
 };
 
 enum reset_type {
-- 
2.40.0

