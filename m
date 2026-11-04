Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765571;
	b=QEaIuvu7hlDbg2W5K7akaMlLxIRpXS1IBXf8+cKhgzOT4UQYF+5Jn6dSvNXKzs8szOMr
	 qw4Q19musotjt6/XUCYuBPE3SqbOXcrH5LL/voCJnCAaybx7dlmTJeeloXPnCnS0bF7t1
	 ttxAiT0dM30EcovV0xM+QOtKfB9dMFNcATQaKKkrhXunR2n7n+9SoNEiEjHIWsUJW3ZK5
	 qr7ar8/xZ9JwNCzOxTHk2UZqSHQS15DGIc6F2ew3y3fqQO982eFLqYC692aBhmxSrcGz3
	 9ybLz+hc6Frt4ymzblCsWCZyO8LzJJY98zVzBkIw1zitwIprgfW+bBoF5LJcv5fzvyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ETxWwH+3XKdmGy3va4VsbBXcOFXJDAUa18QQihknvJY=;
	b=paMIiVRNK6cdxUvjF+XsVYnXo/d1xCFcQ2JYFP6wuTETjZGRjWUaMmlCBSltnQkrI1BY
	 hnYKJW5yaFtoY13R2GrmjLl0YfHxTXDc9pShcTFUcugFYVpgRa8/AXzF4tgiwEaWA2ZeD
	 9IHnvtOy1kI88h6Tx6F/7t1ED0e8GuVx6Hf2sdejty50bYOOmkaWw+LKB0BJd/knX5/A0
	 rBGwggsdpGCW2ifzMmgHfFQtmqYrBqkjF3fjwlQCEBsblDjGVixm2YMZJ78u5TKy5v36i
	 288xCylKnG9gZHm/bYuPyCtJQa6gBsXYRWW6x3Ek0PbUg8cZKxyvf8M9D6pavjlEsmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnwDgGOj;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B640606A334
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 04:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B640606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnwDgGOj
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so2442515e9.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 20:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793765569; x=1794370369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETxWwH+3XKdmGy3va4VsbBXcOFXJDAUa18QQihknvJY=;
        b=rnwDgGOjRSiFhw83B7foxlSgQEWgu0iExnSx9WeExadRFOcpRloAf5cIei4xolmrhr
         O6MLNwWDk15ot/rtCaan0/4FQ+F/tEumfTkC9l+pfZsQhbi6HEMLx3lahNgYzBTojrQW
         P50hs0yX/bOvVRnmf0n9jPNZuk/QDduoMuTNBQ1TQNyS5aFmyjKXhIXYDKACgTsVfjDQ
         SHGzD4IoTFoG+5K6EudDNOiiwke84vcyMpRf9+YAXWA+KYSKjJs+4ZHVR31tB7Mty6nU
         Zybp1ojn/+b5y707lSETyDnhpw/MEpKZc5YqrVElwbpAHngJoSkrIq9knufwXlubT9Qt
         W2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793765569; x=1794370369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETxWwH+3XKdmGy3va4VsbBXcOFXJDAUa18QQihknvJY=;
        b=vVsK+KOIrI3UUJp+yaKzQR7IecLYdsVYg7YMkh2tca4XReB0aKrwCJS5dZHFHmqbaS
         57rtBa1as3KTo+IEBKGRj+5T1DXxXAug+JBtvjpGCWTHayAs6Er7R4Gr8u6Z48DZR9+A
         DIa9prAxIcEnHzwwosdpCYxBB1cQcuwT3901cvj9YVhMUaEOi6RXQ5xe6c2WEoV/Z1aJ
         TfsKktQdHx7+FLmbsoEiHQEaBLa+mtjOIdQHn23gJQ5YTMSVhZVQGQUZXoLuPghBb5M2
         lhLda/lANt8Pc3Rm+GgCLxaN+BWWsg3NyaDBur2E8729uWwbvOU8ohOddeedcumt7Wiv
         b8mw==
X-Forwarded-Encrypted: i=1; AKwUvBxyT1eO5w+g+P3g8MTFn+HnaCJGGxLKen76fZTk/Ed9vnfFgLNQ25PrjzOhfzOIPQJceOplgATGgbodn95F@lists.linux.dev
X-Gm-Message-State: APuU4Z8Ufk8pdNvwcLH/VxIvPD/Z2PA1m6+2WOsg65LyeUgzPuGLtMRp
	jPihd7Ui/1IGkB2C4ipeMZmJ4yVdCD07tjKivCpY3i5ThQXPX9y7B2e6
X-Gm-Gg: AYBFou1hB2/X9+vP98Slk/sjZradbTE79Suqa/1qaiHe8nEMcqzaea8qDOQ7uZ4+3gp
	/J5esncN2SerUkvjjBLCwjWnSBwLXLhrbb4zw43CUZBQmgnc+XgwqcGalKwdNtfuEvGw3SZ49aI
	Yv9Qw2jh9qV0XuudWvDccooq8x5k0/hSZ+kEMA/u4zkfEu6yZ+6PITfC7z49JnPUao+uuGNOl+W
	hLfrm+H8hArOLfsSGN6fhJCr2bGKjdTatu4X/X7u8yNBNeDwV2b3AhzhX3aVUcd//oZlGoKndJW
	UsXIKlu/B/66ysUcVYyuro+lHouNdkL+2pB8DGtQAi1Ay4wyHNXvq8yzfkQ8DUxB6WVoALDjIPF
	qDjaCRZV+lMW/WvrmPFMkjqNuRnOnsW3V4AGemK1jcTmzf03+JscWltwHRr8OwwR5tu7x+AKzqM
	Jl1smY9XqJWBrjsYhwV7XVul3lA7GP61yp+IfDOgGwm+yPqWdU5/E+VJc9UdhtIqPpm7/torMoI
	5tSghu/f4xgm7p6DwhDio7ffpkw7cAGu857Hjc7a169qaPJaKq+fAhV9KOclC9ketLnBIsDqNL5
	xVGjkjmZvyZziUOBhWVkkUoWi14V/pCrIaDl5pzm5K10mf/CBITb4rkjhLn4a1cs0A1rQSFXLN6
	FmfFtTxxwsyZ2Aq6xOilFV3VrbgAUlaWrZKudhSe8RDNi+YfBLIuzSoHBe070ffbduDdNE1m73A
	qVZtfPLBuGP199
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4ac17b2cdc2mr344273165e9.27.1793765569288;
        Tue, 03 Nov 2026 20:12:49 -0800 (PST)
Received: from maria-VMware-Virtual-Platform ([154.80.94.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b437864e3fsm21212225e9.0.2026.11.03.20.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:12:48 -0800 (PST)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH] staging: iio: addac: adt7316: return 0 in _adt7316_store_enabled
Date: Wed,  4 Nov 2026 09:10:45 +0500
Message-ID: <20261104041237.7978-1-mariasheikh812@gmail.com>
X-Mailer: git-send-email 2.53.0
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

_adt7316_store_enabled() writes the config register and returns -EIO if
the write fails. When execution reaches the final "return ret;", the
write has succeeded, so ret is always 0. Return 0 directly to make the
success path obvious.

Found with cppcheck (identicalConditionAfterEarlyExit). All callers
either check for a negative return value or pass it through, so
behavior does not change.

Compile-tested with W=1. The disassembly of adt7316.o is identical
before and after this change.

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
---
 drivers/staging/iio/addac/adt7316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..4cb03e7808ab 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -236,7 +236,7 @@ static ssize_t _adt7316_store_enabled(struct adt7316_chip_info *chip,
 
 	chip->config1 = config1;
 
-	return ret;
+	return 0;
 }
 
 static ssize_t adt7316_store_enabled(struct device *dev,
-- 
2.53.0

