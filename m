Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267989;
	b=wRpD37Pr+xOygEEmHzPMNW6UfmL4zjKUosvWp+fXTkjdCudDhFYYVRGr/evl6nUDBkkG
	 OCU1MjD5lTAX3HhNoH69bX7n/Kyt88vOQ5/8YdW8D27t5Y2I/tYRVLHUOeUHH7nZCZiCq
	 LaduZG4ypuqmIg+xnb8ak67GYHnVrB5lsKMKDGaG57svM5P6LSabcNST0Vsqfti7BlqsP
	 JspnA+a1/b3XU8uCkHV4GCorWWJRFZVojW43AxnnkIB96ny6YKP16ivqyhcV0mJFHkAUE
	 ahcI3AfQgjmBOmQX2D7IYkOtn9Qd2Yl+Bgqsdg73y7/gSiiEelAuAC+cC5A11kI8q5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6QT4nVTPYrmhTuKzdl9GjNrcRlKRJg4+DT5qc8f1gZg=;
	b=JpuSZgt1QV5a8YBmkGGx8ihv/llFgbYtkuUHff9o5ylWSnHD2fhXRBv1r2z97eKN99SS
	 2udg2jZqQSn8dlT6gbBsT14oOoyerF6ia6SuQiukP+n9yMnD74IkK0zpkpNgdMAIEa2eL
	 I9YIGFHdt41HtXm24QEyBsv3zRcEtdEIsgCPXp85S6eCWUSq263Zjl+iY+5bQHP33SNm8
	 vH4hQdZlmmtYIu/HGr6DWQPdJcUI4uNMcXcsm6T3lxSLZVZletnRPEMxXZPH+2RHRtNEm
	 MF0+fCfQ0Vl72F8iTqmB56tdUvNh2Wz3ok5M/qxAZO7opLIlT+th8Aougo32hQjWAOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Osu51l7Q;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BB8606A688
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BB8606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Osu51l7Q
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso15460555e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267988; x=1795872788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QT4nVTPYrmhTuKzdl9GjNrcRlKRJg4+DT5qc8f1gZg=;
        b=Osu51l7QnlKWJ7uWsLJ8YOXKhccliUvHVU5J2xilSOlC7DjlIXm53OnSCoTtPftImz
         2iw9NCisz526Cmz+g/aWq5oG3cMSMwfLtajrx3SC/shRAD6g5MLibIeHDpEdo3U8g405
         cDbNcMvQIWagrr+5FbhPpYDvVdM2ZB9Isi/kim3NFFW04wm0VyQwEJmhTP3kaMOjnm2A
         VnEmEHlw5TGV1ZZviwclbaN92ss3/zz8Oo/lupXkg9fI/bv5mcjCw9a6xp0LxFP2VG7o
         U75yDqMgs/korN02dKDqTWnhDD6enaEZJB44ol7Fi6GD++F1cAi2LXy0uyQFYuJ7v5nm
         whMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267988; x=1795872788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QT4nVTPYrmhTuKzdl9GjNrcRlKRJg4+DT5qc8f1gZg=;
        b=bNICLj3TI6/R921tCVdWqhtqks8P1RG7Lfpqp+ScCTkRi9I6MorOzascu5p6wIDURi
         DfEPIrePzhz8U6D8XZ+a/wDvfxDY3NI0yQGoEPh39I+IU5dsWC+1bQUiL0OwgCYkWGz3
         RSN0oMXIEvIa2C/yDZHO/3reGtF0ItOIhNn+H2kVqYYPTcqqQVqvyWyPYuA3olBHeb1R
         x28x19TGTk9IWigPiMz7QRZdZstLSNElhFGONbuvX39xCSrFvJtdN8kU4YgQ+L2xHaZn
         y7dACoxCICZWpuG3LNhaJzcrx8jqs5J49XvFMDoZ1pTiVsuBYgL/6p2VUF75/lgW28GG
         kxtg==
X-Forwarded-Encrypted: i=1; AL+hErGijYVHvWrCWFwyJopFipQy2TjKLShS91iqsIJxU4ixKksODLmOXK6eWojOScW+NG8ZsG8Tb95w9EzDri9S@lists.linux.dev
X-Gm-Message-State: APuU4Z9RN6bSr9sgteDzAnN/5Uku/atMCujeD+Du4ABsIKWIqCoqvoCY
	2ot5pOEVzFAM2iEeprxJoUPLvdTGQUUlvrKt12qB+l1ZrE3hyHYOjlAt
X-Gm-Gg: AZFdTZewZyLT8GUL/b49uCbzb5j4wmfvbV754+v4yE4VawBZzyjHxkPZzEEH94a3FkD
	IJE5wPWWd7k0A9dTx6XGMeKw/ALpBSWqtnD2ThirU6xJ5LVf1bXaSeHuvFrRXVgofjblFWDsn9A
	s3dpHBq/607yDg6MaA2uMgivJ6kOln+a7m8GigY4Q1Fa/rRIUJn291Gn8VnyIUVBtgMbMUaw7Xr
	R3hE49HKzhSsghn1f9GF6PV70TQMSLVGQ2dGfJ3okiG0p+27txSW9JcPWIuIcmyh1I1i4WflPrA
	OpyciuCC2CR2Orl/GMH9iPjodSnr1Mi5rru8pjOB+Rub7vsx4ZvXpytjvRsp/j8/qOAvthR7Jq0
	UgjQx1Xpc5BS86OcLIhYr7y9FwsPxGa+IRt4klon/g2ljJXBTstIh2cD3GLx7csMq6S1CfnvC1K
	Q/m4DMX+X4J0CMM8cORLhRIoRe4EbAkGDLSj+XELEqhjxl3jeqkWMLZieh7Y6oFYGjSwNwI7rx8
	v4a4rdafmwuUnQKR5iLn2X7/Ww3kbBOBya+lpY3qnH9BnQlV33taHDzAZ9BUNJZbmSDBJyRxWjc
	wN6QhU/eeuN5bDYMUc0axxYjT4jaSERHE3KLJGdbxnQ4YSpU0agXXxDXZhY3Jjru+rCpS8qMmGC
	fTEHSjLhzaM7w
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr135977545e9.26.1795267987817;
        Sat, 21 Nov 2026 05:33:07 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:07 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 10/14] media: ov2740: release group hold after gain write errors
Date: Sat, 21 Nov 2026 14:31:40 +0100
Message-ID: <34bb686e09f150cc17df7b5484142fa76cd2ffa0.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital-gain updates start a register group before writing the red, green
and blue gains. The current error paths return immediately when one of
those writes fails, leaving the group open and never issuing its end and
launch commands. Later control updates can then be accumulated in an
unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Fixes: 84363509c725 ("media: ov2740: use group write for digital gain")
Cc: stable@vger.kernel.org
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 30eb58eed..b9a951e92 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
2.53.0


