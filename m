Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD46152500
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 19:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711566620; cv=none; b=jo5PXSCJ1HCwlcz2FruwP+axbRv/2Uox+ZeTvXNP8KbS9KSYxRbR9fzaK1CP6lPnESDA+tJWHEFkzh4M5mB8yOqI54v/eyRCd4b6OY3Nvmt0TF4GykqliytlME1QAC49VYDo1FLmJxRot5MeHmCNQ/T5PVCHMwwrhAmiBGx4M8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711566620; c=relaxed/simple;
	bh=MTdEjm1D0/qfOUg6cYn6umc0lnlr1h8xueLvXHiRnPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IX5S6oqkz+ia7+tunasPKfaRqgBsOc2WHwBfGIa1u1n9Yrf2ok9CpSvZcvj/dr5i72OwlzKHbKZ0QAZtUhfo9iz0RzwtH7SZnAzg1QOeC/jaz7t+5iLL7Sdtfo6Z0OGpGXycD9vR4rgWmZqkj3V36Hat/BUZMITkzXt4MhzGMiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAUpYNbV; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAUpYNbV"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-69185f093f5so1109506d6.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 12:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711566618; x=1712171418; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/twuRh0ETjmablTSqJuv3fOjHccwwgmOmFpCl7pqqQ=;
        b=gAUpYNbVaLsBfDD+TsDlmDQW5CCTsHwaUI3tJ+EXK4rQqM95QFOoIWc6BsQ0wWMCa1
         D6PM/QXePKGS3S/FhEUJvMhnWiCKqK95rvXnYabcgYo/++ranowVozW7YYJ6Vm9i62AA
         i4QyJfQ6z1yyWMpUVvd4Uh8C8oKwcMh9cA3HrXARuyec9Gj/1AR0GMVPhABaKsurdgr/
         Ta71qViqk2GLgbln1yD333aDDQECzbFbaeprJp/Q2eao+C5jhkPU9BZneHGuZHqypT/5
         JxQunMp7fqVbJFuP+KJqlolTNhd8URItlOsRjudAwVTf3aVTpvraNewl9EExtPlySjvI
         pj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711566618; x=1712171418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/twuRh0ETjmablTSqJuv3fOjHccwwgmOmFpCl7pqqQ=;
        b=BkC1OdTb3yQI9k7k4CeCNcSY4UJPvJga2l8d0H8izqrpMBgMxl1ET7T6PD5ghlMtFx
         qma5l6Sk0ryPmzzlgw92fIBcvW99GPhKLGIfKysDbQaz1FA++IpSXJWC5JDNzePs5E0S
         PnuEE84kSP23jzTtA5suW0qkId5sb84D4GRynQo9ZO8EpzetQwFsVK8A0tDD5cc1fNEZ
         eiMPgPqAeOl0MIqmv6QlQAsMW6Vqr184RqNJIOWa4qbTzvK3tXMm5N7H2gDUVPKig7OO
         NyLAZ97sqQVMMb3cQSa3UB9+gJJbC3TaoUhRQQXDaH3TDeR6QddSAGHLo9mdSSjV9AGK
         j0cQ==
X-Gm-Message-State: AOJu0Yxdxc947Dc9arM9dO2Gzrwhcbfm+8JSnIM8k9AFw3qLqxeU4i41
	KTPGI/Y/Krn5yBqNqHtVcdTDxgY7yNjTSo7RoquFilzfJ05ORQWG
X-Google-Smtp-Source: AGHT+IE7JAxxL25TeM7aqNrXRdLtjlqymQo3Q6QG0/xIfJgEB8sxYSZxlmv0Xnp5rIHt2GSzSS0xnA==
X-Received: by 2002:a05:6214:4c09:b0:696:b2a9:a2ae with SMTP id qh9-20020a0562144c0900b00696b2a9a2aemr475829qvb.6.1711566617988;
        Wed, 27 Mar 2024 12:10:17 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:f38a:32d3:e6f6:959])
        by smtp.gmail.com with ESMTPSA id 10-20020a05621420ea00b00696a1f5dd18sm1784789qvk.116.2024.03.27.12.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:10:17 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] staging: pi433: Make use of spi mode macro instead of magic number.
Date: Wed, 27 Mar 2024 21:10:04 +0200
Message-Id: <20240327191004.619748-4-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327191004.619748-1-ikobh7@gmail.com>
References: <20240327191004.619748-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use SPI_MODE_0 to setup spi mode.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
v2->v3:
        Restore Reviewed-by tag.
 
 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index ec9f07a4f769..8c513ac62156 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1164,7 +1164,7 @@ static int pi433_probe(struct spi_device *spi)
 	struct dentry		*entry;
 
 	/* setup spi parameters */
-	spi->mode = 0x00;
+	spi->mode = SPI_MODE_0;
 	spi->bits_per_word = 8;
 	/*
 	 * spi->max_speed_hz = 10000000;
-- 
2.34.1

