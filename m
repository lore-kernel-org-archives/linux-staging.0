Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DEC14658B;
	Tue, 28 Jan 2025 01:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738026442; cv=none; b=r34fpsyAL+TwNsWFz8j48Eh5r82JNspzzZIThYfTCHggGfLXwR4HqTq9MNvU559U0vwhKUzLXJ6LOPJC/tS07wQzXu9v+0k7mOD2eVPedJWt6PW5fJ6eE1IBV0grjhkd76jfoUD8sXfuWNNCN+wao0cKINSNEQZyYpQvjQnPR+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738026442; c=relaxed/simple;
	bh=lD/qpdJqu2XmnQsjAEcFpH3jyHupHUqNf8kf4/h+8gE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CpSq1kH08v9g4UevM1Fq6t7N9IzkEz0BFqGBXBxQ7x2FPX3oHSZ5zMEBWFR2mNhmDmFwFgmeQC070vnVTxWNS8zAY6Ohcw7bC97da70yNfj8twkhpJyqWoPz0FAIxn+zAeL+4nEEE5WB0p2Vjwdx+6eQ9VUFk+9K1mHljt+NwOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0FkQCpy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0FkQCpy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EFFC4CEE0;
	Tue, 28 Jan 2025 01:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738026442;
	bh=lD/qpdJqu2XmnQsjAEcFpH3jyHupHUqNf8kf4/h+8gE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=j0FkQCpyu/Xoad5dC3gL2HDGmlvd3mBxEw3G4Y02KF93dYmVV3/XdIZo8H9u26nL5
	 tbF+V8FpM0OvsX97QGu6C9SI4CTYVWANOnr0l9PWsuNhAvHbTn0bhpmkx6PEouDG/d
	 9zwppbGewdmcxzHo6xewJaf2xhIAtDKd/n2R7aNMVIooh+Y86QKfWAb6L/hK4BEBcf
	 rbIt40gXp0f4LIC29CI98gOS6FIsNWNaU9u9ovObgeO2Iv7wWGZ3a7B8V2ot3RUJPX
	 aZq94P3pJ33bY0vm/WwcmVbaqMCEHHws094B3iv9QthirIEhyGYbHbPUOD2u5/MGY/
	 FBsVZLPYs+2JQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC8380AA63;
	Tue, 28 Jan 2025 01:07:49 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5fJXGnAxELspPkC@kroah.com>
References: <Z5fJXGnAxELspPkC@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5fJXGnAxELspPkC@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.14-rc1
X-PR-Tracked-Commit-Id: 579b6f18c5ca162af040f44684cc55f7da182236
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 125ca745467d4f87ae58e671a4a5714e024d2908
Message-Id: <173802646799.3281647.10781171035100935505.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jan 2025 01:07:47 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 27 Jan 2025 18:58:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/125ca745467d4f87ae58e671a4a5714e024d2908

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
