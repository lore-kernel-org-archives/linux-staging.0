Received: from cvsmtppost08.nm.naver.com (cvsmtppost08.nm.naver.com [114.111.35.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B795E33B6C4
	for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445288; cv=none; b=pJpvMmgePudrlBh6NKzOV+BVKE0JQyLY3cO2Xi0ZAJkXeDVU1LC0xe3/CaAmY002DyykGNkaFTJJPmD7aB8wqgK833SfVCwC2JS2RkWw/H+gRuZ9rFfJvnn7dtHgiK8XiNdNKVYExJvfOljNl6ln5H1BtmTgbbflZfVkIkxY6Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445288; c=relaxed/simple;
	bh=tZxheq4maX4lgjp/EzuxKj6zzq1daRCf5TKigW/R/gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UREx0JIKkujZXpiNi3QLfx/Zxd8Ef+lxIQ02w05ghrS/OHjq63a0YAU/+kFwld4o9qyb2sembqwmLIgL7bw2MoNfUTuZH8dveNJqC657Jxqh5c9Q6Juflv85xjiDHTAvXaKikKIS9L5OiNMT/QGnsZgvJVqUrf+Bb46vQ9wUaio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=kxH5IkWs; arc=none smtp.client-ip=114.111.35.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="kxH5IkWs"
Received: from cvsendbo036.nm ([10.112.24.44])
  by cvsmtppost08.nm.naver.com with ESMTP id G59Z4MSMSriKG7xTr+oG0Q
  for <linux-staging@lists.linux.dev>;
  Mon, 26 Jan 2026 16:34:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769445279; bh=tZxheq4maX4lgjp/EzuxKj6zzq1daRCf5TKigW/R/gw=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=kxH5IkWsbckF0cZVKVwni0eHb8TJosCY2u7SpAkHazuyTJTZ0oqMtHnWvWPO7x/hk
	 z8T3pkGXTS8xasMpbCGEdJ1QegJ0lxQdrzJRsqZGdHvw6TaqBidAIcM5++sWjPGfqf
	 hr5EbMcKPy01NaM/uCHBek840LOpo3OREaFLwHAEiI+apgVi19svEHAsLGe+gz4cdD
	 1+9WAA8VHwF+sQJFarSpKTNA2+isUJYDE73BGnFGD6Ny2kYeC4V2WlY0zYMsk9JY7D
	 IF29Zgk2/V8HQNGHlanOXz+Hl24vpX6QAxrmTL98ohNQPtncfP1LFNKhMOngyD9W/a
	 MuFmo09jlWLew==
X-Session-ID: eghQv6MLS0mICKDXvqOwGg
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: Y9bwFAvrFqJZ+Hm/Fq2Z+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp007.nm.naver.com with ESMTP id eghQv6MLS0mICKDXvqOwGg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Mon, 26 Jan 2026 16:34:38 -0000
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
Subject: [PATCH v7 0/2] staging: rtl8723bs: Fix error handling in _rtw_pktfile_read()
Date: Tue, 27 Jan 2026 01:34:28 +0900
Message-ID: <20260126163430.3067008-1-s9430939@naver.com>
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

-- 
2.43.0

