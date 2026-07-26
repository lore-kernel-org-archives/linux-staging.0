Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45302D97B9;
	Sun, 26 Jul 2026 20:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096040; cv=none; b=BmEYZwtFSap9/yIPjD+QEMdeEvLBjPikgy51Phtr4rs599+62vxekQomh7eyw5fs0zq1Li4abkOeGOPUU2D0q/hDfHlmHUabBexYaPCEPG9md2iJlWEC4Sbz+qehdNg57cKL0Pqtaf5kbpSGYvWC/JEqVbCt2RSeJ3hULGzPqR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096040; c=relaxed/simple;
	bh=16Fqx9QOGfI6s1TNdLu78eQPbV2TJ27iUB31DvjEIQU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AqhAYTUHciKSsJiy5kfIIhIWAexpBK7QQyXazFHbrn6mobeNt1XQBWSaSCh7WVvswyWeuPDgDGPQ/NnFCXGdZkRPbjYRsGqBeEMTHpal2bGN6GUtjxQXFcZgyLaH2GySZAqqR7xfFrLHms3boH6gBr4q7ZK/KF2ufS8tQSiN3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbi4WEAN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbi4WEAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64411F000E9;
	Sun, 26 Jul 2026 20:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785096037;
	bh=TNiTYn3FSFFXb5AuRT+TTN4nlcmsQpLYJMeoWOgterI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=jbi4WEANvdwedhROD4vtVDNR1YnoNgvRi2HgZAhFmPnt5fAWohQbxIaceZ1XJE1+g
	 b45I6QBGqqqS+PX6nAtezALSxv56i50AhCESi1rIGN6kkpNNc8cEj70FalVCvgc3Sg
	 zKX2yU2u2ddpjzIOVvf5BJz1gu9/Qy/uQDSO8jCJO+DQzY/FpBdCqjdNg7JDxbGrIX
	 7iBicYyBe9OzZwypH09KD5mruRy+RhTINvAEMs3mA3mCntsXbaF2dCYlaisjnyXtmB
	 tgURO75z9risooiH7BXIDDYTzTcescyDvcbFyhpZjWO3JmOvS8ybX9PwRWCVdI6wFJ
	 Q9TkeYwF+fkaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A0B38119F4;
	Sun, 26 Jul 2026 20:00:04 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 7.2-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <amYFNRZ3HEN_acG5@kroah.com>
References: <amYFNRZ3HEN_acG5@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <amYFNRZ3HEN_acG5@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc5
X-PR-Tracked-Commit-Id: 0e95ff792ae0aa6fbad9455943e9e1e4062670e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 516e2cb01086bb448cfbac58da583bf15d3e7051
Message-Id: <178509600328.3839415.8671754209539249498.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jul 2026 20:00:03 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 26 Jul 2026 15:01:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/516e2cb01086bb448cfbac58da583bf15d3e7051

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
