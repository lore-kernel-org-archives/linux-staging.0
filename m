Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B9F19BB0
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQJXyEAK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32f9baca5bcso894187f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432084; x=1701036884; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yx4XEQPLPrhx/0ZC7QuPfqxkRIrwqbWbj56fu2tqSnQ=;
        b=kQJXyEAKhU6qhKzw8oooVBycmFetfOfPDWX2suy+PWrebyyZPp34O91fzX/NvulVh5
         tHrEZ1ihkl0wk59BdFgjHneaP7MvKa559a+udE6V8Q2OGLbXlP5Ij1l7CsNUTcBDIe5j
         I1Ap0HUH/rPoUM7cZhCy51iiGzfGsd5xEeECCSUsAhv7iHL0dKQ1fapQ0WiqJn2sSoq9
         WSzEt8L41sNavzZxVyKzLg2E3KnjgtPvuNC8FGoNogUKk41YeaEMhJqOvpHIvWCc+OnB
         8Sx/3Tzuzi8/O6E9r7DIE6gqthZvbpejN+ZP0ktjRZ1DkK5MlWtubwmHLF3lpvZrqZSd
         GwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432084; x=1701036884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yx4XEQPLPrhx/0ZC7QuPfqxkRIrwqbWbj56fu2tqSnQ=;
        b=qqeof/3MJ6ZywABrviE1IOvuogPITds8kZYG6IzBKu2zne4ZS1+Wzkq3z2+Ite9gTg
         qM5DLWjYN08JDoiAw8zuGW+wlMLARcFKNe3W8ygMhtEHW+QF++2qqpdLTyqTAKWlnr0E
         0w+kBriQ4xfNxuo+I3mc/TldfffK3uyVUA+GZAILw2gbM91I3fTyE0U+2mUW4tfSjS4C
         er18epRCRf+ofxMcj0Ythe9HPNPg45QgAgCxjiWsZ2X9PvSS6SY+zSY/1M2vAA7JBBdi
         q8bE4fouAF4BHiiZZ+CXh43+pxeezGCODZ9L+0ziU4bh3jP61JyMf2xOt0RWxbxGLLBD
         Bz1Q==
X-Gm-Message-State: AOJu0YyiYNi5VpjRWhyyeACsfBWsgvPmw2OTSt/8OMY07Mqot4tNelE6
	LZC7RdatuhWUPWBemTFeEynmlftsHis=
X-Google-Smtp-Source: AGHT+IEGOSTgNAA/AIqNTAbM1kSCWh+yW5uaqSLyqBFly3Kt4PFthCN/dU8eo+UYkaOIFzi8y67XXw==
X-Received: by 2002:a05:600c:1d18:b0:404:72f9:d59a with SMTP id l24-20020a05600c1d1800b0040472f9d59amr4921697wms.0.1700432083647;
        Sun, 19 Nov 2023 14:14:43 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b00407efbc4361sm16033038wms.9.2023.11.19.14.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:14:43 -0800 (PST)
Date: Sun, 19 Nov 2023 23:14:42 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/14] staging: rtl8192e: Remove unused function
 dot11d_update_country()
Message-ID: <364462eae2271f3925b362a439ec27d50dd899ef.1700431464.git.philipp.g.hortmann@gmail.com>
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

Remove unused function dot11d_update_country().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 44 -------------------------------
 drivers/staging/rtl8192e/dot11d.h |  2 --
 2 files changed, 46 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index fdc39e6e7abb..fc65a63a4de6 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -61,50 +61,6 @@ void dot11d_reset(struct rtllib_device *ieee)
 	RESET_CIE_WATCHDOG(ieee);
 }
 
-void dot11d_update_country(struct rtllib_device *dev, u8 *address,
-			   u16 country_len, u8 *country)
-{
-	struct rt_dot11d_info *dot11d_info = GET_DOT11D_INFO(dev);
-	u8 i, j, number_of_triples, max_channel_number;
-	struct chnl_txpow_triple *triple;
-
-	memset(dot11d_info->channel_map, 0, MAX_CHANNEL_NUMBER + 1);
-	memset(dot11d_info->max_tx_power_list, 0xFF, MAX_CHANNEL_NUMBER + 1);
-	max_channel_number = 0;
-	number_of_triples = (country_len - 3) / 3;
-	triple = (struct chnl_txpow_triple *)(country + 3);
-	for (i = 0; i < number_of_triples; i++) {
-		if (max_channel_number >= triple->first_channel) {
-			netdev_info(dev->dev,
-				    "%s: Invalid country IE, skip it......1\n",
-				    __func__);
-			return;
-		}
-		if (MAX_CHANNEL_NUMBER < (triple->first_channel +
-		    triple->num_channels)) {
-			netdev_info(dev->dev,
-				    "%s: Invalid country IE, skip it......2\n",
-				    __func__);
-			return;
-		}
-
-		for (j = 0; j < triple->num_channels; j++) {
-			dot11d_info->channel_map[triple->first_channel + j] = 1;
-			dot11d_info->max_tx_power_list[triple->first_channel + j] =
-						 triple->max_tx_power;
-			max_channel_number = triple->first_channel + j;
-		}
-
-		triple = (struct chnl_txpow_triple *)((u8 *)triple + 3);
-	}
-
-	UPDATE_CIE_SRC(dev, address);
-
-	dot11d_info->country_len = country_len;
-	memcpy(dot11d_info->country_buffer, country, country_len);
-	dot11d_info->state = DOT11D_STATE_LEARNED;
-}
-
 void dot11d_scan_complete(struct rtllib_device *dev)
 {
 	struct rt_dot11d_info *dot11d_info = GET_DOT11D_INFO(dev);
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index 78d1ca1e7743..39bda2f94eed 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -77,8 +77,6 @@ static inline void RESET_CIE_WATCHDOG(struct rtllib_device *__ieee_dev)
 void dot11d_init(struct rtllib_device *dev);
 void dot11d_channel_map(struct rtllib_device *ieee);
 void dot11d_reset(struct rtllib_device *dev);
-void dot11d_update_country(struct rtllib_device *dev, u8 *address,
-			   u16 country_len, u8 *country);
 void dot11d_scan_complete(struct rtllib_device *dev);
 
 #endif
-- 
2.42.0

