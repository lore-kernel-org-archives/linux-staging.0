Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4012B3C20
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 14:40:02 +0000 (UTC)
Received: from dslb-188-104-059-172.188.104.pools.vodafone-ip.de ([188.104.59.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oHnd7-0004pM-MR; Sat, 30 Jul 2022 16:39:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: report errors from ReadAdapterInfo8188EU
Date: Sat, 30 Jul 2022 16:39:36 +0200
Message-Id: <20220730143939.671951-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the ReadAdapterInfo8188EU to return an error code. Change the
calling function to relay these errors to the driver's probe function.

Martin Kaiser (3):
  staging: r8188eu: handle errors from ReadAdapterInfo8188EU
  staging: r8188eu: make rtw_handle_dualmac a void function
  staging: r8188eu: return an error code in rtw_usb_if1_init

 drivers/staging/r8188eu/core/rtw_wlan_util.c |  5 +-
 drivers/staging/r8188eu/hal/usb_halinit.c    |  7 +--
 drivers/staging/r8188eu/include/drv_types.h  |  2 +-
 drivers/staging/r8188eu/include/hal_intf.h   |  2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c    | 49 +++++++++++---------
 5 files changed, 33 insertions(+), 32 deletions(-)

-- 
2.30.2

