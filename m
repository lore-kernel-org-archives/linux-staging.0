Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093DA880A
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:53:59 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pC-0000Lk-7g; Mon, 23 Jan 2023 21:53:54 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/23] staging: r8188eu: some more xmit cleanups
Date: Mon, 23 Jan 2023 21:53:19 +0100
Message-Id: <20230123205342.229589-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another series with cleanups of the xmit part. Amongst other
things, it replaces some __queue variables with standard list_heads.

This series also includes rebased versions of the patches that caused
conflicts during the last review cycle.

Martin Kaiser (23):
  staging: r8188eu: we use a constant number of hw_xmit entries
  staging: r8188eu: pass struct adapter to usb_write
  staging: r8188eu: remove struct intf_hdl
  staging: r8188eu: remove struct intf_priv
  staging: r8188eu: simplify the sta loop in rtw_dequeue_xframe
  staging: r8188eu: simplify the code to initialise inx
  staging: r8188eu: remove an obsolete comment
  staging: r8188eu: remove unused function parameter
  staging: r8188eu: remove dead assignment
  staging: r8188eu: use list_empty
  staging: r8188eu: simplify dequeue_one_xmitframe
  staging: r8188eu: remove redundant parameter
  staging: r8188eu: make rtw_chk_hi_queue_cmd a void function
  staging: r8188eu: decrement qcnt in rtw_dequeue_xframe
  staging: r8188eu: simplify dequeue_one_xmitframe
  staging: r8188eu: use list_head for xmitframe list
  staging: r8188eu: merge dequeue_one_xmitframe into its caller
  staging: r8188eu: use lists for hwxmits
  staging: r8188eu: fix rtw_xmitframe_enqueue error handling
  staging: r8188eu: remove rtw_xmitframe_enqueue
  staging: r8188eu: struct agg_pkt_info is unused
  staging: r8188eu: apsd_setting is unused
  staging: r8188eu: merge rtw_free_hwxmits into its only caller

 drivers/staging/r8188eu/core/rtw_cmd.c        |  16 +--
 drivers/staging/r8188eu/core/rtw_xmit.c       | 119 +++++-------------
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |   7 +-
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  18 +--
 drivers/staging/r8188eu/include/drv_types.h   |   1 -
 drivers/staging/r8188eu/include/osdep_intf.h  |  32 -----
 .../staging/r8188eu/include/rtl8188e_xmit.h   |   3 +-
 drivers/staging/r8188eu/include/rtw_cmd.h     |   2 +-
 drivers/staging/r8188eu/include/rtw_io.h      |   8 --
 drivers/staging/r8188eu/include/rtw_xmit.h    |  23 +---
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   6 -
 11 files changed, 57 insertions(+), 178 deletions(-)

-- 
2.30.2

