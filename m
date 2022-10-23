Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A41362
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 17:08:25 +0000 (UTC)
Received: from ipservice-092-217-070-181.092.217.pools.vodafone-ip.de ([92.217.70.181] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1omeSN-0000Rj-Jk; Sun, 23 Oct 2022 19:08:15 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: some more small cleanups
Date: Sun, 23 Oct 2022 19:08:03 +0200
Message-Id: <20221023170808.46233-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another series with simple cleanups in several places.
Tested with EdimaxV2 on an arm32 system.

Martin Kaiser (5):
  staging: r8188eu: use standard multicast addr check
  staging: r8188eu: don't set pcmd_obj components to 0
  staging: r8188eu: NetworkTypeInUse is not in use
  staging: r8188eu: remove wait_ack param from _issue_probereq_p2p
  staging: r8188eu: bCardDisableWOHSM is write-only

 drivers/staging/r8188eu/core/rtw_mlme.c       | 16 ----------------
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 18 ++++--------------
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  2 +-
 drivers/staging/r8188eu/include/drv_types.h   |  1 -
 drivers/staging/r8188eu/include/wifi.h        |  5 -----
 drivers/staging/r8188eu/include/wlan_bssdef.h |  9 ---------
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  4 ----
 7 files changed, 5 insertions(+), 50 deletions(-)

-- 
2.30.2

