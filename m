Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15522D6E64;
	Sat,  9 May 2026 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341271; cv=none; b=upKNtMSrk03lNiLnb2noYL3t2n06nQ6hw/rVa6Mkm8sKNNwBgHDpzPghqsA753x7OisO8S6IRWTFXUr38a01YmWcm3nNLfDEhEXcZnyOOwOGOAJTqrv3HKD/t4+QIlJ7FEwraWZTIbRKRuFhq1l4QjGuHcnZBBd2GBb9aQn7GIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341271; c=relaxed/simple;
	bh=qvyqHs8rk+oFktkWXZrjPJys61xxzuQ6mVv94NO4bdI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZX6Zp4YtNxIFQOfON5ybBLct883rOp5YTbwy76/feGRitktEzxAgxX3Jq37acIxQglDBsSJLMmvZFRPI9kFAnrTisUWseRzmXjwBlulCmEdGmPxSlAVrGnoUCSR8bQacixF+8LYItNs3ENg7Cx+ciQdpQ2LjJfX2cKPHzcvEA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/2KTr46; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/2KTr46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67ECC2BCC4;
	Sat,  9 May 2026 15:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778341271;
	bh=qvyqHs8rk+oFktkWXZrjPJys61xxzuQ6mVv94NO4bdI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=I/2KTr46hrAFlI9QewspG5TWEYqAda38bdNPhJRcSilvQfeztG/TXS042lp/CubpD
	 3K03XdtWpaF7Wmt2yQIcPXGt7sAPG027z4AHvkO9vv/i+BuMphTA30caUHuteSpe8I
	 1nup+3ibcM6j9AsxttC5a6w8yk3bec5qScnJe7QBmiOd4pezlCizqQ+6eBe0UrR6ks
	 zOdN91uaJ/rlYHcix8RXvdd6AIN3REbnj1fhmF5Zeet4OxN4LN6OA93dhXfj95jf1Z
	 EoeAyzj1fbFzzg9WtQX/AYGgUBJl1XduEd3x+BxQaaajZTaWoTk2lTgfmvREj6m0bN
	 +OCEWw7dGHNVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C613811A55;
	Sat,  9 May 2026 15:40:21 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <af7msSLX8D_YkuA4@kroah.com>
References: <af7msSLX8D_YkuA4@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <af7msSLX8D_YkuA4@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.1-rc3
X-PR-Tracked-Commit-Id: bc851db06045a40c18233dd76ef0562d7f8bb6db
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 234d72ae02e48cd0cf0f6e8f8f7d57c0cf7bcc66
Message-Id: <177834121984.1109995.12465344337849911798.pr-tracker-bot@kernel.org>
Date: Sat, 09 May 2026 15:40:19 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 9 May 2026 09:48:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/234d72ae02e48cd0cf0f6e8f8f7d57c0cf7bcc66

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
