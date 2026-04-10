Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25613016E1
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815720; cv=none; b=hm8Qv1mw0HPzdDPyDVF6Fol0hn3tgR9OIy3JYId7vDYCxvjz+cg6BWDXxJaPcZacue8EUfLKjogvC6umJ9VYFgc0/wtVJH0l8eeYQAtZoI57vbr3BguttB/frSpCULd9vr/yO0e70csOF8Iwxfo2MiYDbA1xVDzuaGzY6mHHW/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815720; c=relaxed/simple;
	bh=jKXI5vmAQ/ZTnFztFPLrzkWhTwqwzddE768Xp81ZlwE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N3qSFjS2KLQPga8LtNZfQEDciflbyXs70tekiyKZfD3NUA/Y0PqZB8yto32Dh5crhD0TkrrkXEcYXfKHfXHxR/WHI0eGt7ggwdYGYWx+8qVihyTL/c2hZYdbDIEqnss0omTJX93TR5xFB99RZf9F47IRuBRp2eqXZVbScOpn+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhj6Dtxv; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhj6Dtxv"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66c24b42efbso2704048a12.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815717; x=1776420517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8QubiV9zHwo1Oo+HC3yCo8pqsZaFDsRg+bFDJDRT0CQ=;
        b=qhj6Dtxv1Fppz6hHPhE2gBCZZVmvQjG9J26OPxQzhsKXOKwoKVAF4OKHteoV0UDi8K
         Ikl7bqwiOCPuq2OZD2Zh8K5W4gnc42/SxkC8ucKWHwGl8JCmsw5oLdAXR5W22pyUHEJV
         /0nZ634KZvnACraAZsl9xk0cFhWuQn92BkVCmYngvdpT/E6qW5TcuZ9n9MMhdJnjXWge
         WuYTAauekWccsYfpOojyMRjEIVJk1a7wjEbfn72xYekT+XhwY380fi7WvnnEd7YoywHT
         c1f+hoyBTCJaKiLJxkbqpCHySYpOuUqUHfj7F2FIczzBmcB+Ax4rPiqE/oFR43wdt9Hw
         o1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815717; x=1776420517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QubiV9zHwo1Oo+HC3yCo8pqsZaFDsRg+bFDJDRT0CQ=;
        b=aGFX8I7P7e4QtnicC3XE5Jp+/1rN1lA5jqzE2G7+CySnJzSi6hDBlXU+2dwV7CtqBe
         9y14TxzKmOlpiKbSvPiKqEGoawM8tUV7c5MFV29rpNtj0Cl2LHhdHj5kDUfjjfD8agUf
         4IwdTD9v4kScD/jd8y2gMCuozX2GzKk5EgsHMpY8ZyoorMRo4TQ/EkcH0lkoOn4qfWHW
         eMQFapYemvJ6eo/wWVGPsJY58EYzWDmhCFUc5L8LQwKDEaD3GOkIHPDbdwv0uHYus4LV
         AZFPn29kt6MgBzG6U/iazV/wEuzEKNys0m8svQp9+gtzOLSnkBmGQ1hiUjH/FawRHgv4
         VKnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvMXQjz+G1gYM4Wv9BVZWVhiGYy2iUJt9AH4gu6toAMwJ5ZXvCYPhsjVvNf7cBGtk1PeVKyFBuqdMCPVna@lists.linux.dev
X-Gm-Message-State: AOJu0YxbvzRPUB8tHx0hU1mBRVkCKkTsaZCmNtTe0KvYUAxKj2i8BSRb
	sYVUBnTbcIC9Ri/pnJrtrzJDY94kIAwCYkdNVIz5UlyadDLcOfA1zRPk
X-Gm-Gg: AeBDieuKwOeub0g/bh0MGB8gnVCupdwCp3Jw9cZb4LDAzZJDxrEBZoClAZeTL93Mb5p
	DtUpyw1BWhFTiBDlm5qP72gr+6YO8jyy5Dh+QctDs50xsuk2BpgWadduiPkaQYQM9LgAQBbnvwd
	uCkqTEaFLkEQrIj18L3liDW21NHnYUPYSG5BMAunJJYlTS1r9fUeg9cpcjPzOhVthDWawsUjN9E
	JmkmegB300py0jCqP2xGFER9ugUC3P7RFlMk/q84Z8LQSoyoGysJ8QbzfEL75tp+BAU9++ZfpZe
	UXsIMdrONTkKGqZKof9VTPtDgzb5uSlAU5H/QBny0+lJdzLVCTr7fbyzQqnu+Zq42Ih8h32ul0D
	GZycSRgXbhU354tJQDi222k8azI5jRKiPBDcojnsMNtmOKQWaxt3nHJGWgzTYatkPiKCBvqBgAp
	Un3F4Gf7/5ZFdYqqDza2gsA3kVfquFUOKixdpwA4tKAyuBQWn0EBKMPI2eBnwxAI7gk4v5Iosta
	jdJ/C5rpLmRTz5+wRAsUzSaV+DFlGHm1/3bZcX+oos8IXtFNPH91UL+hAvF2MJaDcK1YvELL11r
	7HNTJVeLEZDPS69yv6gRKJrA60lW66A36qT0Yubnsi/xvyn3IkZs2Dbh4e63SQ4LQ4Vpytumuj4
	P5MaOKZXaese/dYiKawI=
X-Received: by 2002:a05:6402:21d3:b0:66f:9f63:e537 with SMTP id 4fb4d7f45d1cf-670798efe44mr992275a12.19.1775815717177;
        Fri, 10 Apr 2026 03:08:37 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (216.153.158.34.bc.googleusercontent.com. [34.158.153.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f1340sm433488a12.10.2026.04.10.03.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:08:36 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 0/2] iio: frequency: ad9832: cleanups
Date: Fri, 10 Apr 2026 10:08:30 +0000
Message-ID: <20260410100832.1388-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up issues in the AD9832 driver,
including proxy header removal and bit math
simplification.

Joshua Crofts (2):
  iio: frequency: ad9832: remove kernel.h proxy header.
  iio: frequency: ad9832: simplify bitwise math

 drivers/staging/iio/frequency/ad9832.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.47.3

