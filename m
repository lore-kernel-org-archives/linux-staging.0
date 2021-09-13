Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7582FB2
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 18:53:12 +0000 (UTC)
Received: from 250.57.4.146.static.wline.lns.sme.cust.swisscom.ch ([146.4.57.250] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mPr4g-0005CM-PL; Mon, 13 Sep 2021 20:53:02 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/8] staging: r8188eu: power management cleanup
Date: Mon, 13 Sep 2021 20:51:02 +0200
Message-Id: <20210913185110.3065-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210911141521.24901-1-martin@kaiser.cx>
References: <20210911141521.24901-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused parts of the power management code.

Tested with Edimax EW-7811Un V2 on an ARM32 embedded system.

v2:
- rebased against today's staging-testing branch
- fixed one patch that changed files outside of the r8188eu driver

Martin Kaiser (8):
  staging: r8188eu: remove rtw_set_rpwm
  staging: r8188eu: remove unused power state defines
  staging: r8188eu: _free_pwrlock is empty
  staging: r8188eu: remove unused pwrctrl definitions
  staging: r8188eu: remove unused enum and array
  staging: r8188eu: rtw_set_ips_deny is not used
  staging: r8188eu: remove unused variable cpwm_tog
  staging: r8188eu: remove unused variable b_hw_radio_off

 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 48 ---------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 98 -------------------
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  2 -
 3 files changed, 148 deletions(-)

-- 
2.20.1

