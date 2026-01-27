Received: from cvsmtppost30.nm.naver.com (cvsmtppost30.nm.naver.com [114.111.35.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE1635D5E3
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 15:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528909; cv=none; b=D6VLY0MjQUOpLfhheTEl3UweD5OJlBqKGIhrOnnzpGECagga50292dbebsXexx1LezJZsqoyZ/J2pikVxDqPTNOCCKEhODouG3SbqWFOxEhSI5hy0cA3blCHJk5ENUciQQFfzXznFKtWHeRx52XwhFL0LztsSWiPKkHvOHlEwkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528909; c=relaxed/simple;
	bh=h7UTW8QXCmKcdfDXY1HjpuOX5Qj8UA85ztr05pX+lpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gu9yRul/2aYIn62hI9b11a8H1H00kQpXZfHpAskLevlYU8stS/hCcSaBODr2kjNFIgOcTegKUUCIzSooLZRysTAkwKDo/bSMaI4epd7zy3EzGo02IeonmJbsCN4PqK+SwBIyel4X2mzbDdtD0IHU1Vu3gCMTQK+qAUvHS+T44E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=IOWnPcDL; arc=none smtp.client-ip=114.111.35.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="IOWnPcDL"
Received: from mvsendbo36.nm ([10.179.40.218])
  by cvsmtppost30.nm.naver.com with ESMTP id xjbU0XxuQci2LtvR4kDtsg
  for <linux-staging@lists.linux.dev>;
  Tue, 27 Jan 2026 15:38:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769528298; bh=h7UTW8QXCmKcdfDXY1HjpuOX5Qj8UA85ztr05pX+lpw=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=IOWnPcDLxX/eSHVCK9Tkj119qcI/XFxfKDAzrMHc7xazNTJNivqaYU1sPBaoadGv4
	 amJJwWyBoK7WtAuJOPy3MhEla8E0H1mi86fNbvSE0zHXTzae0v2m/i/bqwWl3Wi4JM
	 H3srrZcyP1AqI/4JCKp4lsKglVEsdPainUDjOpTnJHk2yVb/TZFeIzY/rS1mOb+G/j
	 x3UdECGPtKhR2QjLfU2dQMfh1rJY3VuDgyu7i9U39yB+sugIcyqq6dhl3xDz508ajE
	 Nb8lGDE7ZaLU6T/CZokT/3jsH+NiSz1MhgKrs84RKUUYhJUjC6FXBMe5DeBcOAGUzP
	 rfxHers0TbhOQ==
X-Session-ID: GmfdGtF5RqasA8Z8VHSMdQ
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: urblFAvrFqJZ+HmXax29+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp006.nm.naver.com with ESMTP id GmfdGtF5RqasA8Z8VHSMdQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 27 Jan 2026 15:38:17 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com,
	milospuric856@gmail.com,
	karanja99erick@gmail.com,
	weibu@redadmin.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v8 0/2] staging: rtl8723bs: Fix error handling in _rtw_pktfile_read() 
Date: Wed, 28 Jan 2026 00:38:08 +0900
Message-ID: <20260127153811.1592900-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves error handling in _rtw_pktfile_read() and cleans up
the code style to comply with kernel standards.

1. The first patch combines the logic change and caller updates.
   The function change and the caller updates must be in the same
   patch. If they are separated, the code will not work correctly 
   or will cause errors at that specific point in the history.

2. The second patch focuses purely on code style cleanup (changing uint
   to unsigned int) as requested by Andy Shevchenko.

Regarding the logic change in _rtw_pktfile_read():

    The original code used a ternary operator to read whatever data was 
    available, even if it was less than requested. This could lead to 
    callers processing incomplete data without knowing it.

    I have changed this to return -EINVAL when the remaining data is insufficient. 
    This is safer because most callers expect the exact amount of data and 
    should not proceed with a partial read.

Testing and Verification:

    I do not have access to the physical RTL8723BS hardware. However, I have
    performed a rigorous manual audit of the data path and verified the
    changes using Smatch static analysis. The analysis confirmed that no
    new warnings or logical regressions were introduced in the modified files.

Changes in v8:
    - Rebased on top of staging-next to resolve conflicts.

Changes in v7:
    - Added full cumulative changelog from v2 to v7 as requested by Greg KH.
    - Added note regarding hardware testing and Smatch verification results.

Changes in v6:
   - Reorganized into a 2-patch series to maintain git bisect safety
     (addressed Dan Carpenter's feedback).
   - Combined function logic changes with caller updates into Patch 1.
   - Separated style cleanup (uint -> unsigned int) into Patch 2.

Changes in v5:
   - Split the patch into a 3-patch series (suggested by Greg KH).
   - Patch 1: Refactored return type to 'int'.
   - Patch 2: Added error checks to call sites.
   - Patch 3: Implemented -EINVAL logic.
   (Note: Superseded by v6 to fix git bisect issues).

Changes in v4:
   - Modified _rtw_pktfile_read() to return -EINVAL if data is
     insufficient (following Greg KH's hint).
   - Replaced 'uint' with 'unsigned int' (suggested by Andy Shevchenko).
   - Removed redundant local variable 'len'.

Changes in v3:
   - Updated set_qos() from void to int (suggested by Greg KH, Dan Carpenter).
   - Fixed coding style issues (suggested by Andy Shevchenko).

Changes in v2:
   - Added check for skb_copy_bits() return value.

Minu Jin (2):
  staging: rtl8723bs: update _rtw_pktfile_read() to return error codes
  staging: rtl8723bs: clean up _rtw_pktfile_read()

 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 44 ++++++++++++++-----
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  6 +--
 .../staging/rtl8723bs/include/xmit_osdep.h    |  2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 21 +++++----
 4 files changed, 50 insertions(+), 23 deletions(-)

-- 
2.43.0

