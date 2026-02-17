Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E04372B3D;
	Tue, 17 Feb 2026 17:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350901; cv=none; b=CrxIiyZZF8/QiDLUxBIzPw3wP+MKTkreXSMCQ3gepSB/sQ3cJK6OZ+/n5rQzZViE9b26lmvKH8gNN8VZ2cnjLwFF72jCYfta85gZmqPLOvFwU//k4TSL6eFxFvq+DIYgh3oea2QWJSGkKZ+HKTfafWPwShKuYqeizghu/uq4fng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350901; c=relaxed/simple;
	bh=3ZH1q8pWgNwpD6PRNAHagJwLcUSFNv4ASmsKcNR5uiM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UdqjFh0Dd3R9sQOuPxUqhB7VIp4a+TLJzmrEEQGQYtIepvl+ejV8alC9ppVEJGJut/OxfOJx1gpVMqkznlL9ynF/rgZspQvCsvVQ2/fxcdmti2icOdh9lc1XG1zfNai81iIUzZTRRKStJV6cTy8RQI7ngEtlMFWTScuQKyvghJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLL+qc1/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLL+qc1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2464AC4CEF7;
	Tue, 17 Feb 2026 17:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771350901;
	bh=3ZH1q8pWgNwpD6PRNAHagJwLcUSFNv4ASmsKcNR5uiM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MLL+qc1/WN9x3wtAHh+pAuF5aDGLBmENSlhLYk97uopHy6sosIZ+jO8qj56zx2wqV
	 I8EzFHOX3MHQDJMLYsNAoXGYIhus6AztbQ/95vhfWOOgHqWzgeH6k2n75l+fJBNIqS
	 Z0sdzzoS7ZU1b/uv0pA2+mHx6w/2d/mbjgt5qtPq9qzSS9OtiqC1uYtgPFTRJakHx3
	 q+kKzf393aMpUijiwzEByx05AKJ6ZsZz/1y5j5C7l6qdub84xPsCAcM3zhkd5DSJIk
	 JbP62NbcGwrzEcO11g1PM6Vn806QSpZr5DnLU6SOMSLvFMQ4Ko87uqlvZ/7G8tShLU
	 23qcttPnyiX0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 47FC2380AAF2;
	Tue, 17 Feb 2026 17:54:54 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aZR7MAE8Cm-Viw5w@kroah.com>
References: <aZR7MAE8Cm-Viw5w@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <aZR7MAE8Cm-Viw5w@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.0-rc1
X-PR-Tracked-Commit-Id: 319e3ff5ed7bc16a9932423159b1665418a1a9a0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a5f22b9b139762685810aa5a41fd0181488aea13
Message-Id: <177135089284.577366.6527063621979240274.pr-tracker-bot@kernel.org>
Date: Tue, 17 Feb 2026 17:54:52 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 17 Feb 2026 15:29:04 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a5f22b9b139762685810aa5a41fd0181488aea13

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
