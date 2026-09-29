Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E455D87F
	for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 18:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707776; cv=none; b=oputFoGlg/IYPAwSs+DOvd6aY7p+URXI8dvaAouwglZUc22CznXw/9t5VvHQg6SZp8rsXEztIT0fvyoAkB4eW4NRIV8yhrUIB7XDjQ6IIgE89hnncL3n9vDzB3Xpnwv2hwZZQumQyGRjzAZVaCYUVuhiechage/hd4IY2cTj6ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707776; c=relaxed/simple;
	bh=7IbtXTxlmArJ+BFQWMkEj7Rrtt7najQ4NMwV2C1OO6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5v6SGbjrXhfIhwZljm4/UW0RH3CTMzeJD6TtgTFDyoCJE3+bC3K8qEoRgpOe6+rjrQt4aF1NL0AfuJx1yjXqSG8qyweq+330m7rZNmaax1znCtB9fw5vNU84xaC7YPikzyF77wtjlFyXTQT53xuv1OtWs1QJ5/R1h39DJCNX8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BD5ArNHS; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BD5ArNHS"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso21752f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 29 Sep 2026 11:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707772; x=1791312572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=njjB9DtfVySoR684665xgHbK33P3Y+Sqpm+bMczxzHk=;
        b=BD5ArNHS/K/xPaDp06AqSX/geBYR5NIb02nYxCYCiEZBvi33wKvsE12PSeTngesuMh
         ZWywQti+cYXkM5F2jsvhBPRVOPv0o5ZVB4wJ9bMXQqRVUl5V12UK3ornZCpYum1dbW4Q
         IwYFRf7N9lsGYNHYizXs/EtauFRxmVyzEGhZld7iW0A1rWUStE/U3U2K4Li+JMxzArlb
         5yMB/TKrggKfZyPNqM9bTh2wrw4MA6kywXT8jBpIe5cs7KvGGZ31/LMYFmYkHnuvbw2Q
         Rt0vuVqG7yctNRbjJVXnmtZIRKnzndfZdYdun1Ql46sucaE9TIg12hTKQhx02zloos+S
         z6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707772; x=1791312572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njjB9DtfVySoR684665xgHbK33P3Y+Sqpm+bMczxzHk=;
        b=fdTajlk1OmVsMM2gA/dMGEBcglDuqpjr4yeNn4g0IdpHZP8gnat6QB+YSpVm7dWI3s
         Gd3vDPe/Jpi07Gm/GKXjdgbKLDOgLO2vUZuH37PIzWVgjABKqZ2FMH56OMlHFiaeeBlp
         DZwlCLEao35keF0pR1+Z+uhrYrVXH/5LxI+RGHRkWJVcUGDVPgzllk5+EoSw8XaA20TZ
         WtEZAFS1wv4aBVuynpUkv2UrfkRLjq45nw1Sdb8zD8jqD4YOuJae1dSujkqGMHi18ork
         R/SxnWYMCPJ3pmcK4E9b/s3xO44ReOGtQBpw13E5u/Vhj1+TjPQZl1IR7Zfe1or7XhKm
         X/tw==
X-Forwarded-Encrypted: i=1; AKwUvByOb/BAkrW7squxujR+1XdK3iH0r6V/gzjhftPpoLbolL1V9PQoo3iw0j4dp66lrs84Zvv9zRrwO0Qzd8GC@lists.linux.dev
X-Gm-Message-State: AFq9FYIBQ+tOxkeckQ3/d01inHQW8uMJGMDgdRCgs7Eq2afTj6DVUnEb
	fikQSOHmJ9X+vH5sWKS1wROz4wUG9b86RkgQhuRz4Pvtk9iVPrwoZj0G
X-Gm-Gg: AYBFou2aomiHdY8KuVXi9nJkx0llE3hi3b7kUBRVkVHasAY5qVhBsVdz7svD20QJG/A
	lwlVGEkYsPmR6GiF4KDo4BRRADb3W8eC+sq5Jh1hWDFnQJkCL8NVaRa70mRe6zUBevuhIHM31rf
	eo36A/MZ4GSpx2wYwNUT2rqv5nJoD54sg6LMdrzL5g2W4h2xfkSNXHxMDikvVnsLi78rhqqLE1U
	fyZ4+1Jz9YSIIl6IOvmf3Xpv/ppl/pjkF+sjsBVAbAeXN5WXttK44B0mR144WDZuPnkr8I47Ub4
	8/xX3B2N5KaWqUUFL4RJJkp7mDAPlckfd9I5yDO7Ymlwj5IvZnHldt2OZdM4MyNLGm5u5ePC5Qr
	csz5tlZSjZ4ZMb6WAvKeXS1C+boo5HF9ipfCUzz85M6gy2/L5p3648lsTUzgYaklCVER1L2CDZ9
	fInJK+aq0F09NQrszR975FOCWm1Tr8AkhDeHipTSwgnDYZfTsg5MgAkMrj80HcEkhMG7JAaK9T8
	uS2loqQ63QSnyUCEU8s+l/NfwNRkkY=
X-Received: by 2002:a05:6000:603:b0:488:823d:5060 with SMTP id ffacd0b85a97d-48afe9c2eaemr300741f8f.48.1790707771742;
        Tue, 29 Sep 2026 11:49:31 -0700 (PDT)
Received: from fedora ([154.182.121.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6b8d1esm452569f8f.30.2026.09.29.11.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:49:31 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	error27@gmail.com,
	narcisaanamaria12@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH 0/3] staging: iio: accel: adis16203: fix axis mapping and cleanups
Date: Tue, 29 Sep 2026 21:48:57 +0300
Message-ID: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series addresses a fundamental hardware mapping error in the
ADIS16203 driver and performs a few necessary cleanups.

The ADIS16203 is a single-axis inclinometer. The current driver mistakenly
exposes two separate axes (X and Y), leaving a FIXME comment on the Y-axis.
According to the datasheet, these are actually just two different output
formats for the same axis (0 to 360 degrees, and +/- 180 degrees).

This series removes the unsupported Y-axis, fixes the inclination naming,
adds a missing SPI device ID table to ensure proper module autoloading,
and cleans up the register macros to align with kernel coding style.

Best regards,
Abdelnasser Hussein

Abdelnasser Hussein (3):
  staging: iio: accel: adis16203: fix inclination naming and remove
    unsupported Y-axis
  staging: iio: accel: adis16203: add missing spi_device_id table
  staging: iio: accel: adis16203: clean up register definitions and drop
    redundant comments

 drivers/staging/iio/accel/adis16203.c | 108 ++++++--------------------
 1 file changed, 24 insertions(+), 84 deletions(-)

-- 
2.54.0

