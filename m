Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709A329A1
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 17:10:43 +0000 (UTC)
Received: from dslb-188-097-213-253.188.097.pools.vodafone-ip.de ([188.97.213.253] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oopLs-0006xg-J0; Sat, 29 Oct 2022 19:10:32 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/2] staging: r8188eu: remove the last get_da calls
Date: Sat, 29 Oct 2022 19:10:09 +0200
Message-Id: <20221029171011.1572091-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the remaining two get_da calls with ieee80211_get_DA and
remove get_da.

Martin Kaiser (2):
  staging: r8188eu: replace get_da with ieee80211_get_DA
  staging: r8188eu: remove get_da

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  3 ++-
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  3 ++-
 drivers/staging/r8188eu/include/wifi.h        | 22 -------------------
 3 files changed, 4 insertions(+), 24 deletions(-)

-- 
2.30.2

