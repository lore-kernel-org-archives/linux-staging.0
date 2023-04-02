Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8368D28EA
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 09:52:17 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id b20so106310817edd.1
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680429136; x=1683021136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/d2ZeR1z4unotF600EGJ8LS6r3TxAXihhwj6OvhZ4s=;
        b=Vhs4KIS8EiSOEDtFrW5LWi892ufy5hYLekAexhJ7VTBT23bHuDBUUwV4vArZaxEZcP
         9/cay62aOVWWH6M1N6cNHvZ1QZ2nqCtqyw2a7LdjK0p1KfuWrz1FSmG2yOdDr4PQIGCB
         jW2DNQLlxPjl/zdnZ1mEXrqWhBzDJk3ftS74carwEtcG3vBucvzwnWxHKZbyJ567US68
         js1CLL5WF2k0/pvNwmjxPLvD4rYY+eTPsj9wh+jLXQbUj3kPt6RovjY/2p4FvsDQj2ry
         bPnQojhYRCn5EVaJ0i2lK4Z6wKr+OnGeed0w4UspfqBqLkcrCDbRBD3HNtdpyBko14Jm
         5q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680429136; x=1683021136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/d2ZeR1z4unotF600EGJ8LS6r3TxAXihhwj6OvhZ4s=;
        b=fmwfN9YjyiCSi0ZUnJ7wxkR1wnYnMivN9nuix9lOe2ZldB4bxFuu52wKqbpgDfG32T
         plubu0Nsu0Q4xQoPgcWedfVWuBGZjcJtHHahRnp8x/gQndjZW80I3el6hjVyPZA7VCZi
         eS5mmEGZrhFlStohHvwjWELmvgWGRzskAfTmi6xt4NNGzJqh7ToTQGTO1BXFiaBn4R0+
         v79MBfkh6Q5Ix6WSgBI9rNu5UJ+sS5WSUcXJQCEJZPob+CLDF1JNfa3dei0KOwLK7uuW
         M7dTRsH0GDDIY8elAaEcRtu4YC/gC2jfCx350RuRv/6etqOSJ5kfRZobnoF0Wuq8+0MU
         IPNQ==
X-Gm-Message-State: AAQBX9fGNP52GXuMIbj5Uul/3tu18KAbg1zYZyLRuZDbxbT45LxvfrVO
	rEhbnnWDD77OITusZ/ZDFxg=
X-Google-Smtp-Source: AKy350aQqBJ/2FYaGFnaqBoz8Ycuma9lVMpJrH9jMw4Iw4fCEoK/T2T88jeXnaAnFeUxBEjVsn38dw==
X-Received: by 2002:a17:906:7390:b0:947:8734:a058 with SMTP id f16-20020a170906739000b009478734a058mr8284146ejl.4.1680429135633;
        Sun, 02 Apr 2023 02:52:15 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id p16-20020a170906a01000b008cc920469b5sm3099067ejy.18.2023.04.02.02.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 02:52:15 -0700 (PDT)
Date: Sun, 2 Apr 2023 11:52:13 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] staging: rtl8192e: Remove case customer_id =
 RT_CID_DEFAULT, ..
Message-ID: <58df9db5da84991206266e739b2a12c893d1be8e.1680427945.git.philipp.g.hortmann@gmail.com>
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

customer_id is initialize to zero. Changing customer_id to RT_CID_DEFAULT
will not change customer_id as it is already zero. default and
EEPROM_CID_WHQL contain only a break. Remove useless code lines to
increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: No changes
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 8 --------
 drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h  | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index df8de35cbe0e..aed53fedeb61 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -432,9 +432,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		priv->chnl_plan = priv->reg_chnl_plan;
 
 	switch (priv->eeprom_customer_id) {
-	case EEPROM_CID_DEFAULT:
-		priv->customer_id = RT_CID_DEFAULT;
-		break;
 	case EEPROM_CID_NetCore:
 		priv->customer_id = RT_CID_819X_NETCORE;
 		break;
@@ -445,11 +442,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		else
 			priv->chnl_plan = 0x0;
 		break;
-
-	case EEPROM_CID_WHQL:
-		break;
-	default:
-		break;
 	}
 
 	if (priv->chnl_plan > CHANNEL_PLAN_LEN - 1)
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
index 4ee78b7a558e..f4d4b01630a2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
@@ -30,10 +30,8 @@ enum baseband_config {
 #define EEPROM_TxPwIndex_CCK			0x2C
 #define EEPROM_TxPwIndex_OFDM_24G	0x3A
 
-#define EEPROM_CID_DEFAULT			0x0
 #define EEPROM_CID_TOSHIBA				0x4
 #define EEPROM_CID_NetCore				0x5
-#define EEPROM_CID_WHQL					0xFE
 enum _RTL8192PCI_HW {
 	MAC0			= 0x000,
 	MAC4			= 0x004,
-- 
2.40.0

