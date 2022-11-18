Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58A78F65
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 18:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8A0C433D6;
	Fri, 18 Nov 2022 18:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668794853;
	bh=YKezUL7rdlqTM5mMiRBYXJ4nNl15Ylq+dzyu9cNREjo=;
	h=Date:From:To:Cc:Subject:From;
	b=Hw+KJNpR3Oc/tgyt8+oXuT4o13R0qHGZykjYV572abW5aKOB46U8Jw73CU7YARQxI
	 gA3PwC7OVPu9Pq/dswHcyGwOAvdmaCklFMiLyX7sz0RPW68olmbVx7H5YbRZQQ/y0U
	 /y4R+fombBYnR3bkuMHthThcD1vvLEGhIYrZN++w=
Date: Fri, 18 Nov 2022 19:07:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fix for 6.1-rc6
Message-ID: <Y3fJ4o2sEO7Kef0y@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.1-rc6

for you to fetch changes up to 937ec9f7d5f2625d60077bb7824fee35dc447c6e:

  staging: rtl8192e: remove bogus ssid character sign test (2022-10-25 19:13:48 +0200)

----------------------------------------------------------------
Staging driver fix for 6.1-rc6

Here is a single staging driver fix for 6.1-rc6.

It resolves a bogus signed character test as pointed out, and fixed by,
Jason in the rtl8192e driver

It has been in linux-next for a few weeks now with no reported problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Jason A. Donenfeld (1):
      staging: rtl8192e: remove bogus ssid character sign test

 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)
