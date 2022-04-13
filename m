Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF86B2F32
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 20:07:52 +0000 (UTC)
Received: from dslb-178-004-174-121.178.004.pools.vodafone-ip.de ([178.4.174.121] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nejHI-0005wN-LP; Wed, 13 Apr 2022 22:07:48 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: some more cleanups
Date: Wed, 13 Apr 2022 22:07:38 +0200
Message-Id: <20220413200742.276806-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another set of simple cleanups in the code that handles incoming
frames.

Martin Kaiser (4):
  staging: r8188eu: use ieee80211 helper to read the qos tid
  staging: r8188eu: merge _mgt_dispatcher into mgt_dispatcher
  staging: r8188eu: use ieee80211 helpers in mgt_dispatcher
  staging: r8188eu: pkt_newalloc is not used

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 35 +++++++++------------
 drivers/staging/r8188eu/core/rtw_recv.c     |  3 +-
 drivers/staging/r8188eu/include/rtw_recv.h  |  1 -
 drivers/staging/r8188eu/include/wifi.h      |  2 --
 4 files changed, 16 insertions(+), 25 deletions(-)

-- 
2.30.2

