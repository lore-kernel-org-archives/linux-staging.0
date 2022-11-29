Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C13BA28
	for <linux-staging@lists.linux.dev>; Tue, 29 Nov 2022 20:52:09 +0000 (UTC)
Received: from dslb-188-104-061-001.188.104.pools.vodafone-ip.de ([188.104.61.1] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1p07aA-0001pO-87; Tue, 29 Nov 2022 21:51:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: clean up OnDisassoc
Date: Tue, 29 Nov 2022 21:51:47 +0100
Message-Id: <20221129205152.128172-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the OnDisassoc function. Use a struct ieee80211_mgmt for parsing
the incoming message and reduce the indentation levels.

Please apply this after the two series I sent some days ago

Martin Kaiser (5):
  staging: r8188eu: use ieee80211_mgmt to parse addresses
  staging: r8188eu: read reason code from ieee80211_mgmt
  staging: r8188eu: move bBusyTraffic update
  staging: r8188eu: handle the non-ap case first
  staging: r8188eu: simplify err handling for unknown station

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 47 ++++++++++-----------
 1 file changed, 22 insertions(+), 25 deletions(-)

-- 
2.30.2

