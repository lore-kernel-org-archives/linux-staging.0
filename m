Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9842C9C
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 08:11:41 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id c2so28811375pfc.1
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 00:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=oiEfYts536J1XlebKdzcdP3XXTCS0kXxLUqO5AkEJ40=;
        b=iSJMYQ2Cj4iZmCj4OdlF8CzzypM9mJqA2+nRQYYMvd6hiNfEB++LzTPVLHhtkSp9rK
         1Sf/zeQlPVJqwjx+xP74L5lXLNbJPmsSnVH8AxESoWzzZVqGhVPoNwKkM5CT6N9hjAC5
         RpG7tPf7qIuceAp5DxBI7xXYR/IcvKue4xky8vessf0kHPYPxD2QYCufTpqh7cCaicBI
         GRLxrR2VFB5uyqkaJ7O7SFudv/0eeaHT0CoS+Gm2Jdp62+L1LEuRhuh23mlDBe3RbVlP
         stGxW9qUEKlyeS0BBb7hS0F6N+dRJ6SCqysWcnpwOqzv7FcOKCwjHlOjHN98fGnDqunz
         dsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=oiEfYts536J1XlebKdzcdP3XXTCS0kXxLUqO5AkEJ40=;
        b=vBi+90lpXQw4fvNXOCr/H0ZVeyKlddwQP93KSeWjFyTbLCFaIbMEPtKaMIKMK2P/i1
         w7BpMWqOzp3DJjjq4JsXj/cmc0Qe8qjjNKhrZj9DhcIQPTtHohJV5FK1p7A4N5VuhL2C
         Fn2fKzaMJhr8Y+7MiPm5CyXO+ZvIFR1qR/x9yVcdwXwsSUHXhg8pih+i11wiDys4N1OI
         D2FWnP4NHOO8YKxK9CR3Aj5Q0N5zgVmb924cqpi7Et8k6qten47I6yKddH+qpemcwmdp
         lLS5Qua8SXegGkspVcqWJiQQCtfGwA+rQ7nkMg/6CURWewHZidm9j0lCtkmJyiGRG7C2
         GfIg==
X-Gm-Message-State: AOAM530MrII5eteQHgSjLCkrLYFfxnaJAIau3XnaqFmaDtycyu9/sXQo
	WB8BlYjHzeDfupzJpSDQc2M=
X-Google-Smtp-Source: ABdhPJwnuH+20i3BZtl8dJzs0gIRj7V60TV1uj3NgoCFwUnetkcPhXhwgaXmCxw0epTawoFacj1edA==
X-Received: by 2002:aa7:88c4:0:b0:4bb:5a48:9801 with SMTP id k4-20020aa788c4000000b004bb5a489801mr45376592pff.67.1641197500800;
        Mon, 03 Jan 2022 00:11:40 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id s6sm17413771pjp.19.2022.01.03.00.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 00:11:40 -0800 (PST)
Date: Mon, 3 Jan 2022 21:11:35 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: fix frequency deviation check
Message-ID: <20220103081135.GA11642@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

rf69 datasheet states that frequency deviation must exceed 600 Hz but
also that frequency deviation + (bitrate / 2) should be less than equal
to 500 kHz to ensure proper modulation.

This patch validates that both conditions are met so RF intersymbol
interference is "avoided" where possible.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/rf69.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index e62e61ef4d27..cc22915fd489 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -255,17 +255,29 @@ int rf69_set_deviation(struct spi_device *spi, u32 deviation)
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
+	 * frequency deviation must exceed 600 Hz and but not exceed
+	 * 500kHz when taking bitrate dependency into consideration
+	 * to ensure proper modulation
+	 */
+	if (deviation < 600 || (deviation + (bit_rate / 2)) > 500000) {
+		dev_dbg(&spi->dev,
+			"set_deviation: illegal input param: %u", deviation);
 		return -EINVAL;
 	}
 
-	// calculat f step
+	// calculate f step
 	f_step = F_OSC * factor;
 	do_div(f_step, 524288); //  524288 = 2^19
 
-- 
2.25.4

