Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5725136C5B4
	for <linux-staging@lists.linux.dev>; Sun,  8 Mar 2026 19:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772998069; cv=none; b=RkbfIRnGeTazxgR0zwSEu/DiwgCeaAihp60D5iy9LSZkYCPdCX89NK36bZGnHfzzLGHHlPfcuCpLf0DxOOR20JZ01tPb5N8bP3JwtXNJfE2XHVnCIjkY4cE0SZRvUovbgn8vzZi54s7TIYJgKnTyg3rPMF2eto3CU2dgnUbtLrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772998069; c=relaxed/simple;
	bh=no7JAaSLnuvcJWBYdVvaAiMylmE89V/uRvn5a68ZqTE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=PONsCYKwyIzHUG6eznH1jpCSBueUg5eVqWhSlO/CVWzmT0kRzyuuuJktVqttVNBFP5qFq7l5vthfHpmew7+npZ9ryi8a+6HXhBWYDMZ6NkufFqjgLuhTijEnGLILMYqCzOWu2BdMZobrc3kx65+53xZCczj3e9DlOuz6Zjgo3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiyaeLMt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiyaeLMt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483a233819aso108563925e9.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 12:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772998066; x=1773602866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aD5isJ66ummdjkxzFSXM4A+K3SxN3m/p8YHZQyQN7No=;
        b=LiyaeLMtXS+keq7XXdRf4uTHj5nuuZhYONcr03yAbQ2qWzJsBo8leGSCHWHn7mCjrb
         2oK2/K8AdQZlS5Ey/1puadwqUUmBg8kAaY1cDlpzNxYLKs+cv+CAno2o+1i2xRNdpdjY
         10czVW0QG4q0E3zVCEmHGXbN5KiVLcmundnu26NxnIj8q/NBpam5x8KwK1VHdHhPUglr
         NCQpo9k73vjoHn9uXG5fsecUkMNQELzTouB9YPUzisI23EGws2A8vdOoxvsfzq+6CkVT
         0YF/SS7lwkFGibtgM/YrCkMWmkJ753iqf+5ertHmCfRk6TGIQzp1SlnTjCZDQCUiUtyS
         h5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772998066; x=1773602866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aD5isJ66ummdjkxzFSXM4A+K3SxN3m/p8YHZQyQN7No=;
        b=JNZ+LfioIGMJ+lQ2lZ0ASUxcFKVqztC9ieI/I3fpaQAqcAc+PVdyPc55RsYoTb13uR
         +/U+1WLBKPgmPfA+ov9iZBvkPXk8qZQXnYdKbwUTI35UkEHtXM43KcrSQdIg/4DM8ATn
         X1HJOsKIbii9Tv34cdQ1F1WtM+y4p1wSyWD7frjRnad1Rq/Qp/it479Dkj29lTdcdTEG
         DSS/tt8tJ4XAHwqJdMVpPbCyIb6gRlrKV+lVph8z38EYcvMdpUjD1jF7kRz1KCr+anir
         3bRwQuWf8JJmCSRibEuGrRvjsz7AAM6+j9xWV88zbsOkoXl1exXQT1xSf4pjAH7t3+/g
         vbMQ==
X-Gm-Message-State: AOJu0YwJIQ6pdCr9AamGTYbc8mvwUATlZ3hP9Sqx2D2mgNHXZBcCxST+
	trq5TLLy+pjWxHYjp8qBP/RyRTLoR8X8MZtImsb0w9OyXM+9Nq0j0TGFGmBM+w==
X-Gm-Gg: ATEYQzxe6mdoxTAj1X/bDFbe/kPODMXrztn4Su1UaYy2Z6TQgerXNofNPKrRgWqQuel
	GeE0c+BTU0Xlt2BNj4m68UrWZgSYiasP46Ed8WMU3rg+glNZAI4UBDG/faRbSpivyOsWk2VUyR0
	m3WC633284ezBl96hQImA60k+WYbnLX9xkuLFXnZ9epTvBVQHGvqZ2aoZ3IHbRQoRoVCBdo6V9I
	47IpIzdo7ycV161QMI+p3PjXliM3SwLTQdVXxX4/huq0DaFwrq362E5rg9T6acW9uz+b3frXt+I
	B3Rvtsu+rfWNZc0Spe+uC7lmEjI70uB39/zPSXqtcof91666rYGKonhB3xT8Q6GB9JqH+pWROZK
	tgAbmu2y70QXNGb1ibRmcZ0nkEJ1bXULlRFx5Vg4/0a19PsUVqd46rqX2mJ3B+CY2noodVolpcS
	bDjhhaTvBjWVCi3Q8lriRq9iYUzVJgQuoVDmOEh2kfU4hYForP/Fzr
X-Received: by 2002:a05:600c:35c1:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-48526964c8fmr153289395e9.25.1772998066195;
        Sun, 08 Mar 2026 12:27:46 -0700 (PDT)
Received: from localhost.localdomain ([84.78.248.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852378e700sm119168485e9.0.2026.03.08.12.27.43
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:27:45 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Subject: [PATCH 0/4] staging: rtl8723bs: CamelCase cleanup series
Date: Sun,  8 Mar 2026 20:27:15 +0100
Message-ID: <20260308192734.186757-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes CamelCase and Hungarian notation warnings reported by
checkpatch.pl for the rtl8723bs driver.

Jose A. Perez de Azpillaga (4):
  staging: rtl8723bs: remove Hungarian notation from booleans
  staging: rtl8723bs: rename hal_btcoex functions to snake_case
  staging: rtl8723bs: fix CamelCase in power management logic
  staging: rtl8723bs: fix CamelCase in security identifiers

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  10 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |   4 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  18 +--
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |   2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  26 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  32 ++---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 130 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  20 +--
 drivers/staging/rtl8723bs/core/rtw_security.c |   4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   4 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |  12 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |   2 +-
 drivers/staging/rtl8723bs/hal/odm.c           |   2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  16 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |   2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  10 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |   4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  14 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |   2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  14 +-
 .../staging/rtl8723bs/include/hal_btcoex.h    |  12 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |   2 +-
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  14 +-
 .../staging/rtl8723bs/include/rtw_security.h  |   8 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  42 +++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  38 ++---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  14 +-
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  32 ++---
 28 files changed, 245 insertions(+), 245 deletions(-)

--
2.53.0

