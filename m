Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8551E348875
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796993; cv=none; b=fOUTfkaBbooAEQAazcEjdL8H6C3PD2MYIBzAhLGdVzSPxB5iv9BkXsgWgLHqE2+a8qu2t4MPmABCLnTSbJ4pTkUT/mKeuBzFzf2spHM/EFy8Evm50YyvA8luSDC2V5ACYbWz3hoB0XvLITz8mt0655Ey1fK8/1xESNNdAdZp4uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796993; c=relaxed/simple;
	bh=Il9Eh11WV/xqDqP1PVBl1AW8wIbYEY8UuvNcQustwlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e5Xf9fGPHKJ2A8i29GfWGJotsGg/hYG6+PGUwGp2Qfk0uwH52O7EvBtifvbfmcen3+7DsRELpqZhsZ5rEsPityD+zwpcwhzjn6cVxvgQqXgAMBXxR7uG6vBQ2kYpvZz3G74Q9KiDsmL4nqH3u/xPdB7bYfv/WBEFqpwr9C77Kv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egPQDu4N; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egPQDu4N"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7e2762ad850so1883190b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 06:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767796992; x=1768401792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jFmty4BNuj6awrii1t7U31FXH7wri8KyJdJwKzc08Aw=;
        b=egPQDu4NKXpwF7BqHSB38Oz+ALCNa8I8WBDC2VYqxBzhN+9eWILo6Za8kuuN1tbID4
         oS33oTxRqAxnXAISa+Hxzvd4Pc/MXZ68ok9xNXc5W3zZR6a7Q5iWgVUB583ncMgnKWEl
         Z8AgmC/caD7nkQKetga62tiqrDXk56lXfh8NtoYduNSsIOGfSMRMWskVKM+klmJzT1ZM
         qV+I1ZF3VCBZiDNRuyYz2EcwobsQjPohgFzCNtiTjelcu14TJ+BbXLRItGCIOadu9gWq
         3uradKYB/k0AsRsfr42VIyDICnrXlLUPVCWz5Aynem9XnC7FIPaO6r8E/fdDjM+l6ecp
         5NaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796992; x=1768401792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFmty4BNuj6awrii1t7U31FXH7wri8KyJdJwKzc08Aw=;
        b=YHhYG4uP3s7IPQzT9ceSv9ldUx1K6uNcCS82oRTqxZcgdEQqscsoxxZk3sr5ValCXH
         QWh63MSFiEJcj03qmpgqxiq7wai2bq2bk4FpEaHvkdQbrp4xszgWX3zxqfW3HaRAzZ9/
         /lK4KZSVoLg7sv2VcXtzYqYLFh76KOexm9B6ljNWr2qg1hgdD2txq73jL05QwwoSEn0C
         hJ7a0WLb5nIgjkZSeereT8SNOOPARAURvnnA8JP6PxlIYQUt0132kAAvEg7C4rZPnUE6
         GWUwjwGiCjlCmasB6R/kIxQGDfv7kfNrJonAFrSz1wHwMhdIlaLauIbhINtMay61GKwa
         yyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVraOgKYFQh+P8w2X/b4gy9MSK/7cH35uqBgF0PE6zi4hy1QjLWiBUFvfp1GUnvkv8WZDEif+1hXoMZwkBQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzVNdWuhvA3wEq53VkzzP8bCbii1jLH6agC18tUN1lTLFCGVW+J
	kY8aLo7yIyyvImK1NHbkdPMarvs4Z3UTMfEiDSdTF2jkLP1YBEWL2pkn
X-Gm-Gg: AY/fxX65WMuoQphnTHjgjB2agVyQ93RIyx+Xv2XdJ7UVQj+F6oXo5aHHC4K/2Np1feO
	yaw30SGVyn93flNF1U65LRDDm+c1NtimVy6+UrD6qp4E2gfycPHx/GU2yorpB1GWcR1VAM2UXBd
	MJB0ylD1bk/VI5VWAXNqNBAJJOLjF+9ZbGDCN7EViwgB8jYWcsGAJcqfcA5VGa64Pzurk2s6OVQ
	U2g1X2xhdd686mL9arVRZ/dpRAKF+73JgbXn2/CJbl/47tusApjubAykwGadxZ+JD5UPRXqtQFP
	RFTreBqagZNtDasAYuW2iY+h35jSnQFQWvmMSFv4Oh7XnabIEQQLiYyEp0wTQh2SauwvHRR8DkY
	ySC+1rf09bdeIk4AOpy7NDRQAIMOyZ6blEa7ghpGwSdBaVCGtJkaYd9WcEFqGGrt3wCoP8KZE/z
	wi35NR3FiUQuSkV4aX3d8DoA==
X-Google-Smtp-Source: AGHT+IHBH/YNqBbSFpzLLKloAvcpMmkr0v8s83k+3t8kLdLWdTf6EoKI9MSDa6AMjmoTAhfPDP3b+Q==
X-Received: by 2002:a05:6a00:3019:b0:806:1719:295a with SMTP id d2e1a72fcca58-81b7fdc3515mr2374361b3a.47.1767796991833;
        Wed, 07 Jan 2026 06:43:11 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59da826sm5168936b3a.46.2026.01.07.06.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:43:11 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v3 0/3] media: atomisp: refactoring and fixes for V4L2 compliance
Date: Wed,  7 Jan 2026 20:12:49 +0530
Message-ID: <20260107144252.74666-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses maintainer feedback and fixes build errors
in the atomisp driver.

Patch 1: Standardizes the 'Bridge' structs significantly by using
v4l2_rect instead of custom shadow structs and aligning ia_css_region
members with V4L2 conventions.
Patch 2: Introduces a helper function for statistics buffer allocation
to reduce code duplication and centralize error handling logic.
Patch 3: Adds missing error propagation for IRQ enable and XNR
configuration to improve robustness.

Changes in v3:
- Fix extra new lines in commit messages (Dan Carpenter).
- Remove unnecessary s32/u32 casts in atomisp_cmd.c, keeping only the
  (long long) casts to prevent overflow (Dan Carpenter).
- Propagate error codes in atomisp_ioctl.c instead of returning
  hardcoded -ENOMEM (Dan Carpenter).
- Update commit message for Patch 3 to avoid "flooding" terminology
  (Dan Carpenter).
- Wrap cover letter and commit messages to 75 characters (Dan Carpenter).
- Sent as a new thread to avoid confusion.

Changes in v2:
- Split into a 3-patch series.
- Standardized internal CSS types.
- Fixed integer overflow safety.

This series is based on the latest staging/next tree and has been
verified with checkpatch.pl --strict.

Karthikey D Kadati (3):
  media: atomisp: replace shadow zoom structs with v4l2_rect
  media: atomisp: consolidate statistics buffer allocation
  media: atomisp: propagate errors from ISP xnr and IRQ enable

 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 142 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 127 ++++++++++------
 .../staging/media/atomisp/pci/ia_css_types.h  |   6 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  16 +-
 5 files changed, 170 insertions(+), 140 deletions(-)

-- 
2.43.0

