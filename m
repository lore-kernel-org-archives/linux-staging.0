Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8687E6
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 08:14:29 +0000 (UTC)
Received: from ipservice-092-217-079-032.092.217.pools.vodafone-ip.de ([92.217.79.32] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1omsbI-0000nk-Vq; Mon, 24 Oct 2022 10:14:25 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/17] staging: r8188eu: clean up mlme handlers
Date: Mon, 24 Oct 2022 10:14:00 +0200
Message-Id: <20221024081417.66441-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the mlme handlers that process incoming management
frames.

We can reorder the handler functions and remove forward declarations. We
can also remove unused return values and simplify the error handling.

This series should be applied after the "some more small cleanups" series.

As usual, this series was tested with EdimaxV2 on an arm32 system.

Martin Kaiser (17):
  staging: r8188eu: restructure mlme subfunction handling
  staging: r8188eu: make OnAssocReq static
  staging: r8188eu: make OnAssocRsp static
  staging: r8188eu: make OnProbeReq static
  staging: r8188eu: make OnProbeRsp static
  staging: r8188eu: make OnBeacon static
  staging: r8188eu: make OnDisassoc static
  staging: r8188eu: make OnAuthClient static
  staging: r8188eu: make OnDeAuth static
  staging: r8188eu: make OnAction static
  staging: r8188eu: make OnAuth static
  staging: r8188eu: change mlme handlers to void
  staging: r8188eu: remove unnecessary label
  staging: r8188eu: remove unnecessary else branch
  staging: r8188eu: remove unnecessary return
  staging: r8188eu: remove an else branch
  staging: r8188eu: go2asoc is not needed

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 226 ++++++++----------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  23 +-
 2 files changed, 100 insertions(+), 149 deletions(-)

-- 
2.30.2

