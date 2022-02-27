Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D632F25
	for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 16:42:16 +0000 (UTC)
Received: from ipservice-092-217-088-081.092.217.pools.vodafone-ip.de ([92.217.88.81] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nOMcY-0005Z9-4F; Sun, 27 Feb 2022 17:42:06 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/8] staging: r8188eu: use ieee80211 defines and helpers
Date: Sun, 27 Feb 2022 17:41:39 +0100
Message-Id: <20220227164147.1168847-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218135038.908307-1-martin@kaiser.cx>
References: <20220218135038.908307-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start using some defines and helper functions from
include/linux/ieee80211.h for parsing frame data.

v2:
 - resend the previous set, it seems that it slipped through the cracks
 - add some more patches to replace driver-specific macros with
   ieee80211 macros

Martin Kaiser (8):
  staging: r8188eu: use ieee80211 define for management frame type
  staging: r8188eu: use ieee80211 helpers to check the frame type
  staging: r8188eu: refactor validate_recv_frame's error handling
  staging: r8188eu: use ieee80211 helper for qos bit
  staging: r8188eu: use ieee80211 helper to check for more fragments
  staging: r8188eu: use ieee80211 helper to read "more data"
  staging: r8188eu: use ieee80211 helper to read the protected bit
  staging: r8188eu: use ieee80211 helper to read the "order" bit

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  3 +-
 drivers/staging/r8188eu/core/rtw_recv.c       | 48 +++++++------------
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  2 +-
 drivers/staging/r8188eu/include/rtw_recv.h    |  2 +-
 drivers/staging/r8188eu/include/wifi.h        | 32 +++++--------
 5 files changed, 33 insertions(+), 54 deletions(-)

-- 
2.30.2

