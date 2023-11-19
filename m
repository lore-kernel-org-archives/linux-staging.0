Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595511CB7
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JK+HDzgQ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9e3eaf098f1so110137866b.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432134; x=1701036934; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ael1tKdfqfresRYbM3miMc6lCiPRw9WqecWTMStesZY=;
        b=JK+HDzgQVeJNHZHXzkLYlrG8W4B1e4QVWn3RWxtV6TQ/kH4P0fZ9Jnmshl1rAvKPSn
         GyRc2ZtBRMeNXAWKlU0hqFOJmZ1QIlqedk5Rv/Z9uPvu7WsM2dwbilqzBmzo75Dj9KdM
         yc2oiZk6zktWp/K+B8K6PyB1AvECln/4AQhQ4zfx2sUkHA2Mq9iQYgUiexEoN4CrQeVu
         fLrtEnL1KHNpNokMpYdH1bo+EOw+KoIyIvXYGXmrbpyQAnL7B65zL7KPlCLkkRAUaNJk
         LJaabuGLUm8MJvC6cg/OE9zIHkCyKalwFT/H7QEvNV+enEL9M+OidXSdzV4qv8MUY4Cg
         di8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432134; x=1701036934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ael1tKdfqfresRYbM3miMc6lCiPRw9WqecWTMStesZY=;
        b=RSPQp3LPaMsWJOLk49iIeqR9ulWIeLlH8vQ+KUimTW49PoCeWdZfeRtu6ulenf7E67
         HjIJF/se1+8+HmM6inMCQDeescjfT71Gaj/ueJtoMUEqJpQgzix7AGBg7xeX2xweM7QR
         zPodE9OIAWb+jBOlim3dPb7805F43+czmarlzSR8UroGOSWod0v+Uc0QAYeyeQgtrCaT
         LVRghH+IvhzvzcQ0+S7/MyerEggx87drqUbR08VHhYJUYvNcyWbDkCevTj88mYY7KdM1
         /VNuhWfSEr8Vgw9F8OCEeySef7Ogy2BibI0StIOs005RjXq3IILOLxzUU1XiU/tNiMOc
         K27Q==
X-Gm-Message-State: AOJu0Yz4b9BqtWU8IBiT/hRTSrnuNucYdycdPk537WtSRha4osXOwuVO
	r/cohN7YMN4odzNT2xchGudMe9znumA=
X-Google-Smtp-Source: AGHT+IFIc+7Sjpjpk9g+XxpEuge1OaVTL/eKFf9jWJmtSpAv/pjR+9vMKd1hicUNJXeZaVlyJC4yrQ==
X-Received: by 2002:a17:906:7486:b0:9c4:4b20:44a5 with SMTP id e6-20020a170906748600b009c44b2044a5mr3318304ejl.4.1700432134223;
        Sun, 19 Nov 2023 14:15:34 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id sd22-20020a170906ce3600b009fbf15cee7fsm1434263ejb.69.2023.11.19.14.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:15:34 -0800 (PST)
Date: Sun, 19 Nov 2023 23:15:32 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/14] staging: rtl8192e: Remove unused variable
 country_watchdog
Message-ID: <958f2ebbedb51e71e11479f734b4df27484160e1.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

country_watchdog is initialized to 0 and then never changed. Remove
related macros and functions.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 1 -
 drivers/staging/rtl8192e/dot11d.h | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index b524ebe31869..b8ba95a65f27 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -19,7 +19,6 @@ void dot11d_init(struct rtllib_device *ieee)
 	struct rt_dot11d_info *dot11d_info = GET_DOT11D_INFO(ieee);
 
 	memset(dot11d_info->channel_map, 0, MAX_CHANNEL_NUMBER + 1);
-	RESET_CIE_WATCHDOG(ieee);
 }
 EXPORT_SYMBOL(dot11d_init);
 
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index 64fd39cddc22..82748b12bd82 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -25,20 +25,12 @@ struct chnl_txpow_triple {
  */
 
 struct rt_dot11d_info {
-	u8  country_watchdog;
 	u8  channel_map[MAX_CHANNEL_NUMBER + 1];
 };
 
 #define GET_DOT11D_INFO(__ieee_dev)			\
 	 ((struct rt_dot11d_info *)((__ieee_dev)->dot11d_info))
 
-#define GET_CIE_WATCHDOG(__ieee_dev)				\
-	 (GET_DOT11D_INFO(__ieee_dev)->country_watchdog)
-static inline void RESET_CIE_WATCHDOG(struct rtllib_device *__ieee_dev)
-{
-	GET_CIE_WATCHDOG(__ieee_dev) = 0;
-}
-
 void dot11d_init(struct rtllib_device *dev);
 void dot11d_channel_map(struct rtllib_device *ieee);
 
-- 
2.42.0

