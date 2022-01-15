Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE7A2C9D
	for <linux-staging@lists.linux.dev>; Sat, 15 Jan 2022 16:55:57 +0000 (UTC)
Received: from dslb-178-004-201-171.178.004.pools.vodafone-ip.de ([178.4.201.171] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n8mLC-0005N8-CK; Sat, 15 Jan 2022 17:55:46 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/11] staging: r8188eu: clean up osdep_service.h
Date: Sat, 15 Jan 2022 17:55:25 +0100
Message-Id: <20220115165536.231210-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a couple of unused defines and functions from osdep_service.h.
Replace some one-line wrapper functions with a call to the "wrapped
function".

Tested with Edimax V2 on an arm32 system (as usual).

Martin Kaiser (11):
  staging: r8188eu: remove unused externl variables
  staging: r8188eu: remove unused macros
  staging: r8188eu: remove unused bitshift function
  staging: r8188eu: remove unused PATH_LENGTH_MAX define
  staging: r8188eu: remove rtw_list_delete wrapper
  staging: r8188eu: remove _cancel_timer wrapper
  staging: r8188eu: call msecs_to_jiffies in _set_timer
  staging: r8188eu: remove rtw_netif_wake_queue wrapper
  staging: r8188eu: remove rtw_netif_start_queue wrapper
  staging: r8188eu: remove rtw_netif_stop_queue wrapper
  staging: r8188eu: remove _cancel_timer_ex wrapper

 drivers/staging/r8188eu/core/rtw_cmd.c        |  5 +-
 drivers/staging/r8188eu/core/rtw_mlme.c       | 14 ++---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 38 ++++++-------
 drivers/staging/r8188eu/core/rtw_p2p.c        | 14 ++---
 drivers/staging/r8188eu/core/rtw_recv.c       |  2 +-
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  6 +-
 .../staging/r8188eu/include/osdep_service.h   | 55 +------------------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c     | 24 ++++----
 drivers/staging/r8188eu/os_dep/usb_intf.c     |  2 +-
 10 files changed, 50 insertions(+), 112 deletions(-)

-- 
2.30.2

