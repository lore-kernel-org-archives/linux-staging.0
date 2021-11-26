Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B002C80
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 13:04:21 +0000 (UTC)
Received: from dslb-178-004-171-146.178.004.pools.vodafone-ip.de ([178.4.171.146] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqatk-0006Hl-Ee; Fri, 26 Nov 2021 14:04:16 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/4] staging: r8188eu: some trivial removals
Date: Fri, 26 Nov 2021 14:03:56 +0100
Message-Id: <20211126130400.26151-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211125164745.8188-1-martin@kaiser.cx>
References: <20211125164745.8188-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty functions and unused function parameters.

Tested on top of "clean up workers". Most likey, there's no conflicts
with my previous patches.

v2:
 - add Michael's Reviewed-by tags
 - remove _ps_open_RF prototype

Martin Kaiser (4):
  staging: r8188eu: remove pm_netdev_open
  staging: r8188eu: remove _ps_open_RF
  staging: r8188eu: remove _ps_close_RF
  staging: r8188eu: loadparam needs no net_device

 drivers/staging/r8188eu/hal/usb_halinit.c      | 18 +-----------------
 drivers/staging/r8188eu/include/rtl8188e_hal.h |  1 -
 drivers/staging/r8188eu/include/usb_osintf.h   |  1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c      | 15 ++-------------
 drivers/staging/r8188eu/os_dep/usb_intf.c      |  2 +-
 5 files changed, 4 insertions(+), 33 deletions(-)

-- 
2.20.1

