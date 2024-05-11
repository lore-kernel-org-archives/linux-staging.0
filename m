Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1401BC3F
	for <linux-staging@lists.linux.dev>; Sat, 11 May 2024 16:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715445251; cv=none; b=a+2dwYK9ocYQMgeb2UOfBG2KlYSLYHTxKwzCAGBk3Behp2bIlvL1RYp3I0tInzN52zlQzM7PoLzXg7u0wXpdeazNfJTLV54bFV4iMFPS3HP0slOHrvEQR3DLRpU5dL/fGHKsrYELMe3lH1TU7Q+V8wbUB/NWVJaegtSmJWWZ35w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715445251; c=relaxed/simple;
	bh=Iv617nSHxfFn8mG/1prVYlXPiE/zW6Z5PPRt+mc8e50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptw99hkjbwjIPVLLxGfpVRXLAxy9CZrTAI2r6kC/B3P2qaT6xZXER0x6LEmGrbt0peQs8Kt/c4cOlsdw+nwXBZKGHxd2JhdPoKDZKAxGepc7XDUi5IZb+oUueCCJTQ0mdyW9rjx3H8rXX+uDhTKCJrLGgR/4xb5lIOp9Is08Vcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=XDymT0I1; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="XDymT0I1"
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 5peUsjqa5MXQT5peUssoYd; Sat, 11 May 2024 18:32:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715445172;
	bh=3b7/z6XLiDoS2qLZLRUO85qwKU6ZlvHpSybGTWjg1HM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XDymT0I1WGs+i/KIj4lSkhEw4cQqjWvpGW9hwM0sU/4HQVUtZ8ItkzlIL1ZrWgkjJ
	 lhvhAkO9YYd5ePvexnNS6fXCj2zizb8fYaRjDAA+0yKspCvmN3ai/iEjwV+Fplkx+G
	 WbNO2QJscGsxngGerrwMOw1CGMSFQF5wJOz8SO/2Qsx+6eyg8RBu3l3CQJFe3NM433
	 xF63Kz9FLvPb+r4uF6enBEeTDPbdvVYezwFokJB+Ha8bPwjOrDM9shq82gSuYaIKmT
	 nroEYTQwu1JnuRibM1h+6A2k1IN75qM9UzLY1A6ChP+c5NrxpjXdvWb9/V8xxdl7NO
	 71QXGnhnKRv4A==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 11 May 2024 18:32:52 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: gregkh@linuxfoundation.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	johannes@sipsolutions.net,
	philipp.g.hortmann@gmail.com,
	tdavies@darkphysics.net,
	garyrookard@fastmail.org,
	straube.linux@gmail.com
Cc: linux-staging@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/3] lib80211: Constify struct lib80211_crypto_ops
Date: Sat, 11 May 2024 18:32:37 +0200
Message-ID: <cover.1715443223.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This serie constify struct lib80211_crypto_ops. This sutructure is
mostly some function pointers, so having it in a read-only section
when possible is safer.


The 1st patch, update some function prototypes and data structures in
lib80211.

The 2nd patch constifies some struct lib80211_crypto_ops in lib80211.
This moves some data to a read-only section, so increase overall
security.

The 3rd patch does the same for staging/rtl8192e.

Note that the functions have looked in staging/rtl8192e look really
similar to the ones in lib80211. Maybe it could be removed in favor of
the latter.


Each patch in the serie has been compile tested ony.

Christophe JAILLET (3):
  lib80211: Handle const struct lib80211_crypto_ops in lib80211
  lib80211: Constify struct lib80211_crypto_ops
  staging: rtl8192e: Constify struct lib80211_crypto_ops

 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c |  2 +-
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c |  2 +-
 drivers/staging/rtl8192e/rtllib_crypt_wep.c  |  2 +-
 drivers/staging/rtl8192e/rtllib_wx.c         |  2 +-
 include/net/lib80211.h                       |  8 ++++----
 net/wireless/lib80211.c                      | 10 +++++-----
 net/wireless/lib80211_crypt_ccmp.c           |  2 +-
 net/wireless/lib80211_crypt_tkip.c           |  2 +-
 net/wireless/lib80211_crypt_wep.c            |  2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.45.0

