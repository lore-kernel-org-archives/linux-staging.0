Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FC529B0
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 20:56:18 +0000 (UTC)
Received: from dslb-178-004-172-185.178.004.pools.vodafone-ip.de ([178.4.172.185] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nZefx-0007FS-5x; Wed, 30 Mar 2022 22:12:17 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/2] staging: r8188eu: remove debug code for dumping packets
Date: Wed, 30 Mar 2022 22:12:08 +0200
Message-Id: <20220330201210.175941-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the remains of debug code to print incoming and outgoing packets.

Martin Kaiser (2):
  staging: r8188eu: remove the "dump rx packet" fragments
  staging: r8188eu: remove the "dump tx packet" fragments

 drivers/staging/r8188eu/core/rtw_recv.c        |  4 ----
 drivers/staging/r8188eu/hal/usb_halinit.c      | 12 ------------
 drivers/staging/r8188eu/include/hal_intf.h     |  2 --
 drivers/staging/r8188eu/include/rtl8188e_hal.h |  3 ---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c   |  7 -------
 5 files changed, 28 deletions(-)

-- 
2.30.2

