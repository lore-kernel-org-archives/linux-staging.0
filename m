Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2337629CA
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 15:37:20 +0000 (UTC)
Received: from dslb-084-059-249-202.084.059.pools.vodafone-ip.de ([84.59.249.202] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mCONo-0003Y3-5p; Sat, 07 Aug 2021 17:37:08 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/12] remove the remaining RT_TRACE prints
Date: Sat,  7 Aug 2021 17:36:24 +0200
Message-Id: <20210807153636.11712-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Greg and all,

I'm resending the patches from earlier this week, all in one series, based
on today's staging-testing branch. I hope they do not conflict with other
pending submissions.

As per Greg's request, I removed only RT_TRACE prints and left DBG_88E
alone for now.

While at it, I resurrected the IW_HANDLER change that was already accepted
for the deprecated driver.

Thanks for reviewing this set,

   Martin

Martin Kaiser (12):
  staging: r8188eu: remove RT_TRACE prints from usb_intf.c
  staging: r8188eu: remove RT_TRACE prints from usb_ops_linux.c
  staging: r8188eu: remove RT_TRACE prints from ioctl_linux.c
  staging: r8188eu: remove empty function
  staging: r8188eu: remove RT_TRACE prints from mlme_linux.c
  staging: r8188eu: remove RT_TRACE prints from os_intfs.c
  staging: r8188eu: remove an RT_TRACE print from osdep_service.c
  staging: r8188eu: remove RT_TRACE prints from recv_linux.c
  staging: r8188eu: remove RT_TRACE prints from xmit_linux.c
  staging: r8188eu: use IW_HANDLER to declare wext handlers
  staging: r8188eu: remove unused DEBUG_OID macro
  staging: r8188eu: remove the RT_TRACE macro

 drivers/staging/r8188eu/include/rtw_debug.h   |   9 -
 drivers/staging/r8188eu/include/rtw_ioctl.h   |   6 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 181 +++++-------------
 drivers/staging/r8188eu/os_dep/mlme_linux.c   |   4 -
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  49 +----
 .../staging/r8188eu/os_dep/osdep_service.c    |   6 +-
 drivers/staging/r8188eu/os_dep/recv_linux.c   |  23 +--
 drivers/staging/r8188eu/os_dep/usb_intf.c     |  51 +----
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  15 --
 drivers/staging/r8188eu/os_dep/xmit_linux.c   |   8 +-
 10 files changed, 58 insertions(+), 294 deletions(-)

-- 
2.20.1

