Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C01378
	for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 07:49:11 +0000 (UTC)
Received: from dslb-178-004-173-157.178.004.pools.vodafone-ip.de ([178.4.173.157] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWvjv-0003JV-6K; Wed, 23 Mar 2022 08:49:07 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/7] staging: r8188eu: use ieee80211 helpers for parsing
Date: Wed, 23 Mar 2022 08:48:52 +0100
Message-Id: <20220323074859.177425-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update some of the code for parsing incoming messages to use
the ieee80211 helpers.

Martin Kaiser (7):
  staging: r8188eu: use ieee80211 define for version check
  staging: r8188eu: use ieee80211 helper to read the pwr bit
  staging: r8188eu: use standard mechanisms for control frames
  staging: r8188eu: use standard mechanisms for data frames
  staging: r8188eu: use standard mechanisms for qos data frames
  staging: r8188eu: remove unused data frame subtypes
  staging: r8188eu: remove unused control frame subtypes

 drivers/staging/r8188eu/core/rtw_recv.c       | 18 +++++-----
 drivers/staging/r8188eu/core/rtw_xmit.c       |  6 ++--
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  3 +-
 drivers/staging/r8188eu/include/wifi.h        | 36 ++++---------------
 4 files changed, 21 insertions(+), 42 deletions(-)

-- 
2.30.2

