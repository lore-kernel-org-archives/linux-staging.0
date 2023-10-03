Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180438DE6
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:33:37 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9b2c5664cb4so44593566b.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361615; x=1696966415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KmOK5nTUWkYnjS4nXNkbZr/qlzx1/zJ4Eml2lPlllD0=;
        b=DzuYdKCWKl3b8y5edBCgrWWJuOoiEEQrkrgd1zEDrWq46suCnUOXYe47w+JC64lOBl
         FTDAbVwAzPfJwB5EQxD97mkP52VDYyhRCq5BQeuWmeK58JLL+dUB+7pUiIoZWb2foG/K
         oMmHzhFEbp31C4GDxOiObe+nWWUHq/3NAjqvxagsTOyGYS9puCLvSm8ypyFoF6s2mJxq
         PXiLq9WIUFSd0TvRD0waiBZ1MtmxT2PdWseWLQPMPxB9aWzdX8+zhdetDDJIiB4ld+qs
         BxoyFGzDYPFMHO3Fvss+a5pmiK39TeS6G1z80lKZgjozoyzR8TypFRgQc0XQ99VsnTTx
         6A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361615; x=1696966415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmOK5nTUWkYnjS4nXNkbZr/qlzx1/zJ4Eml2lPlllD0=;
        b=oQCHOmytYgr+vkJBrrrM6NVU/qFCghFSV+iDex0xbFUqOVSmwsJPU7AuQvXwoj9Fdz
         oxDfEfo9bq/ZM5XmisctQl71CBymr8UKfxqWCsMvmNqdNwhnxbDXvvh/brvzUbbfKnNy
         w36eWWw0dFCSWSc68mCm/V+WE5U7pj6dvwUZd8upMZ1njptWMqSqhS9aL8c7HW83nf7M
         0Ga2Vakj/Nxo1l1HgoFlEGkd6JIA84y+/NNWT6l90ZNkjaMvhMtCHUIlxDvTg8KBw4Ec
         f8FeteoswZf5VK24tkHOOf+nhYO4R7lk/LFJvpTKiud740DWGOhByqHjYJY2hiWbh08o
         GxfA==
X-Gm-Message-State: AOJu0YzUnxJ8iCHDChJA86YBJXoDu+H0SuWLxmDY7CoV1s1K8vlOdkln
	WHL1kx/Sw3crNZsCtDHYFsWIy1ayE4Q=
X-Google-Smtp-Source: AGHT+IFgGySfjQxeVabz8Mba5OoaWdJl77RgI6UFFhg5QoRtEsxwEAh9kkDPu6KCLk0CvKxBMrxAiQ==
X-Received: by 2002:a17:906:530b:b0:9a1:aea8:cb5a with SMTP id h11-20020a170906530b00b009a1aea8cb5amr131361ejo.1.1696361615592;
        Tue, 03 Oct 2023 12:33:35 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id c20-20020a170906529400b0098d2d219649sm1531444ejm.174.2023.10.03.12.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:33:35 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:33:33 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] staging: rtl8192e: Remove unused parameter mesh_flag
Message-ID: <3daa591db70978b305e4a1db7353fd96574d5591.1696360403.git.philipp.g.hortmann@gmail.com>
References: <cover.1696360403.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696360403.git.philipp.g.hortmann@gmail.com>

Remove unused parameter mesh_flag of function
rtllib_softmac_start_protocol().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index d01cfca39ef5..9c872819969a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -611,7 +611,7 @@ static int _rtl92e_sta_up(struct net_device *dev)
 		rtl92e_check_rfctrl_gpio_timer(&priv->gpio_polling_timer);
 
 	if (priv->rtllib->link_state != MAC80211_LINKED)
-		rtllib_softmac_start_protocol(priv->rtllib, 0);
+		rtllib_softmac_start_protocol(priv->rtllib);
 	rtllib_reset_queue(priv->rtllib);
 	_rtl92e_watchdog_timer_cb(&priv->watch_dog_timer);
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 41b34331380c..546eedfeb43e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1705,7 +1705,7 @@ void rtllib_EnableIntelPromiscuousMode(struct net_device *dev, bool bInitState);
 void rtllib_DisableIntelPromiscuousMode(struct net_device *dev,
 					bool bInitState);
 void rtllib_softmac_stop_protocol(struct rtllib_device *ieee);
-void rtllib_softmac_start_protocol(struct rtllib_device *ieee, u8 mesh_flag);
+void rtllib_softmac_start_protocol(struct rtllib_device *ieee);
 
 void rtllib_reset_queue(struct rtllib_device *ieee);
 void rtllib_wake_all_queues(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index babd48aa327d..11395dbc9d4d 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2316,7 +2316,7 @@ void rtllib_stop_protocol(struct rtllib_device *ieee)
 	ieee->assocresp_ies_len = 0;
 }
 
-void rtllib_softmac_start_protocol(struct rtllib_device *ieee, u8 mesh_flag)
+void rtllib_softmac_start_protocol(struct rtllib_device *ieee)
 {
 	mutex_lock(&ieee->wx_mutex);
 	rtllib_start_protocol(ieee);
-- 
2.42.0

