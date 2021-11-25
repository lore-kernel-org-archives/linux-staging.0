Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B1768
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 16:25:31 +0000 (UTC)
Received: from dslb-188-097-211-055.188.097.pools.vodafone-ip.de ([188.97.211.55] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqHYs-0006jj-HY; Thu, 25 Nov 2021 17:25:26 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: clean up workers
Date: Thu, 25 Nov 2021 17:25:09 +0100
Message-Id: <20211125162513.25039-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the wrapper functions for work items. Use a delayed worker in the
led layer.

I tested this series on top of "clean up efuse / eeprom code".

Martin Kaiser (4):
  staging: r8188eu: remove the _set_workitem wrapper
  staging: r8188eu: remove the _init_workitem wrapper
  staging: r8188eu: remove the _cancel_workitem_sync wrapper
  staging: r8188eu: use a delayed worker for led updates

 drivers/staging/r8188eu/core/rtw_cmd.c        |   4 +-
 drivers/staging/r8188eu/core/rtw_led.c        | 106 ++++++++----------
 .../staging/r8188eu/include/osdep_service.h   |  14 ---
 drivers/staging/r8188eu/include/rtw_led.h     |  16 +--
 4 files changed, 55 insertions(+), 85 deletions(-)

-- 
2.20.1

