Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8B12CA5
	for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 23:05:08 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so802658pjp.0
        for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 15:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=9nmGSMsNg7TpxFokhDu2M3YQG+slmr+fovI7GFM6KVY=;
        b=iZj1UrYomjsoNst1oHFF0dz6gUYl2R3R86cMGTV1/2YCsaWmkXfGqgZFOFtjr1YZk8
         IzRDYzRzSVUkgOz7YAHzK57bJqsCP3rizbqzhXwBC5CJrQOJuPqMYGjjKGkJ3o4BYvIk
         4oo+6gjjUfoVy1Ckai3kqWm4C2xZBOXdqMhW6lz4ehja9HT70/8fmZRBj89UsUOZEq12
         +NXRBGHXQleJFh95XzcRYmw3jQicebSQH1LUzKvWx/GahWQsjyGHyoAAcKY6WEa1yw68
         txyB6DhXh+N0rrtppw5HU+HnL5EwgTJayLY5YbHWF6JfI4xzl40f7Gmsce60kT/7EYoK
         QhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=9nmGSMsNg7TpxFokhDu2M3YQG+slmr+fovI7GFM6KVY=;
        b=jP9z7NU9/OTY20RypmYyBJW57/fxFw/jz9fMu/ECoJrxtwpK6ds5iC0EnnvoeR8uPw
         xbzg9K3HC+5vEBRB4HUHFa9MYyTzgfjnMChC8V+wINoSDtVofeoeKV2orA/EjW71bVMk
         dluJVUl+0rDX6y0wU+2AXAaBIMh4NkDYCSRFvQ4J85cTlWVI8GvM7XWqhy6fto17j6Zb
         LCNVKKPbp51aoMLKC9CzE/f8TGnbKIIyPVVXLUIPa02p8vUWaXL+WQkNwVASdbryLVAN
         YesF7Hdwryci9TXb42BQFY/QRyF4wZmkzr879eR3T47mgcV2tu+Eo0buZtdt5iQ/HfBQ
         LBgw==
X-Gm-Message-State: AOAM5326PS5TdWUIipOoM122SY7sqQR58V5JbJjY1XHMo3V1nmfCCxDc
	RJ5p/qm0Mf0VpJQRyr/Wy4P+fJ4935ntpYgN5+o=
X-Google-Smtp-Source: ABdhPJwBym8eeRcj0DVKaPItufN4k+RbokuV48j+BiichBZQGbGQaX0QAwwJXHJQ0uGtuJEszQPvlg==
X-Received: by 2002:a17:903:1c4:b0:14a:555c:adc0 with SMTP id e4-20020a17090301c400b0014a555cadc0mr29501068plh.101.1642547108175;
        Tue, 18 Jan 2022 15:05:08 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id on1sm3253534pjb.52.2022.01.18.15.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 15:05:07 -0800 (PST)
Date: Wed, 19 Jan 2022 12:05:02 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] staging: pi433: change order in which driver config
 the rf69 chip
Message-ID: <20220118230502.GA4897@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118230312.GA4826@mail.google.com>

There is an explicit dependency between modulation and bit rate
configurations. To ensure proper validation of input value for the
set_bit_rate routine, we must ensure that modulation has been set
before.

This patch ensures that set_modulation is always called before
set_bit_rate for both RX and TX routines

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index f9f86e2c44a9..17ff51f6a9da 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -167,10 +167,10 @@ rf69_set_rx_cfg(struct pi433_device *dev, struct pi433_rx_cfg *rx_cfg)
 	ret = rf69_set_frequency(dev->spi, rx_cfg->frequency);
 	if (ret < 0)
 		return ret;
-	ret = rf69_set_bit_rate(dev->spi, rx_cfg->bit_rate);
+	ret = rf69_set_modulation(dev->spi, rx_cfg->modulation);
 	if (ret < 0)
 		return ret;
-	ret = rf69_set_modulation(dev->spi, rx_cfg->modulation);
+	ret = rf69_set_bit_rate(dev->spi, rx_cfg->bit_rate);
 	if (ret < 0)
 		return ret;
 	ret = rf69_set_antenna_impedance(dev->spi, rx_cfg->antenna_impedance);
@@ -290,10 +290,10 @@ rf69_set_tx_cfg(struct pi433_device *dev, struct pi433_tx_cfg *tx_cfg)
 	ret = rf69_set_frequency(dev->spi, tx_cfg->frequency);
 	if (ret < 0)
 		return ret;
-	ret = rf69_set_bit_rate(dev->spi, tx_cfg->bit_rate);
+	ret = rf69_set_modulation(dev->spi, tx_cfg->modulation);
 	if (ret < 0)
 		return ret;
-	ret = rf69_set_modulation(dev->spi, tx_cfg->modulation);
+	ret = rf69_set_bit_rate(dev->spi, tx_cfg->bit_rate);
 	if (ret < 0)
 		return ret;
 	ret = rf69_set_deviation(dev->spi, tx_cfg->dev_frequency);
-- 
2.25.4

