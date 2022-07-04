Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A30A3D9A
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 14:52:47 +0000 (UTC)
Received: from dslb-178-004-207-027.178.004.pools.vodafone-ip.de ([178.4.207.27] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1o8NRC-0004hD-Uh; Mon, 04 Jul 2022 16:52:35 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: power sequences cleanup
Date: Mon,  4 Jul 2022 16:52:16 +0200
Message-Id: <20220704145221.159949-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify and clean up the power sequences. Remove some unused register
definitions.

Martin Kaiser (5):
  staging: r8188eu: move pwr seq defines to HalPwrSeqCmd.c
  staging: r8188eu: support only us in PWR_CMD_DELAY
  staging: r8188eu: read pwr seq length, remove PWR_CMD_END
  staging: r8188eu: remove sdio definitions
  staging: r8188eu: mac addr len is unused

 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |  60 +++++---
 .../staging/r8188eu/include/HalPwrSeqCmd.h    |  47 ------
 .../staging/r8188eu/include/rtl8188e_spec.h   | 137 ------------------
 3 files changed, 42 insertions(+), 202 deletions(-)

-- 
2.30.2

