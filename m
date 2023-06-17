Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE89B9467
	for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 13:56:45 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-98282432cfdso46821566b.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Jun 2023 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687010204; x=1689602204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7DeMqONapwDBFWxqll13s5Z4bgKhDNtxF1406ybhog=;
        b=Gh9nS0b0aiRQnGIzctHftCwqdKe3a8dVnxL6zDhEsOp4RV/4iSbkXxXt4lAJM38Jgi
         FCkogfJB/Y4BQDW8Evm89WeIm/ymdaVRg3FjBz7r9x3YYZoUVa3Ks2Q1ilVg5oRqKFiW
         lvITtV6lsyOw69kLQtUKWhacqLrR7sm4kO2Fx55hZVZ1jZ9Tl6DspBoiYYomh+3gobR7
         tK1GZvd2hz/Rv95f8cxPDayZajWplDTZ2OojjygozlojzxwDgeqEKIGgoVs6wGxgbCYe
         ADKHoplJel62AyCXuQeG8ZadW+gg3s67Ym/6mwDBK40RqVd58UuyS7ikuuE1MGGS4dM3
         j5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687010204; x=1689602204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7DeMqONapwDBFWxqll13s5Z4bgKhDNtxF1406ybhog=;
        b=YmH/llMFwkfYPTF3tOYH1eUhdFEPQtr2xtKim2tdxVl+cPGAIxDgGGbhWD4m8G6Xi+
         tLCO0nEkvBf/5IvPMKYIwE2TsFTQZRg4qqp93OpEugfckfUVN1JmC379pjM87l1x1VbF
         a29ErtJzDeWp7hk+ELhKrwSUt188yHqN0KMtUiri3Uq5iI4QiMLMD+p/VVN01ATSKZfn
         17+52s4WHe/zNEshSJODaUmELM2zknAzwWPXXb78TUn+Zkn7cXrdU1/ZMln9s3rCcUjZ
         nKmgjEvkUVASNSvXJkL8gPZlb5h5uy9NG8hgyzWdD83f3Zakq/hsFc4hcI6a+pTB2G+s
         XiOg==
X-Gm-Message-State: AC+VfDzjUhz64q8mlOHMaVdcKS+eXrnnyjvkYb32/jB2Q7bZO+0YJ5Po
	uTQi/aPC4U5tXdGQ/xrJfCY=
X-Google-Smtp-Source: ACHHUZ784+xHMbYwi2TQfZ+xm1+YADywPkb4sBfNUgQos/pr9lHCKzJ1hXsWoRe1LGEsEkGanCSzrw==
X-Received: by 2002:a17:906:7a5e:b0:987:6960:36c6 with SMTP id i30-20020a1709067a5e00b00987696036c6mr1319738ejo.5.1687010203765;
        Sat, 17 Jun 2023 06:56:43 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id n24-20020a170906165800b00977c7566ccbsm11970397ejd.164.2023.06.17.06.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 06:56:43 -0700 (PDT)
Date: Sat, 17 Jun 2023 15:56:41 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] staging: rtl8192e: Remove variable stats->freq as it is
 constant
Message-ID: <4d8801d37889e6af4f43dff10d1426fc7918f562.1687007788.git.philipp.g.hortmann@gmail.com>
References: <cover.1687007788.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687007788.git.philipp.g.hortmann@gmail.com>

stats->freq is initialized with 1 and then unchanged. All evaluations
will result accordingly. Remove resulting dead code and unused defines.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  1 -
 drivers/staging/rtl8192e/rtllib.h            |  5 -----
 drivers/staging/rtl8192e/rtllib_rx.c         | 19 +++++--------------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 17b70dde7eeb..20c0308eb3c1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1769,7 +1769,6 @@ static void _rtl92e_rx_normal(struct net_device *dev)
 		.signal = 0,
 		.noise = (u8)-98,
 		.rate = 0,
-		.freq = RTLLIB_24GHZ_BAND,
 	};
 	unsigned int count = priv->rxringcount;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 87e9169214f6..b4fad9bf0f03 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -500,9 +500,6 @@ enum _REG_PREAMBLE_MODE {
 #define RTLLIB_CCK_MODULATION    (1<<0)
 #define RTLLIB_OFDM_MODULATION   (1<<1)
 
-#define RTLLIB_24GHZ_BAND     (1<<0)
-#define RTLLIB_52GHZ_BAND     (1<<1)
-
 #define RTLLIB_CCK_RATE_LEN		4
 #define RTLLIB_CCK_RATE_1MB			0x02
 #define RTLLIB_CCK_RATE_2MB			0x04
@@ -549,10 +546,8 @@ struct rtllib_rx_stats {
 	u8  signal;
 	u8  noise;
 	u16 rate; /* in 100 kbps */
-	u8  received_channel;
 	u8  control;
 	u8  mask;
-	u8  freq;
 	u16 len;
 	u64 tsf;
 	u32 beacon_time;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 46c77ed335ab..36dace010203 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2301,12 +2301,7 @@ static inline int rtllib_network_init(
 	network->CountryIeLen = 0;
 	memset(network->CountryIeBuf, 0, MAX_IE_LEN);
 	HTInitializeBssDesc(&network->bssht);
-	if (stats->freq == RTLLIB_52GHZ_BAND) {
-		/* for A band (No DS info) */
-		network->channel = stats->received_channel;
-	} else {
-		network->flags |= NETWORK_HAS_CCK;
-	}
+	network->flags |= NETWORK_HAS_CCK;
 
 	network->wpa_ie_len = 0;
 	network->rsn_ie_len = 0;
@@ -2321,14 +2316,10 @@ static inline int rtllib_network_init(
 
 	network->mode = 0;
 
-	if (stats->freq == RTLLIB_52GHZ_BAND) {
-		network->mode = IEEE_A;
-	} else {
-		if (network->flags & NETWORK_HAS_OFDM)
-			network->mode |= IEEE_G;
-		if (network->flags & NETWORK_HAS_CCK)
-			network->mode |= IEEE_B;
-	}
+	if (network->flags & NETWORK_HAS_OFDM)
+		network->mode |= IEEE_G;
+	if (network->flags & NETWORK_HAS_CCK)
+		network->mode |= IEEE_B;
 
 	if (network->mode == 0) {
 		netdev_dbg(ieee->dev, "Filtered out '%s (%pM)' network.\n",
-- 
2.40.1

