Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F9D72
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:12:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0D4B6134F;
	Tue, 19 Oct 2021 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634663569;
	bh=lU/s3zNbKrHTGwl2KoX/OHzS1a3QgqXiy+bziCyCv5w=;
	h=From:To:Cc:Subject:Date:From;
	b=QZgVUOvpsF/VIf7YdkqprPvMm23EcLY5AkXSgodJDEx3PR6fyo2ir6fSBmdodlPKs
	 OzGFNN+7Xl7jYtvvUBjdyzI8SHtuJ2dMmq3HtCxB8ZmhFhEsXtBnixbq9touI8SLr4
	 f+joiCVaE4nIs7k2EXmLaRtl8XDM348wzkFqWZh8OskWbxfH/vO8E0M0FTgIbF5NTg
	 1Zw7jDF2i3uMsg/EjA9jD38VIWHLS2U0BV0ogGWJufgDYHsU4I/S06VKziLzne9bVZ
	 uj0yDq1k/sWLbBnvr8tj55wD9PwvfOd26GQ8Uk9/BnDaLODX7eto+30xO9729U1T+O
	 qnBy0356ZNWJw==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 0/8] staging: prepare for const netdev->dev_addr
Date: Tue, 19 Oct 2021 10:12:35 -0700
Message-Id: <20211019171243.1412240-1-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

This set prepares staging for netdev->dev_addr being const.
We need to sprinkle const around some variables and arguments
and use appropriate helpers to write to netdev->dev_addr.

I'll do another pass over staging before the merge window,
this set is based on what's already there in net-next.

Jakub Kicinski (8):
  staging: use eth_hw_addr_set()
  staging: use eth_hw_addr_set() instead of ether_addr_copy()
  staging: use eth_hw_addr_set() for dev->addr_len cases
  staging: qlge: use eth_hw_addr_set()
  staging: rtl8712: prepare for const netdev->dev_addr
  staging: unisys: use eth_hw_addr_set()
  staging: rtl: use eth_hw_addr_set()
  staging: use eth_hw_addr_set() in orphan drivers

 drivers/staging/gdm724x/gdm_lte.c              |  4 +++-
 drivers/staging/ks7010/ks_hostif.c             |  2 +-
 drivers/staging/ks7010/ks_wlan_net.c           |  4 ++--
 drivers/staging/most/net/net.c                 |  2 +-
 drivers/staging/octeon/ethernet.c              |  2 +-
 drivers/staging/qlge/qlge_main.c               | 18 +++++++-----------
 drivers/staging/qlge/qlge_mpi.c                |  2 +-
 drivers/staging/r8188eu/os_dep/osdep_service.c |  2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c      |  2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  7 +++++--
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c    |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  2 +-
 drivers/staging/rtl8192u/r8192U.h              |  3 ++-
 drivers/staging/rtl8192u/r8192U_core.c         | 15 +++++++++------
 drivers/staging/rtl8712/os_intfs.c             |  9 +++++----
 drivers/staging/rtl8712/rtl871x_cmd.c          |  2 +-
 drivers/staging/rtl8712/rtl871x_cmd.h          |  2 +-
 drivers/staging/rtl8712/usb_intf.c             |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c    |  4 ++--
 .../staging/rtl8723bs/os_dep/osdep_service.c   |  2 +-
 .../staging/unisys/visornic/visornic_main.c    |  5 +++--
 drivers/staging/wlan-ng/p80211netdev.c         |  2 +-
 drivers/staging/wlan-ng/prism2sta.c            |  4 +++-
 23 files changed, 55 insertions(+), 46 deletions(-)

-- 
2.31.1

