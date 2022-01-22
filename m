Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46768173
	for <linux-staging@lists.linux.dev>; Sat, 22 Jan 2022 17:06:06 +0000 (UTC)
Received: from dslb-188-097-041-028.188.097.pools.vodafone-ip.de ([188.97.41.28] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nBJpr-0002IN-Bi; Sat, 22 Jan 2022 18:05:55 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: some more odm cleanup
Date: Sat, 22 Jan 2022 18:05:43 +0100
Message-Id: <20220122170547.68378-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some flags in the odm layer which are always set.
Remove an unused variable and merge two small functions.

Martin Kaiser (4):
  staging: r8188eu: EntryMaxUndecoratedSmoothedPWDB is set but not used
  staging: r8188eu: ODM_RF_TX_PWR_TRACK is always set
  staging: r8188eu: ODM_RF_CALIBRATION is always set
  staging: r8188eu: merge Init_ODM_ComInfo_88E and rtl8188e_init_dm_priv

 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  5 ---
 drivers/staging/r8188eu/hal/odm.c             |  8 -----
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     | 32 ++++---------------
 drivers/staging/r8188eu/include/odm.h         |  4 ---
 drivers/staging/r8188eu/include/rtl8188e_dm.h |  3 +-
 5 files changed, 8 insertions(+), 44 deletions(-)

-- 
2.30.2

