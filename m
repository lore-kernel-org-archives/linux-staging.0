Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1F12AF1D
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 04:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778300599; cv=none; b=JWiQnOHlHzI52mstcm2Ogpvv3lb13J567OCxwPXoR/LijV9e6qZSicQFa0EC603DhB4gf3r4esIn/reDX/E6RkCnEaZ723RfX/mRi3XbwDlowO+7AjIkHF3H/kPIFqt1wyNE8IoPPPp4NHw7shauU8bsgd6eaJ0GZPuxE2fAaLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778300599; c=relaxed/simple;
	bh=kZA7urSYS5Wgt4Zbm9v8JFwDQV3nMJJd4VIURCeNE6U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hW/5CxFWb2DHo3p18QBTP3Zoam4YO7T/HHdVvVNx/naI8/vysJJQgnidQxvPU+8tJyCFHlY4PbPK+aNqQuYNnmHXNvgqjMVuAVLIJ5GfV1nFbduy9a6qz03NbW+vczadd4zhSMajQzfduLe/TrVETRz7TzUhnD4djPt4ZiRx+Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzbNSZ3v; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzbNSZ3v"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f33ae12f97so2003614eec.1
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 21:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778300597; x=1778905397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOcTnyjqqrCWsWwBm0ZIbkmix0CeLTXmxB+5eE/J0Xo=;
        b=PzbNSZ3vNd6DZbX0/8oRtqa2kxeHmceVL+H6TCMvii6O/Jr3F1nuZzm00VgBvxm11+
         U8liKwnlg4pspOTtMjXSq4+IsuYi2sbLyQvoiTrCxlk0PIOljOelWBoa+sQD4km6+b9V
         2rWUq1H4sjA7friYr/3ufNmYZzVYtJ9wawAR3QV9WO+/wohFdX+mLksEMVG51biC2aYV
         j1MwVdIAsPbrniJFp15wx2IXH4JBvRXB0VDHfiS4cTki0uoZ2jNHaCCMSTk9nlrW2rB1
         e4I3Rb7FLeLsm9W5ABll0nRXHcx3rOvhvs/M13PZizYm4lzbqnjtsTkciIO6o5sJoJ1+
         Xrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778300597; x=1778905397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOcTnyjqqrCWsWwBm0ZIbkmix0CeLTXmxB+5eE/J0Xo=;
        b=dwHcFenpHRgCQwIj3H+poFwwpEe/eBjWXUSfMAf7tZmxgsHC5jNzpwpa9a/KKQBm/G
         YEDMQ/eSOXu1I3037JrtWcNwBLtuKfr8gjBM1/O0vHFuCspBIW3XNVMpA19GfG1Khhvr
         hnBOhIlo7zN9emiEJqTSDGE9J7iy8lkrFqpKEgSDE/DT9rI2Dlj/r+BnwnkhQC1vmkB9
         dewkgZU95q0d3jbyuqQUwQH3eVowfNQI9Vim+S4/5wLb3wrxClNQ3sN+FALaewCRhFre
         Yz2ZPvBZe+SgJtElekB8r76IbVhfefqt3rZpgXrtIOcwlGzxWrDeyKMhrRGMkpGRR+OR
         Vvxw==
X-Gm-Message-State: AOJu0YwDPX+GCA30xCczjN/YQFii/7UTgHRF4nMRpPAsGNAS2/4X5bem
	ByXsXF4bw/YhROQ8TGQCT8HV7hcmXpm0WCDLCBU07frGlY+gGx4vJLwkCeclEQ==
X-Gm-Gg: Acq92OFYsD4mFyrwdauim9H0jtAu9/lPfY1gq17UsHeF6q0gqQJjvLcpcGjTPCrPpJw
	MFe+jUag5awhgA4BJxSY8pQ1onDYsPZJIa0xVrKNKr6HlPgcM6483+/1eXGTR/XyiwkIBWMkPqx
	PvCxaIESWW4KHgp4spv36sH9QbKTGHDuf5+U53R34UGkG+XJvDdujZwB7g79oNp63W8H6A0591W
	uuzrzI3DAuOeMulxnHX8wAhxTAhLlDys5iyj4HZ6Ll1w5g5Qun/whK7A0eRtrFhoIWhYlkZUnXT
	iPR1egJHnL/FVvKZkOJJsI03NAPioPFm+cZtLDxyQqkKZHU2MkRr8xgkWj+tRth3sMwmUygS2j7
	ecjeXH9+Mow0NgFUj7M62KFYkHP7Qps62t0hhwj7hGG3F/68mUj9/kVyL2gh+KJEubWOB0KKUYP
	/1DVAjxB+hxL1mmhn1ku0zyedbUsjB1E9uwUiMaYUQ4Yw=
X-Received: by 2002:a05:7301:4088:b0:2ed:6f94:9d9f with SMTP id 5a478bee46e88-2f85c07ca45mr2936995eec.11.1778300596474;
        Fri, 08 May 2026 21:23:16 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f8884750ffsm4950956eec.19.2026.05.08.21.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 21:23:15 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: block comment formatting fixes
Date: Fri,  8 May 2026 21:23:08 -0700
Message-Id: <20260509042310.4745-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset addresses two separate block comment related
checkpatch.pl warnings in hal/ source files.

No functional changes.

Jennifer Guo (2):
  staging: rtl8723bs: fix block comment alignment in hal/ source files
  staging: rtl8723bs: move block comment terminator to new line

 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  3 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       | 28 ++++++++--------
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  6 ++--
 drivers/staging/rtl8723bs/hal/odm.c           | 32 +++++++++----------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 14 ++++----
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  5 +--
 6 files changed, 45 insertions(+), 43 deletions(-)

-- 
2.34.1

