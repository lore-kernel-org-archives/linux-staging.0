Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6972610A
	for <linux-staging@lists.linux.dev>; Mon,  6 Feb 2023 20:18:17 +0000 (UTC)
Received: from ipservice-092-217-084-033.092.217.pools.vodafone-ip.de ([92.217.84.33] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pP7wE-0007ps-Sz; Mon, 06 Feb 2023 21:18:06 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/6] staging: r8188eu: remove intf_start and intf_stop
Date: Mon,  6 Feb 2023 21:17:54 +0100
Message-Id: <20230206201800.139195-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the two pointers to media-specific start and stop functions. The
r8188eu driver supports only usb.

Update some of the functions in the start and stop paths to return
standard error codes instead of _SUCCESS and _FAIL.

Martin Kaiser (6):
  staging: r8188eu: pass a struct recv_buf to rtw_read_port
  staging: r8188eu: use standard error codes in rtw_read_port
  staging: r8188eu: use standard error codes in rtl8188eu_inirp_init
  staging: r8188eu: remove intf_start pointer
  staging: r8188eu: handle rtl8188eu_inirp_init errors
  staging: r8188eu: remove intf_stop pointer

 drivers/staging/r8188eu/hal/usb_halinit.c   | 16 ++++++--------
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 20 ++++++++---------
 drivers/staging/r8188eu/include/drv_types.h |  2 --
 drivers/staging/r8188eu/include/hal_intf.h  |  2 +-
 drivers/staging/r8188eu/include/rtw_io.h    |  2 +-
 drivers/staging/r8188eu/os_dep/os_intfs.c   | 12 +++++------
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 24 +++------------------
 7 files changed, 26 insertions(+), 52 deletions(-)

-- 
2.30.2

