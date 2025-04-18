Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F61E884
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990949; cv=none; b=k0cHv5MfytWrAmavvmc0AL2x/i83IMRk8aVHCjItK/zTZ3NV3EgDrizi0A0V12tVvIL/byC9EusS/mf4qHGWHu7KYmuWQzuJBjN18wktfMWsZyKMj4nM0gpqpKdqvdBGkquHRXz5K9ZHmoKRi4R4hmqhqOd/IbaXbXzmHhSUQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990949; c=relaxed/simple;
	bh=8e7pbQ2bTA4lrV+RYiGKF2Y3SlI9gzWDTtVmcFDC2Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s0eAklmxAsgND2iMNDX/JGPOHCtWZhY4Hqv8yV/uE32LL/yce2W9Y2mQjIVHv1O4q4WcmOcJiQalnvAtm6bglwYBEJFsQgQoYGzCUbd28sd+DMZmS5O3h9gQr/ny7WNEaswXA2qBM1Lbb+hcWzzZycbGiqiX4Ieny5BMpYCKBlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUdf77dh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUdf77dh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so16999555e9.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990946; x=1745595746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swXOeOrGvU16YEKC9rgfXZITAmlWOeSfggI4AmHPyYs=;
        b=YUdf77dhbhnfVlSqFcbz2UDvO+7AVbm+j9xzxm6w1XnjcXwfcjliwXjr3Tp7k/oJZT
         tM4h3P/er1+mSrXdTWtoy/3Irhhm3PDOX40wr0sPxF49FeDfheaITiwYYQ4S5FJeoiek
         NpNFieO3M5lB6+Q4/Y5JYk9B8a9i1qOQLtiRfYrOfuqc331xdJquFD1e3oDlj8AjmOGG
         mOrKvt8vPTFDUxuR3pfVLVSJYwa5gQxkHD1ETKxrKW3to82BYKTH+xCEs0o2Tz0zO5po
         ONll20dO2GFMaPnuCPSCKR/tDR9WNSAmfehObMV3ipJU/OXMz6KOwhfqzFs/ar0YGUgQ
         6GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990946; x=1745595746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swXOeOrGvU16YEKC9rgfXZITAmlWOeSfggI4AmHPyYs=;
        b=Q5RS/yV8LL/mAmtRp11G7GmcmOW8X7s+MEw73N8cM4C25JmTcbc2GEELV7pLAZZN2O
         EXGvSYQ1Oe7e5gvs/b6ZeGWi0f0UQjNaWLgd+/XwxKppTgv5E3ldM6H5VaiVow7hih7w
         YlVQT3fNDT7o8rpjBFHRyrDmMaS73pQsWlO5tc0c+cYO2x9vpjtsLb2Fncaf8algD3Zj
         YhsoZPkJiwiCsJ1k/LFXoQKUB680604yyT+JZkBlXGT0hPRKPvPAThA/HcDtWoohmSc5
         tWzXWU1xcCX+QF/QcHXwQQ6ZysAGjupEVj4g5ooullEh/mo7+/k5uvuzp9eMyP6ibK/f
         b6zw==
X-Forwarded-Encrypted: i=1; AJvYcCUjOUoPvxEiSh/Yv0ov7nxSXGRMGMqJKhB+BhgwzjgioKhJeQFOjbl2ZINdrNyAFgcHntpIu6ZlWm0LEt5r@lists.linux.dev
X-Gm-Message-State: AOJu0YxMYqiCZ1xs8WulnBN1EWvx3cEqqKnBoDBEj1JL0Leon8YGHCXM
	Xe9jLJWVrpdNG3yJdy9iuTVLkbjgx1h4oIwZF/c4esfHv+6xrdNo
X-Gm-Gg: ASbGncvZEijUM58zkopn6AFdhnoB21G3GX9A7aJz0j0F7d/+HkwP+QrEFbrBtPELBqE
	Tg/Kp8Q+U5o7pFl+mAxupHazXGAYegRNUwG9nNLfH+UbSeLuMwQ/w1NppTVQWztbJlPDcylZMt3
	mbriuOFKG2xxTWYAeX6F3w0sPYvF98nh64++CbLqlxX373F+I11/adQKflxcEsGWF4sIaSW9rvW
	002HRGlBgks90VGJGCOVNabFK5yZ7hn6sp9HLEQAHZTUuH0G68CzuuRHCIwwp8mFimSQyk9t5lu
	x8OSBZ3JtWxwkqkdk6wU5RjVZEIE59eWRpOFTw==
X-Google-Smtp-Source: AGHT+IHP1H8hH4FlWxzL+NEYXKcVuQYxizbv7WQN229jr3mrOiH4KUMIeR+Cmibpy0NJ8czxaCRnNw==
X-Received: by 2002:a05:600c:4e8d:b0:43d:1824:aadc with SMTP id 5b1f17b1804b1-4406ac616d8mr28402565e9.29.1744990945681;
        Fri, 18 Apr 2025 08:42:25 -0700 (PDT)
Received: from ubuntu ([102.88.77.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d03csm3160549f8f.59.2025.04.18.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:42:25 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: julia.lawall@inria.fr,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v6 0/2] Cleanup duplicate NULL tests on a value
Date: Fri, 18 Apr 2025 15:41:55 +0000
Message-Id: <cover.1744990405.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v5:
	- Splitted patch v4 into a patchset with two patches so as to
	 proper explanation of each change due to different code patterns
	 in the change as suggested by Julia Lawall.
	 - Modified commit messages in each patch to properly explain the changes
	 show the initial NULL tests on the value.
	 - Added Subject title to each patch to be specific to the value being NULL tested.
Changed in v4:
	- Separated initially integrated suggested change
	 "use modulo % 4096 over & 0xfff" to a different patch.
Changes in v3:
	- Changed other cases to use modulo (% 4096) over (& 0xofff).
	- Modified commit message to reflect these changes.
Changes in v2:
	- Dropped patch files for media drivers from patchset as it is
	  not meant for outreachy applicants.
	- Added full-stop aign to text in commit message.
	- Made code more readable by adding a line break.
	- Changed cases to use modulo (% 4096) over (& 0xfff).
Changes in v1
	- Patch for drivers/staging/media/av7110/sp8870.c and
	- drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
	  is split into two different patches in the patchset for use by the different
	  driver maintainers.
	- Added subject title for each of the separated patches.
	- Patch 1: Removed unnecessary curly braces {} initially inserted.
	- Patch 2: Unnecessary {} was also removed for v1.

Abraham Samuel Adekunle (2):
  staging: rtl8723bs: Remove duplicate NULL tests on pstat
  staging: rtl8723bs: Prevent duplicate NULL tests on psta pointer

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 62 +++++++++----------
 2 files changed, 31 insertions(+), 33 deletions(-)

-- 
2.34.1

