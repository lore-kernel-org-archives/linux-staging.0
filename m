Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7E28F7
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:10 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJma-0004rR-KX; Fri, 30 Dec 2022 19:07:04 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/20] staging: r8188eu: some xmit cleanups
Date: Fri, 30 Dec 2022 19:06:26 +0100
Message-Id: <20221230180646.91008-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start cleaning up the code that transmits data frames to the dongle
via USB.

This should be applied on top of the "merge public action functions"
series.

Martin Kaiser (20):
  staging: r8188eu: make xmitframe_swencrypt a void function
  staging: r8188eu: remove some unused CAM defines
  staging: r8188eu: cmd_seq is write-only
  staging: r8188eu: return immediately if we're not meant to encrypt
  staging: r8188eu: remove unused parameter
  staging: r8188eu: simplify rtl8188eu_xmit_tasklet
  staging: r8188eu: remove rtl8188eu_init_xmit_priv
  staging: r8188eu: remove duplicate psta check
  staging: r8188eu: simplify frame type check
  staging: r8188eu: simplify rtw_make_wlanhdr's error handling
  staging: r8188eu: clean up qos_option setting
  staging: r8188eu: remove unused bpending array
  staging: r8188eu: remove unused dma_transfer_addr
  staging: r8188eu: bm_pending is not used
  staging: r8188eu: terminate_xmitthread_sema is not used
  staging: r8188eu: tx_retevt semaphore is not used
  staging: r8188eu: remove unnecessary rtw_free_xmitframe call
  staging: r8188eu: phwxmit parameter is unused
  staging: r8188eu: rtw_init_hwxmits is not needed
  staging: r8188eu: we use a constant number of hw_xmit entries

 drivers/staging/r8188eu/core/rtw_cmd.c        |   4 -
 drivers/staging/r8188eu/core/rtw_xmit.c       | 239 ++++++++----------
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  27 +-
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  14 +-
 .../staging/r8188eu/include/rtl8188e_spec.h   |  21 --
 .../staging/r8188eu/include/rtl8188e_xmit.h   |   4 +-
 drivers/staging/r8188eu/include/rtw_cmd.h     |   1 -
 drivers/staging/r8188eu/include/rtw_xmit.h    |   9 +-
 8 files changed, 116 insertions(+), 203 deletions(-)

-- 
2.30.2

