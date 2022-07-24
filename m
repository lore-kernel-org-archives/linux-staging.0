Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832BD33C3
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 15:40:16 +0000 (UTC)
Received: from dslb-178-004-201-227.178.004.pools.vodafone-ip.de ([178.4.201.227] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oFdiE-0004Qh-Mo; Sun, 24 Jul 2022 17:40:10 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: use struct ieee80211_mgmt in OnAssocRsp
Date: Sun, 24 Jul 2022 17:39:12 +0200
Message-Id: <20220724153917.138848-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a struct ieee80211_mgmt in OnAssocRsp to read elements of the
association response message.

Martin Kaiser (5):
  staging: r8188eu: get da from ieee80211_mgmt
  staging: r8188eu: read status_code from struct ieee80211_mgmt
  staging: r8188eu: read capability info from struct ieee80211_mgmt
  staging: r8188eu: read aid from struct ieee80211_mgmt
  staging: r8188eu: use offsetof for ie start offset

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

-- 
2.30.2

