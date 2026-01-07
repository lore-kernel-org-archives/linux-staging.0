Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700623314C1
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793749; cv=none; b=ewcDkgH9dj7f4gKVKBBic52tywCECte0RjEOJKr6nTxXKo/OlzDHFXsMtpR/bZfaxPd630GIR/1wdrmT1zxC7n3JsBOdPZZJUl4Wp4/BKInJTlC0Jer1eGEeKkEYsMfkrDaZD8CmG0fkvZSp1c1VRUq55vNfV5X2DnaVhYaNaUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793749; c=relaxed/simple;
	bh=PIgdhokxKmOQqn2YJNx64hxKMduQw5sTcwbexWtt+eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIQWaqsciuLaYcNxo8zMPcix/VHDGfey8pM5morl62PhcjXH9Gyska9yiB7dmH639lGfomZLpEoD5q55acgZjMi5y0Zbw3WdqGc3/n8yWup8UASw41zfPdDF7KmHFvWNdKveQnQE7x5vOPcVhXzbk4Z2LX8e2hU56hLVYnhxFMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLjZGaQy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLjZGaQy"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1410131b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 05:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793748; x=1768398548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxGmxcm8W090/d5nMTt/wORMSUlKQtayAk95lHOSsFw=;
        b=aLjZGaQy/kknoEGHBVpnoxgYc6XmlWwgqluaPZj/l4cjSd1Zky7JrGH211Q7hnWoMp
         tqRZWAirABvFj6fsKcymsEVzqv848xGy1DiiJ4tSGF+YJMwvpykP6homZb3fLO1lmv4K
         0yf84x7UY70SSgxg8qevtX59NoIR8PSsKdbbFYfmDM+owUpxfFLcttr7wIGnGzoKAMsJ
         iKqr4j6UZ5nHe6eefD4g3ixtA1bCMeCwxXEzY45akJ6Y3arWrQ5folk579Stp1owvQqE
         5wPIdabM/618cRknI20c1WRfQFMEVWYziKvBMEfRTgdvShcA7doS7vNx/RS/aX3aY+p1
         57Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793748; x=1768398548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WxGmxcm8W090/d5nMTt/wORMSUlKQtayAk95lHOSsFw=;
        b=TiduiJl4QdbN8x5S6EdsScN+BiF7wbEs4kaPp2JkeOmdi6H63KX9NfdcznB6+uXIp4
         fYLdCihpUFhSTnaOZ6ygUR5Ty0Julc1YVlzAyNDGOMYMfbkdz25r9dNTXmdbw71sS+mj
         vdFLuAdzYwW3Yh14e1YZi3x6hS67Hk7K9hiRwE05844TW1O1MLzUh1S4+lRNNXakuVjQ
         pVRNW8xgb7RU9FO0Ux1FaK/uBzIC6J6fGIW0zhhWUhkS5W9bQ67/GVHMXJNuthywx0Dh
         TNCN8i1CrbUuSSh3ob+7ivjj71+xHvH9AmKwvMJFGCkFeFoEWANk45sLyBFR+7N+64PH
         sxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVukKqf/bXZJ+Fh7+ImqKcKtRv0uwycSZ8Tm7ei+a0CuTT2YMFWCaPakOoPFuhvp6NI3D0H8eAqzh2HFg9e@lists.linux.dev
X-Gm-Message-State: AOJu0YxYbhvuVpolDSFG9SdMfI7Kci/f4dRFrG+su+coKodI6joaDX5I
	zZ8BE1iECDqP7Y6KUBhaMnRBFgCBSiVQPlafKlB48f8g+Ji7zu+521AX
X-Gm-Gg: AY/fxX4gt09CaTwKMYAGMk+DopLr9FjMq0bi0nhrzzgeA1sney9NU8ZAiUTORpe3vMs
	7kNU8scfAB2nqG7jdy1FXE88r5ZCH9lvTSB4F9aWheXxr5MMF2NG1drl3cUfo39xuD7fdEhHbSi
	2JX/Te+MYHRW+vAKdWFsgdblAcNBNBHsN1fhhugCZxs4J1pSAwSCAZ8gQaUwV8sn9xnEiOjOlSK
	fEGfFJjLk7iXQx99UjiKl/7aUfpqGu5hcFHuBORRMT5JAZnBSkJfeC5iDZjL7bRn21qGnC2VvCG
	bo7BIfIYRn7JtMZbOPh5cN36me7/4EVlXV5Pkt7bvJFDn0EC/IBpttDql+k3uF6MHm4wtSkS677
	vbD+QEg1MEpniDlMkANyyjAnUcI2MLcjZVTKexIiLruSSUpKFvGi5p2thI5AQImx58Ypq3IoJhG
	AXdSnDdv6dW+E=
X-Google-Smtp-Source: AGHT+IGJdT2Ci0JP0VKzc3VKsEzWxo3Sysx3HJ/oNP0h/r1jSvEC0TGt4bis1ZBfXHQRRGgyfW+kYQ==
X-Received: by 2002:a05:6a00:32c3:b0:7e8:43f5:bd4c with SMTP id d2e1a72fcca58-81b7fbd2a5amr2389187b3a.56.1767793747571;
        Wed, 07 Jan 2026 05:49:07 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm5109577b3a.42.2026.01.07.05.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:49:07 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 RESEND 0/3] media: atomisp: refactoring and fixes for V4L2 compliance
Date: Wed,  7 Jan 2026 19:18:41 +0530
Message-ID: <20260107134844.68074-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses maintainer feedback and fixes build errors
in the atomisp driver.

Patch 1: Standardizes the 'Bridge' structs significantly by using v4l2_rect instead of custom shadow structs and aligning ia_css_region members with V4L2 conventions.
Patch 2: Introduces a helper function for statistics buffer allocation to reduce code duplication and centralize error handling logic.
Patch 3: Adds missing error propagation for IRQ enable and XNR configuration to improve robustness.

This series is based on the latest staging/next tree and has been verified with checkpatch.pl --strict.

Karthikey D Kadati (3):
  media: atomisp: replace shadow zoom structs with v4l2_rect
  media: atomisp: consolidate statistics buffer allocation
  media: atomisp: propagate errors from ISP xnr and IRQ enable

 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 142 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 123 +++++++++------
 .../staging/media/atomisp/pci/ia_css_types.h  |   6 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  16 +-
 5 files changed, 166 insertions(+), 140 deletions(-)

-- 
2.43.0

