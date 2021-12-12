Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24368
	for <linux-staging@lists.linux.dev>; Sun, 12 Dec 2021 18:58:52 +0000 (UTC)
Received: from dslb-188-104-058-180.188.104.pools.vodafone-ip.de ([188.104.58.180] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mwU3W-0001zY-KP; Sun, 12 Dec 2021 19:58:42 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: remove hal sreset
Date: Sun, 12 Dec 2021 19:58:30 +0100
Message-Id: <20211212185833.22000-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set moves two simple functions out of the hal layer into
the place where they are used. Since we support only a single chipset
in this driver, there's no need to go through the hal layer for such
simple functions.

Martin Kaiser (3):
  staging: r8188eu: move xmit status check from hal to rtw_cmd
  staging: r8188eu: move linked status check from hal to rtw_mlme_ext
  staging: r8188eu: clean up rtl8188e_sreset_linked_status_check

 drivers/staging/r8188eu/Makefile              |  1 -
 drivers/staging/r8188eu/core/rtw_cmd.c        | 13 ++++++-
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 18 ++++++++-
 drivers/staging/r8188eu/hal/rtl8188e_sreset.c | 37 -------------------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  1 -
 .../staging/r8188eu/include/rtl8188e_sreset.h | 13 -------
 6 files changed, 29 insertions(+), 54 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/hal/rtl8188e_sreset.c
 delete mode 100644 drivers/staging/r8188eu/include/rtl8188e_sreset.h

-- 
2.20.1

