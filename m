Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D333FBEAC
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508430; cv=none; b=Ub/SSoA3GSMtvGUgrFYfAeuDm0s/Dhw+IlUAWxfw8abdK4Q7pM0bDPOuaWXKQ8G4m8+qTOV4+5lt1ec0RX4lI+u5/PMFNEIvIRbUURKCgLGGfSfONI4nyCf2GUKzih9s+sHa1EAkVYoMq7a2gxvzujEQMRI99rQUTMJMMhNIz84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508430; c=relaxed/simple;
	bh=/gZeyJV8x7Aeejwh7qyX5OSj6X3GN6xwf1eZzzNee6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vDzg3UK883FoFc7T8kMt1CUn6WlRYRUmFQLPeE4eLN/SLkhJr37Or7Du/Zyo6rpTYcNx9z+lmOw2nEqooHRPlkUUx8tYVPlF2WPFeQ+E49FsjA4Ny+Lil+6l+WMZoQpdj9wLLl2ZsHo/XfSIbMBIzmJ19HSnU4RGcA7qFHdjbIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxDOYq2q; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxDOYq2q"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2f00a567cfaso2970478eec.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778508428; x=1779113228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkQ5/goWHs+AMVv0uCTHxRAt4oXWP81t+SslhUkMMnQ=;
        b=rxDOYq2q8XrSmpibPy58J22hH5dGdisEI6BAjnF/QCtg68yOApkhKKAw3La56t3yS2
         6DuXdn6Fov4XebQyoCLb8k91gp6eH2WBuYPEQyfEGLcOv1IByBpU0bvO7gc8cJKMbctZ
         aJt98QeYv1GmEHTi1UYLIGz4rmWnB8dUNC8QhxRvG9lVuM0wO0PjE0YdKXlIStzu5cz6
         FHR6cvJgOxxKXsjgvw2vUTb/od/p5ll6c8iRkXsqa7WWH/mWFqVIMpDB/g2vYZvLnySU
         ghw5kTGhgMc6KMWdUxd6ac2bI4QvjUszXuPUW2sLeVAqkSxfyVubrIvESUIUSpvZ3kiY
         cJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508428; x=1779113228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkQ5/goWHs+AMVv0uCTHxRAt4oXWP81t+SslhUkMMnQ=;
        b=JrPvtVEe5tX5Or5eyJ9n4J3UTczp5pN2h1lO+CKsmiqPfcXavJvpih4OvHLIOM1c7t
         TtTvwc+XprNeSaliAtZhhZFwuW+ywJcIMHYCXe0vsCQCqHnDBD4/ourS5fXXhLDC7H6b
         QtBc8AgvMBD0V+MAi+v4uH/7br5dLBX+jRrrVhzcs6xZjUlVUf5VcNJCUqhYEu1q6ZLM
         KYBRPcDxIWmDEaKH2fDmvmnBOf2ZK7XdiUkeeT8qx9j+6JfM8HNF9z3K1sAX+VlQC6rS
         VUMZ++73CN/1t7k7hmg5NUVKZkESHK3lzSM1Ib0uxM3W3iZ0gdsnCktOIYDciKgnsFlk
         6r5A==
X-Forwarded-Encrypted: i=1; AFNElJ/jdyffeXEmBsRy8hM9wY3VCQDd+OSRZJEwdpzCf8yWmn4ozmM5n/WKQpVdRpKJbKX61iYB/Yz1Y2o+yDay@lists.linux.dev
X-Gm-Message-State: AOJu0YzQVwXw9pBUuyuQ1fD9tUJvzw4pesun6mQaU2ikX2JMtWLbdC76
	TAv7/FYqC8yrvrIopmgYUPltEvUdC/DlaMFchyyJD16cdMvMwczwQSaZ
X-Gm-Gg: Acq92OEN9Ba1NYimDBDnchopTluDwbhxIEWrVoWaP8M9bsWP0HemQspWL2mhekk2VP0
	Kv0ax96y04KllCMjGvLqvQa+GiBCwtz3BVdQejxpmB4s4R30hMa6mmHQRIGIr6DLQrTigaMrMTU
	mE6cG0P6r+H6Y2ykEH6cBnKpTPF2BDPR5Aq41WSGbX0xudCkugCgIdQ7qrGsDaPtKvVsHssYIvk
	jIq20pgD1X3d1ZjYM0t9z0PTYehTTdBs1gE3KeXQiOWS63/fNgKSkb+z1gCX065JXsLXc/FoMQ6
	85bPgoG3tM7LbrdxccOACdXDTtZlHXWR2ulVAUm2y1cnzZxF4EVRXsfWLeFt0TJ7GYEmW5L9zpL
	gX0Ypc4kxn+7wMcJ8sKy0m1E76ZPLVQRQqJP5ETWwRBiUoSbG13mZVPF7r66dkWKv4peIz+p6mY
	Cc8Xa1JckPm5v68UKb0jlpSu1eI9fp3r+ukSgh6WcdVrWCjNQirjgpZ7msaWCfsJkOOg==
X-Received: by 2002:a05:7022:6187:b0:12c:15ce:a71b with SMTP id a92af1059eb24-1323b1bd713mr8099105c88.25.1778508427507;
        Mon, 11 May 2026 07:07:07 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847504dsm13699258eec.15.2026.05.11.07.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:07:06 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	m32285159@gmail.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4] staging: iio: addac: adt7316: document SPI interface switching sequence
Date: Mon, 11 May 2026 14:06:41 +0000
Message-Id: <20260511140641.86389-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device powers up in I2C mode. Switching to SPI mode
requires sending a sequence of SPI writes as described in
the datasheet.

During this sequence, the device may still be in I2C mode,
so SPI transactions may not be recognized and can fail.
Such errors are therefore ignored.

Add a comment to clarify this behavior.

Datasheet: https://www.analog.com/en/products/adt7316.html
Reviewed-by: Maxwell Doose <m32285159@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v4:
- Restore section title in datasheet reference
- Adjust wording per Jonathan's suggestion
- Add Reviewed-by tags

Changes in v3:
- Add Datasheet tag
- Use datasheet name in code comment

Changes in v2:
- Add datasheet reference
- Add TL;DR note

 drivers/staging/iio/addac/adt7316-spi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index f91325d11394..1debcc36c1af 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -106,7 +106,18 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 		return -EINVAL;
 	}
 
-	/* switch from default I2C protocol to SPI protocol */
+	/*
+	 * The device powers up in I2C mode. Switching to SPI mode
+	 * requires sending a sequence of SPI writes as described in
+	 * the datasheet "ADT7316/ADT7317/ADT7318", Rev. B,
+	 * in the "Serial Interface Selection" section.
+	 *
+	 * During this sequence, the device may still be in I2C mode,
+	 * so SPI transactions may not be recognized and can fail.
+	 * Such errors are therefore ignored.
+	 *
+	 * TL;DR: Do not change this!
+	 */
 	adt7316_spi_write(spi_dev, 0, 0);
 	adt7316_spi_write(spi_dev, 0, 0);
 	adt7316_spi_write(spi_dev, 0, 0);
-- 
2.34.1

