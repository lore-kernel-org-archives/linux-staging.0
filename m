Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC979E1
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 19:53:27 +0000 (UTC)
Received: from dslb-188-097-040-029.188.097.pools.vodafone-ip.de ([188.97.40.29] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pMaDM-0007S2-0D; Mon, 30 Jan 2023 20:53:16 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/9] staging: r8188eu: another round of xmit cleanups
Date: Mon, 30 Jan 2023 20:52:54 +0100
Message-Id: <20230130195303.138941-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's some more cleanups for the xmit code. Amongst other things, there's
one more __queue that can be replaced with a list_head.

Martin Kaiser (9):
  staging: r8188eu: rtw_free_xmitframe_queue needs no spinlock
  staging: r8188eu: change function param from __queue to list_head
  staging: r8188eu: change another function param from __queue to
    list_head
  staging: r8188eu: make sta_pending a list_head
  staging: r8188eu: use kernel helper to iterate over a list
  staging: r8188eu: legacy_dz is initialised but never used
  staging: r8188eu: apsd is initialised but never used
  staging: r8188eu: option in struct sta_xmit_priv is not used
  staging: r8188eu: replace switch-case with if

 drivers/staging/r8188eu/core/rtw_sta_mgt.c    | 10 +++---
 drivers/staging/r8188eu/core/rtw_xmit.c       | 31 +++++--------------
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  4 +--
 drivers/staging/r8188eu/include/rtw_xmit.h    |  8 ++---
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  8 +----
 5 files changed, 18 insertions(+), 43 deletions(-)

-- 
2.30.2

