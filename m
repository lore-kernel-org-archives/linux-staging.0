Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A432C2C80
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:47:59 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqHud-0006ye-45; Thu, 25 Nov 2021 17:47:55 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: some trivial removals
Date: Thu, 25 Nov 2021 17:47:41 +0100
Message-Id: <20211125164745.8188-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty functions and unused function parameters.

Tested on top of "clean up workers". Most likey, there's no conflicts
with my previous patches.

Martin Kaiser (4):
  staging: r8188eu: remove pm_netdev_open
  staging: r8188eu: remove _ps_open_RF
  staging: r8188eu: remove _ps_close_RF
  staging: r8188eu: loadparam needs no net_device

 drivers/staging/r8188eu/hal/usb_halinit.c    | 18 +-----------------
 drivers/staging/r8188eu/include/usb_osintf.h |  1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c    | 15 ++-------------
 drivers/staging/r8188eu/os_dep/usb_intf.c    |  2 +-
 4 files changed, 4 insertions(+), 32 deletions(-)

-- 
2.20.1

