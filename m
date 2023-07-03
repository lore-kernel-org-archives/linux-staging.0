Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1561C125A8
	for <linux-staging@lists.linux.dev>; Mon,  3 Jul 2023 20:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82934C433CA;
	Mon,  3 Jul 2023 20:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688416203;
	bh=fYGf6/P6PCwU0c5wqiJ4jgnTY8peRRZdVZc8FpDWnUE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A0FQpGAS0jemYryQxtad/7vhv53PjwFXIN3FWCaC5yMtWRMYk9I8xQkNfdY2QE0vb
	 OlfXwvYRv+rWZp4JmfeFWOIyi2At0mXlWhC+AJ4VBNG2IspzYP0m9laGYplBb4b0/Y
	 BuFPHYNLmg1eLFItFSvqDEx6dhH0z8RlszNjy+5MCD7QLBmVyn/lkVM8EvRdOmw0+w
	 4Ytbq9rdf32lERPCJsP421x+85zbvT7xQOy86oUxe4H+LXV1kOGXpEZszc2+HURRUV
	 qHA9QyhFnaooTKlfysX3srKJVeh5ZsjCQW+hVXhzsXmk4JjpjHY69d475m+l7KX+zE
	 uE5t7hKOUklVA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6577CC561EE;
	Mon,  3 Jul 2023 20:30:03 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 6.5-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZKKeWkpCEqxHZ7qK@kroah.com>
References: <ZKKeWkpCEqxHZ7qK@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <ZKKeWkpCEqxHZ7qK@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.5-rc1
X-PR-Tracked-Commit-Id: 4a22870cede374d80c5d2f9c5b79253a5a667832
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: db9c6d1d7fcc6dc803f042bf3d29bbff91837f57
Message-Id: <168841620338.1331.16390344819968928844.pr-tracker-bot@kernel.org>
Date: Mon, 03 Jul 2023 20:30:03 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 3 Jul 2023 12:09:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.5-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/db9c6d1d7fcc6dc803f042bf3d29bbff91837f57

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
