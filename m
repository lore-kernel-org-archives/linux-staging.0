Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC82E14A8E
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 18:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956496; cv=none; b=PGocbYOzaY5VY8vAPC/AOhZUsHdXM6rMom6SDyFmgw/VhR/caPnzPlYAWAldmY5X8Kiku/3xSaqe61q1oqmUVmjDbr46t1vg3fcUHExjIpcUfJmtV0yEh2JSGmoHEWtUxG31qOLbdMyl7n9ATYNnp3VNAO/i4ZXSCILtOWaBdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956496; c=relaxed/simple;
	bh=j10rUxaCZdC0Swivmrw4RLDZYEgoGLWKH9dMLzpMKlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCRYCpD6GWnHH2bqBNG/ngyGGARhRMeZZ3oMMnXIVq5LTgJhVCCDZ1RSaQWwbZytahbBSvQ6sH5cB4KNaBtzcabYfZPeuy8f0fCH1y72LVkX40HWz5RL/3JDx92Xi+kS4qv2sZaXVeQVQ7+dAFISxjScW4j2JSaVMdAhYuxP7vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRu8/kmY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRu8/kmY"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59f791a6e67so63430e87.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 10:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771956493; x=1772561293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RlTXStqKBApdTopwjc//Col4cFAMZJmgWaPjEnJTbMc=;
        b=eRu8/kmY9+9821EbXkiSJGrNSTWS/6Cte0ZlPDPGliBAhxJCed0BR7ff7YPuVlWh0z
         bDOelwBgBZ0aPGoQpj6NhHIioQ9ErcVGjpodMDUzD4zzNgf6k680mRwiO9qfZUKkLOAU
         KCj7gKiS+gCitbCNjUNhrmotzIK2I/bG9yQv4OrT3DOTLTPd5wvdZhpuWZ0BxE8BcCgD
         ARtWzVnfUa6pGfksPsMUaMdxHcLuFQVt0U3oENLVVT9it7l0PFxLSnZTiLud9qyK61Tb
         BZ1A/433oIWXHDZc7RN1itB4OW4mhxtId9R+4Ozq2NHkiVLylzn9UZ6INbJEwdh8k4R/
         AF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771956493; x=1772561293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlTXStqKBApdTopwjc//Col4cFAMZJmgWaPjEnJTbMc=;
        b=HhJ5ZqR0NaI9uaGJadMl34oz0HAIUkNdYj1z9n3gLijX3/FpuMCi2Ws4VxAStIlFSV
         kfKVlCUyaX55HaBH3PQswkUVo9OmFe5sFq0YhVFvmzC+8vTEUAFgZF74gdkwxWDIPQeE
         mmgFx+SOlNZX+DbeUmjZd6ulh0ggAyThUawwvy0997r3le2DHC+z7ambfe45OO1XZ3uM
         TycMW9kASAQa0q38gl77jgy38HFAyTyXxkec8HRI2F/iP/6WBrhTZXTthNpkmlQJ/GhA
         uprJ4DHMnXXeWL0zN1Dsbs9tHEVev1XqJ5ZtRtgobJTi5JyqDoyOMnp+1zm04BS2Awg0
         CqHw==
X-Gm-Message-State: AOJu0YxzXJt6TlVgUgrjZ++oTbxH3muJNjsveb4hjEkKTG0MG323pMC+
	gEmYIePoOl/MQAtGPAD9sycbrdNUIb+5a5r6Vcw3Yp13N3Z48bnnvxbM
X-Gm-Gg: ATEYQzwKdxBDUpSH9nkSgzxUP2qJo2PBRgyH3pcGHRjw7LCVeMkk7KwnlFXDA6XfAFO
	BWG47tR4lZsXqH34oq2e+bSdJVzJN002d0xce1zUwYhg4ufVEr9eGBwLMm2kGOK6B7R2BxAJRx2
	gp+izu0wz0ukuUqqZDhrXnoKgBgHqipK1CIgEYDCnmjUDCIhL+O8UpMXuRYbYAe5Uz0XXWF8v6S
	9Re9f3R78TTLx3SiMXu7bcZaPGSDMx2yOkclrx7nh2CiIZDMXoSFrwDIq5GRcIZZIXO0iIGQYsB
	2s8UkeVSJkINvcmSVuVu21ycHgPn+wG5Zc+HLw8RC+ZudmOUXOda/YThpzm8ENwYm8DBFUAZyx3
	wosMrMP+ock/oqiC1Q/jsUaXD2To9+4qIX51UXEJ4VobtVSPM6CUDbSIapv8lsJpngFDOUF98tr
	Blr2GcZ+yYEoZJvgG51mghADsUWULabYslOBXjHGqScvJx62t3qFKyuMPSw35B22RzBYhz/o2Wv
	wmk+sH1NY1z0Wyj1w==
X-Received: by 2002:ac2:5693:0:b0:59e:465c:f86e with SMTP id 2adb3069b0e04-5a0fe42bcf5mr307220e87.0.1771956492800;
        Tue, 24 Feb 2026 10:08:12 -0800 (PST)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45ba7sm2394810e87.70.2026.02.24.10.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:08:12 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v3 0/3] staging: most: dim2: clean up error handling in fsl_mx6_enable
Date: Tue, 24 Feb 2026 21:07:47 +0300
Message-ID: <20260224180750.28468-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up error handling in fsl_mx6_enable(), split into
separate logical changes per Dan Carpenter's review of v1.

Patch 1 replaces IS_ERR_OR_NULL() with IS_ERR() since devm_clk_get()
never returns NULL.

Patch 2 replaces dev_err() + hardcoded -EFAULT with dev_err_probe()
and PTR_ERR() to propagate correct error codes and handle probe
deferral properly.

Patch 3 removes unnecessary string indirection in dev_err() calls
("%s\n", "message" -> "message\n").

Changes since v2:
  - No code changes, resending as new thread to resolve duplicate
    v2 submissions (sorry for the noise)

Changes since v1:
  - Split combined patch into 3 separate patches (one change per patch)
  - Extended string indirection fix to all three enable functions

Artem Lytkin (3):
  staging: most: dim2: replace IS_ERR_OR_NULL with IS_ERR for
    devm_clk_get
  staging: most: dim2: use dev_err_probe and proper error codes for
    clock
  staging: most: dim2: remove unnecessary string indirection in dev_err

 drivers/staging/most/dim2/dim2.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.43.0

