Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C0D4402
	for <linux-staging@lists.linux.dev>; Mon,  8 Aug 2022 20:14:41 +0000 (UTC)
Received: from dslb-188-096-136-209.188.096.pools.vodafone-ip.de ([188.96.136.209] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oL98t-0000V9-Pd; Mon, 08 Aug 2022 22:14:27 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: clean up _InitQueueReservedPage
Date: Mon,  8 Aug 2022 22:14:00 +0200
Message-Id: <20220808201405.68966-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the _InitQueueReservedPage function. Remove unused code.

This series depends on the "simplify endpoint configuration" series.

Martin Kaiser (5):
  staging: r8188eu: remove a temporary variable
  staging: r8188eu: make numNQ a u8
  staging: r8188eu: change all num...Q variables to u8
  staging: r8188eu: remove two unused defines
  staging: r8188eu: the high prio queue is always selected

 drivers/staging/r8188eu/hal/usb_halinit.c     | 33 +++++++------------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  3 +-
 .../staging/r8188eu/include/rtl8188e_spec.h   | 12 ++-----
 3 files changed, 16 insertions(+), 32 deletions(-)

-- 
2.30.2

