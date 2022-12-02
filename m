Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70711C2B
	for <linux-staging@lists.linux.dev>; Fri,  2 Dec 2022 09:32:11 +0000 (UTC)
Received: from ipservice-092-217-087-074.092.217.pools.vodafone-ip.de ([92.217.87.74] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1p12Or-0001zC-Va; Fri, 02 Dec 2022 10:32:06 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/2] staging: r8188eu: use ieee80211 helpers for subtype
Date: Fri,  2 Dec 2022 10:31:57 +0100
Message-Id: <20221202093159.404111-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the ieee80211 helper functions in some places where the frame subtype
is checked.

Martin Kaiser (2):
  staging: r8188eu: use subtype helpers in collect_bss_info
  staging: r8188eu: use subtype helper in rtw_check_bcn_info

 drivers/staging/r8188eu/core/rtw_mlme_ext.c  | 26 +++++++++-----------
 drivers/staging/r8188eu/core/rtw_wlan_util.c |  7 +++---
 2 files changed, 14 insertions(+), 19 deletions(-)

-- 
2.30.2

