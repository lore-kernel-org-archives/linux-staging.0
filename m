Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8F27604B;
	Sat, 12 Jul 2025 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752347626; cv=none; b=AOUPzH5JPaW38UqX7XfKuy6tlisftPExnotZr/fgsuKguLObiUVLGLE2gWXraMZwAxNJYKGcGYdSdwWJdnYvQjiduhud9JHXTauXu5FbSmofaR5ggMkBBHqBiijSx8I9mU/2t31j79bglthRKGkqY0rKYWjKU743xJDrBV3rC6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752347626; c=relaxed/simple;
	bh=KJin/EHTvDTBQXRUn5NEbpxZouun+ebCq9+ujQ1tSZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ksmxU0yhfkiDXkWwu1CLwZh2fgkfRzQZFUXe3S1KVXrcUoxtIevfxqDOx71II2ToVtQ4kelNhYMunxkWUbufRF8R0B27E2KUC6YtNQd4O75OjevRa5VLYUfAaGi5d+37LbGUm7DDnkfceLTuTAumAfBThFy7p11MwhXJa6wLAuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E38S6Pxf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E38S6Pxf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso410744f8f.3;
        Sat, 12 Jul 2025 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752347623; x=1752952423; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uk7OIVhNCkZOCbdEqKaALvak+tALtSP7Gbings6es30=;
        b=E38S6PxfxZADeMtC10YYxn+wsRZDpKNaQdd55Opu+nchn6+Qctpu0Htww6y6euggor
         hq7bNlsagx/uyffuD6RSk3j+/9B9v6Lv/U51vk+ZAicbKUzqvPirkZsn60j1WomRKhYL
         2ALhWkaL5UwjbktKFJxoejrfDmQB69boocGXyP0+Cl+LLkB2hR/3/jS/rTVqztGfpzBK
         C+MSSh2qlqMoZjx1+X88oJNJRQ+zMh+fdgIVdzhe1myH9kF3VvwCfxO2+jiZqPl1Dpl+
         q408+stIbVN+BX/Visv5H6QCADoh6KCBbBeIXKNqOb3Sm/88TcaOKd+YZqEqQwUhY2rl
         2qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752347623; x=1752952423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uk7OIVhNCkZOCbdEqKaALvak+tALtSP7Gbings6es30=;
        b=d7trqGWGw8JX345PN6dxdzelH7vwvXFdUqY3JUbamaSGFVU9KizIbBXhfK+mi+hmV6
         rxpWFO+8YuB8c8qzbhPGmlpyN50oLDc51Y768zy4l1J3YNEBKlgj7B/VjECV8HerUdzg
         00qoBxrkjpWd+HGb+hHSPNN2ikMVeINwAS5VOpc6U7c2n+Jisf59NyimEcb7h6eXXS0i
         G3fTR8rzxJwY2OBXB+j4Qa7lZYshPL+1ZwZ+B7zDi8Tl09Bikk7lewYnx59COLzmOnvs
         E4t5Xk1T610whffkP1s20yEAp8xCKslkq0ZMbgYeYpYioi/2+vSjhDLrogF/Q3CqDVxq
         WwZw==
X-Forwarded-Encrypted: i=1; AJvYcCV07QW2sch0l9kcxmxZlPrqll97dQQpiEpUqGCVxhULSYi9gGIP/4KqQMgt61+SBdYqZoau021tUKfYPTOrsA==@lists.linux.dev, AJvYcCVkj+YTE0fRrmJlDp9V5LIe8CXAZiiFbBtw7BazbC5ra6+3IdqZ/t0ua0IDzVzdi05LFxqnpAnw6hihb/sGoGxbl/5mYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYWriQ3723mOs4EGVgXiEYvcRMEuWVO5OypmElg4UNpBBqN6WV
	8DzYaBWzRyBvRhnbibY6ouEj++seqG8AtIOzx3BItedEfPs1Y+FJa5sT
X-Gm-Gg: ASbGncsGWQtqFjLrPuM01RpC0BUCYUjMruRudx2ModMAc4vyyEuNu3P1djFwCeLtEdp
	1Wy76jbKIffevIUCB0FE4aYnpZph/vBOBVF5up/KpXZDnomI+cFguYWVkD7wIxYYUhw0piENcnp
	eHTcOdpXuISP9kDVyoME0PTRpGFdc3LPsNzEx0OK2965QDRw3cg3UoGykQXsWZ4qKDb1EmXhAwm
	VEnZo2+F+TF/qMDeV0b2J4Lf9oEvEKc4TXs451ZcE1aCHcVhbsBhTNCWLdraRk8ApTvUr1WoALY
	XAYRedTkS+2F1lAIYhO854satLD7/O0b2zuEqIRXDs9qZEA8+ofXfPGfcviHv+bqoUP7ZXj0Szg
	GPWNfjNwecvcN9UBBn510EKc5EWySUykXDjHuaAkWdjYVosvS9YsAYkid7g==
X-Google-Smtp-Source: AGHT+IGrOLiglXKeSvNNhz3uLxDcdedoN3kV3nyhrWgBUWURBZi/gUNkTpSUE9cOpKnvyxpg0sxaOQ==
X-Received: by 2002:adf:9cc9:0:b0:3a5:2ee8:ee1d with SMTP id ffacd0b85a97d-3b5f18a6c77mr2090255f8f.16.1752347622114;
        Sat, 12 Jul 2025 12:13:42 -0700 (PDT)
Received: from localhost.localdomain ([102.42.96.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ff9sm7947939f8f.93.2025.07.12.12.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:13:41 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver AtomIsp
Date: Sat, 12 Jul 2025 22:13:22 +0300
Message-Id: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continuing the cleanup work that is being done on the AtomIsp driver,
This series:

- Process the error inside hmm_init().
- Unifies the HMM init tracking method.
- move hmm related function to hmm.c.

Previously, These patches were sent individualy but they build on
each other so i resent them as one patch series

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Abdelrahman Fekry (3):
  staging: media: atomisp: return early on hmm_bo_device_init() failure
  staging: media: atomisp: unify HMM initialization tracking
  staging: media: atomisp: move hmm_get_mmu_base_addr()

 .../staging/media/atomisp/include/hmm/hmm.h   |  4 +--
 .../media/atomisp/include/hmm/hmm_bo.h        | 11 ++-----
 .../media/atomisp/pci/atomisp_compat_css20.c  | 12 -------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 31 ++++++++++---------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 17 ++++------
 5 files changed, 27 insertions(+), 48 deletions(-)

-- 
2.25.1

