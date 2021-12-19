Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C5029CA
	for <linux-staging@lists.linux.dev>; Sun, 19 Dec 2021 18:39:43 +0000 (UTC)
Received: from dslb-188-097-041-189.188.097.pools.vodafone-ip.de ([188.97.41.189] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mz15p-0000Iw-RY; Sun, 19 Dec 2021 19:39:33 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/9] staging: r8188: clean up the power state transitions
Date: Sun, 19 Dec 2021 19:39:17 +0100
Message-Id: <20211219183926.4746-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code for power state transitions uses arrays that describe the steps
to go from one state into another.

This patch set cleans up these arrays.

Martin Kaiser (9):
  staging: r8188: remove unused power transitions
  staging: r8188: remove sizes from power transition arrays
  staging: r8188: remove cut mask from power transitions
  staging: r8188: remove fab mask from power transitions
  staging: r8188: remove interface mask from power transitions
  staging: r8188: remove base address from power transitions
  staging: r8188: remove unused power command
  staging: r8188: reformat the power transition steps
  staging: r8188: move the steps into Hal8188EPwrSeq.c

 drivers/staging/r8188eu/hal/Hal8188EPwrSeq.c  | 102 +++++-------
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    |  84 +++++-----
 drivers/staging/r8188eu/hal/usb_halinit.c     |   6 +-
 .../staging/r8188eu/include/Hal8188EPwrSeq.h  | 148 +-----------------
 .../staging/r8188eu/include/HalPwrSeqCmd.h    |  53 +------
 5 files changed, 85 insertions(+), 308 deletions(-)

-- 
2.20.1

