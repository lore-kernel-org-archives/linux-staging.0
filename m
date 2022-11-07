Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B7122AC
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 20:28:35 +0000 (UTC)
Received: from ipservice-092-217-067-198.092.217.pools.vodafone-ip.de ([92.217.67.198] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1os8jQ-0004bP-Ag; Mon, 07 Nov 2022 21:28:32 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/3] staging: r8188eu: another round of cleanups
Date: Mon,  7 Nov 2022 21:28:21 +0100
Message-Id: <20221107202824.61431-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's some more cleanups, mostly related to bSurpriseRemoved and
bDriverStopped.

Please apply them after the series I sent yesteday.

Changes in v2
- Fixed the header len calculation in patch 1. Thanks to Dan Carpenter
  for spotting this mistake.

Martin Kaiser (3):
  staging: r8188eu: use a qos_hdr in validate_recv_data_frame
  staging: r8188eu: drop another removal/stop check
  staging: r8188eu: drop removal/stop check in
    dump_mgntframe_and_wait_ack

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 ------
 drivers/staging/r8188eu/core/rtw_recv.c     | 9 +++++----
 2 files changed, 5 insertions(+), 10 deletions(-)

-- 
2.30.2

