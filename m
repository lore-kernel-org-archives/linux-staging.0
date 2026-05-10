Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9111C21773D
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778400662; cv=none; b=WkLIzZow/eYX5fcFps1E49pMVibZ8N0Wj0fEBOIpe6Si+z7a0Pz6HcPtt8/MZgsLsEFX1jGELxfznuj8HKji1kHNiUQ4u2nZBPnUwwAUZZ9Qg0GNF2/DMBWJaofiRe8NuI3YHPZn1zTcBRWbRklJjsHKn7BV7UsJrggA2nTMKbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778400662; c=relaxed/simple;
	bh=qV39xNtfL4QWl44+opgnZA/dVGnBNDm/6My8Yisoxac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gEYxi5fMdCVDv/8Nkm/qUk8V8MRvDcyTtVsCSZtDTRxQxY0F1Sa+G/mSS/oMNpXsPHNvaBLeHcmyoZbBr8VlFrgHcgi26zPQ4p+AylpxJPZOLphIzF44Kz2uPao7ii5jNFxCqPmHGSMowfkTu8YEPLNKfDDDiDqKYQNwL5F2xeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geNzJo49; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geNzJo49"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12c19d23b19so5660718c88.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 01:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778400660; x=1779005460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bIvPRt9dlizeEm93tbtAZzvWwvO1azBOrboHx0X4jRw=;
        b=geNzJo49w6JSH4gstduyLmSfDn3nr3Vn6TWkF7i6bRcqReikKsDW6rlufVdzQeP29A
         gk2+TsDTKl+DxYoNWb7jV6SYb02mh8hBQtPyymilWR3uzOsyXrsLCEwY45/LVx/eWyfV
         oXYwXYUeCo5PmxlWAC3RILrIkScnFuV4V6duVzU47R4ay4qBuvMONYwNk3hQ/pEq1798
         KVy8b6DzugFIYngJ4DlU0rU7SfRohPYOdEZFKb5EyNt9E8I0EfsB2VRXEzvrQQu8vPL1
         QGGjNEhipScZA7KLBC49TFTTSXmu36uDc63swUXhUc5jJbyJOjwguKgQhVWgTiYsclXW
         1dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778400660; x=1779005460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIvPRt9dlizeEm93tbtAZzvWwvO1azBOrboHx0X4jRw=;
        b=qeiZzZxwg2cWn7Mc7LVZH7VOAisbApSEnrB/bDyV2j9Wq/1TRV6KTy8cBs/qLpgilA
         XqbdCXqBq7RUnqbKfryBQtdmR55YnYQxt4S7VON670Su8uTVbBLSqXxOMKb/13xdhRLf
         5jBYFfMbk9ahpJx3iAFIuFj6emKJHn/L/oNpYFxYY1+pIueSnssjqsVRUv1t+ARdsET+
         VwK7YWI1oCzdIHQIDLVc5o9dL2LpHiOPzrMhT+3IwSpVwtItH/8FoycWnBriX8okRUQd
         FtyY2bwoyFj90SdUWouyOCpgUSf+7bXWqFyX0Xcx2dE+FXYoIz9ADPXttB2YxvTf8Z4v
         huOg==
X-Forwarded-Encrypted: i=1; AFNElJ9rlFiX7G3nVdYqrx3RGVqnSLdh81Wi0HunygfieeZeZyWe39aoEDvseOl3wlm77IqJB/Ut/s8k++1Tum1J@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq+NNLcuQ4u8zftZ1SSRXhAXMcOKU/0LAejOVyzDcRDg9L9W6o
	2ZmRBHEeihNS05KgO1L9QWQlAmiumL6fziRqtilHkFExxMyxQB8392/N
X-Gm-Gg: Acq92OGjJeG7njFSt3soO8ljfSIOQbceHabbaR1tNHlh/NwrRT5LHUnk/nHW6nFcdTk
	WpVLUlauGoVtVPfseM3mawzjZ7k/NqROlqjpdlkdR7rDw0bw18gwEUeLlJBvf9+iAXEYsWfM3f5
	XkKM5nSDIjBX9TYEH75sNjEJOrNebE0ixdFXywgWKWTXw8JY9qz4WuZrctEsN5Re4Xyz5nKmmWx
	Tml6nGny5+Cj+TD49RMd0PUTtQwap280c9bQA4+Q2oEZWv4rkInD2k49uvJQSu3dgcpKzf2dqj9
	3jGPXaNmIdp3Jdy6QKclU0meDB08d7FZc4kALvrJv/cKN3spSG3yrBA63wiVzi0lK62Rnm354n7
	T8HYr4b8l4g5pQ+FSWnsWjaNBauGTlwkrldqtvRN/khy6lsn4Z4Nwow2CxpbaVytqEHfzj/HpWs
	YRXSyFn6lN99CIk0liaKza2yimGeO62uiqKabktRyZDlXjkvE4kW3ukwwJtOwPR2qJPA==
X-Received: by 2002:a05:7022:4a9:b0:12d:de3e:be88 with SMTP id a92af1059eb24-131a69f2f19mr8868177c88.36.1778400659598;
        Sun, 10 May 2026 01:10:59 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-132787673ffsm12053688c88.15.2026.05.10.01.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:10:59 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] staging: iio: addac: adt7316: document SPI interface switching sequence
Date: Sun, 10 May 2026 08:10:41 +0000
Message-Id: <20260510081041.85880-1-dennylin0707@gmail.com>
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
Such errors are expected and are ignored.

Add a comment to clarify this behavior.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Add datasheet reference
- Add TL;DR note

 drivers/staging/iio/addac/adt7316-spi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index f91325d11394..980532b7fa1e 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -106,7 +106,17 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 		return -EINVAL;
 	}
 
-	/* switch from default I2C protocol to SPI protocol */
+	/*
+	 * The device powers up in I2C mode. Switching to SPI mode
+	 * requires sending a sequence of SPI writes as described in
+	 * the datasheet ("Serial Interface Selection" section).
+	 *
+	 * During this sequence, the device may still be in I2C mode,
+	 * so SPI transactions may not be recognized and can fail.
+	 * Such errors are expected and are ignored.
+	 *
+	 * TL;DR: Do not change this!
+	 */
 	adt7316_spi_write(spi_dev, 0, 0);
 	adt7316_spi_write(spi_dev, 0, 0);
 	adt7316_spi_write(spi_dev, 0, 0);
-- 
2.34.1

