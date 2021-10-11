Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3936A2C87
	for <linux-staging@lists.linux.dev>; Mon, 11 Oct 2021 20:12:28 +0000 (UTC)
Received: from dslb-188-097-046-226.188.097.pools.vodafone-ip.de ([188.97.46.226] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ma1ei-0004mk-PX; Mon, 11 Oct 2021 22:12:16 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/8] staging: r8188eu: more odm cleanup
Date: Mon, 11 Oct 2021 22:11:51 +0200
Message-Id: <20211011201159.10252-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Greg and all,

here's some more patches to remove unused odm code.

This series should be applied on top of the series I sent yesterday
(starting with message 20211010175204.24029-1-martin@kaiser.cx).

Thanks,
Martin

Martin Kaiser (8):
  staging: r8188eu: remove dm_CheckStatistics
  staging: r8188eu: simplify rtl8188e_HalDmWatchDog
  staging: r8188eu: remove rtl8188e_deinit_dm_priv
  staging: r8188eu: remove LastMinUndecoratedPWDBForDM
  staging: r8188eu: SupportICType is always ODM_RTL8188E
  staging: r8188eu: remove odm_SwAntDivInit
  staging: r8188eu: odm BoardType is never set
  staging: r8188eu: odm SupportPlatform is always ODM_CE

 .../staging/r8188eu/hal/HalHWImg8188E_BB.c    |  16 +-
 .../staging/r8188eu/hal/HalHWImg8188E_MAC.c   |   5 +-
 .../staging/r8188eu/hal/HalHWImg8188E_RF.c    |   5 +-
 drivers/staging/r8188eu/hal/odm.c             | 308 +++---------------
 drivers/staging/r8188eu/hal/odm_HWConfig.c    |  69 ++--
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    |   5 +-
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |  60 +---
 drivers/staging/r8188eu/include/odm.h         |  30 --
 drivers/staging/r8188eu/include/odm_precomp.h |  11 -
 drivers/staging/r8188eu/include/odm_types.h   |   6 -
 drivers/staging/r8188eu/include/rtl8188e_dm.h |   2 -
 drivers/staging/r8188eu/os_dep/os_intfs.c     |   2 -
 12 files changed, 93 insertions(+), 426 deletions(-)

-- 
2.20.1

