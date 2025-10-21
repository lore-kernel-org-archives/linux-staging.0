Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com [162.0.218.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD58204C36
	for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049040; cv=none; b=fjh0QNuoxs7GEaI4r628IJHuN0UNWcfziC11Oj915YF0dn2/cSHHrIBMvoM1fWE4wGm6kV5xmLqXBAubCYeDe7BvotKFb9iSVmjsIV5rU2VxL/HjdnC/iX+ZezCjPPrPm25Xs+G+AbkCHwHM81e3wVSC0Fk9hnWhehDY66PawrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049040; c=relaxed/simple;
	bh=AjtAVzZ3Sje4+V3a1+dfg9wxnVQ4DQmPTiWT948hQvQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FsRBAtbY0Yzdrci29mKqVjPewK9WAmy+bGEBoQV+up1/AcALyTzHMXcJWHrpM+N5R7LloRL1a3YbUuSpJUiVtzML3hf+IEV46/qI3EDkxWUpuuBMHGIS7W6hZxh4GTrIlNRbwZozXP+Ss/+aCMd+grTck+e6ylvz4deAmwPp5U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lukowski.dev; spf=pass smtp.mailfrom=lukowski.dev; dkim=pass (2048-bit key) header.d=lukowski.dev header.i=@lukowski.dev header.b=JDeIIVlA; arc=none smtp.client-ip=162.0.218.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lukowski.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lukowski.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lukowski.dev header.i=@lukowski.dev header.b="JDeIIVlA"
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com [198.54.118.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4crWWc1zlJz2xLW
	for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lukowski.dev;
	s=default; t=1761049027;
	bh=AjtAVzZ3Sje4+V3a1+dfg9wxnVQ4DQmPTiWT948hQvQ=;
	h=From:Subject:Date:To:Cc:From;
	b=JDeIIVlAOuUY/be2/fsTE4XrX1w2yextubr1RHurGg3E1sHPcaQKM6Xf2mMkuZMT6
	 krSSVFJc/3EatZ7PFCWeU3MTg39zq2oeOIX+v5aKQR7x4kPppLCKESyjg/HHArKO6w
	 nEwf0iaWP7RP2d7ELg2L5nJwASuUDEsbQ+Q2mZvoYom+I4ZOIwZgwret2mOftbwRNY
	 k6JQflvJaO/uYaFKAVqCw5NjwYpgi1MXNSmBlcMvy4OVYiSfdBvGidKvZVma9ZW7wO
	 By/VI6uIsMMTBx441Ke6095TPpBE6Jqc1iBAAEnC0leumdGN/f7rJhPXCAs3Bm2pgM
	 YXv675JMH1Cqw==
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
	by mta-08.privateemail.com (Postfix) with ESMTP id 4crWWR3shrz3hhTK;
	Tue, 21 Oct 2025 08:17:07 -0400 (EDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (unknown [150.228.61.72])
	by mta-08.privateemail.com (Postfix) with ESMTPA;
	Tue, 21 Oct 2025 08:16:59 -0400 (EDT)
From: Olle Lukowski <olle@lukowski.dev>
Subject: [PATCH 0/3] staging: most: replace BUG_ON() with WARN_ON_ONCE()
Date: Tue, 21 Oct 2025 15:16:26 +0300
Message-Id: <20251021-staging-most-warn-v1-0-4cdd3745bbdc@lukowski.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNtsYtXEYdoY81gK42oIN7d4
 viG/x9QLsIKffNA4VNUcqqwbQPzSikySqgGZ5y3xlnUg6KkiFvWAy8qCb0NPDnufEcEtdsLL3L
 /z2F83w9LhkrQYwAAAA==
X-Change-ID: 20251021-staging-most-warn-51deb2e454aa
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Olle Lukowski <olle@lukowski.dev>
X-Mailer: b4 0.14.3
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Queue-Id: 4crWWc1zlJz2xLW

This small series replaces BUG_ON() calls in three staging MOST drivers
with WARN_ON_ONCE() and appropriate error handling.

The affected drivers are:

  - drivers/staging/most/i2c/i2c.c
  - drivers/staging/most/dim2/dim2.c
  - drivers/staging/most/video/video.c

All changes are mechanical and do not alter runtime behavior, except that
the kernel will now log a warning instead of panicking if a driver
invariant is violated.

Tested with checkpatch.pl and compile-tested (make M=drivers/staging/most).

Signed-off-by: Olle Lukowski <olle@lukowski.dev>
---
Olle Lukowski (3):
      staging: most: i2c: replace BUG_ON() with WARN_ON_ONCE() and return error
      staging: most: dim2: replace BUG_ON() with WARN_ON_ONCE() and proper error returns
      staging: most: video: replace BUG_ON() with WARN_ON_ONCE()

 drivers/staging/most/dim2/dim2.c   | 27 +++++++++++++++++++--------
 drivers/staging/most/i2c/i2c.c     |  9 ++++++---
 drivers/staging/most/video/video.c |  2 +-
 3 files changed, 26 insertions(+), 12 deletions(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251021-staging-most-warn-51deb2e454aa

Best regards,
-- 
Olle Lukowski <olle@lukowski.dev>

