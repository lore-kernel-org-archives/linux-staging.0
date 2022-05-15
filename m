Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D345A49
	for <linux-staging@lists.linux.dev>; Sun, 15 May 2022 15:54:10 +0000 (UTC)
Received: from dslb-188-096-141-066.188.096.pools.vodafone-ip.de ([188.96.141.66] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nqGZJ-0006NT-9L; Sun, 15 May 2022 17:54:05 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: another set of small fixes
Date: Sun, 15 May 2022 17:53:56 +0200
Message-Id: <20220515155401.352742-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple of simple fixes in several places.

Martin Kaiser (5):
  staging: r8188eu: use ieee80211 helper to check for beacon
  staging: r8188eu: remove obsolete comments
  staging: r8188eu: simplify error handling in recv_func_prehandle
  staging: r8188eu: last_rx_mgnt_pkts is set but not used
  staging: r8188eu: assoc_rsp and assoc_rsp_len are not used

 drivers/staging/r8188eu/core/rtw_mlme.c       |  1 -
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  6 -----
 drivers/staging/r8188eu/core/rtw_recv.c       |  5 +----
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    | 22 -------------------
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  4 +---
 drivers/staging/r8188eu/include/rtw_mlme.h    |  2 --
 drivers/staging/r8188eu/include/sta_info.h    |  2 --
 7 files changed, 2 insertions(+), 40 deletions(-)

-- 
2.30.2

