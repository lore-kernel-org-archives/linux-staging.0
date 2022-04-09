Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3BAA22
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 15:16:12 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndCol-0005k2-40; Sat, 09 Apr 2022 17:16:03 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/8] staging: r8188eu: clean up rtw_pwr_wakeup
Date: Sat,  9 Apr 2022 17:15:49 +0200
Message-Id: <20220409151557.207980-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the rtw_pwr_wakeup function. Use in-kernel routines for
handling timeouts.

Martin Kaiser (8):
  staging: r8188eu: simplify delay conditions in rtw_pwr_wakeup
  staging: r8188eu: don't set _SUCCESS again
  staging: r8188eu: make return values consistent
  staging: r8188eu: simplify the ps_processing check
  staging: r8188eu: summarize two if statements
  staging: r8188eu: use kernel functions for timeout handling
  staging: r8188eu: clean up the code to set ips_deny_time
  staging: r8188eu: remove the bInSuspend loop

 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 48 ++++++-------------
 .../staging/r8188eu/include/osdep_service.h   |  1 -
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 +-
 .../staging/r8188eu/os_dep/osdep_service.c    |  5 --
 4 files changed, 15 insertions(+), 41 deletions(-)

-- 
2.30.2

