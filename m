Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C479E2
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 21:48:06 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-94971337b10so5704866b.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 14:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680731284; x=1683323284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOZBenPjCQElNBV9GC58Q3qKs5/Fllkis9cJIxphAWQ=;
        b=mNUK5sOtttLZfKBNZM2tGZvdtvWYZCi/DnyFtaxmPQB43zb8poHNgldRs20Ns2x/+8
         NcYR46166zF7r6ZSTFAqqmVQs5Fi+xyT+IdIIr4lL48NwmuQtidNzScSnXcu0DpuoLFt
         FAO5lVFsiTnL+6uR4BtwJAk0AbIiI3XDTziLIHLsI22xYhx1op0T8ccXE1fsIw/t1SJg
         8xbwJ8gUZDm5k1SgPLCDZCgyos0ymEWNRduotWj6V9WWMlHWPwLHZEKqeB9NV7lNt0jY
         9zJjTKxUiKezYFAWKabvEmAHnUrpJlxBseIu90twrrVblVQ2X7T3at9syByq6K01CJoI
         7E/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680731284; x=1683323284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOZBenPjCQElNBV9GC58Q3qKs5/Fllkis9cJIxphAWQ=;
        b=ur7w5fxjVBa862CK0Kh03PaiypI5Rr50z9r4ZesHJiMriZUHhbn8OfkOTzuW3igaY9
         ZDOtVVufETCJrxQgRLOU2S87NX/a2dI3qOD1D6YAtyGpppfSjKwE9b/zO8Xoq8xqQ112
         co7q3fe4Kovp5TPcp5POwy6xpfBtX0kfUl3f1PGd22b7irN8h33TrI0gjAJcPTHHxS2R
         cHlvWTWV9FxGOErra9WybUXA0XyCq9cet67WzmiZUlNho0MAJGFP4sFUI5uEQDkUsEio
         9wb+h9YwzIellmO02vplivwXTWSShQsMw9AZn3xkrHaueH4d75bU/3Jysxh+sPln5HP+
         K6Aw==
X-Gm-Message-State: AAQBX9fjleQ2/XSFWE76f95v5nIf++FgJAyed+RNQk6jChhMZP3oXSfn
	RDZJHJJBLMj0IG0rfOGl8k0=
X-Google-Smtp-Source: AKy350aZL+LtplhvFrytwP0+UngaZUt0frcaj0hQk2LZGzxc/dZ1+8TRMb5g742bf8gkEbQokA32xA==
X-Received: by 2002:a05:6402:1e8e:b0:502:1f7b:f069 with SMTP id f14-20020a0564021e8e00b005021f7bf069mr3427551edf.2.1680731284278;
        Wed, 05 Apr 2023 14:48:04 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id j26-20020a50d01a000000b004c4eed3fe20sm7853521edf.5.2023.04.05.14.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 14:48:03 -0700 (PDT)
Date: Wed, 5 Apr 2023 23:48:01 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] staging: rtl8192e: Remove macro IS_HARDWARE_TYPE_8192SE
Message-ID: <c3df7831f519ae4718a52c05d9db9bdb05aaa22b.1680729715.git.philipp.g.hortmann@gmail.com>
References: <cover.1680729715.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680729715.git.philipp.g.hortmann@gmail.com>

Remove unused macro IS_HARDWARE_TYPE_8192SE as it is used only in code
areas that are not executed when 8192SE hardware is found.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 3 ---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 7 +------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 2b2d8af4cf6e..b0aa76574738 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -52,9 +52,6 @@
 #define DRV_AUTHOR  "<wlanfae@realtek.com>"
 #define DRV_VERSION  "0014.0401.2010"
 
-#define IS_HARDWARE_TYPE_8192SE(_priv)		\
-	(((struct r8192_priv *)rtllib_priv(dev))->card_8192 == NIC_8192SE)
-
 #define TOTAL_CAM_ENTRY		32
 #define CAM_CONTENT_COUNT	8
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index cde41111012a..50486f2a6f3a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -214,8 +214,6 @@ void rtl92e_dm_init(struct net_device *dev)
 	_rtl92e_dm_init_fsync(dev);
 	_rtl92e_dm_init_rx_path_selection(dev);
 	_rtl92e_dm_init_cts_to_self(dev);
-	if (IS_HARDWARE_TYPE_8192SE(dev))
-		_rtl92e_dm_init_wa_broadcom_iot(dev);
 
 	INIT_DELAYED_WORK(&priv->gpio_change_rf_wq, (void *)_rtl92e_dm_check_rf_ctrl_gpio);
 }
@@ -816,10 +814,7 @@ static void _rtl92e_dm_check_tx_power_tracking_thermal(struct net_device *dev)
 	static u8	TM_Trigger;
 	u8		TxPowerCheckCnt = 0;
 
-	if (IS_HARDWARE_TYPE_8192SE(dev))
-		TxPowerCheckCnt = 5;
-	else
-		TxPowerCheckCnt = 2;
+	TxPowerCheckCnt = 2;
 	if (!priv->btxpower_tracking)
 		return;
 
-- 
2.40.0

