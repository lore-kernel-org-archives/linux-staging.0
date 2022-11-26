Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE9817D4
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 15:59:54 +0000 (UTC)
Received: from dslb-188-096-151-149.188.096.pools.vodafone-ip.de ([188.96.151.149] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oyxKT-0000Lt-VE; Sat, 26 Nov 2022 16:42:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: another round of cleanups
Date: Sat, 26 Nov 2022 16:42:48 +0100
Message-Id: <20221126154253.178275-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series simplifies the issue_probereq_ex function and fixes other
minor things.

Martin Kaiser (5):
  staging: r8188eu: drop return value from issue_probereq_ex
  staging: r8188eu: remove wait_ms parameter
  staging: r8188eu: fix the number of probereq retries
  staging: r8188eu: simplify the checks for zero address
  staging: r8188eu: use ieee80211 helper for protected bit

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 30 ++++++-------------
 drivers/staging/r8188eu/core/rtw_recv.c       |  5 ++--
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  3 +-
 drivers/staging/r8188eu/include/wifi.h        |  3 --
 4 files changed, 12 insertions(+), 29 deletions(-)

-- 
2.30.2

