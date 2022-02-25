Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335041FDA
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 13:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E302C340F2;
	Fri, 25 Feb 2022 13:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645795390;
	bh=2dmbDmQ/c16gTr3sDpKSTosZiT/HKbrMGh5Gu46S2qc=;
	h=Date:From:To:Cc:Subject:From;
	b=lGXRitXKI0d/KdbSilYtN2dOuY1KmgpVqdYD2DL0WX+7oPQ/Dr1OA8+CaoUgTBIe+
	 6nZiUPfkplgVY6M2u4SN3Ck9e113WdTZjkTCEh0UwpxcSfbCIoIDJK5QgJEDaczPIz
	 cc2Ikw/7NQc7QL3kU2jOXxEX4a/VpaAXGCz6bFdI=
Date: Fri, 25 Feb 2022 14:23:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fix for 5.17-rc6
Message-ID: <YhjYPIRvDnV7XAzV@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 754e0b0e35608ed5206d6a67a791563c631cec07:

  Linux 5.17-rc4 (2022-02-13 12:13:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.17-rc6

for you to fetch changes up to b6821b0d9b56386d2bf14806f90ec401468c799f:

  staging: fbtft: fb_st7789v: reset display before initialization (2022-02-15 17:14:22 +0100)

----------------------------------------------------------------
Staging driver fix for 5.17-rc6

Here is a single staging driver fix for 5.17-rc6.

It resolves a reported problem in the fbtft fb_st7789v.c driver that
could cause the display to be flipped in cold weather.

It has been in linux-next with no reported problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Oliver Graute (1):
      staging: fbtft: fb_st7789v: reset display before initialization

 drivers/staging/fbtft/fb_st7789v.c | 2 ++
 1 file changed, 2 insertions(+)
