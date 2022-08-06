Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FBE7C
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 19:55:54 +0000 (UTC)
Received: from dslb-188-097-043-167.188.097.pools.vodafone-ip.de ([188.97.43.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oKPtk-0004Tu-QR; Sat, 06 Aug 2022 21:55:48 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/13] staging: r8188eu: simplify endpoint configuration
Date: Sat,  6 Aug 2022 21:55:27 +0200
Message-Id: <20220806195540.777390-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains cleanups for rtl8188eu_interface_configure and the
functions that it calls. I tried to fix the error handling and to
summarize small functions and common code.

Martin Kaiser (13):
  staging: r8188eu: Hal_MappingOutPipe should return an int
  staging: r8188eu: process HalUsbSetQueuePipeMapping8188EUsb's return
    value
  staging: r8188eu: merge two small functions
  staging: r8188eu: move endpoint init functions to usb_halinit.c
  staging: r8188eu: summarize endpoint-related settings
  staging: r8188eu: remove OutEpNumber
  staging: r8188eu: remove comments about endpoint mapping
  staging: r8188eu: summarize common Queue2Pipe settings
  staging: r8188eu: simplify three_out_pipe
  staging: r8188eu: simplify two_out_pipe
  staging: r8188eu: remove _InitNormalChipOneOutEpPriority
  staging: r8188eu: we always use HQ and NQ for two endpoints
  staging: r8188eu: simplify _InitNormalChipTwoOutEpPriority

 drivers/staging/r8188eu/hal/hal_com.c         | 110 -------------
 drivers/staging/r8188eu/hal/usb_halinit.c     | 152 ++++++++----------
 drivers/staging/r8188eu/include/hal_com.h     |   2 -
 drivers/staging/r8188eu/include/hal_intf.h    |   2 +-
 .../staging/r8188eu/include/rtl8188e_hal.h    |   1 -
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   4 +-
 6 files changed, 75 insertions(+), 196 deletions(-)

-- 
2.30.2

