Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DED3328EE
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609949; cv=none; b=uDzqGScQ0pmqTpQV5jF618nQOab5YZ+1qYUYbvws6iUajTTcEwJdVBmcKPudbVXrmogI2Ok9GaYIM+MhSOeKAH3WSKQ2+xFvkJGiB2KPmnQ6z5F5H72I+5GhQzHpdbXSXbGSMMiZ72FtjH4DFq37BnkrFYc7pgrirbogcLOZo4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609949; c=relaxed/simple;
	bh=K7RfB3+P7aBM2e5ZgfOAOsKSWHU1lDo9iEuTtJIUVes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+I7GPg4EHUZYicWxt7aFwGg5+VyayA7J4KSvqMdlOtrU+b4yVD8LBLO8XyI++w/kJsCb0xeLV6tLLWk2mEWS+atJRfRm2tjhLckwQwAPZgUXdG+bclrKCd2yoT9+uJ6AbTSSlDnAUP/bjuOH5JpicOhY9YBm+pYtb0orDpL3lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Z3CLPyQg; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Z3CLPyQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hM
	BIrglZLl2cr5F7X5Hu94a3U4hUWyo9xzTV6mqgXro=; b=Z3CLPyQgadFqHDbSkn
	cSEpMKgSvMWjPEmNBXsWmf98QmnVgX6W9mlG8r80hDqINhuNLUZUR0jXvNNN7NLE
	ivQOk1sIXcDFiFvYZOP8MUVaukVhEgqKzPT5HyKwlc7moPYqzGv5jYTtGfYrRmcE
	fKNHYqVdrzXJ7pRYTlcIz44zk=
Received: from outlook.com (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnpxI1lltpOgk_EA--.3518S2;
	Mon, 05 Jan 2026 18:45:16 +0800 (CST)
From: Holden Hsu <holden_hsu@163.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Holden Hsu <holden_hsu@163.com>
Subject: [PATCH 0/2] staging: greybus: arche-platform: minor cleanups
Date: Mon,  5 Jan 2026 02:45:03 -0800
Message-ID: <20260105104505.8120-1-holden_hsu@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnpxI1lltpOgk_EA--.3518S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUUXdbDUUUU
X-CM-SenderInfo: xkrovv5qbk23i6rwjhhfrp/xtbC+xzlt2lbljznKQAA3j

Holden Hsu (2):
  staging: greybus: arche-platform: clarify TODO comment
  staging: greybus: arche-platform: fix spelling mistake in comment

 drivers/staging/greybus/arche-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

