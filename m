Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476D13F43B
	for <linux-staging@lists.linux.dev>; Mon,  5 Aug 2024 06:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722840608; cv=none; b=l5XaSllamsQ2gEUtD9taQikL6C2iV5mC310IaAKC1CE8IOiT6kRpn065BaL9vjILCpqfKxJp6O6r5NOmGc5iqT796KV3J0fFELMYRTzWRV9FENelR6rjUBtJDvJmb3PfMZQjoQrASyatn6Bw6uAG1/SNZBk8nB0zAHPMytdmXYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722840608; c=relaxed/simple;
	bh=UF7et2QqACNgp6O1SUQXlgg+/VGMgi+IZGWPoTIYheU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vf8+zhfK4Oqgh64eGD0UR0tUsxmeH+0Sw2elqPenot7XLw9j6DWKrdVIwGK/K9yxWwDC4jVrTMfmt0VuFrui0dHY5mNNu5ug9LbQXoXdHdZ1Z+lMO5+yPKuc/DG9Pfu0xKlmErERT+RDrEZ1p2Hh8zuglH6U7vzWCKiSPW+MOo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ehzcHu/o; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ehzcHu/o"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id arOns5eD41n2IarOnsUUL2; Mon, 05 Aug 2024 08:40:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722840055;
	bh=bhu0kj/E+bTLzKxE31tljXZoIT0Y2DQ63u7XVU/JDPc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ehzcHu/oAgH+tJ/8KcriYSs256oALIWR7NiwC25+g8kjWSAuXtxBPK8jP6uoIWYEX
	 m8K9a8b+oSN0bX1ZgBFfvaWs6rZYxWOOpVkrGWsEvV6FUdXsJM7fMap3f6yPEVp7WQ
	 zU/SehWywmRy1ZoSMB27mvnmi9pt7nvyRpCGDEE2VIOZkMbhaDt0n/eAA0rVX7EYaG
	 vitndP/CswLd1ezgrPSET3uqUDBtWAmKJYaVC4bjFqSx9EADHBfB8iXf8buvw52QLc
	 21Xw1i4Lk3/ZTSEuKoPAUAWASMoK4EwJ9IJtyfzPJCJPicCvtcG9vnT8lTsf7xeLrq
	 1fdKgLL3K3WDQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 05 Aug 2024 08:40:55 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: stas.yakovlev@gmail.com,
	kvalo@kernel.org,
	gregkh@linuxfoundation.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-staging@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 0/3] Constify struct lib80211_crypto_ops
Date: Mon,  5 Aug 2024 08:40:36 +0200
Message-ID: <cover.1722839425.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
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


Each patch in the serie has been compile tested only.


Changes in v2:
  - patch 1: Update ipw2x00/libipw_wx.c as well   [Simon Horman]
  - patch 2, 3 : no changes


Christophe JAILLET (3):
  lib80211: Handle const struct lib80211_crypto_ops in lib80211
  lib80211: Constify struct lib80211_crypto_ops
  staging: rtl8192e: Constify struct lib80211_crypto_ops

 drivers/net/wireless/intel/ipw2x00/libipw_wx.c |  2 +-
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c   |  2 +-
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c   |  2 +-
 drivers/staging/rtl8192e/rtllib_crypt_wep.c    |  2 +-
 drivers/staging/rtl8192e/rtllib_wx.c           |  2 +-
 include/net/lib80211.h                         |  8 ++++----
 net/wireless/lib80211.c                        | 10 +++++-----
 net/wireless/lib80211_crypt_ccmp.c             |  2 +-
 net/wireless/lib80211_crypt_tkip.c             |  2 +-
 net/wireless/lib80211_crypt_wep.c              |  2 +-
 10 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.45.2

