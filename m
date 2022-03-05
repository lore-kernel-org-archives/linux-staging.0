Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3201394
	for <linux-staging@lists.linux.dev>; Sat,  5 Mar 2022 18:54:04 +0000 (UTC)
Received: from dslb-084-059-247-134.084.059.pools.vodafone-ip.de ([84.59.247.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nQZXT-00016k-Eq; Sat, 05 Mar 2022 19:53:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/6] staging: r8188eu: some rx cleanups
Date: Sat,  5 Mar 2022 19:53:45 +0100
Message-Id: <20220305185351.1409232-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another set with simple cleanups in the code for receiving frames.

Martin Kaiser (6):
  staging: r8188eu: remove unnecessary initializations
  staging: r8188eu: remove three unused receive defines
  staging: r8188eu: remove unused function prototype
  staging: r8188eu: make rtl8188e_process_phy_info static
  staging: r8188eu: remove some unused local ieee80211 macros
  staging: r8188eu: remove local BIT macro

 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  6 +---
 .../staging/r8188eu/include/rtl8188e_recv.h   |  6 ----
 drivers/staging/r8188eu/include/wifi.h        | 34 +------------------
 3 files changed, 2 insertions(+), 44 deletions(-)

-- 
2.30.2

