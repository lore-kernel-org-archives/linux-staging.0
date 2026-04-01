Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E57E47279B
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060753; cv=none; b=KBHJAfopdP//91gr9PWU5MQAzmLSoQEx66avBPbLFSyJxRlfhzUDEVQoFvcLNVrmKh/pWRCbZJkzVOlormyaMTZycu6TrfIFgvPUjkIs4P0peCFDCYjISByRH//3floI0BLD24LQAgAAn5V6WQzI9orhQcV3D18XgewbSTQZ5qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060753; c=relaxed/simple;
	bh=8dXLQMW8sVIcuzDqL6BA+V3ONKfbGvxIejWx1vqWCqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ebmsk6e0uNTqglpH9/I5mJHx+ZtxLSzUtNKsM4sgCKIvpvf6J8RjUuFZeJ+kVdIX/JE4QoBK50ie+CUEeTqp9Q80S1cSrwkc+jraHdJFAhuXNe3HNYH4AVQKfcmJ1EheaW4HXcS6ctlroXgNXeKwvfkCL+2yHHZvNalSTk2VGQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai; spf=none smtp.mailfrom=mirrorstack.ai; dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b=mfcMpSP8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b="mfcMpSP8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35d9749c26dso3439573a91.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 09:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mirrorstack-ai.20230601.gappssmtp.com; s=20230601; t=1775060746; x=1775665546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYbjRDMYvPXm7PwKTidWBLBGSVwyNzNOx/MgyeEmpgE=;
        b=mfcMpSP8eRAAutlW3WTVET0kF+QBL8jazhZnoK9MJfalHnAECmOQNsbd7s4pzRwDSm
         jE+bxt+tbV/CDcUIKkgYiRyko6t1185OanXd8zLeUSeKgY9eGqL8ASO5we8XHr84Rb7x
         xaRWpvuA5w7v+LcpV6hTIfyzq4RY7biisQhV9u2dXvjn8zPROYFqNDvYU8H+STOAVcK1
         vD32PyX3gFvdQWbON/dMA1e9TayxlAbzOoHy9bQxWoO6mGjs2JcEEyMpuNCsipwiDR2+
         hSamXdXQBV0wZcU+omDy854Q1QuZZSKXG0EFQCh/Wb8pMP40HjRd1PzyjBUgvnI7LCtk
         wkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060746; x=1775665546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYbjRDMYvPXm7PwKTidWBLBGSVwyNzNOx/MgyeEmpgE=;
        b=QhPyUoFzq7nXWOZb/ye4Gnt6JnAPw/fZe/vAcSSi61ekhDj6QfOFnTRdJt80NtIyzJ
         tc5Yoz3qs0hxAHNYNiQ+sP3MHwqiLkLTnEHLIprFWX+5fkAJNEGPa7WOntdGm0PKJou6
         McGG0IgECNYlSnc1XMIvt73iiSzz88NgrDPaIK8OoEfhL/ZsJ0WVteLTGrSZ69/ZsuRM
         ScLJnX7MEv2nERKH043TQTnNvPuFtDSpvTDXhxIk1F/du6JKcrwwe7ckGkJIvXmV2P7B
         6oWrxZ67yoPk2MywNaOlb5KV1b0uJz9kuQyNG1m9Sx1BZr0jyAwvlBsapXboXqNABe01
         ZAkw==
X-Forwarded-Encrypted: i=1; AJvYcCUXNfiPMO+wIDE8pMAwrQPDYoOpbMA8utfdqqZKaot8UyVQvxNBA7BLQKQUtkFCc7YV35PRdwOFUqtEtdD0@lists.linux.dev
X-Gm-Message-State: AOJu0YxuBU7gFMEpzKDtmchkyVlO7+bnIGVGUgKe22xrGoYLnDUSQJdJ
	jSsrIpChzK+H44oYCFNpldlai6vtLigqANMbs9M/WqTL6dEjjvjYn3dbGDzB9cn3tda5
X-Gm-Gg: ATEYQzwR4MZxp5SViKEMDaJk5FzgGgdFLZUM4g4366aLZa44K++4mrUAQiYyAyJaXeH
	DKcVBjT2m7iBX4//qyWHbW1KRdZuGpgf1M5bzUryEOEpywtAHGg5hC5wHVaY03on+1jOZzEuPH9
	uRAwCboWY5/QET7D1yolhmpDMfKLxm6ayd0rpwo74VTPE6Nq+zeDALB0EA2J9RcZic91udddzRo
	O1yzB8z5uEfFxNdplS8TfgwyIHB0lxKzq3j/dA5iIZEXGgBcZW8/bqHVpUMQ6C0oydxSVTFUE3V
	knboqx9sLla009qHNFd6nsOX3bTLZUc1PBoQNT+ZoPPsGhqN8sHaeegowSV2J6nGVPcQhd/zZFZ
	6dFxGbPz61+4KxcGpWGk6CHnOvjyxEJKTdZJJKr0b0ncMZBEQ2n4plAMuj2H+z8LJ6NbDcfGJm/
	0xwxgWhfKfG4p8RmzqESZBs0ROUo3A6PzFCeiS5PQujC4GmEcUZYQaIcql86axUXa3U9AO6ZvLL
	WioEmROj7RTmtKX/U1LG6aDN+L639/n5PvKCKb72g==
X-Received: by 2002:a17:90b:5107:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35dc6e77e5dmr3618101a91.1.1775060746179;
        Wed, 01 Apr 2026 09:25:46 -0700 (PDT)
Received: from ip-172-26-8-186.ap-northeast-1.compute.internal ([2406:da14:e8:bc00:e546:17ee:7142:6d05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34eesm281813a91.2.2026.04.01.09.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:25:45 -0700 (PDT)
From: Sheng Kun Chang <nothingchang@mirrorstack.ai>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng Kun Chang <nothingchang@mirrorstack.ai>
Subject: [PATCH 2/3] staging: iio: adis16203: align MODULE_LICENSE with SPDX identifier
Date: Wed,  1 Apr 2026 16:24:56 +0000
Message-ID: <20260401162458.88110-3-nothingchang@mirrorstack.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
References: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPDX license identifier is GPL-2.0+ (GPL v2 or later) but
MODULE_LICENSE was set to "GPL v2" which indicates GPL v2 only.
Change to "GPL" which means GPL v2 or later, matching the SPDX
header.

Signed-off-by: Sheng Kun Chang <nothingchang@mirrorstack.ai>
---
 drivers/staging/iio/accel/adis16203.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index 830ff38fd..0ea127c9c 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -310,6 +310,6 @@ module_spi_driver(adis16203_driver);
 
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16203 Programmable 360 Degrees Inclinometer");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("spi:adis16203");
 MODULE_IMPORT_NS("IIO_ADISLIB");
-- 
2.43.0

