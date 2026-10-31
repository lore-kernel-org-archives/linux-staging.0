Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437993;
	b=ypoCigWekJ9kPSaL488g03naaTfsVCm/4EZL3xxbxEVsSVlFic+taGyualaNHIutLpAK
	 GmdaL6hubhg9RXmb4hanUYO62AIrX8cjD5fdIhw6T/+5ZYTGHT2e0wWZeAZcORlHDA06y
	 4ZRaYJeVYjYZzJpLSosvYHC5CCp4+zlmhvBEeJyXOdIANZJzvolVmER9wG3rsXR8PvL4f
	 X1nLj0L5Q+BwNMn+7BbMuXR8V9P4QNVg+i2Oorw+9AncPN8Zd2S1T69aa2vxPOXcJ0bLl
	 BkLnQFoxKQ6ZYVtNBs2f/RmAMLDgd+m0D0Ir9/TNxRXqUI8U3HtFShwbdd0VMaDi7gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yvb6WJh+6K9JJR5AEaTQbWzXxWner501dTBgAUHA8yQ=;
	b=uobSpmOby4FoKkcj9fSRCCq0fPfES1VMTvzK4QVYNUQL4IEgPuR43wBtZCEnz9k625fJ
	 rlJueRcXx4WxT8dRFz88Nnp9D5i9ir1VdI6GmDhsgwwPLp1JE8iRdgk7iUwV1RbErfaut
	 EJArj3R6GNilsazeKaX0aK4Ef85nvnIf4ueAn+DAGIyYzuAGqkml7SwD3UtyPptp+kyIo
	 zgGAoT5ywgB0w8WomDOBiti0crDB1NSiETzgtKHttT7H9RgBSbsObA3z0NlQlYkhe1buM
	 bY62xcGHR99mrl0zHYJWbJog9Zt8NQXPm+BXnV7bPF0qTFMCKUhgPclk3BD8vsISDLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkrPrzTu;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEF6606A31A
	for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 09:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DEF6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkrPrzTu
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1adbf62dd31so1348246c88.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Oct 2026 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793437992; x=1794042792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvb6WJh+6K9JJR5AEaTQbWzXxWner501dTBgAUHA8yQ=;
        b=OkrPrzTuQcUuW/UhNHHxX8NdB9cupQkNYT5j+lqp+ZPZajRJBUWfM9FC7MSWMdeqvA
         TEcmlaYf92vK5J30gk1t+MZQanjRmfC/ErhUCQ3ZxcLIE3O4/z5k4WCxtkaLiAP+Bof5
         j4h/EWOO8kIYzydgxVKcuPgV04Xlegfak7fKNa3JLLqL+oGBcZA7OdtX9e/3FkmRSaLm
         x7+Et1naN85dCPVR7JoGTECCk2Z1iof91A2OeTE2nHA41SXIzFzEP68kj9kz0JqThuAy
         VGs53K6th2izRUyjSVTWASLi/0NSwW4qY6Y9eP0V8xDR0K5yFH6CAp/IVu7Lt5ltOI6o
         nLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437992; x=1794042792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvb6WJh+6K9JJR5AEaTQbWzXxWner501dTBgAUHA8yQ=;
        b=zwg7aRIdTs5qwoTqARgugMk6R4a4/CbFWcL4vPklqnWsaQ2uxfiD0SRaHfThrJTQve
         CTEuxt13hMM0Ao/p8BrJDEKpMl1XSBkItbxCqCISvxQ/QwzLsBtVw8GhEu5xdhxHzx8a
         NHGI21lDzZR9ktbAW/MlkTBel2Ecn8YDeLM7GzA8HLhtsJRQqRnNk8GSA6u2dzKflT/5
         qnXf0RZqZqUVMESwBNGiKPKOX2xIL19DewBQg7ful2OBlwz9Wj4BuGMsI3/7P+GAx3Up
         jfEF9iK7WpDGKTFx8NPCBcckp/PW9Y5kSreqogx8OR0tMJhCmy4cvMs2rpRLxtt6Mxqi
         Qrhw==
X-Forwarded-Encrypted: i=1; AKwUvByL96fiBTaqyxcwE3cHQeQp+O2g2Fq7A/I8stMdlZSk8Agp1h4Nj+rDFIEUj2YMIdpjjMmDBJtd1sdjtZkF@lists.linux.dev
X-Gm-Message-State: AFq9FYK5iCN5GMOvHmUbQDZg4jnu1kGd2ijk802OxqrT9OMKnehqGthR
	gkjUDy/kcUcxRnqGuuHKUKceMwFK776wA1mEQ3lfer8HetSRzE2jRglc
X-Gm-Gg: AYBFou3PMBLEyh/npdLRFDKRjYCog+IloLBN6EJWlLsEBcBBdXMF4BzAgGJkpwpTdbL
	KRHyjZSnZIWAGChAbAo/jSQ2mAnsfueJguNso/iRMBeori8NvyNaPYISuTiy2e8SUcLDFsSM+km
	lXNuRY0CalnRGC2cvztTZqxeIDK7RDaWegXKRhzEexdRgp6qvwdYpRtmWzr5CokplbETqA4/gMC
	xp6N3jlw41SKksKAqlCfdVsOL5DzCtomGGhXBgLA5P1XDJexqrDYGxoyIWfw6CafCJEwZNcix/4
	qIajKg00E6cQDXvm8MWcaL7D8VqZ8/odJVkYez1FjZx+Nlt5zYbpK2Ep1IdRolwAj/nKxOZvVds
	bxp84/zVLn36zCZLHCoraBTUhuJdpvoFqkIMydPUPeAws7kc0uS5mp/Gizuaa7n3I1k8173nmo0
	JD9UMrlSrm16dCumlmtp1MOvF2AARp+gst6T0p6xEZ2j8FUhsak5WTlTmWjEjsxktYgNKPf9PoD
	QFLRjkDwgr8ZxZ7Ka7iDC/13GL+V16YTrpQd25yZV3SKQMexj72C2LAh7xEE6PGXTktFc+/Uroo
	eh6gWCWSU3bQsI/N5qU7RCYEPFsVO+o0qVJL
X-Received: by 2002:a05:7022:3b88:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1ac5c8380aamr7862765c88.18.1793437991368;
        Sat, 31 Oct 2026 02:13:11 -0700 (PDT)
Received: from archlinux ([2401:4900:ccca:8aae:db4f:18dc:62fa:a502])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm15771014eec.24.2026.10.31.02.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:13:10 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH v2] staging: iio: frequency: ad9832: use devm_mutex_init()
Date: Sat, 31 Oct 2026 14:42:36 +0530
Message-ID: <20261031091236.40401-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Replace mutex_init() with devm_mutex_init() in ad9832_probe() and
check its return value. The driver already uses devm_* helpers for
its other resources and has no remove() callback, so this ensures
the mutex is destroyed automatically on teardown when mutex
debugging is enabled.

No functional change intended. Compile-tested only.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
Changes in v2:
- Add blank line after "st->spi = spi;" (Andy)

 drivers/staging/iio/frequency/ad9832.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 35f823f24f..e3b4e19a8d 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -325,7 +325,10 @@ static int ad9832_probe(struct spi_device *spi)
 		return PTR_ERR(st->mclk);
 
 	st->spi = spi;
-	mutex_init(&st->lock);
+
+	ret = devm_mutex_init(&spi->dev, &st->lock);
+	if (ret)
+		return ret;
 
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->info = &ad9832_info;
-- 
2.56.0

