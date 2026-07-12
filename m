Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8764371CE4;
	Sun, 12 Jul 2026 21:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783891062; cv=none; b=nqppTfKTVzIgKigYZEdKhNZLQIQcLzHAS+euyTbMWRFlcgttg/e7TGhuFmYmqtx6F5ylRvLsyNGdtl8FDoJbb2yA5lGx61kmqn639MBK4rjMMmjvxx24LTvphfsI0O2462925dsCgBvjMIO6gxsg0ROYtuzSumQ7WmKMR5O6vog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783891062; c=relaxed/simple;
	bh=BtnMMKk/iYZB+R9aLn7cFGX2OGfSQUuznr9U4bW1mRE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JgASgo6UxnRBEdJqwWxV7fh51oKqGO3qqpfwGZ9Q7z0KNP0I4wrg/hWvW6yzo6trjJl1QBsEuTKCDeS8k3chyGsAoFQCFPgia5rogEKVDKhkFS0MBuyOiswil66gHLKXX+z3urU52wGb2Dlxa9mbq+YFiImsjCWv1/yDX4G00WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBFrBs4B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBFrBs4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF78B1F00A3F;
	Sun, 12 Jul 2026 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783891056;
	bh=oEfKP46dTW2Fp1/cHfwHdoEWwmNmlssRl9E2rBPlgdY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hBFrBs4B/C6GUBTm3ijeeTSe6fG7+3UCsTjyOG7vbr/Mrj9XXzQrlQJEvggMGK11S
	 jFk5QkMgutbps/4GZyGazeLQCH1V2ujRBoAP2ld5MMebBo/1XZwzTFEY2scXXUK3OH
	 8fgXXj9KBaOZ7FXq1TTMTiL0oYsyj/UJd5p2pYG7o5/n5s2xA1V2Rt0d2jcYhb7Nbl
	 SXRtpH2GSl7KPdzlB0AGfL7XGOD6FiaI6UK6Pp1CV6cdrMbqn0zCXB3jLWuX0iDg/1
	 HjUJYNA/gWIV41KDzBNgTmuUY+nU1JCw6sz9+kNdaCTGa0/cycKUDqnB7xf/EdqO1C
	 hRH+1OW3eLCQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 195AD39244C3;
	Sun, 12 Jul 2026 21:17:14 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 7.2-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <alNUCxosMgwZ2XQO@kroah.com>
References: <alNUCxosMgwZ2XQO@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <alNUCxosMgwZ2XQO@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc3
X-PR-Tracked-Commit-Id: 1463ca3ec6601cbb097d8d87dbf5dcf1cb86a344
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 940d91caf09cc849ac514043bbf5c0e1b43aea0b
Message-Id: <178389103281.1485009.17806788140921849817.pr-tracker-bot@kernel.org>
Date: Sun, 12 Jul 2026 21:17:12 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 12 Jul 2026 10:44:59 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/940d91caf09cc849ac514043bbf5c0e1b43aea0b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
