Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25549211460;
	Fri, 18 Apr 2025 20:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745009425; cv=none; b=M8L3u+Ty7uxr1hLrft1Mc00PByNdCfzz9vAyXNAknyoS0j2THikEQksclznrU0VkY2c2hUqj6t7O8Cm3obwVsv53FPwamTaieUWXEr4wlU90uVS4mfuGeukcXC0PhiLE53+eA6qP4hCtLEEKugYfEOkxR5vJ69XrtXYp6JAX88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745009425; c=relaxed/simple;
	bh=W9segW3cJMe7VP3WKWL2Rpm9z+MOBA5Bz2bhSFPcUHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7Ir3e05BTN5mw6/k0qaXg7O5Q4EbNNWhHdAt1QuwWTiEmGQrbhR3vUlsNR87t1Xcvv/JIXSRrGGffkl/Scmd9tcN7agYEUC5qu7Vnq2l+soa/CphfRlvfEBlVNG3QdT0Wxzmwu+dsoolVQLfRvSwGeBPSXAh1EPSK0ALtaUhJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqPmU3hy; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqPmU3hy"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8f6970326so19788376d6.0;
        Fri, 18 Apr 2025 13:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745009423; x=1745614223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBS+gMuCbxo0lQQXgb/9PCP46mLZ8s4XB03eoOWWGew=;
        b=fqPmU3hyet3m5pawEfAaciN/M7qugCClikSeC6xymczJC60nHeATSYlmbzgiKAT4zn
         iiraG0/1mj0o0VVMPYJcV1Lo7UWygSyZH/sLLSJAfLfzBzpZ6TKRZWxbBpQOVc5+hcvv
         V65QG5KnggJPhnzZss11VnfKV1RRIBhf1XQ7yV3E2Y+ly+ttHa0JLKyLvVR96b5E6+wp
         uAlitkPAZlXH1R/pj6xFpE5V6w3DV4Lm69OELpr/1dCdRUe0b9rlXHo7xts/3+oOwF46
         GaYXdPm8bz7/o2HMA4gjelQI75kwhRwfVSIGb2PCDh5PKmuo5H36PcD9X8CaDdnSseBg
         8Ezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745009423; x=1745614223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBS+gMuCbxo0lQQXgb/9PCP46mLZ8s4XB03eoOWWGew=;
        b=gL5Cj4DfH+W3b23Zr+/WKaaNl29Sf2lS+VDJHtsnxmmoe5y4WqTEmOUk4D+GFllNIw
         mr8sqpr7MTf6zu8TS8EcxycQUtgG/+ewjxtIIlYvgK2c6LPCYNN18edJTFSZa7Cg9GRw
         z8TZxSonxXW5FcWsL80dMmnB1cdvHJQJttYL9VxJiHsPhyvqiWSIqCXUFGtrX/Ww41jI
         h3jR5SQL6lArCdd4Ex/tJnYRbYuXvpSFZxa+nen5kgYJBwI4zJXT9DxdNufz8drnNhzt
         rk5+3EkP5vrb08ckfDdDVE42P1c1ZpqRtvJPBBz9OsbPhbo3iqsEtYNwtW+VlcAStVNM
         x5nw==
X-Forwarded-Encrypted: i=1; AJvYcCWGpqvV3XCkbkqG+d5jX1l9hbMB/hLzz2jJEua9YUe9HeiydQ1wHvo2gJ9XVOums2yAkXddbC5t6nbd4TEL3NyyRv6vcQ==@lists.linux.dev, AJvYcCWsCKSFqlXx+z8cKwt63TwjWayke6zsIIh4v4W2kqux3g9Lcbok4bNBtMwnGDBbPjn40/diwhWImEIPGVbDaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUnFLhnzALseiQLTxQE59k/aG0M1WGwya034GXqjhKzQ9OVcS5
	RIHmd8PHxPBWSBU1fYrh6rny3OwkM6tEbCDGA7uyaEcWoDy4/IaM
X-Gm-Gg: ASbGncuvOR4zGt1ityOvTfbdSRDy9x+7+qXVRwkNSn6JumMGfSWix5bKSF4sfcoONmx
	Xkr7/Sh615LhvGF4cUEfmowAh6ha76iCealpewNvB6ayUgcKxQCkboOgH2U7pwayQ1+723SPiWS
	Ux7fg7ml8bRj8EFFxpqjMosLmJQJQnlmuEiqnWpNStLPm+9yZZ9GNZAFnKBeTwLal8sR4E/EvPH
	3MJCAxsMPt6Z5FKk+7UJScw0V4qzirJZoOaEVxNfdq7bR1bVqQcf1oAwATlp0beoyBK3xYmbm0r
	mv0WLhGwy7+L7ppp6TXLPDRdQHfOH29ndiyYyIbYcuMHmA4uG21vqxmsWqAhDHrMkmKKAGB3UGc
	DCix/TaWr4QtNpM5OQO2JYaGFOvXwrA==
X-Google-Smtp-Source: AGHT+IGfxKsSAmrL28HNu5yl4e6s2vMKqHnmp5LNwavPA9VlB2hFWprDYSQDcjsuRTkffTYQCc6V5w==
X-Received: by 2002:a05:6214:20a7:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f2c4687fc9mr82895486d6.38.1745009422700;
        Fri, 18 Apr 2025 13:50:22 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af11d7sm14355906d6.6.2025.04.18.13.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:50:22 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 0/5] staging: iio: adc: ad7816: Fix channel handling
Date: Fri, 18 Apr 2025 16:47:34 -0400
Message-ID: <cover.1745007964.git.gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original patch combined a functional fix (allowing channel 7) with
several refactoring steps (introducing chip_info, renaming structs,
improving validation). As requested, these have now been separated.

The series proceeds as follows:
1. Fix: Allow diagnostic channel 7 for all device variants.
2. Refactor: Rename the main state structure for clarity before introducing
   the new chip_info struct.
3. Refactor: Introduce struct ad7816_chip_info to hold static per-variant
   data, update ID tables to store pointers, and switch to using
   device_get_match_data() for firmware-independent identification.
   This removes the old enum/id mechanism.
4. Refactor: Add has_busy_pin to chip_info and use this flag to
   determine BUSY pin handling, replacing pointer comparisons.
5. Refactor: Simplify channel validation logic using 
   chip_info->max_channels, removing strcmp() checks.

Regarding the 'fixes' tag: I've applied it only to the first commit
containing the core fix, primarily to make backporting easier. Is this
the standard practice, or should the tag typically be applied to
subsequent commits that build upon or are related to the fix as well?

Chainges in v3:
	- Split the patch into smaller patches. Make the fix first
	  followed by clean up.
	- Include missing channel for channel selection.
	- Address specific feedback regarding enums vs. chip_info data.
	- Use device_get_match_data() for device identification.
	- Move BUSY pin capability check into chip_info data.
	- Simplify channel validation using chip_info data.
Changes in v2:
        - Refactor by adding chip_info struct which simplifies
          conditional logic.

Gabriel Shahrouzi (5):
  staging: iio: adc: ad7816: Allow channel 7 for all devices
  staging: iio: adc: ad7816: Rename state structure
  staging: iio: adc: ad7816: Introduce chip_info and use pointer
    matching
  staging: iio: adc: ad7816: Use chip_info for device capabilities
  staging: iio: adc: ad7816: Simplify channel validation using chip_info

 drivers/staging/iio/adc/ad7816.c | 94 ++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 40 deletions(-)

-- 
2.43.0

