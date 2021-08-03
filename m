Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BB070
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 22:36:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B7E861029;
	Tue,  3 Aug 2021 22:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628030203;
	bh=hQ50CpAn7wAmW4WIyQJTFytEVNqrsX5q/ubUIcXjkgg=;
	h=From:To:Cc:Subject:Date:From;
	b=sAXwd2yVSeHKnfYXpLo0f4bKSUOd85VghAfY/zwkrp07hCFSHOaQHKhqRHCeV30fI
	 yHJn5nXmYlqPGUw9CSNu5ySebChQtDRd7UwyArTCmbt5OdsdXPqUGjMuAI3wHwo8oz
	 JJ+qzu7nrUQOb9iBBFgCAmPXUitt8DVKgMgJO8zoMAnUNiE4laeollNuUWw4fmzC7h
	 K3iCAEy79Ee9tQlgVl1HnzTEqq4GI97yUw47jc2CwXU9OKTunaenCa6DfncRwjV+Ve
	 L7v+p0bgVqJ5iS2pHHXEYwbWTtCGA+F3xYP2IE3re2MhscDH1wa/bl3ib8aRv/4Acv
	 v+z0rR6PAImHg==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Phillip Potter <phil@philpotter.co.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/4] staging: r8188eu: Fix clang warnings
Date: Tue,  3 Aug 2021 15:36:05 -0700
Message-Id: <20210803223609.1627280-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

This series cleans up all of the clang warnings that I noticed with
x86_64 allmodconfig on the current staging-next. This has been build
tested with both clang and gcc with x86_64 allmodconfig.

Nathan Chancellor (4):
  staging: r8188eu: Remove _rtw_spinlock_free()
  staging: r8188eu: Remove unnecessary parentheses
  staging: r8188eu: Remove self assignment in get_rx_power_val_by_reg()
  staging: r8188eu: Remove pointless NULL check in
    rtw_check_join_candidate()

 drivers/staging/r8188eu/core/rtw_cmd.c        |  2 -
 drivers/staging/r8188eu/core/rtw_mlme.c       | 18 +----
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    |  2 +-
 drivers/staging/r8188eu/core/rtw_recv.c       | 11 ---
 drivers/staging/r8188eu/core/rtw_security.c   |  4 +-
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    | 77 -------------------
 drivers/staging/r8188eu/core/rtw_wlan_util.c  |  2 +-
 drivers/staging/r8188eu/core/rtw_xmit.c       | 19 -----
 drivers/staging/r8188eu/hal/odm.c             |  2 +-
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |  2 -
 drivers/staging/r8188eu/hal/usb_halinit.c     |  2 +-
 .../staging/r8188eu/include/osdep_service.h   |  1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  2 -
 .../staging/r8188eu/os_dep/osdep_service.c    |  4 -
 14 files changed, 9 insertions(+), 139 deletions(-)


base-commit: 11e14fc3e49481b6322bbd976bb7dd2f0d7ef3d2
-- 
2.33.0.rc0

