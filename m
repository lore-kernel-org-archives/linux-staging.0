Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159333C73E3
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870971; cv=none; b=JO+mLAoXoWyrGbY2ZaJZzHpMEQY+VFn18pD5zWCn3yZMohU3M5oFjF29B44NJ+LO7/g/7QcC3RObu0PMlMpKDPbKSkc+MGFvygq7SQmFgthiwY/vh582nc4AeAEPDycDyBx36+8ZZNIGG6bpMtWFXedsTnkizOjK5p+yuNqyN5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870971; c=relaxed/simple;
	bh=GdB+GL7O5clIW0vHbdtrKq7eu1odnX0zuJZG04POA/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iY7aNtPXjKX75UvOyE4hyceoyoo/bb/WNnrA/ilpp07cgkcX4XMn+knugVGDSmPZi0MmbYcf+h3HMIjjhmA6GCdZAwI92c6fYU0+4dhtJ/CVvxX+FZvo+FBBufzQsNK9Jzh0o/BWgrR4TXwxDBMLX2gq+aJcEJUM/5SDuhKt+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mdCx1CjL; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CUBBzR4a; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mdCx1CjL";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CUBBzR4a"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4fkqB01R6szB0tF;
	Mon, 30 Mar 2026 13:42:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774870968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s1PfbvFfVicB7Eokwp2siWRx85LpBKLQEb0SMgHQwII=;
	b=mdCx1CjLCdt0R6Qd+mok3oJKi+qrsp2TTw0gZYeKjOE9eB0OtzBV08B0VVlMKZUWlvf+F2
	Re0XMaDdqKCFT9R+luDSkAJwHOkEMt6XaK/1I1CMDziDSt5gaHkIbkXwEUniVrsmYbUZOH
	GguY9KsnKZ9xU0YrcZel/MgXnXYEJrrLGanBtg34eqYJTiIqrTBN+YY4mFQqJb6R/p7Ooy
	lekw9NBan58+5za3NqO27k/I3iMY7kusGnK2fhF7tvDHAx3qT4q8OuteV+tEwKnhnXlW/m
	KbxjN9OmU7UP4SNvna81D9vRiAshtRZ3OmDJnWfT8/7cDxz+P0ZzBtlG7cyAsw==
From: Mashiro Chen <mashiro.chen@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774870967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s1PfbvFfVicB7Eokwp2siWRx85LpBKLQEb0SMgHQwII=;
	b=CUBBzR4aJbzuAkmKOCbVpLFsNAaJUxlLiRpOEhmNwvteqkhnVlfh4zNj/mhd8V7lyxF/tU
	7TZLj6ovoPGgX/Wzw03Z+JADoGz2WuRgaI9qPW0f/jxVnVC2QPVSh8HPXSUeOXwzGyTeQq
	HyRkTxlbTxPEsbZLdWFyR5DrkJb3hLIb6pHirfsYVj1rMaLH7yZde2JeO9ZkYPMQ1Fsnxr
	rlN8WHFdTJ3EGU1onsRKB/e+CYUTiKwpLrEIWvmMVj1D6iQ8wd8I7bR3qFcTH+LSaSgtaP
	YAPivXGq6MOujboq+2xKeKUJTamvx+PNPrNyh6/+OMJ7lJJqAIs7AxNEL+7rug==
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mashiro Chen <mashiro.chen@mailbox.org>
Subject: [PATCH v2 0/3] staging: rtl8723bs: macro fixes in basic_types.h
Date: Mon, 30 Mar 2026 19:42:29 +0800
Message-ID: <20260330114232.91431-1-mashiro.chen@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 896c6f1083caf852426
X-MBO-RS-META: 476z7mujrr3m1mr1nyaucrdj4bkqy4h5

This series addresses issues in the basic_types.h header of the
rtl8723bs driver.

In v2, patch 1 now removes all unused WRITEEF/READEF macros entirely
rather than fixing the latent bug, as suggested by Dan Carpenter.
The do-while cleanup patch from v1 is dropped since those macros no
longer exist.

Mashiro Chen (3):
  staging: rtl8723bs: remove unused WRITEEF/READEF byte macros
  staging: rtl8723bs: wrap complex macros with parentheses
  staging: rtl8723bs: remove redundant blank lines in basic_types.h

 .../staging/rtl8723bs/include/basic_types.h   | 38 +++----------------
 1 file changed, 6 insertions(+), 32 deletions(-)

-- 
2.53.0

