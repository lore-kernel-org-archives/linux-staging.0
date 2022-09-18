Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B607C
	for <linux-staging@lists.linux.dev>; Sun, 18 Sep 2022 17:57:15 +0000 (UTC)
Received: from dslb-188-096-149-102.188.096.pools.vodafone-ip.de ([188.96.149.102] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oZyXR-0006VL-Q4; Sun, 18 Sep 2022 19:57:05 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/6] staging: r8188eu: another round of led layer cleanups
Date: Sun, 18 Sep 2022 19:56:54 +0200
Message-Id: <20220918175700.215170-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's some more cleanups for the led layer. This series should be applied
on top of the "staging: r8188eu: more led cleanups" series I sent on Sep
11th.

Martin Kaiser (6):
  staging: r8188eu: cancel blink_work during wps stop
  staging: r8188eu: update status before wps success blinking
  staging: r8188eu: remove bLedNoLinkBlinkInProgress
  staging: r8188eu: remove BlinkingLedState
  staging: r8188eu: remove duplicate bSurpriseRemoved check
  staging: r8188eu: remove two unused enum entries

 drivers/staging/r8188eu/core/rtw_led.c    | 104 +++-------------------
 drivers/staging/r8188eu/include/rtw_led.h |   8 --
 2 files changed, 12 insertions(+), 100 deletions(-)

-- 
2.30.2

