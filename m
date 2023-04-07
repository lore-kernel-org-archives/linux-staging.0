Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891D3AFE7
	for <linux-staging@lists.linux.dev>; Fri,  7 Apr 2023 21:50:24 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-947a47eb908so90104466b.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Apr 2023 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680904224; x=1683496224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOZBenPjCQElNBV9GC58Q3qKs5/Fllkis9cJIxphAWQ=;
        b=aHyx2cCO6il6cbGQZ0m/vQt1mipsG3YpejNkL9hASbNeefAnvW5W61Zx+c0eaAgaQw
         P7aFTmWzv6iMZk300l+Xqci3hSMGtbOlY6mQHNgsPJrreq3s9PhnAaLzxMNzUlU96f5G
         Vbpjlb2H5pcNlQc6xvsTaUsGiu5lNu/+v9VCj2Bk7n1mwsMJRCGtOKxjrmkmmnsAgpv3
         knmT0AUwUr03eqw7BEuP2z2KX34TYe5UE8mA7DqAodRgZ9w++V2bKCVjBeXBzGjn9av6
         u/6v/WnGc5C/NjZAfISdedeNlCe5iNeHuRDIbVy1dPAJyqE7UcJIkFv1vQ30/sTqV+4a
         auDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904224; x=1683496224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOZBenPjCQElNBV9GC58Q3qKs5/Fllkis9cJIxphAWQ=;
        b=KCOOWwD0mjoVppketvlOJI7PZLHw/9uU58MezFk9eVgpwLkPLsgPN+TkzaQR+Adqyz
         M6yUH8TGswEbRQkezwWsGRxMnmBsg2ph++6Pzs6nvz0hNGWE29qLrVJykZZnD532ZHcH
         bQ4ZfGuw7WTc+lwASLMqFkWMSrkxkmrihksPdB6nHb130ah6VKoc4hd2oanh9iJFVqW4
         2Ty9Mzstiy8XoekjOm6S5VrwbkfOA0y3KccaGZYVkEOiEGmC0df/Ww1vrsTe4tLzMtBf
         uFJZi6+hzbO1cp4NJsfx2pJugf85NLtxQqk9V3S44OD8pVBATMjd8FqDsH96kx6NExKO
         cZ/Q==
X-Gm-Message-State: AAQBX9dcrDY2Xt75YqoG6o8zmYvu9tTgbhM+H9dNPXPaFCTnRweHcOlv
	jdH8+CybGVYDV3SLSVKgymBhzgrBGCI=
X-Google-Smtp-Source: AKy350adbodKNBbqqG3x4Q5fva8YRV3yL2abrwH3hdgIIv0kTmvhD1sBcseyS2k26rRGkD9NCDHGSw==
X-Received: by 2002:a17:906:51c8:b0:92f:27c2:13c0 with SMTP id v8-20020a17090651c800b0092f27c213c0mr673359ejk.6.1680904223811;
        Fri, 07 Apr 2023 14:50:23 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id lw26-20020a170906bcda00b009310d4dece9sm2450471ejb.62.2023.04.07.14.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 14:50:23 -0700 (PDT)
Date: Fri, 7 Apr 2023 23:50:21 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] staging: rtl8192e: Remove macro
 IS_HARDWARE_TYPE_8192SE
Message-ID: <e9b19862ace002462e870e62c6f62bab3cc81c5a.1680902603.git.philipp.g.hortmann@gmail.com>
References: <cover.1680902603.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680902603.git.philipp.g.hortmann@gmail.com>

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

