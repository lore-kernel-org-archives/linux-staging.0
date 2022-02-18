Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C104C3B29
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 13:50:53 +0000 (UTC)
Received: from dslb-178-004-174-047.178.004.pools.vodafone-ip.de ([178.4.174.47] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nL3eq-0007eo-UG; Fri, 18 Feb 2022 14:50:48 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: use ieee80211 defines and helpers
Date: Fri, 18 Feb 2022 14:50:34 +0100
Message-Id: <20220218135038.908307-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start using some defines and helper functions from
include/linux/ieee80211.h for parsing frame data.

Yet again, this is testing the water. I'd appreciate feedback if this
approach makes sense. If so, there's lots of other places that can be
converted.

Martin Kaiser (4):
  staging: r8188eu: use ieee80211 define for management frame type
  staging: r8188eu: use ieee80211 helpers to check the frame type
  staging: r8188eu: refactor validate_recv_frame's error handling
  staging: r8188eu: use ieee80211 helper for qos bit

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  3 +-
 drivers/staging/r8188eu/core/rtw_recv.c       | 40 ++++++-------------
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  2 +-
 drivers/staging/r8188eu/include/rtw_recv.h    |  2 +-
 drivers/staging/r8188eu/include/wifi.h        | 25 ++++++------
 5 files changed, 29 insertions(+), 43 deletions(-)

-- 
2.30.2

