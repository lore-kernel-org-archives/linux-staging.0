Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E3270ED7
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693059; cv=none; b=q4CjXF1xWpaPmEpsbIT47SUYF8Tdi0k81zA9vOEd3VBxsCByjgB+iP74mz9uscIMG4+XIXkJBscMSv3kZmoMwioMgmzh8gFHwjdhlFIAiTUEGmpVrae/ciWNMPL9OQ1oASpMgdG8DmlB5Wy6gF5EoUZFismMaGu6w16mYhzzozs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693059; c=relaxed/simple;
	bh=3R60NyR2bqPjZM4J8YaizxTs1ZsEx6zpcOnYFdSXiZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VuY71DcU1+XGxHvruDIY3xE8gtbQ0oA2pkGwLUvoGAlfEYLxcSS+I+CSkw/Cad0I2Wi61FZLXZDyQwQ7dFWEE7sAX1Dt7MQVRe+WKVbC5k89W3WfcRrEVrcK9H0Bb/iwDsmsEdafkqlHouNkwwRSBOkLlWZvTofBA0CGhDVWsWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7Hu8I45; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7Hu8I45"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee07570deso8189865e9.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 05:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769693056; x=1770297856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3u8mKltuBpkY8aldbJOj2Ri9zZxsG4XVbHIuPoOSKF4=;
        b=c7Hu8I45H3710rSAXMihEBSEZaFQbJphpLCtI0+1h8PE5+ngYXtOR0wAVCthlXEH91
         ukdfxwzK9a3bMxwe/JCLoTXnvBDBkAGmGLd0sif0gruE8VWtjtATaJaSF1bokuNv6yLI
         prtZfCDAjhGZQUIH0zMCJIqU+IV19203veiynSfQtA3RL/fgy95KuUVM2KJ5ZoiSvQPV
         j1XrJ7GfcobXQTfd+TFOlCdhWRGeRXYJdE/3QBxSyKv6eNDuQGPWV42Rg73UsJqhA31A
         +PxAloYBtvtEXzDlorjyZv0f2zyoulwCT1qH7lRvZIssUrl37lUHT66JOJf/obV0TGvv
         5PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693056; x=1770297856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u8mKltuBpkY8aldbJOj2Ri9zZxsG4XVbHIuPoOSKF4=;
        b=HMz8eLQ+FOFyDXYgttp0JuJ3kfYYimMhH0za/Uutmg0i3+MH8pFQrtNmXXLonq7lgR
         KV6H4e22SKozp0X0dWXhjQ37Q3Tqml6c1iPm2xSaq4eRlk2M5un0+BZn9VDJFC4yDXsc
         9sffulPmcLfnuL1IwPafxj245O+jXauLvjCFUlBIdF3XgcLHEFHR+L81E9ZqgSo3YO/D
         OwGJbW552E2F53QL4sT7PJXi/ILXpEgyzAqgpALgFEGBVKhw5TtHCrcK4NVLmBSS9gwE
         h7KfvQf8lnecNRLzf6rR6O7lijYChrMwCQ2nVqWb8qTdlJQdUwN5YjL3zHmz5ClYZsrf
         VykA==
X-Forwarded-Encrypted: i=1; AJvYcCXYMw67QZZfIHhKrE8YmCGo4DkEVbOm6Di/K8sq4yAZg93sDpr3v2/qEsWV0oiJAfJThEwC3Em/ONkym5xp@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2+0mJpMV36mCENENapqxwfHY1yU27i0vpafafVFnIjrApVn+8
	rebWIlyfzswh76QCi2s/yWU/tn6zhjyxPVTheq1BnkVq9DxAVbA1Y2I=
X-Gm-Gg: AZuq6aKS+zgrJCqtPyDZPLreMTfaUXVOabRlPZKJFrUpneRxEu4b/skaTd103loVqIv
	iKlssgui0cWkU5XGpiDsR0C/NixWzZ5as+vvq7WSFXM3bp+jU60yDOp9EGsli2SCfxLpVDGSUti
	wucaC+prhe1IV2nwBqc6Y84fdvrEtzAgyOZiiJOOiR0cQcIZHAI39ZL8YsYxBSWZSpSIf/9jGVi
	BKFpYJhuCO5K0th/yyYXLF5LT5uE75syppSNDaVOihW03AlwfDrR4Uk0HhbBcBKQmo/eGZb7Eij
	m13FgLDTtUb3mTYALBU1I/Npv1f30RCXkpfvzwBdAuS90Xmycy+oebHAuhPrHSlx8LZ7CNKnCl/
	q8uENG0LDN9CqZiFQ5ST2vOry0qjdzVFEidonV+uVB7lZkrctfrrX/Cdk/pRlwjl/e4FU+FVMZh
	VV
X-Received: by 2002:a05:600c:3b96:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-48069c37e2dmr122721475e9.9.1769693056125;
        Thu, 29 Jan 2026 05:24:16 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm217492315e9.1.2026.01.29.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:24:15 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v2 0/5] staging: rtl8723bs: Cleanups and security fix
Date: Thu, 29 Jan 2026 14:23:47 +0100
Message-ID: <20260129132352.14615-1-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors the rtl8723bs driver for better compliance with 
kernel coding standards and fixes a potential out-of-bounds read. 

Changes in v2:
Split u1bTmp rename and spacing fixes into two separate patches.
Split hex modernization and the WMM bugfix into two separate patches.
Added a Fixes: tag to the WMM bugfix (Patch 4).
Removed an unused variable and dead debugging code (Patch 5).

Luka Gejak (5):
  staging: rtl8723bs: rename u1bTmp to val
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
  staging: rtl8723bs: fix out-of-bounds check in rtw_restruct_wmm_ie
  staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  6 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  9 ------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 32 +++++++++----------
 4 files changed, 35 insertions(+), 44 deletions(-)

-- 
2.52.0

