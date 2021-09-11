Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC453FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 14:16:01 +0000 (UTC)
Received: from dslb-084-059-243-091.084.059.pools.vodafone-ip.de ([84.59.243.91] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mP3nQ-0006bt-F6; Sat, 11 Sep 2021 16:15:56 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/12] staging: r8188eu: power management cleanup
Date: Sat, 11 Sep 2021 16:15:09 +0200
Message-Id: <20210911141521.24901-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused parts of the power management code.

Tested with Edimax EW-7811Un V2 on an ARM32 embedded system.

Martin Kaiser (12):
  staging: r8188eu: btcoex_rfon is always false
  staging: r8188eu: setting HW_VAR_SET_RPWM does nothing
  staging: r8188eu: remove write-only variable cpwm
  staging: r8188eu: remove write-only variable tog
  staging: r8188eu: remove rtw_set_rpwm
  staging: r8188eu: remove unused power state defines
  staging: r8188eu: _free_pwrlock is empty
  staging: r8188eu: remove unused pwrctrl definitions
  staging: r8188eu: remove unused enum and array
  staging: r8188eu: rtw_set_ips_deny is not used
  staging: r8188eu: remove unused variable cpwm_tog
  staging: r8188eu: remove unused variable b_hw_radio_off

 .../realtek/rtl8192cu/include/rtw_pwrctrl.h   |   1 -
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |  69 ------------
 drivers/staging/r8188eu/hal/usb_halinit.c     |   2 -
 drivers/staging/r8188eu/include/hal_intf.h    |   1 -
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 102 ------------------
 drivers/staging/r8188eu/os_dep/os_intfs.c     |   2 -
 6 files changed, 177 deletions(-)

-- 
2.20.1

