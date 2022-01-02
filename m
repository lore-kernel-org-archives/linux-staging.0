Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FEA2C9D
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 18:00:08 +0000 (UTC)
Received: from dslb-188-104-058-096.188.104.pools.vodafone-ip.de ([188.104.58.96] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n459H-0005Ye-Ot; Sun, 02 Jan 2022 19:00:03 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: some trivial cleanups
Date: Sun,  2 Jan 2022 18:59:27 +0100
Message-Id: <20220102175932.89127-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused variables and defines in several places.

Martin Kaiser (5):
  staging: r8188eu: remove unused power management defines
  staging: r8188eu: internal autosuspend is always false
  staging: r8188eu: fix_rate is set but not used.
  staging: r8188eu: cmd_issued_cnt is set but not used
  staging: r8188eu: turbo scan is always off for r8188eu

 drivers/staging/r8188eu/core/rtw_cmd.c        |  3 ---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |  9 +-------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |  1 -
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 21 +++++++------------
 drivers/staging/r8188eu/include/drv_types.h   |  2 --
 drivers/staging/r8188eu/include/rtw_cmd.h     |  1 -
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  5 -----
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  6 ------
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  4 ----
 drivers/staging/r8188eu/os_dep/usb_intf.c     |  3 +--
 10 files changed, 9 insertions(+), 46 deletions(-)

-- 
2.30.2

