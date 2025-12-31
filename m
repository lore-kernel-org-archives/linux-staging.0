Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94FE298CA6
	for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184815; cv=none; b=n446P7NGNryXtoHKj/8M9Mmb7JM4hXNFd+ShK4bcLihDywzj/ioPlbOIL2uTdkp7CaNfOWjXl2Y1IAbDOTkkwNICidSJr+GkS2r2IOeVoLKO9mzW3zqonk1j0bYUIbj/AK6g0UTHYQnxLVxM7E2THLpQkZcFiAdEGvacFJSxpYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184815; c=relaxed/simple;
	bh=QeOzoma0bEwKJTmy78B7HhWmFn2PQZkre2zLCJd9faw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyduz82WYIb3yxznWPLBEsWHStEWD13nhQ7FTsaSj17MyyMV2zh+0q1raSUkDJ17a+I8cPLJ8WhkD4isSWthrUvFrhMRumH5plL1LOUygESbIMVtLdXuRn2zjQyxlAGReUMMiRhCAF+xK4Zl/DDGccB57Ec24FwkuBaDhrX2aSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlBWQUv8; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlBWQUv8"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78c6a53187dso82046617b3.2
        for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 04:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767184812; x=1767789612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xO5H5t3OeipHl8rga8srT12DcrRvTCrCfotIF69iAAk=;
        b=QlBWQUv8UUZMEyCoSqPRuTXj7S9+gAOE8kUWffUI8CVy93Xt4bnxnFMs6sJhJLmSWW
         oqBj+/c5U+XYiJOfYWJvYqlhoI3yDJsFigxo8YWLoRAuXFdzMF655f7Ud6teqLVrzPBf
         S8wyuBKQau3fxvv8rvz7yBwfzfXEApOvQqpwZp6sG8bkGsV7Qswck0qVFk0UzvhRbE2g
         pVR2LF0PNiNUZJ7XysmdYinKA1LDOWPb+khQdgKOIR10rl15cwGkPKic/dWfbuG0+tD7
         Hbcw3k0n8Cmzw8EzCqQshoMFAxT2YTE1l9ZaXJx/HtvVWJY4amLvFCC/s6vwcjXkxb/T
         ZA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184812; x=1767789612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xO5H5t3OeipHl8rga8srT12DcrRvTCrCfotIF69iAAk=;
        b=LTi1XiL8WNZvFRvFNmlaA9fbS2IDUs/Gx8FHfD9+IeB9Vz2g6AIvXcwD2+NifXLyC1
         Gb/Ytjw2hVvyd3DaSbmo+p/HgaeLwc8Qy+oVXF3nrKu9FTJuqODMcFI62aLPU6qeSyP0
         LLOPJcvxmxX7LqOxciY2duJPG+p7IXbsxUpGk0D7SsqMBEE+Q8/ST858I8e+/2VAA8Em
         4UIrv8sZINxhOJ6IOJyuiiZplXlftPo23tYNLfApYhNBi6j8j5sPycC6Q6SuPUu9GJW9
         q5Th62S4iNg2VzxodvHGl6S18j93iSfeeHLW70RghCTyLbKBEGqbEfMCnvhkTmVUf4RQ
         lkWw==
X-Gm-Message-State: AOJu0YwUtbvO0rw3sRVE+ze0Z1P2PSObacnxVMIIYRDOc3BgQTJb4G3v
	MaUK5fK+NK4NCMjvi8WFq75cZ3+ghfJlTMXkPCK5baAtRzndQeQHYGLg
X-Gm-Gg: AY/fxX7ZSaUptFRky70Xs5zXa90GIogId/ZJV852T1kOuVs037mJhndNeFnT0mRXQde
	TiM8iyDmso3YrOf9OX3DRVYdUrhQJu9HIaNDybibQ4a6JBr0gZb2jXO696+Vvfy46rMqlelQGze
	syEmsVyIG40XVijnFB4E5HevOjbGrDz+JaYHSHE98bodqMcgD1aFo8la/Yb09xUtNZi6W8OMnla
	lAJVMbdlivZElMo/Cn0Euv58TCcXoJs+mhjeZCnnuBiVfDp05hGeVJoKDvDIC6cMgn8e/shc1G1
	zIMU0dqwmjXYupQNrgQnQMy3CT5uWxY5mPQxYU/PlVNVECJ71WT2Ymw1g00mDzBFUAHRJGrQK5Q
	RsNSazJMGQOuyGvnToRuoez4pES8JLm6bXbS4TqXKmxP0nsMJRa+36GDY5ijoeEvkM7R6qnGNPw
	P/7JjrC6axyqjPfepHMAfPctquDUgly8F8IE5CBz9Elo9xLu0FbvSVl+tAPh4fj3n1/ETVz5Pqa
	YTmYRw=
X-Google-Smtp-Source: AGHT+IGJFWHmis9CdJXj7mgYsSVBx6L8ZVMm9aBmS3lTkz+kX5H35E381Fw8LrQh+Ej4t0OC3yedUg==
X-Received: by 2002:a05:690c:64c4:b0:78d:6254:d162 with SMTP id 00721157ae682-78fb3f517damr306846497b3.31.1767184811814;
        Wed, 31 Dec 2025 04:40:11 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43b2690sm137555257b3.18.2025.12.31.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:40:11 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-staging@lists.linux.dev,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	mchehab@kernel.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 0/2] staging: media: tegra-video: clean up shared SoC declarations
Date: Wed, 31 Dec 2025 20:39:53 +0800
Message-ID: <20251231123955.277384-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up tegra-video SoC data declarations shared across .c
files by moving them to the corresponding headers.

No functional change intended.

---
Changes in v2:
  - Add exact sparse warning line to patch 1 commit message.
  - Add patch 2 moving tegra20_vip_soc declaration to vip.h for consistency.

Changes in v1:
  - Initial version.

Sun Jian (2):
  staging: media: tegra-video: move tegra210_csi_soc declaration to
    csi.h
  staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h

 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

