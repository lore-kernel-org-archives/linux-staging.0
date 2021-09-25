Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD13FC8
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 14:13:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DDA360F51;
	Sat, 25 Sep 2021 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632579228;
	bh=zIqpgd92wmYxXIA+UuR083vNmruz8CUBkaWE3vELJRE=;
	h=Date:From:To:Cc:Subject:From;
	b=WL9mdJtIYSDKvopTFbob3u+mZqjVN7V/Y1x6uZKYZYJYAOvkXUI9DRwzC48eM9Gz7
	 dmiZm2ArLF+yc89Ic8hNScT+J2rXwtT0zm+tLkZPYVQj1O9OaOMpQN8bD1iw3zaJx7
	 PPjnLQCzt/o4fpu0f+ccwlSgqKXdvP50B9AKieZo=
Date: Sat, 25 Sep 2021 16:13:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 5.15-rc3
Message-ID: <YU8umcrWhi65i8PU@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.15-rc3

for you to fetch changes up to aa3233ea7bdb6c4004f5032a3a07417ea51dc409:

  staging: r8188eu: fix -Wrestrict warnings (2021-09-20 12:33:22 +0200)

----------------------------------------------------------------
Staging driver fixes for 5.15-rc3

Here are 2 small staging driver fixes for 5.15-rc3:
	- greybus tty use-after-free bugfix
	- r8188eu ioctl overlap build warning fix

Note, the r8188eu ioctl has been entirely removed for 5.16-rc1, but it's
good to get this fixed now for people using this in 5.15.

Both of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Arnd Bergmann (1):
      staging: r8188eu: fix -Wrestrict warnings

Johan Hovold (1):
      staging: greybus: uart: fix tty use after free

 drivers/staging/greybus/uart.c               | 62 ++++++++++++++--------------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c |  8 ++--
 2 files changed, 36 insertions(+), 34 deletions(-)
