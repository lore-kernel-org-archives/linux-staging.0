Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17FFA3C
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 12:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C06C385A1;
	Sun, 10 Apr 2022 12:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649594821;
	bh=dYMhQEzpgHnWUUNH0hPRezY0fA5jNru+ZMP67xw1L00=;
	h=Date:From:To:Cc:Subject:From;
	b=dEfF+UWCpTHhBJWPSuimRamdiovi0mi7pC4pLcSsfqqIWIxTbxJ4dh8NbwKrX6a9+
	 6mlguTg+8SxzspANIK5Dzuv+CFaegrnc9EZxz31NR26aweykiZdzguMK5/2XpSNMRA
	 MAiDGtG+hXAumOXVATLltHQHoxvxq5IqcYAmmjAo=
Date: Sun, 10 Apr 2022 14:46:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fix for 5.18-rc2
Message-ID: <YlLRwmx7f+fdiDuu@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.18-rc2

for you to fetch changes up to 20314bacd2f9b1b8fc10895417e6db0dc85f8248:

  staging: r8188eu: Fix PPPoE tag insertion on little endian systems (2022-04-04 16:35:20 +0200)

----------------------------------------------------------------
Staging driver fix for 5.18-rc2

Here is a single staging driver fix for 5.18-rc2 that resolves an endian
issue for the r8188eu driver.  It has been in linux-next all this week
with no reported problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Guenter Roeck (1):
      staging: r8188eu: Fix PPPoE tag insertion on little endian systems

 drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
