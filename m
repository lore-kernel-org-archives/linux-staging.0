Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED62F7A
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:22:36 +0000 (UTC)
Received: from dslb-188-096-140-061.188.096.pools.vodafone-ip.de ([188.96.140.61] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ng230-0002FP-0d; Sun, 17 Apr 2022 12:22:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/6] staging: r8188eu: clean up mgt_dispatcher
Date: Sun, 17 Apr 2022 12:22:15 +0200
Message-Id: <20220417102221.466524-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the mgt_dispatcher function and remove unnecessary info from the
mlme_sta_tbl array.

Martin Kaiser (6):
  staging: r8188eu: check receiver address only once
  staging: r8188eu: replace the GetFrameSubType call
  staging: r8188eu: the frame type is shifted out
  staging: r8188eu: replace mlme_handler with function pointer
  staging: r8188eu: don't call empty DoReserved function
  staging: r8188eu: use ARRAY_SIZE for mlme_sta_tbl

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 60 ++++++++-----------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  6 +-
 2 files changed, 25 insertions(+), 41 deletions(-)

-- 
2.30.2

