Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335FF1B69
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 08:17:15 +0000 (UTC)
Received: from dslb-188-097-046-221.188.097.pools.vodafone-ip.de ([188.97.46.221] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nKFUm-0008Pc-6b; Wed, 16 Feb 2022 09:17:04 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: three trivial cleanups
Date: Wed, 16 Feb 2022 09:16:54 +0100
Message-Id: <20220216081657.622467-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes an unused struct and two unused variables.

Martin Kaiser (3):
  staging: r8188eu: evt_allocated_buf is not used
  staging: r8188eu: evt_done_cnt is set but not used
  staging: r8188eu: struct usb_suspend_parm is not used

 drivers/staging/r8188eu/core/rtw_cmd.c      |  1 -
 drivers/staging/r8188eu/core/rtw_mlme_ext.c |  2 --
 drivers/staging/r8188eu/include/rtw_cmd.h   | 14 --------------
 3 files changed, 17 deletions(-)

-- 
2.30.2

