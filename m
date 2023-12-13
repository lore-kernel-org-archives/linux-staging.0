Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B237C2FC21
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAZGtBO5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a1b6524f24fso224831466b.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486377; x=1703091177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FS9s22OYVyAuBMFkyAlKFllCNEacvvjLW0t9zMiOW0M=;
        b=JAZGtBO5N9T+9kyBfv2L0GxFzKVNSl7ueMErNDB8g3d1bJRF6DnyreEyEcKz+jEeld
         cWdcO+QsWFocdX6NZUuSb/e5fRWgJdIb7fcX9AlDnLDbVfBu03ZxjGNgVrwhoMR8ol0z
         bHxSt1CJgRDvZ+0ddoq3TfW5m2eeb+/vceVGZBrv5VKZZdg6Ygc2IdZqym4CnIuUNGS2
         VwsBNALMF/3G5l8ETsfp4RfJv4xSj9eUvtKmz7gRuIkURQWmzDMb/cYx+IjYT1guBKxt
         rRv3p6zsYHQVSlqIomvMBjlKjpBPlZ9enWemiJzrKY35Rll6374hE1ah10EGVQkoeE4R
         8k8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486377; x=1703091177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS9s22OYVyAuBMFkyAlKFllCNEacvvjLW0t9zMiOW0M=;
        b=hMDVA8cOxZQO6v9cjY/wkB42GMCyZosKCQ7AmOOHpdQ9QrKzlYut0/n6mQlZIfHpOy
         yDTNpb7Zf+pModyK/y8XSitb5VH6Gw4fvsdizN50Oz63BsWNRLGRQNzvGKMygE8MG4fT
         cEkKYCDbmuee2vsrJ0P0D4Pc1nHvLVnBoHx5zi7SdOirq/Kzf3cEts+nYf1IXIg9PIXX
         njLjXQQCnz7wX1nAJz8ObZvBt0SerqOHe0ETKJXGLwmojpwH/oYRnBvSHbs+pcDWMvjL
         69jtvn+LmozUj8q9VmmX3YrB9nx3vJZ0b0ksVUJ9BytSvW116O/xCQPYXCSzt9KFhwSY
         5gRA==
X-Gm-Message-State: AOJu0YwpJ09yRhuRBRuQ6jKc0KKYyGnhJMs04iwjqIYKMq/Nmi6uVKWk
	/FYx/A7+OsSncbYQk6UFHgAeSQniqDY=
X-Google-Smtp-Source: AGHT+IFIApYKM+gx1pkJmp4hu81yddktS+De8kLLlF1vuNbUK4n3HX+NC4tp8rIIgO/t5SqJueGYeQ==
X-Received: by 2002:a17:906:99cf:b0:a1c:5944:29bb with SMTP id s15-20020a17090699cf00b00a1c594429bbmr9082964ejn.7.1702486376863;
        Wed, 13 Dec 2023 08:52:56 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id sa16-20020a1709076d1000b00a1da72b8752sm8047775ejc.212.2023.12.13.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:52:56 -0800 (PST)
Date: Wed, 13 Dec 2023 17:52:55 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] staging: rtl8192e: Remove constant variable
 reg_rx_reorder_enable
Message-ID: <c9bf183b78bfe1fc242dc496786cd0c9f20262a4.1702406712.git.philipp.g.hortmann@gmail.com>
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

Remove constant variable reg_rx_reorder_enable and replace it at the place
of usage with the value.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 514ac9e1f3f8..2911ea82dd17 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -115,7 +115,6 @@ struct rt_hi_throughput {
 	u8 current_rt2rt_aggregation;
 	u8 current_rt2rt_long_slot_time;
 	u8 sz_rt2rt_agg_buf[10];
-	u8 reg_rx_reorder_enable;
 	u8 cur_rx_reorder_enable;
 	u8 rx_reorder_win_size;
 	u8 rx_reorder_pending_time;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index d9561e3a76d6..00bf5c706157 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -79,7 +79,6 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 
 	ieee->tx_enable_fw_calc_dur = 1;
 
-	ht_info->reg_rx_reorder_enable = 1;
 	ht_info->rx_reorder_win_size = 64;
 	ht_info->rx_reorder_pending_time = 30;
 }
@@ -484,7 +483,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
 		ht_info->current_ampdu_enable = false;
 	}
-	ht_info->cur_rx_reorder_enable = ht_info->reg_rx_reorder_enable;
+	ht_info->cur_rx_reorder_enable = 1;
 
 	if (pPeerHTCap->MCS[0] == 0)
 		pPeerHTCap->MCS[0] = 0xff;
-- 
2.43.0

