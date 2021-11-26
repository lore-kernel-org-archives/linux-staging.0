Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCE22C83
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 17:32:26 +0000 (UTC)
Received: from dslb-084-059-234-221.084.059.pools.vodafone-ip.de ([84.59.234.221] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqf54-00083N-9v; Fri, 26 Nov 2021 18:32:14 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/8] staging: r8188eu: simplify usb in ep handling
Date: Fri, 26 Nov 2021 18:31:57 +0100
Message-Id: <20211126173205.21352-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the code to detect and use usb in endpoints.

Martin Kaiser (8):
  staging: r8188eu: rtw_read_port needs no cnt parameter
  staging: r8188eu: only the bulk in ep is used for network data
  staging: r8188eu: get the rcv bulk pipe handle directly
  staging: r8188eu: remove code to get int in pipe handle
  staging: r8188eu: if2 is not used
  staging: r8188eu: remove ep_num array
  staging: r8188eu: don't store nr_endpoint in a global struct
  staging: r8188eu: require a single bulk in endpoint

 drivers/staging/r8188eu/hal/usb_halinit.c     | 24 ++++---------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 10 ++++----
 drivers/staging/r8188eu/include/drv_types.h   |  6 +----
 .../staging/r8188eu/include/rtl8188e_recv.h   |  2 --
 drivers/staging/r8188eu/include/rtw_io.h      |  2 +-
 drivers/staging/r8188eu/include/rtw_recv.h    |  1 -
 drivers/staging/r8188eu/os_dep/usb_intf.c     | 24 +++++++++----------
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  6 +----
 8 files changed, 24 insertions(+), 51 deletions(-)

-- 
2.20.1

