Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626AB2C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 17:24:14 +0000 (UTC)
Received: from ipservice-092-217-067-147.092.217.pools.vodafone-ip.de ([92.217.67.147] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mbnPm-0006XE-0r; Sat, 16 Oct 2021 19:24:10 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/2] staging: r8188eu: remove CONFIG_BT_COEXIST
Date: Sat, 16 Oct 2021 19:23:43 +0200
Message-Id: <20211016172345.23114-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the remaining code for CONFIG_BT_COEXIST, which is not used for
this driver.

This series should be applied on top of "staging: r8188eu: another round
of removals".

Martin Kaiser (2):
  staging: r8188eu: remove unused components in pwrctrl_priv
  staging: r8188eu: remove BT_COEXIST settings from Makefile

 drivers/staging/r8188eu/Makefile              | 5 -----
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 4 ----
 2 files changed, 9 deletions(-)

-- 
2.20.1

