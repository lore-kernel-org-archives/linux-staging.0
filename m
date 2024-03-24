Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F5175AD
	for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711272736; cv=none; b=el5/KShhYjKxQP/FlJmjJaLGZgZnttBht7XNngZ6Ny7ft3Ok6aC6LVYCalyy94yOQ84GlKeFrzTsFAyIm0PGwWytAPvixBSsg8YFjFahBCwwoPCStYfpBiUsrlsBcEliVJVmU+Ide7IB4q3ImayGJ+m7mQ0Lo1gWKLuju6ezAPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711272736; c=relaxed/simple;
	bh=u5pB1sDbN4TWFvIqouYPN1Z7rf5l2iCYMwm/u0Zd89Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HizZMB8eP9VNBnxNL+TEqBYU5VU0yDS5s9lge50JKQ1AdFQDSEhJ9Vev10vfWJe0EcNnpuXXty0cjvkusW4+mAiYAppy3rQMR+kKTXN6fs8VmNvPPkFaNZyxG04VNZ0SDNg3vlBbaBzGAD0DfPu1stl2bYDUiA1sijGh3wqPOvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIjLNxPe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIjLNxPe"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34175878e3cso2353143f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711272733; x=1711877533; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LopSDTAPBYKt0PL+7kumsFXpTtF7FOQgTtXMVa1BlOc=;
        b=fIjLNxPet+uy+BegEGTuyJxuV+faDnC3Yl2LgiDhfglA2Xxy6wUT/74khummBz62XW
         DSx3IFfJb6ZDx4KwIVlkdSRiU6dmQsE5/PGxG5Sue3gCunmEipGh9p1Jng1xh18CUapu
         UduVyYaRrQmaKxjkqMiZqORC85SwRLf6shLgu/ncFD+Zfmw6OfaEFUXzXJH+Xg5Vx1qQ
         mM1M70O94u9lJn7L9bEc222UrF3NNQyQF31akqif15ntpT9krKrsWf2ncV0DeVfaY+EY
         TcsDL94vBzVeBTk9gcR2lTsuAQJNE3ola1nOSsxJWbAj1zuQ5LCkA32F3v6VgCnQV8AD
         Rmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711272733; x=1711877533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LopSDTAPBYKt0PL+7kumsFXpTtF7FOQgTtXMVa1BlOc=;
        b=o+6fo2A4dCFjaUN3TYUZcAslQ952ENbtqazkdYrblxlzdUfHwuO03x81Ol85qm+3l/
         JuYkFJUycLOZ7rLbaSshd/v2S/52xUArmOMF0btNp1hX4KntSGnfswVxA0ZB7UsEWRk/
         ech36f23ufoCGoLZdczD+FHEPbq05FtU+wK+Bmj3yBhZDsBR7m3gGx7itt0k3e/QGZI3
         XR7V/6Piwv+T/aIYzJ2lwNSLf+KAO5EwekEh3RJJ9/T88HEm5fQEqtHTFtiDnPSgVRnb
         pf9fwHxHiL8dqSGgoykSm+5Nur3blRee+nTV717JTVmcjQNDDtmujZAesV9mUx590d0w
         T6eg==
X-Gm-Message-State: AOJu0YwQ6Ly647tPnVvq6o140+GYaZmVjtR/KemEYPZT/ko3ioRHzGJT
	+oWvm5qzeWa749txcfOTgiS4Nwuq3clZR/vtcXH/IwdVk8liOM5d
X-Google-Smtp-Source: AGHT+IF91Uh6i88LrUzD+gi+FwyOQaAtfAZXHw4cg56yiqD7KbRaau00hOa/ZC4pWwll5Q63J9ScPg==
X-Received: by 2002:adf:e885:0:b0:33e:781e:da57 with SMTP id d5-20020adfe885000000b0033e781eda57mr2494177wrm.53.1711272733665;
        Sun, 24 Mar 2024 02:32:13 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:42b5:8c78:fc9d:7600])
        by smtp.gmail.com with ESMTPSA id ay9-20020a5d6f09000000b0033b87c2725csm6490711wrb.104.2024.03.24.02.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 02:32:13 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: pi433: Make use of spi mode macro instead of magic number.
Date: Sun, 24 Mar 2024 11:32:01 +0200
Message-Id: <20240324093201.793485-4-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240324093201.793485-1-ikobh7@gmail.com>
References: <20240324093201.793485-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use SPI_MODE_0 to setup spi mode.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 9fc93fa454b1..2a22342eda69 100644
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

