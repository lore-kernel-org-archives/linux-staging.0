Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD023D70
	for <linux-staging@lists.linux.dev>; Sat, 26 Feb 2022 18:15:26 +0000 (UTC)
Received: from ipservice-092-217-092-093.092.217.pools.vodafone-ip.de ([92.217.92.93] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nO1bF-0001Cd-Ud; Sat, 26 Feb 2022 19:15:22 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/7] staging: r8188eu: some removals, fix an endless loop
Date: Sat, 26 Feb 2022 19:14:50 +0100
Message-Id: <20220226181457.1138035-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220226144843.1118951-1-martin@kaiser.cx>
References: <20220226144843.1118951-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes some unused variables, functions and defines in
rtw_recv.[ch]

v2: Fix an endless loop in recv_func.

Martin Kaiser (7):
  staging: r8188eu: smooth_rssi_data is not used
  staging: r8188eu: irq_prepare_beacon_tasklet is unused
  staging: r8188eu: fix endless loop in recv_func
  staging: r8188eu: cnt is set but not used
  staging: r8188eu: recvframe_push is not used
  staging: r8188eu: get_rx_status is not used
  staging: r8188eu: remove unused define

 drivers/staging/r8188eu/core/rtw_recv.c    |  6 +---
 drivers/staging/r8188eu/include/rtw_recv.h | 34 ----------------------
 2 files changed, 1 insertion(+), 39 deletions(-)

-- 
2.30.2

