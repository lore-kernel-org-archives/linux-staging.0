Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBF03A9605
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011126; cv=none; b=awTf3oI9/uBRl1y7OWs8RLMbAJD2Xwb5DBejqVxkUVGYHy1kqZ6hC3ylPU+FWLQrJfG0SOLYO6c8xZuEgqBRzDF4mcY2g6hq0zS7zQFW4g9ZExG72st1SBUCOjsXh/6U7k7TrxCJiBBgzUZhPRxerCk8T6WTAgIQr/Uxsrz8ufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011126; c=relaxed/simple;
	bh=dDFkiOZCR6vFnvQRyi43vYP3khgC2hrP5tR5WhrCVGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pr2ZAp0EG6bQNNzQs/GP5xB4ZgAUU9j14472iubfFyiDNz1V6VufP1SzLbJbWINAQ4l2RlZbxrqayat+ODfeeZ/r9K29rUmqCI3myQ5kLDskBmbNYwOfE54pv2/gHkfFijFPmsAEEvlV8i7gAQc/Y6NQ3zQxpueAuh7WBVx2F48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaZPfw43; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaZPfw43"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1154152a12.0
        for <linux-staging@lists.linux.dev>; Thu, 06 Aug 2026 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011124; x=1786615924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XtAiplxMmMFNrwGgH3OvUxuzrJYevo4RilZFtq691U=;
        b=aaZPfw43wevlm3eDXeICoC6zDAM5R+nAK29V8o/DJJgj7PNz1X+Aq5cn5MX8D/yJfj
         zlQDrf6Y7jwe6mB05ea+VJ0rhB/mHwOJejIp50zH8McNvREZvntC8kCw9xt8kLMj0juk
         DwCvm4ghzd3EGwRfLasmzrYig9enKjnRLV9zds6hUs5blrw08Jh6R1/Se94WIe+m7inf
         BWOIA2yFf2URrOQFjg/hcQwjUv3QF0X/stig5uBJ5HT4NBZm3jMwOGHArCxZKEFKAh7b
         A71woSvtPvCpej9cgC4sZafsKsrBLHTj/Ohullz6RWxNnjPfWobjlKiamg4z5tLfVQAX
         7d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011124; x=1786615924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XtAiplxMmMFNrwGgH3OvUxuzrJYevo4RilZFtq691U=;
        b=pWXGrZARgjrSRuAQTty7ARGtTS1TvEyuDkDNkDGD8TgrSiy2/AFJh3vHyQM0rOVBfo
         aUGLQGza3HGZFKgDeGd9nMHsSY58v6BDqeov2n7cDG4fdYjUFmgzApy0ruxyq9E3mC3U
         kw5G7BB0du4vKsVcI4gUmF39NewzZIe37Wnr8C0LQ+NgH7QC58wKJDBhkK5ZkAy8Dh3W
         SjVtdSnipRYDmWhBVgTzo8fPDdyCxgnwQUcidvxLX51OuogiimgnTu4d+JQOm9XuQI90
         tJwoAuh77DBDkhtvTyeVzPc2theaxS3afpqpQSTI9XnE0mjoowirYMh+gzxRFj5pl6mR
         1EVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgOZol8WqPa4FbkPQq6A0EwWioagh8s6QwCbmaLrakY54JhvG55ObxhUwOeqxMymF6rqEWvaoq9ZJdy/BC@lists.linux.dev
X-Gm-Message-State: AOJu0YyYR09R44QuY2yYfiig/WAr1JUuvIn2c1cuRIccC3N5Bp6EWtIs
	4313Z9++fh0zSe9hiuDME+emSXf0y9w7NVuHV+RDSRDmU4QtG5qU8k1D
X-Gm-Gg: AR+sD10wijdRlpz95CZ9S8TEYGcddjGusQ4ivGbdoSQrboZaoQlkuuPsxeSHCWIDMAS
	d6Bpt5MyJHQ8hnpA5t0MszpXpr4uUn1z7dGVxWhpjKuqV3ObuR4V7LtwS7a97BRT7VXQoY0JDYb
	pTqC6T4U4ZNQrCxmts4HuUKv7H59lWfEqUGpuzmwttEHIR2RXXzufwbVtEytWAAKDcGgcAdklQp
	QmdjwoouCdzkkVIOF4+ctGA5AfLRc5s1Q3wg5ajHFaz+BMwPHIfSgR/53Eewhe4HUhpLr69YXYy
	m8GG343AjCfo1uOGlHkOYWtU1g8vpQTWtIYr0HQu/Kruu23yETYT/9Y7BKuZfqmQjICgc1xhAkh
	EwE1k19KV9s06k15M7iuYsx3whP3DB5AA/UaIG91rvd7ATEZJqIjKyloTYfhxYNdmDdq/dSonWI
	eANMI/eo4Slnk47gZV7dMX1OLWAZGyPZvSDOhG0EV/X70e6jWEhE2IfkJzdg==
X-Received: by 2002:a05:6a20:d12e:b0:3b4:71c1:ab29 with SMTP id adf61e73a8af0-3cb85e3e76cmr17461336637.16.1786011123966;
        Thu, 06 Aug 2026 03:12:03 -0700 (PDT)
Received: from dio ([103.161.231.150])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158676f579sm24414248eec.20.2026.08.06.03.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:12:03 -0700 (PDT)
From: singh.supreet14@gmail.com
To: Viresh Kumar <vireshk@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Supreet Singh <singh.supreet14@gmail.com>
Subject: [PATCH v2] staging: greybus: spilib: Handle SPI device types with a switch statement
Date: Thu,  6 Aug 2026 15:41:18 +0530
Message-ID: <20260806101118.146685-1-singh.supreet14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805111958.114209-1-singh.supreet14@gmail.com>
References: <20260805111958.114209-1-singh.supreet14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Supreet Singh <singh.supreet14@gmail.com>

Replace the if/else chain that selects the SPI device type with a switch
statement. This makes the code easier to extend when additional device
types are introduced and improves readability.


Signed-off-by: Supreet Singh <singh.supreet14@gmail.com>
---
Changes in v2:
- Restore the temporary variable spidev
- Use the contributor's full name in the From and Signed-off-by lines.

 drivers/staging/greybus/spilib.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index e4d1ae8308aa..d1b7ca9c4ee3 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -458,17 +458,22 @@ static int gb_spi_setup_device(struct gb_spilib *spi, u8 cs)
 
 	dev_type = response.device_type;
 
-	if (dev_type == GB_SPI_SPI_DEV)
+	switch (dev_type) {
+	case GB_SPI_SPI_DEV:
 		strscpy(spi_board.modalias, "spidev",
 			sizeof(spi_board.modalias));
-	else if (dev_type == GB_SPI_SPI_NOR)
+		break;
+	case GB_SPI_SPI_NOR:
 		strscpy(spi_board.modalias, "spi-nor",
 			sizeof(spi_board.modalias));
-	else if (dev_type == GB_SPI_SPI_MODALIAS)
+		break;
+	case GB_SPI_SPI_MODALIAS:
 		memcpy(spi_board.modalias, response.name,
-		       sizeof(spi_board.modalias));
-	else
+		sizeof(spi_board.modalias));
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	spi_board.mode		= le16_to_cpu(response.mode);
 	spi_board.bus_num	= ctlr->bus_num;
-- 
2.55.0

