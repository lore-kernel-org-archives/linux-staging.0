Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283FC2594
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 18:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB86BC340EE;
	Sat, 12 Feb 2022 18:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644690195;
	bh=aclq4BigH/5SnTkWtvIFs9ppgvX17gruplULvi9rNuU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cGYwzKf6BHl0KYgAEKw8RCKqI0VUOpXdlUNOep+EExpp2NwxyXXczz3pAJsj0kPJq
	 8wVRAYqA8KmGMS37523wRPA8y5nEtw8ddz2Rm/B3gYNGD3fNiT18XfMY2Zv7IuIbuO
	 0G6pTFt4Dq6Z/yy5kmg8pCiPGyCWFiv0sO1I5Yvyq51aI0FYKmxfQ1phDVb9LjVP5c
	 Kwq/ynSKcBMw2beGCh62gYVkWD7WO09VidmgdjoJvZqKjPkCET1gTxWDl40RTWyGvf
	 7wPzQP3IE79A88ffND8mtDmSEjE5BjGFKXyXqfCfW2ULoT07L9KEXmo87+cJo7c0lu
	 L09BYMFDB/Fzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B96EFE5CF96;
	Sat, 12 Feb 2022 18:23:15 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver changes for 5.17-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <YgeMgTqMg82ZC7hA@kroah.com>
References: <YgeMgTqMg82ZC7hA@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YgeMgTqMg82ZC7hA@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.17-rc4
X-PR-Tracked-Commit-Id: 426aca16e903b387a0b0001d62207a745c67cfd3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dcd72f54665717f9d610ea101336d42b7a80704b
Message-Id: <164469019575.16091.1381341887522721401.pr-tracker-bot@kernel.org>
Date: Sat, 12 Feb 2022 18:23:15 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 12 Feb 2022 11:31:29 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-5.17-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dcd72f54665717f9d610ea101336d42b7a80704b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
