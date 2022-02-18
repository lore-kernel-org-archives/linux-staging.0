Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAB72F2D
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 09:30:42 +0000 (UTC)
Received: from dslb-178-004-174-047.178.004.pools.vodafone-ip.de ([178.4.174.47] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nKzb4-0005VT-C8; Fri, 18 Feb 2022 10:30:38 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: remove some more unused variables
Date: Fri, 18 Feb 2022 10:30:30 +0100
Message-Id: <20220218093034.854049-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused variables related to phy info and signal quality.

Martin Kaiser (4):
  staging: r8188eu: RxMIMOSignalQuality is set but not used
  staging: r8188eu: RxSNR is set but not used
  staging: r8188eu: NumQryPhyStatusCCK is set but not used
  staging: r8188eu: NumQryPhyStatusOFDM is set but not used

 drivers/staging/r8188eu/hal/odm_HWConfig.c | 10 ----------
 drivers/staging/r8188eu/include/odm.h      |  2 --
 drivers/staging/r8188eu/include/rtw_recv.h |  2 --
 3 files changed, 14 deletions(-)

-- 
2.30.2

