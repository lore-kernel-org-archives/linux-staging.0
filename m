Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AC120E0
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:24:49 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojj1q-000722-9k; Sat, 15 Oct 2022 17:24:46 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/9] staging: r8188eu: clean up the OnDeAuth function
Date: Sat, 15 Oct 2022 17:24:31 +0200
Message-Id: <20221015152440.232281-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the OnDeAuth function and tries to replace
driver-specific parsing code with helpers from ieee80211.h.

Martin Kaiser (9):
  staging: r8188eu: replace one GetAddr3Ptr call
  staging: r8188eu: get reason code from mgmt struct
  staging: r8188eu: clarify the bBusyTraffic assignment
  staging: r8188eu: use sa instead of Addr2
  staging: r8188eu: get bssid from mgmt struct
  staging: r8188eu: exit for deauth from unknown station
  staging: r8188eu: remove unnecessary return
  staging: r8188eu: summarize two flags checks
  staging: r8188eu: ignore_received_deauth is a boolean

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 45 ++++++++++-----------
 1 file changed, 21 insertions(+), 24 deletions(-)

-- 
2.30.2

