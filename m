Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB34C6D
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 20:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EF94C340F0;
	Mon, 28 Mar 2022 20:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648499324;
	bh=QLi7AzU+b/7PjKH7gsTRezczmXRNXx1OFehK9D/8XdY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=i1AGItzJaB7wOwgjZB3C7vVVPmwPfrkwl3pkUZ/tBr3UZQj8SQZzrJ2DVP5cumzjy
	 KB8YchKRrCuJxIiEU8tS3j8EHsXMpfdvta58ntAFrFUxdohx20apc5yW32bxuYK9fE
	 If0//oKQv/FhcU0vh/tSUD3Ycoz3X2ckpN4F2tuIWZcQETMI+S4YazrFVFrO/YkqOD
	 dt4FhK/cUB6F+KqxDUXJ39bitpgk6FMikcA+tx2bUsL2pyWD91bD3pjxpVllR9KVGC
	 B+o2M4kP94C7VquVCse9qpUuFeDIKsdzDEkr7W30ZZ0dvulFAQSdh2kekSyqZIj7NF
	 jc7pZqe5w+eyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F1A21EAC081;
	Mon, 28 Mar 2022 20:28:43 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver changes for 5.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <YkG60GW9QJ8OCWjd@kroah.com>
References: <YkG60GW9QJ8OCWjd@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YkG60GW9QJ8OCWjd@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.18-rc1
X-PR-Tracked-Commit-Id: 41197a5f11a4b2d11ac19bc62552022153032811
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dfdc1de64248b5e1024d8188aeaf0e59ec6cecd5
Message-Id: <164849932398.7875.1978345527314763094.pr-tracker-bot@kernel.org>
Date: Mon, 28 Mar 2022 20:28:43 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 28 Mar 2022 15:40:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dfdc1de64248b5e1024d8188aeaf0e59ec6cecd5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
