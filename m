Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84213EA5
	for <linux-staging@lists.linux.dev>; Fri,  3 Jun 2022 18:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34A77C36AE3;
	Fri,  3 Jun 2022 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654282218;
	bh=mFi11WzvRUDrhTxmLoXAsjPwlv4dTuzd1ZnWn6wBUUw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=V/YYiWshOhUaoNs4jFxrTTKM08ZS3d6PS8+7R3sx16c+7PRDPpc9lm7KNK5bVY6mS
	 dSdi1V/rUGJUrQhV99f/M0E7hZ2hEArax9auH1zT2TkR25Ht3vBvxWdw19UcTYuuFq
	 EYfPPBC0IXe5ZSgipCHIYgnpEipsDVl+LMILN35px16tT7gL4IYJq0lzea8YQiHAbE
	 UX15nTdWUcuu+4ah325NUPjhhKrHlxxZDxyCUw2RAQB5H1jZvzwO6DgNBZQdTmrLBu
	 mk//W40Fq+h5mVFsl2JdMR8csCYZNxj8FrpZr3Ijcx6YQztzDF1ZTVZfbj12W4FM1t
	 /ql+URYh6hn/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 22545F0394E;
	Fri,  3 Jun 2022 18:50:18 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 5.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Ypng29bf0vGJ20fo@kroah.com>
References: <Ypng29bf0vGJ20fo@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <Ypng29bf0vGJ20fo@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.19-rc1
X-PR-Tracked-Commit-Id: 6a31a95135da0bb2c5349e49e37d76e9909ab7ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ad680f083ec360e0991c453e18a38ed9ae500d7
Message-Id: <165428221813.10974.3090032157881018828.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jun 2022 18:50:18 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 3 Jun 2022 12:22:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ad680f083ec360e0991c453e18a38ed9ae500d7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
