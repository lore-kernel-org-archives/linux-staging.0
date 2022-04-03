Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6022C1FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:45:42 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3MA-00085T-EM; Sun, 03 Apr 2022 18:45:38 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: clean up validate_recv_ctrl_frame
Date: Sun,  3 Apr 2022 18:45:21 +0200
Message-Id: <20220403164526.357371-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the return value, use ieee80211 helpers, simplify the error
handling.

Martin Kaiser (5):
  staging: r8188eu: make validate_recv_ctrl_frame return void
  staging: r8188eu: use ieee80211 helper to check for pspoll
  staging: r8188eu: exit straight away if we have no pspoll frame
  staging: r8188eu: use ieee80211 structs for addresses
  staging: r8188eu: use ieee80211 struct for aid

 drivers/staging/r8188eu/core/rtw_recv.c | 161 +++++++++++-------------
 drivers/staging/r8188eu/include/wifi.h  |   2 -
 2 files changed, 76 insertions(+), 87 deletions(-)

-- 
2.30.2

