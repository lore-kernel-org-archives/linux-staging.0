Received: from cvsmtppost04.nm.naver.com (cvsmtppost04.nm.naver.com [114.111.35.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6C4346780
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103700; cv=none; b=jH0T4KAOYEMfXtHHCtTB+xvM42Nxa2MmPyrUNrRBsIcqyNbH8ylJEgMmpt3Pa+BZ+QuV1MSxAKkgI+DFI8IKzS7PyBL3F3ePmn/bY6T1U7QFBiPrtvldsq+xSfCBDzs+6R2JcohE77KyErCLw16QMF279vAo0ZhazLDAYtKt7Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103700; c=relaxed/simple;
	bh=EXwzVZzGEM6K6o8R1iDXjDlmGy39UsWO9HFRgwRhLek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oxy7pIjtMblh+DCUJV+snH8IyPhVtTSBvVSGZmnCz+IKIDI788wJ50wkaxjUxzLil1hn8y7hm4zdq48xqJ9cZBWf7DIUo64m/LKp51X6soV81e8sZliWX5nLd11qstwoKd4geS2Jy/+7jPKnVljkAzN8LVf9ikWG37VAUv5GXwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=prYNuKY8; arc=none smtp.client-ip=114.111.35.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="prYNuKY8"
Received: from cvsendbo036.nm ([10.112.24.44])
  by cvsmtppost04.nm.naver.com with ESMTP id EN7iFkvvRemt1GYbWjxt1g
  for <linux-staging@lists.linux.dev>;
  Thu, 22 Jan 2026 17:41:29 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769103689; bh=EXwzVZzGEM6K6o8R1iDXjDlmGy39UsWO9HFRgwRhLek=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=prYNuKY86d0l+TfipLcAp+VVRjGA5DOAdpHo4jhFQwyvq1D8dzFgOvMZl4jSsUxUJ
	 JMURqavkDMb/K+JPqhcCceUoFdbZn9hI5cqHi3CuQrgRbDUyNKoQ3++wRlwafnzcJe
	 CJ8JflGWaoqZsgfHjBYLbCyhHfhoFRgSXSY3629ELwlkaUijt3xwdFGBCDgbdA7TPV
	 ZNOFHKCxY4ea3DEOHP9ZYqk6++ZtAI5R63qNNVzJIIkLq+KQgjo6sAUfc+VIeC6ct7
	 JM9abmZCzrWQT5V/Ulv/RTjy5HUwO+qnLPBzgciX6W1pL48yecc1TRX5wszBxL6Iwu
	 ElafDiXfITYSw==
X-Session-ID: j9FPNTKuQaCgILfLK-IKzQ
X-Works-Send-Opt: LdYwjAJYjHmZaAKqKBmmKxbwKqpYkEljxBmwjAg=
X-Works-Smtp-Source: QqYXKAvrFqJZ+Hm/aAUw+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp012.nm.naver.com with ESMTP id j9FPNTKuQaCgILfLK-IKzQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 22 Jan 2026 17:41:28 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andriy.shevchenko@linux.intel.com,
	abrahamadekunle50@gmail.com,
	zxcv2569763104@gmail.com,
	milospuric856@gmail.com,
	karanja99erick@gmail.com,
	weibu@redadmin.org,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v6 0/2] staging: rtl8723bs: Fix error handling in _rtw_pktfile_read() 
Date: Fri, 23 Jan 2026 02:41:23 +0900
Message-ID: <20260122174125.2567008-1-s9430939@naver.com>
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

In v6, I have reorganized the patches into a series of two to satisfy
both Greg and Dan's feedback:

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

Changes in v6:
    - Reorganized into a 2-patch series to maintain git bisect safety.
    - Combined function logic changes with caller updates into Patch 1.
    - Separated style cleanup (uint -> unsigned int) into Patch 2.

-- 
2.43.0

