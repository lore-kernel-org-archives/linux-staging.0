Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273272C81
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 18:05:07 +0000 (UTC)
Received: from dslb-178-004-201-201.178.004.pools.vodafone-ip.de ([178.4.201.201] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mehrd-00049p-Gw; Sun, 24 Oct 2021 20:04:57 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: remove struct sreset_priv
Date: Sun, 24 Oct 2021 20:04:43 +0200
Message-Id: <20211024180448.20624-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sreset_priv structure is not used by the r8188eu driver. This patchset
removes sreset_priv step by step.

Martin Kaiser (5):
  staging: r8188eu: silent_reset_inprogress is never read
  staging: r8188eu: wifi_error_status is write-only
  staging: r8188eu: silentreset_mutex is unused
  staging: r8188eu: remove last_tx_complete_time
  staging: r8188eu: remove the sreset_priv structure

 drivers/staging/r8188eu/Makefile              |  1 -
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  2 ++
 drivers/staging/r8188eu/core/rtw_sreset.c     | 32 -------------------
 drivers/staging/r8188eu/hal/rtl8188e_sreset.c | 15 ---------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 10 ------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  1 -
 .../staging/r8188eu/include/rtl8188e_sreset.h |  1 -
 drivers/staging/r8188eu/include/rtw_sreset.h  | 29 -----------------
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  4 ---
 .../staging/r8188eu/os_dep/usb_ops_linux.c    | 18 +++--------
 10 files changed, 6 insertions(+), 107 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/core/rtw_sreset.c
 delete mode 100644 drivers/staging/r8188eu/include/rtw_sreset.h

-- 
2.20.1

