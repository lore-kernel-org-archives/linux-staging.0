Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816B57D
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 10:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFBFC340E7;
	Sat, 12 Feb 2022 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644661892;
	bh=W8C3px4Ho/2tSKsRI2O5MxXfZutbE8YDsLfIVKb3P3o=;
	h=Date:From:To:Cc:Subject:From;
	b=XGZQqpetQWZMdaGqP4pK+wxUO8dWF2JLo8nckcwv9wk4t4v5OAhChvTyD7A9uT5V/
	 e4buUoAns3sbx6a0hMHoz0Yvrf8GbYhKkHONJiquxTbk8+RUG6NMHnl5h4jRiNfRu+
	 1mo+Ize34gv4svOCwRw/FCmDHwpS6sWNnSLutskg=
Date: Sat, 12 Feb 2022 11:31:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver changes for 5.17-rc4
Message-ID: <YgeMgTqMg82ZC7hA@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.17-rc4

for you to fetch changes up to 426aca16e903b387a0b0001d62207a745c67cfd3:

  staging: fbtft: Fix error path in fbtft_driver_module_init() (2022-01-25 16:36:49 +0100)

----------------------------------------------------------------
Staging driver fixes for 5.17-rc4

Here are 2 staging driver fixes for 5.17-rc4.  These are:
	- fbtft error path fix
	- vc04_services rcu dereference fix

Both of these have been in linux-next for a while with no reported
issues

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Padmanabha Srinivasaiah (1):
      staging: vc04_services: Fix RCU dereference check

Uwe Kleine-König (1):
      staging: fbtft: Fix error path in fbtft_driver_module_init()

 drivers/staging/fbtft/fbtft.h                        |  5 ++++-
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c    | 20 ++++++++++++++++++--
 2 files changed, 22 insertions(+), 3 deletions(-)
