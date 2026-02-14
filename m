Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E00253932
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771063802; cv=none; b=rJsCVzZhFJhE4wcFy0FTSAk6yUa60BO6IN4D7BqDoShvNjxxGz279YvnwvJH100dDbAVQb5Rxx33Srvdk8a5+LDvizmZPtZglpF4xq2E02EN7ZhTU3IxRG9FzSUPZEIAmsf7ejJGy3lzGCM3981bs7dkRLANqspd7Vlmm4MkA+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771063802; c=relaxed/simple;
	bh=ANy09DMBVIVhb3q0aN2TM8uMddKfP4Z6yRVy9SQmc0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jtMEedKjTXvIMrwE1ntFXJ+6WPuIKKNxGHyXAbSTPhUgvwzw+uUt9UKEPAdEm1STTu+i+cQvOQmRuuh8lfYt9loYU7wZYI0jEmgjVCrTzyorTri327Pdlqy+ERQ/tpiGYwPQGRziUYmR16ttqi96H2K34iHjgi6evNoxtHWmfkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atoxPYvi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atoxPYvi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48378e60742so1158155e9.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 02:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771063800; x=1771668600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WRRr75MXN68GiYIDuo/ETD3d1656Cq09EtmYVeD6hAQ=;
        b=atoxPYviIJcOomkTFNzSJGaT7xsVH3fzs2caACZIvOOfdnx2vppydlbDou7NY8G66h
         JDN57ojauAySnB4jmkXtAsZPUPaldqKneNk16u6IHXmM1y5b6l5BQQGYX/fm8zEtKoZC
         bG8aucYx8wTf5XnVHB6HrhqeAkKgEH9H7Vgfg8i0JEmGIWZkCEjHczCpEJS0OkGiHNdT
         zd/6+EvGGSzZltQB4Zwsk/FBqt1f9RjwrYRcUCjxirwClrjXmGmmplBTfbTaGGI9WCN9
         VWb+QXbeasL4nL0rUvxunc3w0OtRpAnkIVFTEfgjtURKtrNwmQabXmJj395y3bTBa6LJ
         qJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771063800; x=1771668600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRRr75MXN68GiYIDuo/ETD3d1656Cq09EtmYVeD6hAQ=;
        b=jpDE4Y/c2nsqTX/WR7hjrI8GlrTl3POjjV6eyE640RgbNehx1OEWb7PrROJy4SSGtU
         trW0rRDNUscoQqfaxjqX919svP1FN/7A1HEsdinQNAs+wTmXwp+c5kU80i7MoYyv8F/B
         4c8AUvkcvXLh/9sBiLryv2IPlSq5ZcWwhBie/W1/pAHS8gib0ApoLzwUtTRHxYMECt95
         Ow3znNIOCY95LdcvhHNYQhxw+KbYHdWYwHwz4kiRzL8MjvHvK3N0qLMcqEQkOep2vQYq
         nEaOa3i+Ke7Lb4x9/w01299dwXxrwZZc2YqZKtyX4rtgzQUlM8qBbGGBGeGh3R/Z8LGd
         FNkg==
X-Forwarded-Encrypted: i=1; AJvYcCUKHnIUd9YvROldFdoASDt3jWq2qlCzD1NbbbJQA4s+CXikE+NT4hfXYZMPe9LQBfVWq5SDPZdyz/wmtY4k@lists.linux.dev
X-Gm-Message-State: AOJu0YyrMLegWwIYqiwGYbOjIUCiLkedIn1HQtmAGJdpnMaMNJezzzQw
	AZETwOXbFAPPkKsf1RDp7l3lAdIuxElNYq7feNb4yur88XYhGBSUaS8z
X-Gm-Gg: AZuq6aKa8gyU/BuWgXlua0oYBah8TXXCnB2XUIkDAsfX/I3qxNcvrPS4f3QUmI9f1L+
	eRIrZ0CRiSQrEHJ9txJ7APtqtVrAXlZlV+KZ3pmvFLgLI4+r4ziDDnYqmsVFw3mW54sJD9PNNlr
	0+gX/fysPuDgxqjFevP5S5HYO9KEdEz17bKjsARpY9jNPrPcfZYcDWStpEzbaR/rn2iIegIPq0r
	0yI5Q6F95SVcFoAhzfiBisdhMSqNxJVeJsmnbzo1H0rYkuZVHigDmQevOcZt15M2ILmPewVH5Co
	x+M3QU/fdLHpvVs6gO5S/G3uOS3gpkEOLxFZlnW6PJXfTR6Xo/AmOfNDjNCgTyA45/rGILQ1zbB
	wavFyZNQmJOj9HjD1pysjCOaidsEwfqn2AnxcQWF4ZU2VbeUXxwiTUwFizh8g/Kf/CXqhmHCu16
	JPTiZXdzPjxf8sZQ1sbu3tyZu7zEUW5t2WYD3z1Xwl2yI0pMplmf1RVnBpMlWilqT/ICMzKaZoh
	iQvwP+zeuUQ0W1BVbXQp5sPUitaxDlJBB+5xC7Te/+Cl2DqBNJc
X-Received: by 2002:a05:600c:8b35:b0:477:5b01:7d42 with SMTP id 5b1f17b1804b1-4837104003fmr53314665e9.5.1771063799625;
        Sat, 14 Feb 2026 02:09:59 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a4e62dsm37190835e9.4.2026.02.14.02.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 02:09:59 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: greybus: pwm: Fix typo in comment
Date: Sat, 14 Feb 2026 14:09:47 +0400
Message-ID: <20260214100947.70527-1-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "privodes" to "provides" in a comment.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/greybus/pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 1cb7b9089ead..52515a4acb12 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -215,7 +215,7 @@ static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	/*
 	 * Set period and duty cycle
 	 *
-	 * PWM privodes 64-bit period and duty_cycle, but greybus only accepts
+	 * PWM provides 64-bit period and duty_cycle, but greybus only accepts
 	 * 32-bit, so their values have to be limited to U32_MAX.
 	 */
 	if (period > U32_MAX)
-- 
2.52.0

