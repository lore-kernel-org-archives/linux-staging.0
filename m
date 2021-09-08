Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473272
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 09:25:27 +0000 (UTC)
Received: from pd956d63d.dip0.t-ipconnect.de ([217.86.214.61] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mNtPG-0000yP-RN; Wed, 08 Sep 2021 10:58:10 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] three simple cleanups
Date: Wed,  8 Sep 2021 10:57:44 +0200
Message-Id: <20210908085747.32254-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused definitions and a pointless loop.

Martin Kaiser (3):
  staging: r8188eu: remove unused function prototype
  staging: r8188eu: remove unused define
  staging: r8188eu: this endless loop is executed only once

 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  | 34 ++++++++-----------
 drivers/staging/r8188eu/include/rtw_io.h      |  2 --
 .../staging/r8188eu/os_dep/osdep_service.c    |  2 --
 3 files changed, 15 insertions(+), 23 deletions(-)

-- 
2.20.1

