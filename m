Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EBA28F9
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 18:59:51 +0000 (UTC)
Received: from dslb-188-096-147-053.188.096.pools.vodafone-ip.de ([188.96.147.53] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEarb-0003b8-57; Sun, 08 Jan 2023 19:57:47 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/13] staging: r8188eu: some more xmit cleanups
Date: Sun,  8 Jan 2023 19:57:25 +0100
Message-Id: <20230108185738.597105-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another set of xmit cleanups, based on my previous patches.

Martin Kaiser (13):
  staging: r8188eu: beq_cnt is write-only
  staging: r8188eu: bkq_cnt is write-only
  staging: r8188eu: viq_cnt is write-only
  staging: r8188eu: voq_cnt is write-only
  staging: r8188eu: replace switch with if
  staging: r8188eu: make rtl8188eu_inirp_init a void function
  staging: r8188eu: dir_dev is unused
  staging: r8188eu: remove unused hal_xmit_handler define
  staging: r8188eu: txirp_cnt is write-only
  staging: r8188eu: remove unused QSLT defines
  staging: r8188eu: xmit_priv's vcs_type is not used
  staging: r8188eu: xmit_priv's vcs is not used
  staging: r8188eu: xmit_priv's vcs_setting is not used

 drivers/staging/r8188eu/core/rtw_mlme.c       |  5 ---
 drivers/staging/r8188eu/core/rtw_xmit.c       | 42 -------------------
 drivers/staging/r8188eu/hal/usb_halinit.c     | 14 ++-----
 drivers/staging/r8188eu/include/drv_types.h   |  1 -
 drivers/staging/r8188eu/include/hal_intf.h    |  2 +-
 .../staging/r8188eu/include/rtl8188e_xmit.h   | 11 -----
 drivers/staging/r8188eu/include/rtw_xmit.h    | 10 -----
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  3 --
 .../staging/r8188eu/os_dep/usb_ops_linux.c    | 23 +---------
 9 files changed, 5 insertions(+), 106 deletions(-)

-- 
2.30.2

