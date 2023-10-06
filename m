Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E35A2D
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 00:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Tz3YMvJs"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1dcbd8a56d6so1005731fac.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 17:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696553466; x=1697158266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmnWnKvM60dm/oO+QIaL6SFHQ4EDYTo8nwIRSW4SLrI=;
        b=Tz3YMvJsSYOTeCClHOmt3adKqbgu5oX8/fUJ7jNLucqHnjjHunXKjiC7ly7k8yruCF
         d4t6qTYpKPUIXt9zRytiab3LBYmvajrk6xTxvUda/UOxEoTke4gLDAXV1hPYurL1IlgZ
         po5U60kNpj3t30c+O3spM8Kqho0AGY82bG2ZIU3+tkgMn0CU43bB3ceCjjQONia1Rqv7
         fxAlWYLMqI9ZoqpXEQYdOlp+rv9fu7HHlKL4X0JhXvwGYxaXLDAjd7NdneL1aPB2e7S9
         LEv3qTS8/dJCh80b/gcmXi1UPHt9KffwhuXyKcz70dQv4Y/DYZiOeO21gQ8aEWjY6lFP
         sVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696553466; x=1697158266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmnWnKvM60dm/oO+QIaL6SFHQ4EDYTo8nwIRSW4SLrI=;
        b=uoEkCfpFmORrqVUcE9FF4OG6dbBmjPn6tdr488tVRgidLruDvepwObMkInoGDJEfb0
         I4NinEEhf9flkLEtBeBIo3C7HHoh574YFTc3u5f4ffDG/lJIYsLXWtP7A3e0+pFnMWvF
         DvRRHQQ0ljHf2WkpwkJt2pzNjnlr13Mo7dtQ7qVMUG2EKD/6hMNQl1KZYndaLScC5ldJ
         02OvnnCXt+nz3oshOeM07dlSca+jurb2sm/wf3U6PPy+Pzw3kP+5NGzN/2R1nwoTk8UH
         x0Pf33D++EEGUA/mfHmgfl9J0YrF76ZeoVrx3WtEVifef3Q2nKwJ14THdrVmEp0c5nKQ
         R88w==
X-Gm-Message-State: AOJu0YxMDjlnNSZQ0kq01/URpo/6i2VZSYXsOczn0neCdcTQ9ONFI1/w
	ZwJTrmJ6EzBMaPZ7/zpku8tI8g==
X-Google-Smtp-Source: AGHT+IEv6WtS6qh9/yTfpep5SGFAYpPtAHL09gstutBcqD5TCzldqYdZkPKppJ2qxWVI1cuLcrDWug==
X-Received: by 2002:a05:6870:9a21:b0:1db:3031:c97c with SMTP id fo33-20020a0568709a2100b001db3031c97cmr8089382oab.26.1696553466001;
        Thu, 05 Oct 2023 17:51:06 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id mo9-20020a056871320900b001dd0ff401edsm545072oac.51.2023.10.05.17.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 17:51:05 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/17] staging: iio: resolver: ad2s1210: do not use fault register for dummy read
Date: Thu,  5 Oct 2023 19:50:18 -0500
Message-ID: <20231005-ad2s1210-mainline-v4-1-ec00746840fc@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
References: <20231005-ad2s1210-mainline-v4-0-ec00746840fc@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.3
Content-Transfer-Encoding: 8bit

When reading registers on the AD2S1210 chip, we have to supply a "dummy"
address for the second SPI tx byte so that we don't accidentally write
to a register. This register will be read and the value discarded on the
next regmap read or write call.

Reading the fault register has a side-effect of clearing the faults
so we should not use this register for the dummy read.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v4 changes: New patch

(this probably should have been done before "staging: iio: resolver:
ad2s1210: use regmap for config registers" but was overlooked until now)

 drivers/staging/iio/resolver/ad2s1210.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 67d8af0dd7ae..8fbde9517fe9 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -166,9 +166,10 @@ static int ad2s1210_regmap_reg_read(void *context, unsigned int reg,
 	st->tx[0] = reg;
 	/*
 	 * Must be valid register address here otherwise this could write data.
-	 * It doesn't matter which one.
+	 * It doesn't matter which one as long as reading doesn't have side-
+	 * effects.
 	 */
-	st->tx[1] = AD2S1210_REG_FAULT;
+	st->tx[1] = AD2S1210_REG_CONTROL;
 
 	ret = spi_sync_transfer(st->sdev, xfers, ARRAY_SIZE(xfers));
 	if (ret < 0)

-- 
2.42.0

