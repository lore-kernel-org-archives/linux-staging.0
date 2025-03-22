Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C62E338A
	for <linux-staging@lists.linux.dev>; Sat, 22 Mar 2025 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742661229; cv=none; b=pX/OOGiKhUlWq7uFb44JqPjIl40sLcyeGox4mG3yaJeNwEe/jzq4yOykL9QtWl7FfYMP6A3PqzgD9GJAWIJefShFeiJZ/cXD6ryd9/ayGPP7t9YJFiVoS4DVa/cddQJNwmJcL2GwW3y6TWb15oUA00z6q9CBIuMTYdSBpkHlB/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742661229; c=relaxed/simple;
	bh=epmdvcBgUanvI6wdPZu88ilV2evqCFFzXuIN1GcCsmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtlIHZOeqdab6NWVEBFhAHzuCLKJqCvJlF1CkKLIiIPNuslboL7RlSR82b/NLDuXdDFz89CR0T11SafqaDsPIwKt52w+hmt0IAfLgSZrwLwTdfCXEcojMyqKRp9rURKknhaFhPyJFd0BMdhmWV983q7qqJeZeojJOZW/lODQxnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFtJwVkv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFtJwVkv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225b5448519so59250445ad.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Mar 2025 09:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742661227; x=1743266027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lxd+tOwn8e/o7grBip1jXB4LMTIMBCnYXyU0gFmpfs=;
        b=VFtJwVkvJskESgidqbfLFlS66Dgd+l7gCQl8bCjqSYKeNGef5mFngPOS3VjxLo6jMM
         wTpGYNdoUcynxDLGDXQgZAWHWL7/4aX+wFyQo4n6PanHMnA/gRws6hSes1yMrZ27z73v
         wDBYBrKbYvveVQ5HxvZzGR8U/K5kyvrdA2fuDs+MmUXwgX+7n9trVpfR3wpYd9H8aBF8
         3IKEgRFn023iaMMUlgyXU9QGqeJF4yBqnph8plOxvibv2GB1EH+M9CQTGjAPr2EN/EfT
         9/AfeyqbUk6xSO6tpWe0w5CRFL8nOMdlNuVpjazlOFJWFuMt6MLZq45mxSlzxnWmQTge
         UaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742661227; x=1743266027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lxd+tOwn8e/o7grBip1jXB4LMTIMBCnYXyU0gFmpfs=;
        b=cTROL0EBI9sELlW0XaEnUEWVMGGPGOJVtWgkFPGh5mN2KuwIXLA9azVmJICtPV/PH9
         0CtMrhLQ4TOG1zs7J94oWR9gfynALmPvpofWCBOxm3WpiTvohW2JZtCpXQRcf7whKnMt
         WajxRtW4llZz2s2zdJjTu+aSFPdY9Yjya5hgaApdAo89hoP+sb1q0lKKES5ZOnu3LS+D
         6vg26UPI3NQZbCQhtr0IsxdAiybz7XvMpNLXxKhE8Ol7e5m1/RYHCksyqI7LVZnFnBVU
         ZoB/xaU3wxWWunmZQ6xy1JQgYVf+DaqXXvOBKyBcEQdXiinyeTWcZg8aK3EFKZhzaDNZ
         U40g==
X-Forwarded-Encrypted: i=1; AJvYcCWC7Y27kSCd6PcusbnY9lEGILT03+wzolN6mvWG729qw5qIbCeQDpWNJDrhqVpOktIgl2RoVFGruDe7e52R@lists.linux.dev
X-Gm-Message-State: AOJu0YyeHhe75R9Cf3v9O0A4itsa6uKq4QRJnaORw8SE0OBtY/gKb8Vd
	zCdMOXlEa3sS0JaueTBsoMstyx40G3W5DKH71qKdDeWAHHkXmw+D
X-Gm-Gg: ASbGncvMLGvtNs14rWyOX9BCAnTMp2B6brx++7rzayfixjOb/zAh5g4JX149XCyAEkP
	nEAOZC3+fhb31gyilIuFrpJfLJhIEHeTXIXznwxoQ6A4zPniZ5/FgH6oC3Q9kiFk3T2G+QUFiLP
	Ed6J/QNkiewJoXZmka/YY5yOgzRiDQju43cOpiXU782baTe1riN1C0ppsAiRU17+/NljdOKkJdE
	sQq2YjRsZ0ZsDUrfGLOnJMtRkNyTSUBu1WXaOgulTDIyc94mVWdbp/i0gC2wJF5SwBImsx1yD7r
	l/6XxZaljPmKF/KZP1w4Gw+KRD+x/Uj//2pVB5V08kY=
X-Google-Smtp-Source: AGHT+IH4CHkfGbiwWX4r0WBCSBmcdbIgUSaaT+sHhmfhWqHiDv/CxFN/ZQPy1h/6Ri/ibAktf50eig==
X-Received: by 2002:a05:6a00:3927:b0:736:ab1e:7775 with SMTP id d2e1a72fcca58-7390562ad7fmr13594642b3a.0.1742661226828;
        Sat, 22 Mar 2025 09:33:46 -0700 (PDT)
Received: from fedora.. ([2409:40f3:20df:7495:662f:ad70:6f52:57ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906159fa1sm4213634b3a.151.2025.03.22.09.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 09:33:46 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	marcelo.schmitt1@gmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH v2] iio: frequency: ad9832: devicetree probing support
Date: Sat, 22 Mar 2025 21:58:11 +0530
Message-ID: <20250322163211.253009-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct for device match of_device_id to avoid relying on fallback
mechanisms, which could lead to false matches against other AD9832 variants
in the future.

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 v1->v2:
 - updated commit message to be more informative
 - minor changes to code formatting
 drivers/staging/iio/frequency/ad9832.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index 140ee4f9c137..7d4f655f6df1 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -431,6 +431,13 @@ static int ad9832_probe(struct spi_device *spi)
 	return devm_iio_device_register(&spi->dev, indio_dev);
 }
 
+static const struct of_device_id ad9832_of_match[] = {
+	{ .compatible = "adi,ad9832" },
+	{ .compatible = "adi,ad9835" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ad9832_of_match);
+
 static const struct spi_device_id ad9832_id[] = {
 	{"ad9832", 0},
 	{"ad9835", 0},
@@ -441,6 +448,7 @@ MODULE_DEVICE_TABLE(spi, ad9832_id);
 static struct spi_driver ad9832_driver = {
 	.driver = {
 		.name	= "ad9832",
+		.of_match_table = ad9832_of_match,
 	},
 	.probe		= ad9832_probe,
 	.id_table	= ad9832_id,
-- 
2.48.1

