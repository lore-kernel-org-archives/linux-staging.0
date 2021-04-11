Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2BA6D00
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:28 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MKKIZ-1lGaYi1Kvv-00LoHF; Sun, 11 Apr 2021 20:12:23 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 00/10] staging: vchiq_core: improve code readability
Date: Sun, 11 Apr 2021 20:11:30 +0200
Message-Id: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:p/uzOoHMgdiiIkBFykZ7LeGVCK4DvUgyhkacKe5PXnmNg7BL9P1
 nsSz9JwfSOVWSqKPutbzWly74sp3cvq4M4x+B34JV2LFTYmCqvFtCpq9WknTQhlgWGiTEEu
 qnM12J5KfFSNCXgvyVhTxjfmKO/6RjBeybKlL+l93kNynFoZ3B+9WvdmKxroxY91HHq+og0
 tPNJgU39nZ0VjxgkPHDAg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SvQyoyjLqHo=:9BoyJ/V6AQKIEYH++hSGR+
 KJpkVkXV073+soklmjtlurR2ih3IovAkAY/bRFKIV02SXXGA642RFNgO7iWUUFLmiofWr/F13
 yUelE3JmqMPtSzcI5U1x5NHZzMzaW7Wk11/HnPvAtWhyxPP/RsdSNPu5mAUsWr5Zk+FpHna4f
 bO2pPmu0SGTVtwJi/ID47KG9ll0VfIAhkCqM2IM74yuWHyDbxv5G3bWeodMhvf53F8fnLelog
 qYzNLbnvJ/E5pJzeYve8TYaUPd1Ui52jy9fT4AlgGMpSK1E+CmlbthBgwUZLrwGS0jrtBIyk2
 oo3wqTcwW1kRe1Npv56FmuURHo9uxoY6FRRKKvctDK+Fgdt3FM7c+LjeYoGcqyBHtelr6xI/4
 LgrDBSls63jXC2VUSwJ0RkRNnD6uS7XGFaJVKrULBUux3AdFTZKg5wSnIqhzx7ntgX08/nhLi
 Y8hyEjMg9+hanYnZbp60gsUtaOfdQGqd9XYO8fJNarzwrkzJJQRQ
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This series mostly addresses the point "Reformat core code with more sane
indentations" from the TODO list.

Stefan Wahren (10):
  staging: vchiq_core: Simplify vchiq_send_remote_use*
  staging: vchiq_core: Shorten var name for service quota
  staging: vchiq_core: Get the rid off curly braces around cases
  staging: vchiq_core: Exit early in 2 functions
  staging: vchiq_core: introduce service skip
  staging: vchiq_core: improve readability of request_poll
  staging: vchiq_core: use BITSET_WORD macro
  staging: vchiq_core: introduce SLOT_QUEUE_INDEX_FROM_POS_MASKED
  staging: vchiq_core: fix if alignments
  staging: vchiq_core: split exit conditions

 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 360 +++++++++++----------
 1 file changed, 182 insertions(+), 178 deletions(-)

-- 
2.7.4

