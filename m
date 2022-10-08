Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE30B10F3
	for <linux-staging@lists.linux.dev>; Sat,  8 Oct 2022 16:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89915C43140;
	Sat,  8 Oct 2022 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665246609;
	bh=DtWmD11NXBVddZY5n7EffCClnSFVrNuM1IpvTVtlI/k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=d6RJKg4716mGBoP+bYOR8lRzmaVg3pfFI1qVhJFa4ZpKxVp/Vb0L0P2IUBM5tlFIt
	 GYlqM4YbMpCLOefUczTS6ORSUFeoAtmkSorkImUi7SC/Hd7bYjrCLYqxGUgGw8WEQW
	 NyW/HhFnrY7us1z6Ng5ozSvSRtM5fmRiv1f/KGSwWS26kt2EG+Gr26yI55pPrAtU66
	 lfzlVyodyEzMGliJHjcRQaCH6pWpUubQHWj4MpYgtWyJnNrs73g6V0+k4SDOFRzC6d
	 jls8XHxPiRDK9d0smc3RXgChDbRokIIFMD0WHFT2nCcCG49HF8MQT7uFrb9IXAr/M3
	 oZhnrtqIszpZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F3A5E43EFB;
	Sat,  8 Oct 2022 16:30:09 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver changes for 6.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y0GQ+GimB8eTuRDL@kroah.com>
References: <Y0GQ+GimB8eTuRDL@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <Y0GQ+GimB8eTuRDL@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.1-rc1
X-PR-Tracked-Commit-Id: 4256e500f61922a3e59c7ecb6a11aab972d41b18
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3002b7a31894cfa0e57080f7e0961b5fee788aa3
Message-Id: <166524660942.14582.11161381391303967190.pr-tracker-bot@kernel.org>
Date: Sat, 08 Oct 2022 16:30:09 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 8 Oct 2022 17:02:16 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3002b7a31894cfa0e57080f7e0961b5fee788aa3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
