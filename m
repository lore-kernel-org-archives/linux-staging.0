Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B192C83
	for <linux-staging@lists.linux.dev>; Sun,  7 Nov 2021 16:16:57 +0000 (UTC)
Received: from dslb-178-004-202-058.178.004.pools.vodafone-ip.de ([178.4.202.58] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mjkqi-0002GA-EB; Sun, 07 Nov 2021 17:16:52 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/2] staging: r8188eu: remove code for writing efuses
Date: Sun,  7 Nov 2021 17:16:22 +0100
Message-Id: <20211107161624.9452-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's two patches that remove code for writing efuses, the driver needs
only read access.

Martin Kaiser (2):
  staging: r8188eu: remove write support from rtl8188e_EfusePowerSwitch
  staging: r8188eu: remove efuse write functions

 drivers/staging/r8188eu/core/rtw_efuse.c      |   4 +-
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 480 +-----------------
 drivers/staging/r8188eu/include/hal_intf.h    |   3 +-
 3 files changed, 4 insertions(+), 483 deletions(-)

-- 
2.20.1

