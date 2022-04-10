Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FBF1389
	for <linux-staging@lists.linux.dev>; Sun, 10 Apr 2022 20:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96911C385A4;
	Sun, 10 Apr 2022 20:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649621542;
	bh=lXzVYyKX9kMuwe87o/UiXITPzlGmt/cZtZ4IHhprIq0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KICWpaIRjthSiv+9yN3tOsyOPejXJ7zIF+4tqohaNMwFUs+WZtt1IiqEDEH7x0PYU
	 BHqbOP/qWRJ9SGJaiEvKA+j4oaTkmVH4aujcLAQYMkSnsUUTWPr6npTj/KnpzJJ3Yp
	 03xffgynchV/1IBIB/AKb/FNrf1cC+7WMFyzY0PDxrVSO0kcrT+EYXlwIQnjdjULLG
	 0rWcPutSknqGrh+9OTNGdu1OSHS6861Eelr1GcKvOYt9hlt+tctRw7Hj7MuXhAaMe8
	 OIefpATC/hbZIeXb6OD0cVsDXklDhZsDcUVuOYMJgl/2wxHb/TnsAcJTxE0G9aaFAB
	 cDDOlZ97A0v0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 847D1E8DD64;
	Sun, 10 Apr 2022 20:12:22 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fix for 5.18-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <YlLRwmx7f+fdiDuu@kroah.com>
References: <YlLRwmx7f+fdiDuu@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YlLRwmx7f+fdiDuu@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.18-rc2
X-PR-Tracked-Commit-Id: 20314bacd2f9b1b8fc10895417e6db0dc85f8248
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95aa17c36dc89bf008753217ed27f8a8eb5faf79
Message-Id: <164962154253.385.4073204117109499480.pr-tracker-bot@kernel.org>
Date: Sun, 10 Apr 2022 20:12:22 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 10 Apr 2022 14:46:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.18-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95aa17c36dc89bf008753217ed27f8a8eb5faf79

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
