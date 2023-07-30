Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AB4369
	for <linux-staging@lists.linux.dev>; Sun, 30 Jul 2023 11:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11291C433C8;
	Sun, 30 Jul 2023 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690715240;
	bh=E4LNqsv1lwU4GRCt6fPvRvslxpVxWHFdlSY8gywKbz0=;
	h=Date:From:To:Cc:Subject:From;
	b=A1mwbhzHA+JMDrF31uyYGSPfGFk/1ZQM5KQz2VAj8k8/PAc5jpwNodvgcfp+XGpAm
	 9W6QOt+PEPyJ17F0xZo0S4QhT5jC9ewkyO2nG3scLSwgR3Gz0gwF+AaCN2IUZKOFuu
	 fFqJTvZTEsfn5sdZ6UCuDt0Nq4cbH0V8DvcWI3xk=
Date: Sun, 30 Jul 2023 13:07:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 6.5-rc4
Message-ID: <ZMZEZev25nzJoNaM@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6eaae198076080886b9e7d57f4ae06fa782f90ef:

  Linux 6.5-rc3 (2023-07-23 15:24:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.5-rc4

for you to fetch changes up to 5f1c7031e044cb2fba82836d55cc235e2ad619dc:

  staging: ks7010: potential buffer overflow in ks_wlan_set_encode_ext() (2023-07-27 09:54:33 +0200)

----------------------------------------------------------------
Staging driver fixes for 6.5-rc4

Here are 3 small staging driver fixes for 6.5-rc4 that resolve some
reported problems.  These fixes are:
  - fix for an old bug in the r8712 driver
  - fbtft driver fix for a spi device
  - potential overflow fix in the ks7010 driver

All of these have been in linux-next with no reported problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Larry Finger (1):
      staging: r8712: Fix memory leak in _r8712_init_xmit_priv()

Raphael Gallais-Pou (1):
      staging: fbtft: ili9341: use macro FBTFT_REGISTER_SPI_DRIVER

Zhang Shurong (1):
      staging: ks7010: potential buffer overflow in ks_wlan_set_encode_ext()

 drivers/staging/fbtft/fb_ili9341.c     |  2 +-
 drivers/staging/ks7010/ks_wlan_net.c   |  6 +++--
 drivers/staging/rtl8712/rtl871x_xmit.c | 43 +++++++++++++++++++++++++++-------
 drivers/staging/rtl8712/xmit_linux.c   |  6 +++++
 4 files changed, 45 insertions(+), 12 deletions(-)
