Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE6C184D
	for <linux-staging@lists.linux.dev>; Sun,  8 May 2022 16:15:06 +0000 (UTC)
Received: from dslb-094-219-036-010.094.219.pools.vodafone-ip.de ([94.219.36.10] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nnjYd-00045H-RC; Sun, 08 May 2022 18:14:55 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: start cleaning up OnAction_back
Date: Sun,  8 May 2022 18:14:46 +0200
Message-Id: <20220508161451.115847-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a struct ieee80211_mgmt variable to OnAction_back, simplify the
parsing of the received management frame.

Martin Kaiser (5):
  staging: r8188eu: read addr2 from ieee80211_mgmt
  staging: r8188eu: don't check the category in OnAction_back
  staging: r8188eu: read destination address from ieee80211_mgmt
  staging: r8188eu: use back action codes from ieee80211.h
  staging: r8188eu: read back action code from ieee80211_mgmt

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 84 ++++++++++-----------
 1 file changed, 40 insertions(+), 44 deletions(-)

-- 
2.30.2

