Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0030450F2
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 22:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774045471; cv=none; b=qubTgoTkmA+UapW5K0tc29+e3srjKTdSM9n2GMffUWEamy9xp5doFVxIBDXGmUTDd0CaRjZ0BqBwb8aLxlMnq+h05zJ/rjZfliXZBjNueIv488vnw0WwqgUE0370hTAD53agocK3hispwJpgnb+dfQ4PR91LxZTeBm6jqXuQQlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774045471; c=relaxed/simple;
	bh=bW5hXjc9OlxURFU4kk4Cob6ovzZ9WrBLweKyot0XKRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VFHsQuXE8w0RsHuGDkAyFELy1HZpac2mp0N/3vxBzn7tTuUPXWXJZDrF/nhnULlTUN3Je3p5cumv7KFJaruK6kP9hf+1k4e9YaIG0RwpHclVxBA8ZYSkwqTodZNZYPawaU+P5ReVXYHyxjHDNksVHloy7DHh2L+koljGfnJv3pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUmaf7nw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUmaf7nw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so18809175e9.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 15:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774045468; x=1774650268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tv0fn6kQsVTouvLE5GNhR8tGbxcquMyrqZ+KJnhTDe8=;
        b=gUmaf7nwXxG+yPPDrXYbjie5f7ZWiyci1P5XcfYNg+pVOOnCPSwdcQyS2Zy6RKO8AH
         yH1XToTcTc33c8Or9Zc7uyMnhPm+yvSXMFa6KDvoqenYgtnvRjkFBjAzfv1MmEDkytws
         7Prviyq5F+GQXv8aC2sPO1QXWAWAfo9IuMPKEYYaptwBCZSv9ac9rCaVnLOSY9Hh18LJ
         lw4+RXtww2wm98PeK7mEuGqmY3tz7TM4Jp0FF0r5AwdAGjcfBPXoq+dzXCmXBv4d3/r0
         iSC7vUqUepknOcjqikh9DgSSY/DJGTyQltPyzPm2g76ESrA7i7A5KyUvz9ATivUGI7Qd
         qs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774045468; x=1774650268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tv0fn6kQsVTouvLE5GNhR8tGbxcquMyrqZ+KJnhTDe8=;
        b=FOEe35FZdYlonXxT6r1uggtz0G2FjYLTDlR98+GBRj1Zc+a1trfy4p6zfJ3lSg92o7
         mwRUteNOuNig98PrGvgO4ucMaMdWpEM+7Q/QS4lOkDvSRa/Ulx27Uoy52A69lE2i8AvJ
         WDmCuEAz3CT6TqkPrxUEd+lhid7QkyjUQuGguueqKYvz5hIAE2fBHksl6dydcJxhMDyL
         vFkusEVf/ESz4cQCGXl8cU6kdYsDpeobZ0Oz3rjBpru1e7LpbwGnHMLP+7ILolxh6STX
         kIJHNFk3xrhLFz1XrdSqPATY9w/BxG+NM8pnim7rRjU/lypg4gKOW19ygjuMq2Zt+MrJ
         sFZA==
X-Forwarded-Encrypted: i=1; AJvYcCUJTKBFszmmod7oyPsTea+Ocvq0pDkis22IbaFXb/s0KkThM/MTVjKFimBop7sYGoCYXVFnzKOJ+rVIVq6G@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg/ntuDOyUZ7dJLkMmPZUCLQTjjqgXPobLp6iqAGaGwv2KfwYF
	/oQoIW0WNSyHs8Xb4j7Tckpi6umdEBY6o9ENWUH7DlGFcIC9KLPGYopR
X-Gm-Gg: ATEYQzxmmA55plB29cm8BwPn9QZaUhSV918w/IuXdmuD1stpzttKO1htgljhIoL5vyF
	s/+SBMmltUm82URRECWgL0786TfKYAib6Jr225LU+ZanmnUxZwuCw5R3u8YnqSW9U2TfCysbkCp
	1IkkLzd2+iAvf00x2DXvMAhd2Qw6OKGpDac57cw7r/+8ukNtVVfEMkkyumdLx2pGFvW4utMY3aO
	iHYxLHR1gnxWu62JutA2gijXeDVdUoEl9XV9MnN1Yl3SynrLonGj60ETgDJlK/YGnOHt83YOdr1
	rbnhQ6dIejbypb96EUm8HbMpYfvTz2SkpI3GL5vMvGkd1+O8urJtzV3jmEO6IjuhioT/InQX3RO
	fksvtjQzJxaPKfMGmv20aF9P1X5Rvg+ex/wyrENIfS26PPbsTxryqwUPuBO1ZklgoTXM4IfMj3G
	ItuKcO8amrDcCMg7kqZ36Qccv3cqvm4UpNJZiqArlE6GVKFWJ86Xkb3YRpyA==
X-Received: by 2002:a05:600c:a4a:b0:485:4eaf:eb14 with SMTP id 5b1f17b1804b1-486fee0fbf6mr60854665e9.21.1774045468001;
        Fri, 20 Mar 2026 15:24:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:6c9b:a000:bc11:6b0a:79ed:3d9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae016sm9290237f8f.4.2026.03.20.15.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 15:24:27 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: iio: replace sprintf() with sysfs_emit()
Date: Fri, 20 Mar 2026 22:24:21 +0000
Message-Id: <20260320222424.53294-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260319225719.73587-1-grondon@gmail.com>
References: <20260319225719.73587-1-grondon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining sprintf() calls with sysfs_emit() in sysfs
show functions across three staging IIO drivers: ad7816, ad5933, and
ad9834.

sysfs_emit() is the preferred API for sysfs callbacks as it is aware
of the PAGE_SIZE buffer limit. Build tested with gcc 13.3.

Changes since v1:
- ad5933: remove unnecessary (int) cast in ad5933_show_frequency()
  and use %llu format specifier for unsigned long long (Andy Shevchenko)
- ad9834: simplify wavetype_available show functions by removing
  intermediate string variable and returning directly (Andy Shevchenko)

Gabriel Rondon (3):
  staging: iio: ad7816: use sysfs_emit() in show functions
  staging: iio: ad5933: use sysfs_emit() in show functions
  staging: iio: ad9834: use sysfs_emit() and simplify show functions

 drivers/staging/iio/adc/ad7816.c              | 16 ++++++-------
 drivers/staging/iio/frequency/ad9834.c        | 20 +++++-----------
 .../staging/iio/impedance-analyzer/ad5933.c   | 24 +++++++++----------
 3 files changed, 26 insertions(+), 34 deletions(-)

-- 
2.33.0

