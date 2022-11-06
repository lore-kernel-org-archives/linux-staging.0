Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75B27F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 12:49:15 +0000 (UTC)
Received: from ipservice-092-217-068-220.092.217.pools.vodafone-ip.de ([92.217.68.220] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1orf5E-0008Dj-Ua; Sun, 06 Nov 2022 13:49:05 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/9] staging: r8188eu: another round of cleanups
Date: Sun,  6 Nov 2022 13:48:52 +0100
Message-Id: <20221106124901.720785-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another patch set with several cleanups throughout the driver.

Martin Kaiser (9):
  staging: r8188eu: don't store addba request
  staging: r8188eu: remove some obsolete comments
  staging: r8188eu: reorder assignments, clarify the header format
  staging: r8188eu: reformat a function header
  staging: r8188eu: remove state checks in rtw_led_control
  staging: r8188eu: clean up rtw_hal_init
  staging: r8188eu: remove get_fwstate
  staging: r8188eu: merge two rtw_free_network_nolock functions
  staging: r8188eu: remove checks in dump_mgntframe

 drivers/staging/r8188eu/core/rtw_led.c        |  3 +-
 drivers/staging/r8188eu/core/rtw_mlme.c       | 23 ++++++---------
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 28 ++++++++-----------
 drivers/staging/r8188eu/core/rtw_recv.c       |  2 --
 drivers/staging/r8188eu/hal/hal_intf.c        | 19 +++++--------
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  6 +---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 15 ++++------
 drivers/staging/r8188eu/include/rtw_mlme.h    |  7 -----
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  4 +--
 drivers/staging/r8188eu/include/wifi.h        |  8 ------
 10 files changed, 36 insertions(+), 79 deletions(-)

-- 
2.30.2

