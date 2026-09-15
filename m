Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B733C7DE8
	for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459205; cv=none; b=LeERUY6WtkSFQ7pN+9KACGFhLezuuodKwfnkcClMj/BoUHvC+YYHIAgsY38u4//5sOIA5Fz+bL5+Jhw05+QaJIwsDuhpwRwC8z/XZ89robWi1bkK8UkKNerl2XEhD/+jqf2G276QGEmOH4XO3nDx3TyBMTeMfxintG/bxFS2r00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459205; c=relaxed/simple;
	bh=GILNLQIt4Kvkzuaw/uizZLn8SlGgfvSI7pdRyWR4a7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9F35MvZDh3gu/LJ7egCO7tuXVLw5VS9jFqa0yPMT6QrfdpE5B7MK03qkoHpmec/Yh0xw8Yqx0VFde73w5XLLQEMaiIQD0LZ1WfRjXyIsi0MNJPJ+LRyso1qmJA4BHoQsIHBrgweavfvO9I9KiD5VAXkhljIGo9FEYvzpKdrIhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+n0RPvS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+n0RPvS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so7874f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Sep 2026 01:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459201; x=1790064001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lHkGbv3xQAD2AcFEaHFNC5cNK+7NTF1uSPhL3tTLDI=;
        b=a+n0RPvSeNHomXpxc9B8Js+1uZqR20JxcPp3z4QD6I702lsNxZkVa9ux80PIXkWv1l
         yvu9JBYvV80/Gt5ONChOlR0qDhY+1WRuO/MKT2Om6erF/WiNAeCiGjgEDyB81V/RXoOU
         692HaD9054jVhoolvHD/3tsrUa28sQQBSe2wTu8WmvQGmehHq3bqpwHhj887VKUq4CDX
         /p1qJWXlFrFbjDmht0SAGdXCShmQ16tTyFkAbcUuH3/Hs3qQPz3BOl9iNSWeaA1OQkX/
         U82Mv73VW7yFqtklGH/JRbFrxxY3dAaZjng0O8cQusknutUyGVM8BqJ+6CyIGYz9E9/S
         czig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459201; x=1790064001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lHkGbv3xQAD2AcFEaHFNC5cNK+7NTF1uSPhL3tTLDI=;
        b=w2n3TId8hnypXnhd/8bgd+wH3SbwdqK0N6QCz9je5V17R8UDRlIi3vwyQX6gez/j+f
         RJ8XUIxcG0Dw7NHLPT1jZ9BslSeu1qnxduT9anzYWbsA7SECdKaPEY3pZj3RzZxhppFu
         2OdmXsFdEy9dez5PkqSVNotN91Bn0Hv0We+7CEJRFsBONcHlqzTj4Gg+wRH0W+V+wYqs
         0q7jGwi5oCccibW7YfAY0BDTl2FcPhIL+8owAyvtDEsKIKtUXKmjvHqxCTDTMTEH5L/2
         XbtnH6Ude9EIcaBceNtxghxKqSUIx1bc6UyOJPYQoWSCHZ+MiFy3xRx8IufHOM0wRNrU
         /3yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfZrHD6BUufAsuRPoZEw0hc8ReZnHV4MKTkXczLLt6hl7v+kBU2iLt9XpLWtpCdL0xOSZsPDnWG8rvXb2I@lists.linux.dev
X-Gm-Message-State: AFuF++l4XP2aAj+ukmEfGXHmvRVxe1ot70/AsEgLDbAubAofIIU7GQ9X
	xMihzFzcTBudA0LDje3UAd5lQg7so/9X8l8AxS6tru8UAsa+u+IWK0Tt
X-Gm-Gg: AYBFou3/fRZQYtpTlrq+4CCjXBk90gwDIZSTB5GEOOyvbqLJ2uWHXWrNaoShSrCVoa2
	UDOmFEiBdAR0V3VV4WuqtG/+ZXl/iJ6zORIVlFRgVwqQhw/9X8xNis1BJA0UMfqSWRu4BkbF60c
	1zHVnr7f1skSQRwe27tb0l8+1m5mY40e2QJXxmI1YIiOxOb95FuTxaC5UZmIGzZrqNYMP0wJklW
	m4U0OsLAAIrF4QXGLSBKQl7pNwzSu1MqPGluT5sNH4ZYtDtOkEgPxx6wsnwhmfoG1ieTH2t61bu
	dHhMknuJRcJt9GSl8MQhOUg8TctDhMs5xuDwrFbcN+LcEPIx7bNLumQG4BGbtXazAbcHEHzXXTS
	ASfT0p16BtzWofV0ons2SBLXFgRrBkmyhQRszXgJwlf7vC4f/EEQ7AUJB6xESAs1Q7P2ujFVjzt
	eDZPz9B8zzvLUIk98QR+bz2y4ZwkBBgF9IwPAA4r2mJo8+fALgfpAJTkDPCQq4igacGfwAihQKt
	81igMousIbNlsq/euQ=
X-Received: by 2002:a05:600c:4f4b:b0:49e:70b2:66ab with SMTP id 5b1f17b1804b1-49e82176603mr1629885e9.0.1789459200433;
        Tue, 15 Sep 2026 01:00:00 -0700 (PDT)
Received: from fedora ([154.182.99.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm64112155e9.15.2026.09.15.00.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:00:00 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v7 0/3] staging: iio: adc: ad7816: Fix SPI operations race condition and DMA safety
Date: Tue, 15 Sep 2026 10:59:36 +0300
Message-ID: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses separate issues in the ad7816 driver regarding
race conditions and DMA safety across all SPI operations.

Changes in v7:

    Patch 2: Moved the mutex to the top of the ad7816_chip_info struct
    (right after the pointers) to prevent struct padding/holes, as
    pointed out by Andy Shevchenko. Also expanded the mutex to serialize
    ad7816_spi_write() to prevent race conditions.

    Patch 3: Dropped the dedicated rx_buf. Switched all spi_write() and
    spi_read() calls to use spi_write_then_read(..., NULL, 0) to safely
    handle DMA using an internal bounce buffer, avoiding cacheline sharing,
    as guided by Jonathan Cameron.

Changes in v6:

    Separated the alphabetical sorting of include headers into a dedicated
    precursor patch (Patch 1).

    Kept the mutex addition strictly focused on serializing the read
    operations without modifying the sizeof() argument (Patch 2).

    Moved the sizeof() argument fix to the DMA-safe buffer patch where
    it logically belongs (Patch 3).

Changes in v5:

    Split the changes into separate patches for bisectability.

    Replaced stack buffer with a dedicated rx_buf aligned with
    IIO_DMA_MINALIGN.

Abdelnasser Hussein (3):
  staging: iio: adc: ad7816: Sort headers alphabetically
  staging: iio: adc: ad7816: Serialize SPI operations
  staging: iio: adc: ad7816: Fix DMA safety issues in SPI transfers

 drivers/staging/iio/adc/ad7816.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

-- 
2.54.0

