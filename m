Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E092578
	for <linux-staging@lists.linux.dev>; Sat, 14 May 2022 16:47:56 +0000 (UTC)
Received: from dslb-188-097-047-153.188.097.pools.vodafone-ip.de ([188.97.47.153] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1npuvh-0003kw-Qd; Sat, 14 May 2022 18:47:45 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/7] staging: r8188eu: more cleanups in OnAction_back
Date: Sat, 14 May 2022 18:47:33 +0200
Message-Id: <20220514164740.282552-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify some more places where fields are extracted from an incoming
block ack frame.

This series should be applied after the "start cleaning up OnAction_back"
series.

Martin Kaiser (7):
  staging: r8188eu: get addba resp status from ieee80211_mgmt
  staging: r8188eu: read addba resp tid from ieee80211_mgmt
  staging: r8188eu: merge process_addba_req into OnAction_back
  staging: r8188eu: replace if with ternary operator
  staging: r8188eu: use BIT(tid) instead of manual shift
  staging: r8188eu: check for initiator vs recipient
  staging: r8188eu: use the tid in delba processing

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 36 ++++++++++---------
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 22 ------------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 --
 3 files changed, 20 insertions(+), 40 deletions(-)

-- 
2.30.2

