Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C903204
	for <linux-staging@lists.linux.dev>; Mon,  2 May 2022 20:26:15 +0000 (UTC)
Received: from ipservice-092-217-077-109.092.217.pools.vodafone-ip.de ([92.217.77.109] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nlcJw-0007ch-IE; Mon, 02 May 2022 22:07:00 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/9] staging: r8188eu: clean up OnAction
Date: Mon,  2 May 2022 22:06:43 +0200
Message-Id: <20220502200652.143665-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the OnAction function. Remove unused action categories.
Use a switch statement instead of a table for the three remaining
categories.

Martin Kaiser (9):
  staging: r8188eu: action category ht is not used
  staging: r8188eu: action category wmm is not used
  staging: r8188eu: remove unused action handler prototypes
  staging: r8188eu: remove action_handler string
  staging: r8188eu: remove an unused category define
  staging: r8188eu: replace OnAction_tbl with switch-case
  staging: r8188eu: use ieee80211_mgmt for action category
  staging: r8188eu: use standard category defines
  staging: r8188eu: remove unused IEEE_* defines

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 62 +++++++------------
 drivers/staging/r8188eu/core/rtw_p2p.c        |  4 +-
 drivers/staging/r8188eu/include/ieee80211.h   | 10 ---
 .../staging/r8188eu/include/rtw_mlme_ext.h    | 16 -----
 4 files changed, 23 insertions(+), 69 deletions(-)

-- 
2.30.2

