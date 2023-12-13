Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE382FC21
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNEAot1q"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a1d9a736510so218262966b.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486351; x=1703091151; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2IeMdk9LkSGFLAKjbTSIgJ9FLE3muXvM3bh5IcmmJy8=;
        b=jNEAot1q8nS0ngq8OFsWA52uGDYjE6A2Cl7D6Uka7xCiEPaNONU/oxn4PZX9CHcgvf
         HrDgaZT6ZIsvJ+b4b2wEHsKBW4eNwI4DVqB6lb8WdDqBlcK8vSYBZgZY7ifq1SOdWEAP
         +VVPnrzTYc0aFAAI2QyQ2N+W3Fo7HOxsOrzVIi4Tcaup7K+A3hL8Gk9irgfZg8fZz7kI
         iy/64kgM3WsPWrfVmt/1h47WffFyryLXrpVezBVRz8iKBMkacFEHwM4L1ziJ92DN7Vz6
         wvipykDjg3NWbBVw3P5EhoRhltuytpFZVrozNVbDlnaRgvn36jJBqaERj2V+jeRJK7FR
         /Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486351; x=1703091151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IeMdk9LkSGFLAKjbTSIgJ9FLE3muXvM3bh5IcmmJy8=;
        b=uaGNy9surRuvYYgk+HBqjPqaftQ4fcOmRvJqLWdXYt26Az0PX8e0WnLYDF0kQv8CMB
         Mtbe98FHIfOpjUz29ZHyI3tOsCmz106+N851fg1q/5fyNSkQFW51RVNsYf5tiwPJeTt+
         qtgHVBdw0e+0CL/7ZsBja0OT5g/0PxD7AiTJ86gUaPwPBacXwwSlwbc8GH1GaNQdU9d5
         EaxwYM8jr28q2xjSwXdCzMP4HkZTv6p77s607p94XSU7JqTJkWjndb79fqkDbAqEjVpa
         +5NRJWQkMQbCBnC88FWbI9oJOc85NYy/DauljyCv/Ffl+7jKrc8SZENGpGOZo/wrx0Zl
         Jmzw==
X-Gm-Message-State: AOJu0YxKv5WLVZL7oww33Ss8EwMjfJ+owsQxe7U5SoR1LP2xBcyEkF3B
	BfUk42IwSA3dSle/IzFFGww=
X-Google-Smtp-Source: AGHT+IGPNcU/50+hpUoQHnLv+AQkC9dE9Per50QuyKsJ715hk2aPjYYa8YscJtrZq1mrdXJf93xumw==
X-Received: by 2002:a17:907:c003:b0:a1d:6d:1392 with SMTP id ss3-20020a170907c00300b00a1d006d1392mr9509922ejc.1.1702486350900;
        Wed, 13 Dec 2023 08:52:30 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id ul5-20020a170907ca8500b00a1fa7e39957sm4417134ejc.136.2023.12.13.08.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:52:30 -0800 (PST)
Date: Wed, 13 Dec 2023 17:52:29 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] staging: rtl8192e: Remove variable
 ht_info->mpdu_density
Message-ID: <ef90d31e0e8281235ae4d138ce2de26e35c1bbd1.1702406712.git.philipp.g.hortmann@gmail.com>
References: <cover.1702406712.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702406712.git.philipp.g.hortmann@gmail.com>

ht_info->mpdu_density is set to 0 and unchanged. Therefore all equations
result accordingly and ht_info->forced_short_gi can be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index c4af9968cd67..1da56f1c04eb 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -105,7 +105,6 @@ struct rt_hi_throughput {
 	u8 current_ampdu_enable;
 	u8 ampdu_factor;
 	u8 CurrentAMPDUFactor;
-	u8 mpdu_density;
 	u8 current_mpdu_density;
 	u8 forced_ampdu_factor;
 	u8 forced_mpdu_density;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 044bfe44d213..14e6f46a65ed 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -73,7 +73,6 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 
 	ht_info->ampdu_enable = 1;
 	ht_info->ampdu_factor = 2;
-	ht_info->mpdu_density = 0;
 
 	ieee->tx_dis_rate_fallback = 0;
 	ieee->tx_use_drv_assinged_rate = 0;
@@ -491,8 +490,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 							    HT_AGG_SIZE_32K);
 		}
 	}
-	ht_info->current_mpdu_density = max_t(u8, ht_info->mpdu_density,
-					      pPeerHTCap->MPDUDensity);
+	ht_info->current_mpdu_density = pPeerHTCap->MPDUDensity;
 	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
 		ht_info->current_ampdu_enable = false;
 	}
@@ -526,7 +524,7 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	ht_info->cur_short_gi_20mhz = false;
 	ht_info->cur_short_gi_40mhz = false;
 
-	ht_info->current_mpdu_density = ht_info->mpdu_density;
+	ht_info->current_mpdu_density = 0;
 	ht_info->CurrentAMPDUFactor = ht_info->ampdu_factor;
 
 	memset((void *)(&ht_info->SelfHTCap), 0,
-- 
2.43.0

