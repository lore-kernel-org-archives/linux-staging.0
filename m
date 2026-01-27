Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E23239E7D
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476898; cv=none; b=UIs1e74HjDPASG70s1MNSm/DJ6ZMgQOALECXzeHxFyL51tUVGA2fqqIbxhIsgrUdL3I8+Ra9FJ5AkB+YaHF1vY/ZbOebOU+QHriD4xtPIq2TX49ToCyFu+93t9VTVxtCyfBbmL8XjPD//CMm5N8WxxE/LH0s3u0qvCWUiwh7ZTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476898; c=relaxed/simple;
	bh=b9iQR0+gK+7D/3uKSACeiQB8Wt6yPbWFXAYNvYo/rBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iyy1smYn4Ciarz183LfxXeaGe/Er/D1WFJDu49924h9qWfz8h9lpqi6ZDfBS31Ba11z9F43BYq/oYg/QCf6huiKVFcwblozyp/PRt6sxPRfe9eA/untV1GfVDGxihilVl81p7S3cZ4OSWjVVegrgM6Bkom+Stk/z+ELpdDWEi4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwiUrK7t; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwiUrK7t"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79407df9391so53104777b3.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 17:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476896; x=1770081696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4v65tYL8/R5dIuprjnUyw8SrO/FYR6ClRfn88bEPYVI=;
        b=ZwiUrK7tojO08+WrlXO1FK8seSUVgRRVYIdFny+w8YH3vLyDu3Ybv5m5Zp+tkHgeBn
         028GjLxQygBxA6yMbIRrbpuXnaMzV43nhib6xP/OlPFyjf2yBnvEVkcu8Bk+7JyAW3X2
         WDzJLnkyk/eNcAdLX1iUiu0aa4MqXAPlS3VjQ38L2tuQAsBE3ryypgr2s3NHog2nLUlK
         ekpQBIPAGS78wMQU8oZoNIyKXR6autouLxeylA/z5RTvGJWcwVmwSL/x60fEU4ZLJ990
         HDb/8hBg5j0WXqmbMbw9CUS+boLrxPXcUoGxaqts+eXo1fTk1QoNKV8vbJjMrDHsTYiG
         7KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476896; x=1770081696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v65tYL8/R5dIuprjnUyw8SrO/FYR6ClRfn88bEPYVI=;
        b=UN/cOoJcc9zOlfKX4xi2HF687/5OUR4RKIhXiKhUn5C9+II/Imp0bpGv9PLq5qBYem
         BOTHt+e7xUg3KlX9FSnhbj/WZYabtvyyD/Forq66WRyE9dO4ePStR1rfzpRGe9zKcVuh
         6tXLKdnZq9x3qjPv250g1qVlpWiHcx7IJPvp+YGGOVo0VoXQXkHJhiyCLvm7YHvhh1co
         eayPlJBwNfxYMCsF+q0I2ikOs2zvrBkhaYh4DeD+IuzdgUvgU9+f2i9+1f5dbC0ydkbd
         MH5KcntvHmJ87bTQPF+HMXucFcAtVW/HcCru/UeaoeLkulcjTAWR4/bmsMDyp1Se5YVx
         pgeA==
X-Forwarded-Encrypted: i=1; AJvYcCWoUV7oPl+LcoQI0LbnMr7p0WyQ5ralwDWH9n4Z7vURv1PSgbKSXjItz9HaSPnIJN1IE4taHXCjPH+2DpBM@lists.linux.dev
X-Gm-Message-State: AOJu0YwkoF3+6zzhDRNLgL1WSPr1q/BQnnx8+yUfIp33+3i0x8T0oxXk
	CXReGE25e8ZRr6HjrjjmBzU8KSB3yp5Qx6JNk8gAppLhF6Haz1TCwL7n
X-Gm-Gg: AZuq6aK3q7hmV64BIbZNvTJDJk55WIL+WvhW2/Afjwlhnd9V3C7ZLaJBev2SMsnJ1To
	8pNIPKnXfpjIikRIgwo5dze25YoXQ5we7BcF1caLoQyH9n3J8kM8SJAw4d9Zrbivsj+rGrKrwBV
	ve5V10kwkbBbhcsLM55zaj2GtoMouNc7Lesg5apC3guguoQQ1HClbgw8tCoOpFDlvxlr4sWgAxL
	xnuDUcQbuHYAcLWzCH1DOghFJPc9y8VWx7xgWXnnPibWSBdySmnWLaOubLVgi6xWZDCTl8EjRdJ
	CTcFN3Kno8bc04exfSZbqmoHI2dk334hOX96HReC+I7J65N54HdLTJaIaOZPbD/wyEtLqkIIGhx
	caInQG0etjWfn+Jdf+Hxp7cYLd8G58c5UOzqj8IeXAMxuVOU7guBwbIIhunf4LXyXJQs=
X-Received: by 2002:a05:690c:6ac4:b0:78f:984b:4bb9 with SMTP id 00721157ae682-7945a9ca8b4mr54191367b3.56.1769476895832;
        Mon, 26 Jan 2026 17:21:35 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944c5c9b0bsm40189657b3.57.2026.01.26.17.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 17:21:35 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 0/8] staging: rtl8723bs: rename members of struct registry_priv and remove dead code
Date: Mon, 26 Jan 2026 19:21:10 -0600
Message-ID: <20260127012118.43037-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
  - Split the series into one logical change per patch as requested.
  - Removed unused variables (bEn_RFE, RFE_Type, etc.) instead of 
    renaming them, resolving the Hungarian notation issue.
  - Removed stray changes to function parameters to keep patches 
    focused on struct registry_priv members.

Ethan Tidmore (8):
  staging: rtl8723bs: rename RegEnableTxPowerLimit to
    reg_enable_tx_power_limit
  staging: rtl8723bs: rename RegEnableTxPowerByRate to
    reg_enable_tx_power_by_rate
  staging: rtl8723bs: rename RegPwrTblSel to reg_pwr_tbl_sel
  staging: rtl8723bs: remove unused variable TxBBSwing_2G
  staging: rtl8723bs: remove unused variable AmplifierType_2G
  staging: rtl8723bs: remove unused variable bEn_RFE
  staging: rtl8723bs: remove unused variable RFE_Type

 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 14 +++++----
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 31 ++++++++-----------
 drivers/staging/rtl8723bs/include/drv_types.h | 12 +++----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  9 ++----
 4 files changed, 28 insertions(+), 38 deletions(-)

-- 
2.52.0

