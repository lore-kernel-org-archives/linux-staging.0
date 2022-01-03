Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87016168
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 22:23:40 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id l16so13665676plg.10
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 14:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=7+eoPrWBnsqkg0fAIVFgS3RBVP3KC8VrN3JsKcU1B2s=;
        b=qtj9PmHsxSdp7OE/XuGTlwgKnbDoIUURq0wfKaiiDDALCRrdayT+9xjFEsWhI7vLb4
         BbqcGT88h0lVM5Gfh46Q6MeeC8rsy82tUVANZfyxwxpbXKDR7sFVsSqqmQ68bvyaxN+W
         BQG2+f2fBvjbYY1iHT9H43gb2QcXdNM55GQGslFN07n08CGDQ01OdZp/oDgX/3WXMdaR
         /1cgmXHqCrhTUYM1nueD53dfKAPck0BHMKbC5cnB/2ZyCBCLnCNgJvTVycS1Vpyaj7zG
         lAl5QDD7K53HeaEmFg4zoR5Y+lUDloz2CdBh0bQyDNsto8DUUxGVp6mdyy1EBDYCWbTc
         Q+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=7+eoPrWBnsqkg0fAIVFgS3RBVP3KC8VrN3JsKcU1B2s=;
        b=QzAcWzQ4QRdrAcLWmBmLNc2r+1XIDs1nRGQL5b1XaphSCd9P233npbQCykjCuZyd9X
         OLtgx0y9bHWv0QPAodVkHaTVggAh9t+kqf5YrjsAedHU6BWPy4yV6h/EURXrcC2NkbjW
         xa6fVhbRdWe+ee1J4xREEyOZcOOBW7tSKfbTO4yHAfTxXWTTF/jbKF6SZjVhPmcWXSU3
         TV5GeEpjreV3EYba2s4zK2iE0F3MWfWa4ULhAS06qx4Iu1RokNIo8lXKGfICx8H860gT
         c5Bo2MzRfuQMPjFDWyVBzOKpB3V8Sl7oIHiASMCdu1ZU2IzaVXqGSF8UbBZjmoa/K3VW
         39fA==
X-Gm-Message-State: AOAM533CT6BjhXkeA6cCzsLG7+Izw9lMKYKeXHLfpOdqhxOym22QOWEy
	XVhJV6qzBvJgulS0QLldZ1o=
X-Google-Smtp-Source: ABdhPJysJhKoguGpq3/J9PCTTlVxZMUULoo0yDkuPQntMcxGzIddWbt1iId27NX5njZwg7AMVdmCXg==
X-Received: by 2002:a17:902:f54e:b0:148:e8ae:ffde with SMTP id h14-20020a170902f54e00b00148e8aeffdemr47740869plf.25.1641248619969;
        Mon, 03 Jan 2022 14:23:39 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id l2sm41574351pfc.42.2022.01.03.14.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 14:23:39 -0800 (PST)
Date: Tue, 4 Jan 2022 11:23:34 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: pi433: fix frequency deviation check
Message-ID: <20220103222334.GA6814@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdL5rtWw2PTXdsRM@kroah.com>

rf69 datasheet states that frequency deviation must exceed 600 Hz but
also that frequency deviation + (bitrate / 2) should be less than equal
to 500 kHz to ensure proper modulation.

This patch validates that both conditions are met so RF intersymbol
interference is less likely to happen due to misconfiguration of the uC

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
v2: remove typo correction from this patch - Req Greg k-h, Fabio A.
v1: https://lore.kernel.org/lkml/20220103081135.GA11642@mail.google.com/
---
 drivers/staging/pi433/rf69.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index e62e61ef4d27..d64df072d8e8 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -255,13 +255,25 @@ int rf69_set_deviation(struct spi_device *spi, u32 deviation)
 	int retval;
 	u64 f_reg;
 	u64 f_step;
+	u32 bit_rate_reg;
+	u32 bit_rate;
 	u8 msb;
 	u8 lsb;
 	u64 factor = 1000000; // to improve precision of calculation
 
-	// TODO: Dependency to bitrate
-	if (deviation < 600 || deviation > 500000) {
-		dev_dbg(&spi->dev, "set_deviation: illegal input param");
+	// calculate bit rate
+	bit_rate_reg = rf69_read_reg(spi, REG_BITRATE_MSB) << 8;
+	bit_rate_reg |= rf69_read_reg(spi, REG_BITRATE_LSB);
+	bit_rate = F_OSC / bit_rate_reg;
+
+	/*
+	 * frequency deviation must exceed 600 Hz but not exceed
+	 * 500kHz when taking bitrate dependency into consideration
+	 * to ensure proper modulation
+	 */
+	if (deviation < 600 || (deviation + (bit_rate / 2)) > 500000) {
+		dev_dbg(&spi->dev,
+			"set_deviation: illegal input param: %u", deviation);
 		return -EINVAL;
 	}
 
-- 
2.25.4

