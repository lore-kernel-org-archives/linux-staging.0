Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5833C257AFA
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151838; cv=none; b=nOklK7kmwaIU1YSGhR49B9sOUbbd2fcn21J+PHnlyjaWwtWb77wgjxrSUu87AcXtiFbDKH8IWo5gz/2J4EGG/hLQ1ItQ2R24NOhJY3s7av5aaXh4/SaBGZTh4/o0jspZ0LGEdHN5IetlCK/OljHMTE+0c0D1JnNrBR5nZ/euNoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151838; c=relaxed/simple;
	bh=PXVgHVPYegdRX7cYC838pfew04kJcnGdwL8MrqFnLUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pc07L8cchwQchboRb4SQp0lGIOBO++OgXUP/WiSLGP3Ubm+5u/RlUYWXNh8aICpHvFIkR80soO23w65f9uynkhQ6OKg2DCWDmGMRhLDCmcxjfPJQoJgBhLIdZnz9Fq4y0ZYFL8q70zSHyKj6+7J33e/bze2TJ0w5h5IAM5KmToU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=dDA69MfG; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="dDA69MfG"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736c277331eso114675b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151834; x=1744756634; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5psd4uyYELxSqHEi4JcOM6XflshtV89daX4C/MP4ds=;
        b=dDA69MfGrPUhWnh+tGz+//Yin7y6W9x4m0wRAjgSbEoovII/2IyAzWqg2eZPbOQwa0
         u7YpNxh+6D6BanMf9DFD1dmkZtKdHXAvJU3fA6cIBWGYGaw6RiE4zZk2rMcQ1i5Ag93W
         1Wx1uZzSqKCZCjnmFd94F2Gv1OBrJWRR+wUjDddVh888T/f6u+7/X0wp+fmiKbp5XFyS
         M/DcAus99lt6uEekUPUeJic6U2c7ca0FqthysPF12TOFUBBULfLU+82n9SWcQ7fy9BQi
         C3IZEHw1ZXJcloRit4sd6feecCydKXT72wv1ftEs36NO4FLnh8LHBoToTe/C4qdgKavG
         9JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151834; x=1744756634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5psd4uyYELxSqHEi4JcOM6XflshtV89daX4C/MP4ds=;
        b=eslMby1yOZFftou0fHnY1EKoWdAOH08pU1KaOCbueDBptrEgDRdiKkcBtI2RfN1p4F
         j8tnxNFRCxzdqIMXAKd8BNnYxBhf6z2q+twBLIeyMmQrVc/iVl6oDDmQ39H9O1/n6wG8
         OtGnpAVayEy3VUbBw3grMxDyedHZlWjjEC8GtAAuTV1j71YIy3oQYw4f1/5BtgL2GpvE
         DUXpaH1IivL/3NvOJq7Nt2UPQemTJCv9sxQs75AifudHruc5u3j/OAmULsoOBSi8UyBj
         VA1R3UiEPaOm0FmMQQhS3Nlt0tF2KT0DzuYjedTpjUlsMzeUioAgYoVT65oQZ5l/tuXl
         DMDA==
X-Forwarded-Encrypted: i=1; AJvYcCV59/XL66rqpaWwFD9ZPcNHBMVI7bvlvzxsXgNhAOSFnAHsD8zk7EB+6q+MrCBrIkTOAIEva9CSC418jH+K@lists.linux.dev
X-Gm-Message-State: AOJu0YzMjoG6RNSy1WQd0blfbwBvPTZIipaNfh5yWC/8rMu2T4Q/qSS0
	tWRBoMS89+rp9mXbl922jTcDocdak7i8xRrAk1LLydneESAcTqAZY/MX/YrV9A==
X-Gm-Gg: ASbGncvSFIFW4RseeoEzyDLKK9tulTOG4PVW3xstmqHavRJG7LmGfw0bgB7HGFwjJsw
	gbmh+jDxlifg9S7PvvozGT5B9jPlk38S1dyUDKi1UYRnny2yW3UTZsGVZ+mj2iBUcpphjc1KL/9
	5D89QM9M2OtFafm8jSNqUKUQTgvd3Hll4bES/I6eavwnTnt5AueMFbrN06ZVi+knPb9k887jGRJ
	LbW2rVLOiM7Nt2xdXYA0X0hxYiLvz8ZStyHM9eM/nqk41SPr1SeJ4m6Ib0uqEdLsTbVjpu5gFS/
	ZM1aRoO88WIGQV8yiEeSeLDLit6Klv/v3IaWBdMBiXI2Ve5Lvmli2I2LRupOqiij2XSXurTC2fd
	9/1LkkepRJZ46c+uuEcW9
X-Google-Smtp-Source: AGHT+IH5nHu6Q9oriNtPHT59BEfzZVatsCeFr84A/ulxraBO/exrM7YRAFjTVfIAYkkRu95gUGqlrA==
X-Received: by 2002:a05:6a21:910c:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-20158d9ae12mr1016266637.3.1744151834543;
        Tue, 08 Apr 2025 15:37:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc34eefesm9539344a12.36.2025.04.08.15.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 10/18] staging: gpib: hp_82335: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:50 +0000
Message-ID: <20250408223659.187109-11-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 1a93a456f7bd..32b3aba673d9 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -24,7 +24,7 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for HP 82335 interface cards");
 
-static int hp82335_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int hp82335_attach(struct gpib_board *board, const struct gpib_board_config *config);
 static void hp82335_detach(struct gpib_board *board);
 static irqreturn_t hp82335_interrupt(int irq, void *arg);
 
@@ -243,7 +243,7 @@ static void hp82335_clear_interrupt(struct hp82335_priv *hp_priv)
 	writeb(0, tms_priv->mmiobase + HPREG_INTR_CLEAR);
 }
 
-static int hp82335_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int hp82335_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct hp82335_priv *hp_priv;
 	struct tms9914_priv *tms_priv;
-- 
2.43.0

