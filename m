Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF62DF12F
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767553520; cv=none; b=lmb4Dbeq4nKO7l998bQxOHxz5IWZDNE8wHUqouc+g/sCDGPKp4pgSvgcaS9Fph0+AmnNgHrFYDhB7GhwQnwGkJ+xYCXiKqfik03PqESCwVcbMw6OskD+bfpSDU3mAg+bzvK8ffuHCqm8ybnC0rCPLXdETd0S/ABiC8nND1Tie9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767553520; c=relaxed/simple;
	bh=6/zCJJXx9DZfY48PIkypH/UZeZ/cOMZ7xcc/kYBfYdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xpa4OhGeGcMu9GHEwjF1SnidnkHPkb2JZNHM3DoTehaApn74/gixKMAts5cl3F1RBCrOfPTq7i90yr1ubx00UFLJZ/UtShpSz6/VkvagcwBYIQWtsWYUvELV8UKy/rhXfybRDncwMQ0bOlpcUujI+MY0UHdLTs+Fa0zKgBkvh0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNoSHhMb; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNoSHhMb"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4775ae77516so139949055e9.1
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 11:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553517; x=1768158317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kH7dAkCMy49tzMgoDi5R1yw9hpYDlkp4ghtVJ345QuA=;
        b=TNoSHhMbx9DMU7eDHAVksAUgc18BjSA2zZoQaV+PJWJtSL2teLWnLc1lspB4+k7Dl0
         uvn8FWXh1gV7k2H9jGxICNFlfLwLzTrl+QJLqoIbIooVQsH2Ki4gD+mSeJnV7F06oBb/
         zXZCKHJIWGqeEDvXchPMtOrtK+5Motkjm5foYfeYo3fN8dTgUWxUC0TvwLlxmLVwFDOc
         MTHrCXDPC4Hc4gxbApL+OMio8tNaB2GApxQ4jEcrfM41dBLF5SWE6WJZ72m/h7QDQxVa
         QQkMndDHdax3/kD8Q/BAcxcLhoUSsoFEZQ66mWRDhI7QtbmnWCDPj0Lt4RTSnz3+5wMh
         580Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553517; x=1768158317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH7dAkCMy49tzMgoDi5R1yw9hpYDlkp4ghtVJ345QuA=;
        b=aMzg738zv2b/t0QW8xbOIbA9Ky8LzJj2E7qbkEwnhZhbJRgPCXaf0OLhPoWZOFVGdr
         28vPjuNIY4Lu1VlJoNNINcOsYBCSPTOdalPyZZoihrzq91/+dyKaVv0T1ViZ4NPJmicn
         tAmypttvA6aVKOC5LwgnBfAe6mZ78szFPixwHdboKlnhW1d3UX62wuxM1AytccVLCnNT
         FKDSjVOGfLp7otAO5BGwVLeD2Z7EBdZ+5SXLrgzhE0VyyuJ4u2kJI32NExKkCVUyFxAG
         wy2X4z6dg0CefPqy6oohHiaKd6MufKrjrg/woMCS6A0JwPfHaPJ86+yFBZMFkSDPmDP1
         WdQA==
X-Forwarded-Encrypted: i=1; AJvYcCVRi/Dy1l2UyzzmZgf5P0EOiu5Eqm1kqTpRs7Wes4aIdTixcdvIU2I93vAnHejiY+2b/gfFOzzMfS1ftgV4@lists.linux.dev
X-Gm-Message-State: AOJu0YxJn5q1Q0wZxFxZ8h6jBrdwmnvjI3xeFPvRhqshmGmtd9/HGMMg
	g6Ikb/16I2iFCvHh4lvOAaOqyIMs9M7vC6hAGBXYzPSCXlgoBYhphlGT
X-Gm-Gg: AY/fxX68cFezCD/yqbQZorgzmZWxbyLhkFEB5Us8bcMTKmfdPK6S9jOJYvWcR4O6kni
	lk+UmVvPMtoisufpTxBa3QgpcluNlhIwAWVFu/+rLtpE3Kjrd+G97ScxmIZJv0oxgqEExMIidx5
	Yh5CxDejIXcHKHLrAUV4dQuHBNclj9OwiwDCVtJ8arAzHm8S0xcDoJrHHmbGkrMFQofVqYPLwJk
	0QW0DH+GMlKckHMl3bZB0KQhe2oUOxKVkckMkuKAlJrn2PPfkFXs7F6Pi64ABFNkPxg/2bwzoHp
	9uB6aisGLclry3VpyBqdtwL/Dox8mGSZhPxRSSEe6s15EEz2xj0lV2IXodh2XS/gDilcLBx9yWb
	xEBHwO+OUEu3XwJZMBI4625m8tvHHggyoY2J4S/Fct7qxgER5UkrTS9RG0gDaD64wdBoN4mStud
	z0xduEikMqOTw4YgrIY76irS993e36VcCnORW2eTQ=
X-Google-Smtp-Source: AGHT+IHrVdiL/42Ek87wCD1+Dv/YGTDvseNRtk1LjSkqIgCTkDD3F5Hmvfq293naJjBGVzQPVVIIbg==
X-Received: by 2002:a05:600c:8b56:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47d5b21d77emr251472445e9.36.1767553516932;
        Sun, 04 Jan 2026 11:05:16 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2c4fsm96505089f8f.42.2026.01.04.11.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 11:05:16 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] media: atomisp: Cleanup and documentation fixes for mmu_public.h
Date: Mon,  5 Jan 2026 00:05:04 +0500
Message-ID: <20260104190509.19683-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses multiple style and documentation issues in the
AtomISP staging driver, specifically in pci/hive_isp_css_include/host/mmu_public.h.

The series starts by fixing checkpatch warnings regarding redundant
return statements, function signature alignment, and block comment coding
style issues.

It then removes erroneous function documentation where additional parameters
were being shown but the actual function signature did not accept any
such parameters.

Finally, the Doxygen-style comments were converted to the standard
kernel-doc format to adhere to the Linux kernel standards.

Mahad Ibrahim (5):
  media: atomisp: Remove redundant return statement
  media: atomisp: Fix function signature alignment
  media: atomisp: Fix block comment coding style
  media: atomisp: Fix erroneous parameter descriptions
  media: atomisp: Convert comments to kernel-doc

 .../hive_isp_css_include/host/mmu_public.h    | 87 ++++++++-----------
 1 file changed, 38 insertions(+), 49 deletions(-)

-- 
2.47.3

