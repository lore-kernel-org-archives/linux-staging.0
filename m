Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5D4239E65
	for <linux-staging@lists.linux.dev>; Sun,  1 Feb 2026 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769945999; cv=none; b=obpA7dxC+eGjRkJ5iDHvnTkMb5DjoOv+cfEI81uowX9vuA4sLPa73kowpFMRNNNUarKS5FyRuEE2ml4f0DvBbTVwCKvC5IcrQ7B6QSgyDiM1ypUhHYRWhymQ42VzX+1OXDjxuBAFjuy4MHt04KvXolZbtic0qexqxj46vskhwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769945999; c=relaxed/simple;
	bh=S3Pf3+PCulECg62nn5Lr5sR5NNJQ3pTrzptgERD/8N0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QdLRiVC6Hcihr82zoPKMKAegWzXIhJi/vhX7049lo9NDHhIsAcG5YLv5gNi8yVdu+et3nGK7HyJGW9Z+s7EDynD8xARfipKLIU3VqVBKvXlNbmnVyU3AUrcJIFb7Zr5Qw3AZjJ6T6TVDkOkJQmrWjg0ZD/qW7VPLiHnEn9+IiUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBoXqrrs; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBoXqrrs"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a9057b2ec3so1670805ad.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 03:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769945997; x=1770550797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5CJglAFNDAjz3QuVtzdU4KsZoOw0uIp0h+o2m5ekNPU=;
        b=SBoXqrrs5UXzTIjlnAsE7E97O/yNdSOA+HQ+EAQHm8az+vcbF9Rez+gU8Y8ZZjZiTE
         jsBVhzDLEoTLsrV0Pb0fmRctmkTuyiptgOyN9lxKXvC29aNj2hoEFkM1zwa3txRCR1jo
         Dt5OIJA2hCScYNkSvRWtBEh1sHI3yOVO7nn32Pdzdtjt6z69emoDZdfvjoFbqKKLt1XV
         dHECa7ntC/vvHhnk/RqaFsXjB+odErGrFiWC1HtBL5QMF85qkjLCtZvYp+H1DYg2/1ID
         Ckd3mMquzXQZyvTdZomc7mlUH9P51BTD0oexmODqwB3msYzHtvC4jSF0Mxx/s3Th0sh7
         4iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769945997; x=1770550797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CJglAFNDAjz3QuVtzdU4KsZoOw0uIp0h+o2m5ekNPU=;
        b=UX3Fzrypsgf3P4aY4+aBI3JTVM6s6ouiXC0mpMpAbIB/Iwqz1mRBPCav8lUmrd5jgp
         kpon35nhdiv+I6MShoCUxhFDt4ejbO69FnodxZxiTm5A6AQ49uqLrbLed5gQ/4sMBVL6
         THhU2ttLRWbTPR3AppVxryrleIACKrzVq7vMaaDRGqAHJCALsyIqma3i47V4zBYgxL5r
         BsqSYd7AboC2vIFCk/1kWaJGR2HUTNwxm3TU7xt0HmJtXYtq372AH2vf2g3sCWZ/F4A1
         dVA1nqsOGbgQOGxjACXo52n0wCzcUMSsHM/3mGiqOFIWkL4BJqKRrOe/9nXPpsIMUAE0
         oMVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZi1LKEo7XRVJeHK8eIT3vdgYaNmtwgA9Qj7GbyAQGN9wRMSdMpRIvHj+k68i+W9c8eerbJ8f8MN1XzU2k@lists.linux.dev
X-Gm-Message-State: AOJu0YxX3neZLQIfRkp2mqq1RNrO9FhqO3x7x4u/kZc8ywu4azAh7tsF
	DYx56nidw5A4giLqAY/Ru9HpDwT04hfq5aFoQhZp73xiQoeVOAlwFzo5
X-Gm-Gg: AZuq6aIeEOmH3v89ZjEGheecyTRGWuA4fwHgbF/YlHDN8GNPo0e+ipWuVKLrfcsZhgW
	pS59O2fQNG5b5EO+S9zOF3IAWnYk8sFCQf0RlIo8sTu98ChCwKyWeNgWkuNN6KL2SEnnYEUin1l
	dkeE++QcprUNqXW+mZHXGiE9Yry4Kbgn/SBbh2MJE4Mup4VqpOaikRODN590l6SElR2SvqUcE/F
	jY5vKGYbr25eh2HD2ARUuywL3UkK3ZKEtPO0FjdZEP8AR8aqmbsCJtjZWfyUIyFOjq1A1XjlBH0
	BkihrBHArI/lzycHpE3Ycp4E2j8XgyHTb03SBQL48XvwSFnztXKYbs3pQuTC8jUENoBh73arV4s
	NdlEwuZHuIygwB6xkqrXg9O9Q3Qt3ENyqS1ZxZ83mIxJvML185j0je53hqAD7K5rhn5mU1I0xaM
	lrL7mV/6fJXKVvANOawvywmL3kKyo=
X-Received: by 2002:a17:903:1967:b0:2a3:bf5f:936b with SMTP id d9443c01a7336-2a8d96b11cfmr90667655ad.26.1769945997220;
        Sun, 01 Feb 2026 03:39:57 -0800 (PST)
Received: from snowman ([2401:4900:614d:8c00:9d3:b11e:236d:377a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f7caasm121156675ad.101.2026.02.01.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:39:56 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v6 0/4] staging: rtl8723bs: coding style and refactoring cleanups
Date: Sun,  1 Feb 2026 17:08:33 +0530
Message-ID: <20260201113837.8531-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs minor refactoring and coding style cleanups
across the rtl8723bs driver, addressing checkpatch.pl warnings.

---
Changelog:
v5 -> v6: Split LinkDetectInfo renaming and adddress checkpatch issues
in separate patches.
v4 -> v5: Rebased onto current staging-testing.
v3 -> v4: Updated rename scope, cleaned up formatting, comments, and
parentheses.
v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
v1 -> v2: Fixed incorrect commit messages.

Khushal Chitturi (4):
  staging: rtl8723bs: rename LinkDetectInfo and clean up related code
  staging: rtl8723bs: convert traffic status variables to bool
  staging: rtl8723bs: simplify boolean expressions
  staging: rtl8723bs: fix line length and alignment issues

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 104 ++++++------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  66 ++++----
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  21 ++-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  10 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |   4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 149 +++++++++++-------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   4 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  31 ++--
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  16 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |   8 +-
 13 files changed, 230 insertions(+), 193 deletions(-)

-- 
2.52.0

