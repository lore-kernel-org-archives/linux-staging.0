Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A29023773
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521126; cv=none; b=jtBcmerzC9WSQoI6S3y7yGk6SSGO622Huo4+SZzeG1uw6oRgKjSlzacgkPvdUozV9f01pg0q8/c3uB2CGU0+WNN/W2NbTjaRUFEsUPXBh3sB4cscDySWrlZtQB1vkKEVH+G3jqByOdb0ujYZw9F+yDz+JWSTgauOSANXMsMB5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521126; c=relaxed/simple;
	bh=4Ya6dMmudtxYNTl823jMJouUofxDkL1bOiUAsKX9Kv8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FuAdt0RqA3e6lac3aJd5lfLWvtBfs1UAi27OnTUptTQYCBqtAEM8dyOoiK47CbGBNtv7zTqgSqVpd68UxO46JQ4/FJLbXySI9sa3bErHWtGYSBGDcauueLNySLoMqR6lMvHtWDFyGcXfyNFDFJrB+0tD5ekQwaiPErUQvWf7oMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBreUKoV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBreUKoV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4149319511fso2421685e9.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711521124; x=1712125924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXMHtvsJsvcQqDicqUMe4VBvDRS5p7vk0mv1oCDMNgk=;
        b=KBreUKoVkAgCBux8kYX9SZ+Xt+aVgpZyokhw52O/EDV2fbh2F5APxD4ejz7wji1BWV
         twUMbID+WcAJEKeH9rD3FYF8XRAs7CQFfNTP20wT3LoWA5wUFq3T49ENNJ5Kcv+J8aG4
         uejn2/uG1hapND+Pj6iSYBaWLzLSsLFMu5jY8XwDwuerAv4GMh5qRy8J1YWxiJ8MkNuO
         g/VYB09NuOALB7n98373xPhh3Hem2CrZTLUhXTY8+p5f291Ogj+0x2VEtfmVEu8JcLbq
         WhS6aW1d1Jl8wAfdngkmmrWQhwi/NYcweMRpVC2rjaPjmO2/OwYx/yOUTdTglpmLA3lE
         Jz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521124; x=1712125924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXMHtvsJsvcQqDicqUMe4VBvDRS5p7vk0mv1oCDMNgk=;
        b=rQrdPA6eClt2JEyGvvBsqJLmhvfxef9s2Q30eUvlzgWEE0WBicv0/HBpElJ/Ya/DJT
         +RLbR7SgipitwDARUsoHKxPFvTtgf5p21thxj1AySm/n+yYoAFeuSINDFs70UhxKYDS+
         Yz/hd6g6GYtYhSd3xQHz1eIqa1GiCNTuQwIqBZimzI0zAcd+BxgR5TPQJJlqlBjSp5gD
         lRPlHDa5g7K1vF44qnM9yHA1LXkyRLoWe01lajEaolZDdmIDoPGgCUN8jLlmC4yDt4Fe
         HcKiYll1pSCLPbDcnT6d/w0U1ql2zWRdh2pWwcbumS3kqt/AMJj579h0cueS/9kHzOUL
         H+eQ==
X-Gm-Message-State: AOJu0YzR3obo1IQq4odcsNN/AOVUYQ+GJ7mw57x27p0dso5OGMh38P1J
	pagQLYVHnnBNCPa0ezkZzIjlxt9Jf/R9wa86OEGy2gEaw1TxVrw4
X-Google-Smtp-Source: AGHT+IFpCD7tboYvNfb4MrBj3TBy+dSMMfHPuYZxT4EyTeiUHVl1fmgymSFndJwB+olMdfitoepI6Q==
X-Received: by 2002:a05:600c:3c99:b0:414:61d9:d1f5 with SMTP id bg25-20020a05600c3c9900b0041461d9d1f5mr3067760wmb.10.1711521123637;
        Tue, 26 Mar 2024 23:32:03 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:f38a:32d3:e6f6:959])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c139600b004148d7b889asm1121360wmf.8.2024.03.26.23.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:32:03 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: pi433: Make use of spi mode macro instead of magic number.
Date: Wed, 27 Mar 2024 08:31:56 +0200
Message-Id: <20240327063156.96307-4-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327063156.96307-1-ikobh7@gmail.com>
References: <20240327063156.96307-1-ikobh7@gmail.com>
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

