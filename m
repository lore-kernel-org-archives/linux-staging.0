Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93D1245005
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782023413; cv=none; b=jwG+OHhdI5yLXLZ1OxQSnDf/v3K+dxIJEFnkZgwEP+/grSd0SbzGMVhk5coYIAV3JlqoUFxXARO+jpXAgwf1F+wCBgCZJ+MZs1+IYmtfRJfSrxY1BnNCgw/LxTUuiHlnOyIIdMAEeZ2dJN7MnXEOZqT4l3zn+QV5fOx09Aj6iSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782023413; c=relaxed/simple;
	bh=LPBX5peVu2+CGfivQVGZ27pn3uwBQKahf3dtTK2W6jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q1FCSH+mLND3zrTucsDsCtvJNhL0Z7QT66GQK+kgmnGbA5Kw1OWgXz0dHF5v34wFk/jBbJUl9uZbSRu5eD9z9xpqYjC/HR2FFdNSVVczCMQP1MS6NR4P7eEzMSGzo3Ci+A14HWB3dHpuGAz98TVVhWE+xPRKLGIEYyG5hm9BBdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sY+3oA1j; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sY+3oA1j"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-842338c18e0so2322715b3a.1
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 23:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782023411; x=1782628211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6tpylLWP859Y5GaGz8xWvHuAS1IpP/+yGasAke1UnQ=;
        b=sY+3oA1jNcGhQr8qpwSGQn5RGSj4WIsqu0nduiKGdv4v+CKR7aeMNvw9Da/WVfpv6S
         dNC9XKlU9LrLm1Aa1uSRYKL4DbvpCBZWJRX0K6DBeqlDkoMudQW54EyCYQw679XOvbJo
         FhRigwPZoqCHKOIpAiQb2Yt545R8N5dHhtq/E4GrIFJFXOZU5AOdxbh/4jSgCFtPmpa4
         M+cpGWVZ0KigR0SYAkZyRl5dN7qzZQc7WQnnn17hWGKQcXqdXOAf/RITkOrCU8Ims9wk
         oVYeX//l9m9jd/EiKeZe5IS7gjyxskQRM7dKvZZ2b306A6z8kQCdsYaGuOmRjkXk25qw
         Sazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782023411; x=1782628211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6tpylLWP859Y5GaGz8xWvHuAS1IpP/+yGasAke1UnQ=;
        b=Zm5UA08vMkKLryiDEhusuC9GyHMHQry8X7DuD/8x26Y7veH37SZMXY/5eJrWafXVrM
         2VyDJKLPMAVkT9uF8Et/j+pUFV6jzt0vl6l4SvAJLbDrR83+XZTrMoRmOYm/E/31zrvv
         k2eeaAc51w8pdhRRy68lR5fGrmDN4xAiamx80JAbDn5AdaIEYOmZNy61v2CefBwUFb68
         r1Wh8/eYPfdG1ikCnwkB0vwSPZDN4i2ysZnr3hU4deKrxy4BwrekX5XLsczyAqg8vnai
         RB8bSkR+Y+q5HjzjIxYEvIfTodgeQta5PKyMBh/6aNVkWXTcEyz92DNcwb53QLWrnB4y
         i6fg==
X-Forwarded-Encrypted: i=1; AFNElJ/OaX1J9I/AWDY2Lec85afnNBq1MxoX85ZIDrdxUZv2DSsRapwH/ElZDHQy/geTfrheYStvp0dCx9+PRfel@lists.linux.dev
X-Gm-Message-State: AOJu0YxY3VVVmbhKQAGRB80kdZ7g/6FZdRFiNeuD4PYRROCJ0hc+VAWT
	ie3F7bQYTFQOPpK6BKVxP4bKyLBSBu2ai929AlXX7QG7sWTKFPutmnVVwxj3zSKW5rQ=
X-Gm-Gg: AfdE7cmbgRjprL6PDzoaH9Xd9aAemwXZ5Dcw6+46pXMkxWmK+m9R37XVQcwBkUl86Ag
	htHu5auxdZCTXLyBmkD/d9IXoCLXyo7tHRs16Qm0cMkXoPqwP8ezx0eeMVDSDpFggPkfkLahsiD
	LbufHXpTDFd6CSBkd35u9Yx0Sx8Y6EGT/J2HWLLvc9wheNso3WmIP0njpU3KSmDy/EntXCnYDVe
	biIfU1cQd2HQfU/B5ZIjcp7G4gMwE2wW5oA2deqMlau48EZD2GrPPnFEYNhyPL6pC8mf/6CSjfM
	YLGRGiVEzQnEXx0Nth6GuBnaQI4vnChxJrnA/YX9TIC8Z3zEO5ACRYi651vaTNVZoOmMvDdCC6q
	jfbyGV/hJxp1BNwFPyyjvI375xOKSZ03J2kOavkR1vrEplF/gzdetZTg6ZgdrnEdNnUnKERI+JP
	Z88LMXBWBiROCBC2FUnU71A9YOWeKPvx0iSF/0XrCvqg==
X-Received: by 2002:a05:6a00:2a0c:b0:842:5d9b:d590 with SMTP id d2e1a72fcca58-84550887d3cmr11687574b3a.30.1782023411053;
        Sat, 20 Jun 2026 23:30:11 -0700 (PDT)
Received: from kernel-dev ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e76d3csm3812486b3a.30.2026.06.20.23.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 23:30:10 -0700 (PDT)
From: Aditya Chari <adi25charis@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari <adi25charis@gmail.com>
Subject: [PATCH] staging: fbtft: fix parenthesis alignment in fb_tinylcd.c
Date: Sun, 21 Jun 2026 11:59:45 +0530
Message-ID: <20260621062945.42519-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch.pl
CHECK:PARENTHESIS_ALIGNMENT warning by aligning the wrapped
argument list of write_reg() with the line above it.

Signed-off-by: Aditya Chari <adi25charis@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index afa8f1c74..d58b12472 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	fsleep(250);
-- 
2.53.0

