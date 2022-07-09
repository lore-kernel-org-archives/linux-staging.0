Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B61C10
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 17:10:23 +0000 (UTC)
Received: from dslb-188-096-144-007.188.096.pools.vodafone-ip.de ([188.96.144.7] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oADy7-0005n0-U8; Sat, 09 Jul 2022 19:10:12 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/14] clean up efuse reading
Date: Sat,  9 Jul 2022 19:09:46 +0200
Message-Id: <20220709171000.180481-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the code that reads config data from the efuses.

Martin Kaiser (14):
  staging: r8188eu: remove unused eeprom defines
  staging: r8188eu: remove EepromOrEfuse from struct eeprom_priv
  staging: r8188eu: remove eeprom function prototypes
  staging: r8188eu: merge EFUSE_ShadowMapUpdate with its caller
  staging: r8188eu: use a local buffer for efuse data
  staging: r8188eu: always initialise efuse buffer with 0xff
  staging: r8188eu: use memcpy for fallback mac address
  staging: r8188eu: merge ReadEFuseByIC into rtl8188e_ReadEFuse
  staging: r8188eu: txpktbuf_bndy is always 0
  staging: r8188eu: offset is always 0 in rtl8188e_ReadEFuse
  staging: r8188eu: offset is always 0 in iol_read_efuse
  staging: r8188eu: _offset is always 0 in efuse_phymap_to_logical
  staging: r8188eu: efuse_utilized is never read
  staging: r8188eu: the bcnhead parameter is always 0

 drivers/staging/r8188eu/core/rtw_efuse.c      | 30 ------------
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 47 ++++---------------
 drivers/staging/r8188eu/hal/usb_halinit.c     | 33 +++++++------
 drivers/staging/r8188eu/include/hal_intf.h    |  4 +-
 .../staging/r8188eu/include/rtl8188e_spec.h   |  6 ---
 drivers/staging/r8188eu/include/rtw_eeprom.h  | 10 ----
 drivers/staging/r8188eu/include/rtw_efuse.h   |  2 -
 7 files changed, 29 insertions(+), 103 deletions(-)

-- 
2.30.2

