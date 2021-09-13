Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FC13FC3
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 19:00:54 +0000 (UTC)
Received: from 250.57.4.146.static.wline.lns.sme.cust.swisscom.ch ([146.4.57.250] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mPrCD-0005LG-TG; Mon, 13 Sep 2021 21:00:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/2] staging: r8188eu: more power management cleanup
Date: Mon, 13 Sep 2021 20:59:55 +0200
Message-Id: <20210913185957.3166-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210911161019.26881-1-martin@kaiser.cx>
References: <20210911161019.26881-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bHWPwrPindetect is always 0 for the r8188eu driver. This makes a lot of
code unreachable.

Tested with Edimax EW-7811Un V2 on an ARM32 embedded system.

v2:
- rebased against today's staging-testing branch

Martin Kaiser (2):
  staging: r8188eu: brfoffbyhw is always false
  staging: r8188eu: remove rtw_hw_resume

 drivers/staging/r8188eu/include/osdep_intf.h  |  1 -
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  1 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  7 ----
 drivers/staging/r8188eu/os_dep/usb_intf.c     | 40 -------------------
 4 files changed, 49 deletions(-)

-- 
2.20.1

