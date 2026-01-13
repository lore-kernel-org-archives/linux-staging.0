Received: from cvsmtppost25.nm.naver.com (cvsmtppost25.nm.naver.com [114.111.35.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95332773CB
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312135; cv=none; b=GPb+YI42x5QQgelsb/AvnDfJY4LOlyFDmbJq0fvfHpAlC0pMxqAWOm2F4/K89w37FrlHPfImZ74gsbwm/QAL1k0/3iNhHQrsN89yPiWToGezdyzvm/mFHJ4hrA0QY3hDZm89IF2n7mU5jEirFyxt1vMbrrFrrM6lPOGpHrZuAQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312135; c=relaxed/simple;
	bh=kV5Ikpx3ss+gKB6zXycrnUZOrz/M9XyrSskyShsLWqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fFV1Gj+Gf8QWLp195SMbf6n7Bat2LBWeZ7a8uxBxJOoAEZcKizlUhH52870XcgTyAPVgzZaXzlQMWWHC9G6jn7cYIjj/t1OdIrPCB169Ea4mF51TaXo4xvRKCtFn02ZaRiuM3lOLHpjBtO4GLhL9mziKBvpJnNspYbLkNmvdzHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=BXoLPwa0; arc=none smtp.client-ip=114.111.35.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="BXoLPwa0"
Received: from cvsendbo018.nm ([10.112.20.46])
  by cvsmtppost25.nm.naver.com with ESMTP id KHjlGLS1StGInIhgh8xX4g
  for <linux-staging@lists.linux.dev>;
  Tue, 13 Jan 2026 13:38:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1768311523; bh=kV5Ikpx3ss+gKB6zXycrnUZOrz/M9XyrSskyShsLWqc=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=BXoLPwa00lTVkMffnatbmdTOutD7bFJAdiXPomO1dkTeTYnBSU+PNnUxdXNaKJfHa
	 tCsNcJmq7XUqsmZnUp+gi76c2QHUvKuDuMmuENyR2sOkz9wL/31IRwftRl6w3ckAYX
	 MosT0n7YMRq7vPilDvLteY6cJ1SE0Ayud5C1Va5N5xDemLyE5cFACBsXJyCsZHmbGu
	 cQbJXSACVWvzzWQLLtwfOeEJzP8SEINN3x63skbYcezGGNdovb7IY4/R4a9fJa1Xwz
	 XSKfnLNP7WwQEr1DU3uio7GlK8HYMwjmwxCGAbRcAp8eynTF/zudlwYbPkao+kxo7a
	 yvpGgLaEWaVvA==
X-Session-ID: s6CJAD6sSQWMfy8u7SoAxQ
X-Works-Send-Opt: 6/Y9jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: fZYXKo2rFqJZ+HmqKoul+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp008.nm.naver.com with ESMTP id s6CJAD6sSQWMfy8u7SoAxQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 13 Jan 2026 13:38:43 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH 0/2] staging: axis-fifo: I/O accessor cleanups 
Date: Tue, 13 Jan 2026 22:38:29 +0900
Message-ID: <20260113133831.3422480-1-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors I/O access patterns in the axis-fifo driver
to improve code readability and align with kernel coding conventions.

Patch 1 introduces wrapper functions for single register access.
Patch 2 replaces manual loops with standard bulk I/O accessors.

No functional changes intended.

Minu Jin (2):
  staging: axis-fifo: Introduce helper functions for register access
  staging: axis-fifo: Use bulk I/O accessors for data transfers

 drivers/staging/axis-fifo/axis-fifo.c | 64 +++++++++++++++++----------
 1 file changed, 40 insertions(+), 24 deletions(-)

-- 
2.43.0

