Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEAC7485
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 19:23:31 +0000 (UTC)
Received: from dslb-178-004-202-208.178.004.pools.vodafone-ip.de ([178.4.202.208] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pPTYr-0002XK-I5; Tue, 07 Feb 2023 20:23:25 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/7] staging: r8188eu: another round of xmit cleanups
Date: Tue,  7 Feb 2023 20:23:12 +0100
Message-Id: <20230207192319.294203-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains some more cleanups for the xmit code.

Amongst other things, we can reduce the data for the completion function
of the usb bulk urbs that we send out.

Martin Kaiser (7):
  staging: r8188eu: merge do_queue_select into its only caller
  staging: r8188eu: simplify rtw_alloc_xmitframe
  staging: r8188eu: remove unused frametag defines
  staging: r8188eu: xmit_buf's ff_hwaddr is not used
  staging: r8188eu: simplify xmit_buf flags
  staging: r8188eu: simplify rtw_get_ff_hwaddr
  staging: r8188eu: bagg_pkt parameter is not used

 drivers/staging/r8188eu/core/rtw_xmit.c       | 85 +++++--------------
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  8 +-
 drivers/staging/r8188eu/include/rtw_xmit.h    | 17 +---
 .../staging/r8188eu/os_dep/usb_ops_linux.c    | 25 +-----
 4 files changed, 27 insertions(+), 108 deletions(-)

-- 
2.30.2

