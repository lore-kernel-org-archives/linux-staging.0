Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B8E70
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:24:50 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so4418729wmi.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+MlwvedlRq5Aoz1XN1aqqaDksTBqCj+dbV2mvDjvBWM=;
        b=FGU2w3Pwke9ay5slGbOMZ6/xTu4FVN/nojnXW2M2EWIZQTSYIVbIZrnDYMpXYMfElo
         bJaIABqQ0RVDnlcskO+kcl67bDXwa7rrqJ2HQLy369zBAv3wYgMIiHpVDISMiZVhB9Yz
         EQo+WMQEorTuDzZwdj0s6RECz1ot+/TqfHm3omlXiUOdO/SI1w+5EhJxl017nuF+UB74
         gQ3EiNAw0Gark5nn7vaSaFMB/IUBuGnY57s25t2s0BFDTAkyJrBRcXQAX3+3mRtLGJ9A
         WkXnoBQrLQw/2u7fZRKHzkEMEhR0K27mj9b6etht3pGPWBjOZEAb+92woFym4RvCJRnZ
         Oadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+MlwvedlRq5Aoz1XN1aqqaDksTBqCj+dbV2mvDjvBWM=;
        b=LXg97pnpNiA51wEPs2Dg/w6uVOLwm5n88B5NSkxEmulYomHkz1oQ3eslZzGkT7MCx+
         JZgn7Wg6e4TZ1LguVUVro8IjUk2UqTRV4rIFFX8o7YhtLPifLv+lAUYlyoKibf6KmJhk
         ZkufuRnUTKImC0Pzy2rFTtJ1pSgcaS1LoyprvNUEzEz4wUNMn5DlXee6A2eaGIegUyfK
         6ONYpWGi7WQVva+qaOMZKEPPDBG8BH0hCzvw6zAp51/7u++HPEJd0oJwIcBUYA4hvnos
         I90qIIHHQO1livkaqhJRH/WZYgdt7m+7gPBOwtw7K/+AQ81Z44z6NRG2quoQHLbh2Aic
         GDDw==
X-Gm-Message-State: AOAM532v2IAa0ju9U42TU1CtPmlr2tgqwoNM2xHsGBmUwmOWptJYh9yo
	lBvUiJkEBvqIsr5ZP0kLbmgeDaXenpLryQ==
X-Google-Smtp-Source: ABdhPJzt7d3dW6Of4v3cU3V7iM7luZmf8mpoHG6JDJMhQagJ1kEdBg02THHHhaQhpouVhjK/ZyJfaw==
X-Received: by 2002:a05:600c:2197:: with SMTP id e23mr17271516wme.39.1616855089520;
        Sat, 27 Mar 2021 07:24:49 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id r16sm13649978wrx.75.2021.03.27.07.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:49 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 05/20] staging: rtl8723bs: remove unused macros in include/hal_data.h
Date: Sat, 27 Mar 2021 15:24:04 +0100
Message-Id: <5ad16f41ae356e09156a0f3018eef9cffd3c59a7.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove declarations of unused macros in include/hal_data.h

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index b5a0be35a6ce..93ee20e8e860 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -50,12 +50,10 @@ enum rt_ampdu_burst {
 #define CHANNEL_MAX_NUMBER_2G		14
 #define CHANNEL_MAX_NUMBER_5G		54			/*  Please refer to "phy_GetChnlGroup8812A" and "Hal_ReadTxPowerInfo8812A" */
 #define CHANNEL_MAX_NUMBER_5G_80M	7
-#define CHANNEL_GROUP_MAX		3+9	/*  ch1~3, ch4~9, ch10~14 total three groups */
 #define MAX_PG_GROUP			13
 
 /*  Tx Power Limit Table Size */
 #define MAX_REGULATION_NUM			4
-#define MAX_RF_PATH_NUM_IN_POWER_LIMIT_TABLE	4
 #define MAX_2_4G_BANDWIDTH_NUM			4
 #define MAX_RATE_SECTION_NUM			10
 #define MAX_5G_BANDWIDTH_NUM			4
@@ -69,11 +67,6 @@ enum rt_ampdu_burst {
 /* define IQK_ADDA_REG_NUM		16 */
 
 /* define IQK_BB_REG_NUM			10 */
-#define IQK_BB_REG_NUM_92C	9
-#define IQK_BB_REG_NUM_92D	10
-#define IQK_BB_REG_NUM_test	6
-
-#define IQK_Matrix_Settings_NUM_92D	1+24+21
 
 /* define HP_THERMAL_NUM		8 */
 /*  duplicate code, will move to ODM ######### */
-- 
2.20.1

