Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A562912
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 20:51:04 +0000 (UTC)
Received: from ipservice-092-217-079-029.092.217.pools.vodafone-ip.de ([92.217.79.29] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nUE86-00084h-Hd; Tue, 15 Mar 2022 21:50:54 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/6] staging: r8188eu: some rx cleanups
Date: Tue, 15 Mar 2022 21:50:35 +0100
Message-Id: <20220315205041.2714168-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another set with simple cleanups in the code for receiving frames.

v2 fixes a build error on 64-bit systems in the last patch.

Martin Kaiser (6):
  staging: r8188eu: remove unnecessary initializations
  staging: r8188eu: remove three unused receive defines
  staging: r8188eu: remove unused function prototype
  staging: r8188eu: make rtl8188e_process_phy_info static
  staging: r8188eu: remove some unused local ieee80211 macros
  staging: r8188eu: remove local BIT macro

 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  6 +---
 .../staging/r8188eu/include/rtl8188e_recv.h   |  6 ----
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 +-
 drivers/staging/r8188eu/include/wifi.h        | 34 +------------------
 4 files changed, 3 insertions(+), 45 deletions(-)

-- 
2.30.2

