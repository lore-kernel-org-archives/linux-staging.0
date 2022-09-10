Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579585A74
	for <linux-staging@lists.linux.dev>; Sat, 10 Sep 2022 18:02:55 +0000 (UTC)
Received: from ipservice-092-217-076-063.092.217.pools.vodafone-ip.de ([92.217.76.63] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oX4oW-0000f7-Ix; Sat, 10 Sep 2022 20:02:44 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: remove empty rtw_*scan* macros
Date: Sat, 10 Sep 2022 20:02:32 +0200
Message-Id: <20220910180236.489808-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove four rtw_*scan* macros which are empty or constant.

Martin Kaiser (4):
  staging: r8188eu: remove empty rtw_set_scan_deny macro
  staging: r8188eu: remove rtw_set_scan_deny_timer_hdl
  staging: r8188eu: remove rtw_clear_scan_deny
  staging: r8188eu: rtw_is_scan_deny is always false

 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 5 -----
 drivers/staging/r8188eu/core/rtw_mlme.c      | 5 -----
 drivers/staging/r8188eu/core/rtw_xmit.c      | 3 ---
 drivers/staging/r8188eu/include/rtw_mlme.h   | 4 ----
 4 files changed, 17 deletions(-)

-- 
2.30.2

