Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA63210E
	for <linux-staging@lists.linux.dev>; Sat, 13 Mar 2021 20:45:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 093F464ECD;
	Sat, 13 Mar 2021 20:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615668337;
	bh=5nnFLUcda35viq8Qhfh/pqZLI3CNroVWlEze4mLqHAM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NJ4vn+v1AREtSMpGxGEL7DiW72wnmT4GRb7xNRX7pUjDbOWoKxZ30ygd0TICr6xSM
	 i0gDLHEimefL0pS/urqzxjNF0N7iIpLdmVckzLvv8jV8fwt4/8mxmtjXo35vB1qsXB
	 8NT++moB5qXBYPb9t5XMqkGX8AXTPhhpEBWk9CKVMYpozTn08+lFPl+edoINVbgxL9
	 vMs5YN7Aiz/qQFJf4A5h9hEOAkv8DXWe9vhkpy/HuEHCcbqpUUHQk0Q3AqVOx5fCZi
	 i58L7ss+3JrWsmat8KzKhiWPcyIhLnUtAXBj9IgQ0pAgUzeXoL7mb10K5UlA9TYfQV
	 OXHKK3krLLbQA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EB5E960971;
	Sat, 13 Mar 2021 20:45:36 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 5.12-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <YEzURs5m1NwP4DyY@kroah.com>
References: <YEzURs5m1NwP4DyY@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <YEzURs5m1NwP4DyY@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.12-rc3
X-PR-Tracked-Commit-Id: 16d7586dccf83785819f5b66f4d20fac9bfcd644
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: be61af330e09cfdde29fa5516b2ee015ebdc8bea
Message-Id: <161566833690.19597.7937919137536167389.pr-tracker-bot@kernel.org>
Date: Sat, 13 Mar 2021 20:45:36 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, devel@linuxdriverproject.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 13 Mar 2021 16:03:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.12-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/be61af330e09cfdde29fa5516b2ee015ebdc8bea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
