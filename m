Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB43D235045
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 02:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778292423; cv=none; b=rtd0tlpQ4PWE72m/v/8g5c9sqm8YFB9paPw5UlxWXSiKEmUoq5YSga5sb0F7P0UX5p9vUxqBRJOcXOxdlzAYEee3Vvj/KRxuUwOuMatBtM3vnIsLJsw1vl3ZHLCAAdY7hpg7wrKWwhyoLgPrVJ6xjUS/v1YtuAWQPNmTlJffIOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778292423; c=relaxed/simple;
	bh=0UqRGMGJFyQR4ZU9B1gZnIWfgj1nOftZ7YXBLwSK29o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZSEePCqBD/B9XHGTz3LDVZgerAyA5xRI+KUxiU/3Q7EiD30j524AOZKD+bbK4j//81/f3MXp+O4wQuj+nyvZmh7FMf+RRK6dSTjnRnR+mGUFQNYXulPmkWWhTOfeirE0TFffixcK/RcDW+OH7T9cKfT9n3Wc1oyrNLinttDBiMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxXRns/s; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxXRns/s"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso2911116eec.0
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 19:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778292421; x=1778897221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ai/n2cnUufP8ldkhBkibpvPnnhM8YVdLaYJ+C13VY6g=;
        b=OxXRns/sc1vbGLFWR/yM5h67hORo460goTnBHKSJlFvmQtx3XhBI2na6mXjNCmrKCw
         xJMxNZ4117IcOjb8io113raa+SafVpkQXBvEQlVPbRdQ5BdZHVxjbiSzmQz5DnDn3Qgm
         eFZcwYAUeuZ+amiilzl/bZxnh4ea06j+jlxWuMgHBuQc/QWdbsjT49wId3ckUwHir2tg
         Twx5tyVNyy4wESVpjgkFEWBCz6fLI/3Ff4J756DA96o7C49WLvqpzrMs0b4n/wA/z5+L
         gbMc6l+9Kw8IKxOSK8MSU8TTOpambJZZPrhF1exgRR7rlzdBuCrfSwjuQvFx9b/BBn9X
         4Bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778292421; x=1778897221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ai/n2cnUufP8ldkhBkibpvPnnhM8YVdLaYJ+C13VY6g=;
        b=E+dFlOBwe128g598bGHF3GtkKkWHGPviUq6iUscMQz+F2jabChLUjbZZ0VP1hHDniu
         LlAw6p1ofbIAwD+M/Qx7qK32UExgilL1SACFESjLQs1VeChUFSP119VAgK9pyuf2UbHZ
         /x8LENAdhkqoYV3iLTTCUHOkmq/rrDv88kC+cSXMjE7mO0ReXhxbP09c9oGvS/XAlM9c
         aOXFqWi/5z8asdk5XBQE8xJ9T0TzGDkqVmD4/lbliiUM42OrpsGk0mJM0X6wvYgOGGfk
         4+B4PULpYdA98lUhL7/uT01xxFF71JwouhPweZgQhfh5GjiLaZjAvKQ3Kh1tfOtBiKd8
         cNkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/e2gWU1eYXn0+4DkP9QLDRpU9szxyOsocLYEm3mlKj4aSwzfeSW/Es702mv7SmlqWp+OtnT9+IxZNcCP+0@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh1vMy4CRA4rKq8nUJm8VD6K4RIeMO/x18UdEJvpCxY9ix6kug
	sB+9UwwTFQIICk2R2WUk2y4Imtm2vMe0Z52Ed5Pm04DBOXq0T/S5VFYt
X-Gm-Gg: Acq92OEjgVVNJ1QpUuq6TKmfUyQHdYubo74Jpq1Xgk41+1d3igxXWQLlufW7fT3GUSf
	KpjMCdWs9ce7p0TOcORWyl1brMi4tn18wZWZ62Ea656G3mI5oIlf8hNs+OeUMeMoEd73rVxsbFh
	kvAZbAQXSFjObEUvC9btc/GzR0kqBYyeHrJlltvqTyRyJM0t2GOc7QxLOah3jiWmiatI3CsYqE+
	Gq2LxUQNIKMDnas8CXYJeVArxHOfrnzZzna19BUf9r1TPpHvtT1wcCZ8P4JgQaUYAQ1Jx34H0kI
	EOkoYUBm+f0nxwqBynLdqd8/7GE9du4ZdyQKjeyaO5KeyFsnSbBUjFku/DwVJ6hCu3lssfNwTGA
	ryRX8mAVFsbGUP5PAfRb1+ZsiHtcVZR3GH3Le6HIJGCbjHS9+2ENyGyRLIGVtRbwJMrb7mbUzMI
	5CBZ2sWQ14KbBjjU02skYn2SQH8ImiPC8XA4eQmjySjK/TMkQAQdnda7I=
X-Received: by 2002:a05:7300:b919:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2f54a87e845mr7917637eec.22.1778292420587;
        Fri, 08 May 2026 19:07:00 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8893441absm6080859eec.31.2026.05.08.19.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:07:00 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] iio: adc: ad7816: propagate SPI error codes
Date: Sat,  9 May 2026 02:06:46 +0000
Message-Id: <20260509020646.82778-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently returns -EIO for SPI read/write failures,
which hides the actual error code returned by the SPI subsystem.

Return the original error code instead to allow better diagnostics
and error handling by callers.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 0e32a2295990..9052203eb4f3 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -222,7 +222,7 @@ static ssize_t ad7816_show_value(struct device *dev,
 
 	ret = ad7816_spi_read(chip, &data);
 	if (ret)
-		return -EIO;
+		return ret;
 
 	data >>= AD7816_VALUE_OFFSET;
 
@@ -320,7 +320,7 @@ static inline ssize_t ad7816_set_oti(struct device *dev,
 
 	ret = ad7816_spi_write(chip, data);
 	if (ret)
-		return -EIO;
+		return ret;
 
 	chip->oti_data[chip->channel_id] = data;
 
-- 
2.34.1

