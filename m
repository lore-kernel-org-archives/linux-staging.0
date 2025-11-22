Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9561A23A0
	for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833571; cv=none; b=JZaeXP7ZdEuBofV++5xlf8DKkWAK5M54JHq61GCGRWfColJwOHn0Wmoo5T8mhe/pWqxrtJkeHnCEMAo3DkoKpp54uWW1IC1SSrCfxPRkEYCNHtpmUErDlKOUK8gDne0OeuIqmShNf3xEul2PNA++3Lg/fEidaISZRFQzFeIC6Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833571; c=relaxed/simple;
	bh=Cze+ZB6ej8lL8zqq8khA2hKPtx2DesfChZXAVRer2Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fca2xDuEiNPahoqkpUzBTilFcrOyAN11GubUI6OaeFox6+0J97Xzc2i+WgO7D8LU7U5dkUdXYvWQY9wpU7g4dIy3uJBvNBtf1ZS0dPEIRz7vu1Ppa/UqlNhwuhV2fIiEQOug9ZZ1hk3+nnr/QZYJUpvf61q7nHZDrix/qf22Q6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVK5sWqk; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVK5sWqk"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29555b384acso37760585ad.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 09:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763833568; x=1764438368; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn2B8NHv2HKTuXlBgh8H5DUX0/x6jnbnwpB8eDb6pPs=;
        b=UVK5sWqkRzHHYQI+Tb7iJGwaFeWNx8AP6gfp/1cWTh1ztVyO8TrMx6UtWHyQJsUMOd
         0ix0DWdlvhjhff7UnaYWeMI9hgHcyO7tHN0m8B69arOBzdeo5AichGU6XQcMPOmEfKAq
         M2pW24LzpByRAfDF8XFZwv4Kb/WQNzV8qMEp/JeGlE8KzIxW44+npvZ8us3M0YN11zZ/
         Cb/CCNmXjwGPvpJ+aIR41cGoFKgTSHbgTRHSrStgQXYAfoD3FN2J3w+IOfJOxgip5BiI
         0r5xXO0/VC1ycAbrN2cBEmCItpWEsF/+JlZEWd3jFwa3pZnRpxuig8BYlSU2Egmxc9pe
         ElXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763833568; x=1764438368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zn2B8NHv2HKTuXlBgh8H5DUX0/x6jnbnwpB8eDb6pPs=;
        b=r4FDw1LKxaRBmPvgwk1fCaWtVGwHnqGIK048OUs6yET1Fvwksy4eXdsFrXxvXMtEfI
         UvDxzl18l3IU9PVoKtQmzN+RI/PmkobWWSkMxii52GRUVGZLKa9rXeXZXeK3es6ZhenL
         3MHSbMXc4ProsuJdA/jsC9k4kp4JnnWrLiVTP1s/PueDH/B+dIEj7sMoWogjVnyqVieE
         8rQlLPs5YnbCG2oHJ6T9aCVYaoWrIIKPqZ/8jq1pVP8mB3nzuNHDO43nMKr8Wx1uTZ96
         SqPozGQgjh3u4mGOfaS5DLI/rnokTnMT/0bXk4jTwdfPgtWqzxr4mzpm/If3+238VtTj
         /jWQ==
X-Gm-Message-State: AOJu0Yy0Hcw45uyQGHJ7wGQQ8TOF8keaD673s+/yUBOowhlm2WvOFvOu
	iR6sv108Gy/C5C22ABztNI8gujt0f3UR35Cz7L0nWjLycSIsOS1g9hR2
X-Gm-Gg: ASbGncsJV2nOlfYpPXOBeZDReQXVrxTY4nluK0sHlOT4jYBodomwmveGaLnymPYLSAv
	BRnVIS0qJKbRGHQWw/J0DbGLhauP7udZhglcNr7b4Cil6+XalVLbxKukCX73c+ib/x9e+HxbqOb
	CnZRDhnPiDAO8fealNOVabUl+t9ElAn2OZB2XfdViBbJBsxDNEmPRoD50LMpzcBFsJ2pwRFa8P3
	f8ecNloMavFJBo2cUrOFyTN1vXJ5QkrRK4/HPdjFWW2CbcSWKPkI8WUmzeR1mRC0eC+T93vQMkW
	jiLwlikDWXZE9/VAZTah/v4cdIeZLIPLazMGooMyWDJxYEXPHTx4vtSnKBfFyvPoHWkF/1OTYKR
	mtVpAGIJT0pmuqE15DouA8j5NoIt/AxEkVQcWcp1Qb7Q2pmAtXvU5GbJZQPW/Wr13uuth3kBRZP
	uePLmn0/wIqnb6CxJiTxZ4y92kbVZp6O7BF206D8pPZZ5mOsXtmayxIVEW06E9czKtJcP2bXN1q
	t6tlyDswm4ryfsVV2Y=
X-Google-Smtp-Source: AGHT+IEFTt+iW6URHu6MNlk1VsTIMvGGs93VU839g8Wv0k3AmDxd4ATHSrrBA5t3yMLclq1O+lPYnQ==
X-Received: by 2002:a17:903:234a:b0:299:fc47:d7e3 with SMTP id d9443c01a7336-29b6c57224emr76765545ad.31.1763833567910;
        Sat, 22 Nov 2025 09:46:07 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a80csm90186085ad.35.2025.11.22.09.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:46:07 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH 0/5] staging: rtl8723bs: remove custom FIELD_OFFSET macro and dead code
Date: Sat, 22 Nov 2025 17:45:50 +0000
Message-ID: <20251122174555.215109-1-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series performs cleanup on the rtl8723bs staging driver to align
with kernel coding standards.

The driver defined a custom macro `FIELD_OFFSET` which duplicated the
functionality of the standard `offsetof()` macro. This series replaces
all usages of the custom macro with the standard one and removes the
redundant definition.

Additionally, this series removes dead commented-out code in `odm.c`
that referenced unsupported chips (RTL8723A/RTL8188E).

All patches checkpatch clean.

Navaneeth K (5):
  staging: rtl8723bs: remove custom FIELD_OFFSET macro
  staging: rtl8723bs: replace FIELD_OFFSET usage with offsetof
  staging: rtl8723bs: use standard offsetof in cfg80211 operations
  staging: rtl8723bs: remove dead code from odm.c
  staging: rtl8723bs: use offsetof in rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 4 ++--
 drivers/staging/rtl8723bs/hal/odm.c               | 4 ----
 drivers/staging/rtl8723bs/include/basic_types.h   | 3 +--
 drivers/staging/rtl8723bs/include/drv_types.h     | 4 ++--
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 ++-
 5 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.43.0

