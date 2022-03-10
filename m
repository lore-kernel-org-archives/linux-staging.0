Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F3F5A1F
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 20:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3363BC340E9;
	Thu, 10 Mar 2022 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646943356;
	bh=ak+v21TU0T7xdjHzfC5DTvQ+6ElifXCS3gGz+2uZCu0=;
	h=Date:From:To:Cc:Subject:From;
	b=xFw9q3PUtkr/fx+2yGAem7DF31e/ARSI3GJye80gNtF1h0m1NZ+KJDIY+VjUSbQRZ
	 5Y7mpNVZQqbTzLkjRtOs/tGrNyjD9RJdw+mPknuHeCs7gtzc9IoM2V3FXAa9PwbwGK
	 WKejIqhJv1ZxKnMWlpZ+q2LO9122Za5c1f5vYMbA=
Date: Thu, 10 Mar 2022 21:15:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 5.17-rc8
Message-ID: <YipceDbnLhoJKnWW@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 7e57714cd0ad2d5bb90e50b5096a0e671dec1ef3:

  Linux 5.17-rc6 (2022-02-27 14:36:33 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.17-rc8

for you to fetch changes up to 342e7c6ea58200e45bcaa9bdd8402a5531c4777e:

  staging: rtl8723bs: Improve the comment explaining the locking rules (2022-03-02 16:38:24 +0100)

----------------------------------------------------------------
Staging driver fixes for 5.17-rc8

Here are 3 small fixes for staging drivers for 5.17-rc8 or -final, which
ever comes next.

They resolve some reported problems:
	- rtl8723bs wifi driver deadlock fix for reported problem that
	  is a revert of a previous patch.  Also a documentation fix is
	  added so that the same problem hopefully can not come back
	  again.
	- gdm724x driver use-after-free fix for a reported problem.

All of these have been in linux-next for a while with no reported
problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Dan Carpenter (1):
      staging: gdm724x: fix use after free in gdm_lte_rx()

Hans de Goede (2):
      staging: rtl8723bs: Fix access-point mode deadlock
      staging: rtl8723bs: Improve the comment explaining the locking rules

 drivers/staging/gdm724x/gdm_lte.c              |  5 +++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  |  7 +++++--
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 10 +++++++---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c   | 22 ++++++++++------------
 drivers/staging/rtl8723bs/core/rtw_xmit.c      | 16 +++++++++-------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c |  2 ++
 drivers/staging/rtl8723bs/include/rtw_mlme.h   |  8 ++++++--
 7 files changed, 42 insertions(+), 28 deletions(-)
