Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D868
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 15:56:03 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqGSV-0005zf-Ik; Thu, 25 Nov 2021 16:14:47 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/6] staging: r8188eu: clean up efuse / eeprom code
Date: Thu, 25 Nov 2021 16:14:30 +0100
Message-Id: <20211125151436.5895-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused defines and functions related to efuses and eeprom.

Martin Kaiser (6):
  staging: r8188eu: Efuse_CalculateWordCnts is not used
  staging: r8188eu: efuse_WordEnableDataRead is not used
  staging: r8188eu: remove unused efuse defines
  staging: r8188eu: do not extract eeprom version from the fuses
  staging: r8188eu: remove unused eeprom defines
  staging: r8188eu: hal data's board type is unused

 drivers/staging/r8188eu/core/rtw_efuse.c      | 56 -------------------
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 24 --------
 drivers/staging/r8188eu/hal/usb_halinit.c     |  2 -
 .../staging/r8188eu/include/rtl8188e_hal.h    |  7 ---
 .../staging/r8188eu/include/rtl8188e_spec.h   | 49 ----------------
 drivers/staging/r8188eu/include/rtw_efuse.h   | 25 ---------
 6 files changed, 163 deletions(-)

-- 
2.20.1

