Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D248823A0
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 20:08:14 +0000 (UTC)
Received: from dslb-178-004-168-011.178.004.pools.vodafone-ip.de ([178.4.168.11] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nhd63-0001vc-JN; Thu, 21 Apr 2022 22:08:11 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: clean up OnAction_tbl
Date: Thu, 21 Apr 2022 22:08:00 +0200
Message-Id: <20220421200805.192083-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary entries from OnAction_tbl.

Martin Kaiser (4):
  staging: r8188eu: remove dummy entries from OnAction_tbl
  staging: r8188eu: on_action_spct does nothing
  staging: r8188eu: remove OnAction_qos
  staging: r8188eu: remove OnAction_dls

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 57 ---------------------
 drivers/staging/r8188eu/include/ieee80211.h |  6 ---
 2 files changed, 63 deletions(-)

-- 
2.30.2

