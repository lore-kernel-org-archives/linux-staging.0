Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C54101C3
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYbhSH+H"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9bf0bee9f2fso76474466b.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297496; x=1700902296; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fFLHsxGK7k/8eykGJrZMJGzqZ9wJ0aqJSpq01GUYpM8=;
        b=JYbhSH+HoFsdKhxxOuqJbDIpAIEIjq/qIdQ04MQfYzNZZmNH4TbNdfqyDHyLuwvLmy
         EwfmsSQRQ6ZluClaU9JYts5hwA2TA0kNzPedcLhaVqt6Kb6ClBSkIItmQLSq9MI4rnCR
         duTc1Vv2WjnN7mGpWyFDYHNBGHqfimQW1ZXiTgdGLsIumk2Db7ohhOqij6vEaLkhLY6A
         qyaOZGg9cMTValH3wdmRumg2HGgNJk0CSWofajRAmFxtFxng/cDoakTIT6XX5THjKK41
         h6Qks7j3dIK+evYVaEehHLhZU9oCyTqc9jrAnKiPkVFPAaIy8W207wQxPf7Vj+EyAO/Z
         n99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297496; x=1700902296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFLHsxGK7k/8eykGJrZMJGzqZ9wJ0aqJSpq01GUYpM8=;
        b=exuyfu9NJ2WItV4ZwBYJBWC7H/Y/o6Rw9gNtQIv5R3baZ68oIXPyaoPNP+Y7b0jl0A
         fcmRmPwQ9LCDRE5UQOaOKIrvhRtmb4hGfmWfWGHDvzS5DwUpVk6UPpaxd3nRu4ncLcJ1
         RRg9Abys37PepXnDLmivEvSAyj1GPkoKf15dEbyqcK2sO9brpxRHtVfzIKhhQoe+hQ4m
         7z9uspkcPqBtfIRUZE7852y62U4RbnoVB8vtMAWmrN1Ele/HYgMm4vrZwnl9XaGYTjAs
         +F1TqDg99SDbJWBdLqgfknhGwb2TMVYYkuQJpzQz9UvcJcvhlo4tMJV5HFc9Qr40F4YM
         2qtQ==
X-Gm-Message-State: AOJu0YyTyruy9tkj048hI4m/MRKtjPHdawPwM+id3P7pAYC6KM4/Sykt
	ZO/lBRFWIxRkuUEABCThujFeJYF7/DQ=
X-Google-Smtp-Source: AGHT+IGRibVfC9vsxr71T3msML2jvfXftKU6rYG8jk8iYmowTNsklN78jaPALqMcQoG9VhQlI2kNFA==
X-Received: by 2002:a17:906:1da:b0:9cf:7d6e:2c3e with SMTP id 26-20020a17090601da00b009cf7d6e2c3emr1133601ejj.7.1700297495823;
        Sat, 18 Nov 2023 00:51:35 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id l2-20020a170906230200b009fb1fc8c405sm214001eja.179.2023.11.18.00.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:51:35 -0800 (PST)
Date: Sat, 18 Nov 2023 09:51:34 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] staging: rtl8192e: Remove constant variable chnl_plan
Message-ID: <e46f16227877fe9853c9d15992e7fd27a0ceeae6.1700296319.git.philipp.g.hortmann@gmail.com>
References: <cover.1700296319.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700296319.git.philipp.g.hortmann@gmail.com>

Remove constant variable chnl_plan and replace it with its constant.
Remove equation that limits maximum value of chnl_plan as it is always
false.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 --
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 7 +------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 1 -
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 44898e0be21c..9b51deba149b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -396,8 +396,6 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		break;
 	}
 
-	priv->chnl_plan = COUNTRY_CODE_WORLD_WIDE_13;
-
 	if (priv->eeprom_vid == 0x1186 &&  priv->eeprom_did == 0x3304)
 		priv->rtllib->bSupportRemoteWakeUp = true;
 	else
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 2789f428e4f9..68bd03500267 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -795,13 +795,8 @@ static short _rtl92e_get_channel_map(struct net_device *dev)
 
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->chnl_plan >= COUNTRY_CODE_MAX) {
-		netdev_info(dev,
-			    "rtl819x_init:Error channel plan! Set to default.\n");
-		priv->chnl_plan = COUNTRY_CODE_FCC;
-	}
 	dot11d_init(priv->rtllib);
-	dot11d_channel_map(priv->chnl_plan, priv->rtllib);
+	dot11d_channel_map(COUNTRY_CODE_WORLD_WIDE_13, priv->rtllib);
 	for (i = 1; i <= 11; i++)
 		(priv->rtllib->active_channel_map)[i] = 1;
 	(priv->rtllib->active_channel_map)[12] = 2;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 348df71e122e..addaa1eb39ee 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -310,7 +310,6 @@ struct r8192_priv {
 
 	bool tx_pwr_data_read_from_eeprom;
 
-	u16 chnl_plan;
 	u8 hw_rf_off_action;
 
 	bool rf_change_in_progress;
-- 
2.42.0

