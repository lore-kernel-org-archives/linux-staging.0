Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95602773DE
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 20:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767126936; cv=none; b=njvlzPsh0JIf9or8F3GcftwMiszi7Guko0JKvcY5wO7mhqC7nfO3c+TxX2l6mZlY4g9cugO6QXDJf0taBTDG7eeZatM5bPOiBgYuso9ikGrfO592lnPuNNSYrgQigzKdfwK262n+6FFRKP5zy4GPnOp3HoPbO6x3demBH4CicR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767126936; c=relaxed/simple;
	bh=vESSaFIFVODvDAYauywzLFHfGN0Mc3h70ZxlmCWHsa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4p+C+3I11nCOXWBYefIPvqmkqHobrTlzGvQhrMDuA+tdbFRkJgK0OmI71/mdpFmV1T+Y2X5KLpd4SHN5GrujbjGmZlYd+MOLG39cBXTXWEAdWJ6itzXIXmEMIjWJMybTgr3jReZo5R3clRqNQDkiCJ0yow82PALCqCj3neBbUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2A8NP4I; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2A8NP4I"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0c20ee83dso131073905ad.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 12:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767126934; x=1767731734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axPCG5191y85EuHI3q1Bwt62R50lYejVjnZraRFrpsg=;
        b=P2A8NP4I3+37J1MCw9u7cNI55nfbuBNa11Bil7Xx+1TCq5uaB2C3aKNxY5fJwurdYX
         vDLGZ9sR/UuyWvmMbdN+TH1R33xqgNKpxpPQGKNjaFNtLneFSYYWdxZvh18myAEdnb8r
         LOqkEM/Qjdlk7h03L+ypEjxbCzxv3slwimXF6HMaD0kTLaJFFUHruxib9nkjpF9ccwts
         oFa/FuOYkZ5YbkHp3xEq6OGNC4dwdUbtH55Tvz8F+DMPw911NVX9cYQ3Ez8T9EQZDyJm
         wdzjEG/zYEe9P86hRqIJe2keuhrw2f7YhOTXhqKMbWr1Qy/pNwuaXAzjCzU1Re4AmvvX
         jPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767126934; x=1767731734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axPCG5191y85EuHI3q1Bwt62R50lYejVjnZraRFrpsg=;
        b=SdQDfmWAV64Cg+p4zevEMfCAWpX1JZ7my9np1xQz+uk2GL6MQdJR0W1Ti6VlL/J7nw
         y4MAGcX2FY5s3jw4fYGR4jt0hvuPaYHEjRp0/B+CGkLGggIb0bP5YtaynfSmRz7iWOa2
         5838WaME2Q8S70voUY19HGbwhLDBKKjXSfurN+KnZ1dHW2KhHwNL3j6pm+lyOCV6Yuje
         pSQL6BMDA1oW1xQUakyK9pUSachCV4LBA05Hb9FAWzBKWeV8N4MN/Tm2Ak09HtrPbWnI
         jfoWo6VshTDYvnXmHRrduwqV3kWweVJ300K+3djdLWwEJnTWL9hOyLrILuvkKP6AI/IY
         cQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL2xzn0v5+tyjjQFajzVpGjmLX9vcvaj2xD1wOMRMNMtJCNUVZoKOTyK7evUGrb3SMmppXOBWOmUKcvCtM@lists.linux.dev
X-Gm-Message-State: AOJu0YwEod+frE8sdeRgwFzRtI+tzwzHE2zLsDwvZDRkq8P/J392NcOv
	vdEp0pRToOY/ignghOftBaA7/Yv8sLA3R8B/JrxQpJwXSEf7JcQJFnN5
X-Gm-Gg: AY/fxX5nrtLArB73dwZIovqHFuK8suOsSdnhfVnA7uGNKSzD3B5pxY0utq9zt33HYMI
	fEbw51qwDs4xgyp9lM152ea6Vz+cK+5Dlpv9IvXi6Bcw44H4VRYXYNrlHWx8LoP727XwXUpBVBR
	J0Au6E++2U3ZQlnux/EwZG5N85nPY8Aqn6xMvLl4Q1OVwsWbfagiq+QSPU7GTdvkAZjW3oS1+on
	cEva+8L+ZM1XLjVs61wkMWxmox0J9LV4qXBik563Svs1mgiNPcWldNsYdosyR8BIKI93Wab0jO2
	qVBcVyKN452Wi73V2au96zCmNfX0AShEMR//0DQN7gSunBexePIzhy70ilIkl+qcMJyx7Mn7KTd
	fAzasl6sfKpiRV33UODHIW3uz29PpuU6dXvIufmGzn5y3LyjDSwh0jgvHiW/EFFcYklaj8/L/rX
	8ocKdeWLC14lkpIcvtat15sLzY40K0hk0HD5NAlxOy2DtdOo2yNG6LQyYt5Mv7Xxvq0rYE+Tl/t
	CtDrtcrU8YcsH4bec2frjMY9n8Ki6RSsfiR1Z7jX0IAvFDuFr6JFPGaN/i8gwitWoU46vnN
X-Google-Smtp-Source: AGHT+IEjynbnbNOs0GxvG1NZrDdhGId8lCBPq2Ib/COi11IyOlDHpfQ3hve0iMX2aPrHetQoG3h2YA==
X-Received: by 2002:a05:7022:220b:b0:11a:61ef:8491 with SMTP id a92af1059eb24-121722a9744mr39338291c88.3.1767126934007;
        Tue, 30 Dec 2025 12:35:34 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm128074981c88.9.2025.12.30.12.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:35:33 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [PATCH v2 3/6] staging: iio: ad9832: convert to devm_mutex_init()
Date: Tue, 30 Dec 2025 17:34:56 -0300
Message-ID: <20251230203459.28935-4-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230203459.28935-1-tomasborquez13@gmail.com>
References: <20251230203459.28935-1-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_mutex_init() for automatic resource cleanup when the device
is removed or probe fails.

Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 35d8d51d5c2b..4bb203a67046 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -310,7 +310,9 @@ static int ad9832_probe(struct spi_device *spi)
 		return dev_err_probe(dev, PTR_ERR(st->mclk), "failed to enable MCLK\n");
 
 	st->spi = spi;
-	mutex_init(&st->lock);
+	ret = devm_mutex_init(&spi->dev, &st->lock);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize mutex\n");
 
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->info = &ad9832_info;
-- 
2.43.0

