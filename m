Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F92F5F
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 20:33:57 +0000 (UTC)
Received: from dslb-094-219-034-255.094.219.pools.vodafone-ip.de ([94.219.34.255] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWOiv-0003ce-BX; Mon, 21 Mar 2022 21:33:53 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/6] staging: r8188eu: clean up odm dynamic functions
Date: Mon, 21 Mar 2022 21:30:25 +0100
Message-Id: <20220321203031.143486-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the code for odm dynamic functions. Remove unused capabilities
and intermediate steps.

This should be applied after the "remove local BIT macro" patch.

Martin Kaiser (6):
  staging: r8188eu: remove two limit defines
  staging: r8188eu: remove unused defines for dynamic functions
  staging: r8188eu: DYNAMIC_BB_DYNAMIC_TXPWR is not used
  staging: r8188eu: DYNAMIC_BB_ANT_DIV is not used
  staging: r8188eu: DYNAMIC_RF_CALIBRATION is not used
  staging: r8188eu: refactor dm func set and clear

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  6 ++---
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 12 ---------
 drivers/staging/r8188eu/hal/usb_halinit.c     | 16 +++---------
 drivers/staging/r8188eu/include/hal_intf.h    |  2 +-
 .../staging/r8188eu/include/rtw_mlme_ext.h    | 25 -------------------
 5 files changed, 7 insertions(+), 54 deletions(-)

-- 
2.30.2

