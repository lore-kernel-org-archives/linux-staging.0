Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADAF2F32
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 19:37:45 +0000 (UTC)
Received: from dslb-178-004-174-121.178.004.pools.vodafone-ip.de ([178.4.174.121] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1neio3-0005fr-8s; Wed, 13 Apr 2022 21:37:35 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/8] staging: r8188eu: clean up rtw_pwr_wakeup
Date: Wed, 13 Apr 2022 21:36:46 +0200
Message-Id: <20220413193654.258507-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409151557.207980-1-martin@kaiser.cx>
References: <20220409151557.207980-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the rtw_pwr_wakeup function. Use in-kernel routines for
handling timeouts.

v2:
 - drop the "don't set _SUCCESS again" patch
 - add another patch to remove unused timer functions

Martin Kaiser (8):
  staging: r8188eu: simplify delay conditions in rtw_pwr_wakeup
  staging: r8188eu: make return values consistent
  staging: r8188eu: simplify the ps_processing check
  staging: r8188eu: summarize two if statements
  staging: r8188eu: use kernel functions for timeout handling
  staging: r8188eu: clean up the code to set ips_deny_time
  staging: r8188eu: remove the bInSuspend loop
  staging: r8188eu: remove unused timer functions

 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 44 ++++++-------------
 .../staging/r8188eu/include/osdep_service.h   |  4 --
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  2 +-
 .../staging/r8188eu/os_dep/osdep_service.c    | 16 -------
 4 files changed, 14 insertions(+), 52 deletions(-)

-- 
2.30.2

