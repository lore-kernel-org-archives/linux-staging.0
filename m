Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F917D4
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:01:38 +0000 (UTC)
Received: from dslb-188-096-151-149.188.096.pools.vodafone-ip.de ([188.96.151.149] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oyxcT-0000Ub-JF; Sat, 26 Nov 2022 17:01:33 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/10] staging: r8188eu: clean up OnBeacon
Date: Sat, 26 Nov 2022 17:01:19 +0100
Message-Id: <20221126160129.178697-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the OnBeacon function. It tries to replace
driver-sepcific message parsing with ieee80211 helper functions.

Please apply this after the "another round of cleanups" series.

Martin Kaiser (10):
  staging: r8188eu: replace one GetAddr3Ptr call
  staging: r8188eu: read timestamp from ieee80211_mgmt
  staging: r8188eu: replace GetAddr2Ptr calls
  staging: r8188eu: pass only ies to process_p2p_ps_ie
  staging: r8188eu: use ie buffer in update_beacon_info
  staging: r8188eu: simplify update_sta_support_rate params
  staging: r8188eu: exit if beacon is not from our bss
  staging: r8188eu: stop beacon processing if kmalloc fails
  staging: r8188eu: simplify error handling for missing station
  staging: r8188eu: remove a variable

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 130 ++++++++----------
 drivers/staging/r8188eu/core/rtw_p2p.c        |  11 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |   9 +-
 .../staging/r8188eu/include/rtw_mlme_ext.h    |   3 +-
 4 files changed, 66 insertions(+), 87 deletions(-)

-- 
2.30.2

