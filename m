Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5C37C0F3
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837214; cv=none; b=ISq7aqakUIOBxx/BD5380EK2kvFfOkXtV12JC4RWSr3R1RLWtLmlu6FiPY8YtGtF54ieGfIkRqJqk+Icj3FTwyyP6CUUNBuErOEhLu964JorSDDOirIZkIoNsDpw8sXGdK3GHItPE9H4axA91e1+CTyJlBX7va7r/oapvEETayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837214; c=relaxed/simple;
	bh=ZAbwiQHi+iE8yUSF8CiWH5HY29xfqCf1dJqHsWWir9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OGCv7t3ZConNlTfn3k16ZwP9+XIVJZDQ72mgW4KH3eW3tuLkPXcEvlC9NzEvB6bDEjvzj5m7chJU2SXjmUNsUufy40UQxW21fNK+re6BojlVvdF6ImwHvsrK626BEJ5RFfq0HyNwgmKPsqXBIthSAvMx4M/7hxxIdvFd0f7UTQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Hj8TaIjf; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Hj8TaIjf"
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4gqTGt2NPzzDqSl
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1782837206; bh=50HnRUI+A+3GORVq3GhGuza5shFoWikYoKOHo/zrCwU=;
	h=From:To:Cc:Subject:Date:From;
	b=Hj8TaIjflD/H7wNB1bXe67sFRC3rfVXTjkpksocY+2hPmSm0H1Xog8xowI32KUXpO
	 xGjTLKX4o4Y8HWjkn8oAPRYEh+a6BTSHaCWzQZF49HV5tNra2Ut2fW1qG5h0FW1dwY
	 zO/BhcYW5T9rPir6dQ6EbyspkmFL4ZK5/A7iqcYw=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4gqTGm0QZ5z9sVd;
	Tue, 30 Jun 2026 16:33:20 +0000 (UTC)
X-Riseup-User-ID: 6698835F2DE288BF4F6A8EA919D6F0DFB875FE5FBCDBFD7C82C5DEE30D17AC5D
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4gqTGl2rQCz1yhr;
	Tue, 30 Jun 2026 16:33:19 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH 0/6] staging: rtl8723bs: style fixes for rtl8723bs_cmd.c
Date: Tue, 30 Jun 2026 17:33:10 +0100
Message-ID: <20260630163316.1128319-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans multiple style errors flagged by checkpatch.pl
script. None of it changes functionality.

Alonso Garrigues (6):
  staging: rtl8723bs: remove dead code block in rtl8723bs_cmd.c
  staging: rtl8723bs: correct binary operator style in rtl8723bs_cmd.c
  staging: rtl8723bs: fix lines ending in '(' in rtl8723b_cmd.c
  staging: rtl8723bs: remove dead code in rtl8723b_cmd.c
  staging: rtl8723bs: remove unnecessary parentheses in rtl8723b_cmd.c
  staging: rtl8723bs: Add braces to if statement in rtl8723bs_cmd.c

 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 246 +++++++++----------
 1 file changed, 110 insertions(+), 136 deletions(-)

-- 
2.54.0

