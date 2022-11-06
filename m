Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D58320A
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 17:05:04 +0000 (UTC)
Received: from ipservice-092-217-068-220.092.217.pools.vodafone-ip.de ([92.217.68.220] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1orj4s-0001KU-RV; Sun, 06 Nov 2022 18:04:58 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: another round of cleanups
Date: Sun,  6 Nov 2022 18:04:52 +0100
Message-Id: <20221106170455.743058-1-martin@kaiser.cx>
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

Please apply them after the first patchset I sent earlier today.

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

