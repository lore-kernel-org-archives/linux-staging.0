Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05742F24
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 17:59:37 +0000 (UTC)
Received: from ipservice-092-217-075-184.092.217.pools.vodafone-ip.de ([92.217.75.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGloz-0002n8-6R; Sun, 06 Feb 2022 18:59:33 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: clean up struct dvobj_priv
Date: Sun,  6 Feb 2022 18:59:20 +0100
Message-Id: <20220206175925.461426-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused or unnecessary components from struct dvobj_priv.

Martin Kaiser (5):
  staging: r8188eu: usb_vendor_req_mutex is not used
  staging: r8188eu: dvobj_priv's signal_strength is not used
  staging: r8188eu: RegUsbSS is not used
  staging: r8188eu: usb_suspend_sema is initialised but not used
  staging: r8188eu: remove ishighspeed from dvobj_priv

 drivers/staging/r8188eu/core/rtw_iol.c      | 4 +++-
 drivers/staging/r8188eu/hal/usb_halinit.c   | 4 ++--
 drivers/staging/r8188eu/include/drv_types.h | 5 -----
 drivers/staging/r8188eu/include/usb_ops.h   | 2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 9 ---------
 5 files changed, 6 insertions(+), 18 deletions(-)

-- 
2.30.2

