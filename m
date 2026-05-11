Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8739443
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 02:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778466715; cv=none; b=tyG1wwbhdtxD486+MUQZ4BNUxf41VqnRAZvQq6oQTkQ3c7iZt8zeLXVPyRz0shEglVaNBCC/g/T8GoKhcsr0P5AZdfUVvg8hoiCXBrn2MTl/doQjScr+bYzeVMy5hvoZ2O34OSpxk+lU6nXgAi91Umt5xpMNmslTa3jEJCJp+Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778466715; c=relaxed/simple;
	bh=vb7R1yQybfDBF115WukukZkLEfPQzU4PLJn5yOLJdYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VnDKzMD0Xet/ebTsU6Dk13ygpTvshXowYST9NT5Ht0v7Qen/qhAUiiAVWNbRt984T+RCKmn83dIx5FFl0IuJLENlqISJPDEXU8nF0/tQgcClpCPmhrXeded/C6uHYoMk54w2f+cym3Tf7oprEdTBxUU6WnxSy3wQdZNyHOobSQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTTOwnAd; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTTOwnAd"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12c8f9846c8so5313567c88.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 19:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778466714; x=1779071514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5dJJxDTuelTtKgmCQMBBHtFYQaNXdMMZt2BZbSIE3c=;
        b=sTTOwnAdxS1o1SmFFOeon5lfiqoKJts9Zv44deUej8C9ZELGCzQZSZYtV22jwpQnOH
         KpD8GHjl9kQJGuVirKj/6JrFMjLwpDwesnLVFxHnLOBgtAOJkGDrnkHhOFzCgdNxUXPC
         9uPUzchCrNivaHm2vbYps+4iXHd5TrzhAFrKE0YurvayzbArzdxigcl3/5IYOJx4AyCV
         JfUP7Es5tsYeFLkQN4T9gDpwT62FbbV4Ev0iWSVF6w5bkhiAnlKHYI2uqSe+lm0O4Oxd
         lF7zufBk2AO/vKYnxi4cAcI7ZO46//hLMBIXZyYUqj5pUSmp4IWIqvCoP3INXRmA0VHs
         waAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778466714; x=1779071514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5dJJxDTuelTtKgmCQMBBHtFYQaNXdMMZt2BZbSIE3c=;
        b=p33mEWdYYT8sOXd64zAro2Qy0ET5aObLxHjm5hth2xYH4bpAr20xDZOJYsgsMk0I5X
         53ZZ0MNgrUxFY5OD4mhDPAr7lgpmC7TsLFLxZWjizFoKl1+AI6N6s2OZ8BYbR31yzcRv
         jCXBwN2CKKEDauSiqG9TvEFq/K/rH+cAwn8kyqAeb+GGbH8KX1YkpMd+XiEc5ekXpFJq
         bfPcXI4+mKUUENC6+SmCA3pRR/ts2RnDGsGuVi3bltWVI2Wj8th4UvD0EMHw0P+Rk9DR
         mQlwjJbcSdIdUz1JO+VcgySxx8GFRNoHmWeKMgle3xOncjcJtIQwt9R+qAAXSm4WM798
         1R9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+jie4lE1VJuG6I8RoBTgEaPNzd5UmEhOmVkCLUifzdLFKdsKNd6wCTA0Gkxr66/AaAYOKRnR/si4rhLPJz@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa+tep7KkBCFGwMuoqDf6IjicuILe8x+TLx58rdJ2+8rvf3RZH
	Fgq217m8m6D9quESEMQhLEDzPChWvhjZvHzDJdX8kTisDY7BLceVKAvf
X-Gm-Gg: Acq92OGHqcPC+YdXz2f8emg1KtCB7AmRQwAvOQMFUOuRdjhlqm1YVr7cfqLvasUmUwu
	8K5C2jf53Huh2stf8K8r/++9xlguT5XADKGzYIZcyfIoLggs8C+RZw2wZleAAR43ozoxrkqCf9k
	HzHhIsjBMBJUQRrbEB7qgMISMHjJKeFM7lVrkyEaod5lttUiChh4LyG8/thmSEK/fziZ4/CSKUn
	2xMX9zEPt3xtGsi4B82zIGD59QDq+OvMrzBAoUMMnag6yWx04Q8wxQZPtX4zboeyf2q81cepkc/
	iBzAhCln4RV//OubYOk0gWIPR0JzG3vsLKFFFTJCGpYNxOIXwhpFB68gZ7iF0bl4U78oZCa7h4Z
	C9h92n4kkpAoA+BDV1R2IR245Tw9Zc18DZBNtK/5r0oK+WBDZtOhj3gZ/1Qw39p1mZqWmJPNhC5
	pm2WHlQMeu3a9yll9BiQ6HykexEtG5b4etqoNJLwZT/9LU51OCC81OL4A=
X-Received: by 2002:a05:7022:672a:b0:128:bae0:e043 with SMTP id a92af1059eb24-1318eb4a66bmr10666104c88.31.1778466713575;
        Sun, 10 May 2026 19:31:53 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fd00sm15597932c88.8.2026.05.10.19.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 19:31:52 -0700 (PDT)
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
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3] staging: iio: addac: adt7316: document SPI interface switching sequence
Date: Mon, 11 May 2026 02:31:27 +0000
Message-Id: <20260511023127.86113-1-dennylin0707@gmail.com>
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

Datasheet: https://www.analog.com/en/products/adt7316.html
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v3:
- Add Datasheet tag
- Use datasheet name in code comment

Changes in v2:
- Add datasheet reference
- Add TL;DR note

 drivers/staging/iio/addac/adt7316-spi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index f91325d11394..bd92dcddfd91 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -106,7 +106,17 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 		return -EINVAL;
 	}
 
-	/* switch from default I2C protocol to SPI protocol */
+	/*
+	 * The device powers up in I2C mode. Switching to SPI mode
+	 * requires sending a sequence of SPI writes as described in
+	 * the datasheet "ADT7316/ADT7317/ADT7318", Rev. B.
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

