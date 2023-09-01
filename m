Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972B20E1
	for <linux-staging@lists.linux.dev>; Fri,  1 Sep 2023 17:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BCF4C433CB;
	Fri,  1 Sep 2023 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693588219;
	bh=5hGgbCh/DXvNXLpwd91LJuWNlv8LwfJRornO5YjBQ08=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SxBZS1U+zxn85gR3s0Q8yKh/jYpDjyH18PA/7u4BkCIoe5ZD4ZyVzriumxdCMwfw4
	 SfL3PBsNGsRMegYYIA6Ci+Vc0lB8pEsNdvnt0bq90psc+QBDOcowh3TP6qePfu031y
	 GQUJnCisY1t2ATsQcvMx+Ef+aHoYQ03riCvFpNighBF5H/EyVH5S0tdWNysBloDDDK
	 mCy4CnU/66GUEUHcOoGfdiGS814NMAaT3QKW4mOSvTsYGJVi8sZKB7CWRkD5vzblHU
	 O+pdY0OmsBTuzF3hRBKb668OgJ4WuNvlAoINouj5SmpMO6DDGFx+0v3s8j5GmDEtZ2
	 xNsfRhT1Zrmeg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65197C595D2;
	Fri,  1 Sep 2023 17:10:19 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver updates for 6.6-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZPIBGeHW4W8GQgui@kroah.com>
References: <ZPIBGeHW4W8GQgui@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZPIBGeHW4W8GQgui@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.6-rc1
X-PR-Tracked-Commit-Id: aee17df05ea3771cb74662430dc98e69b72ab9f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e925992671907314b7db6793a28eb39b36bc21a4
Message-Id: <169358821940.1073.15277472709542929455.pr-tracker-bot@kernel.org>
Date: Fri, 01 Sep 2023 17:10:19 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 1 Sep 2023 17:19:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e925992671907314b7db6793a28eb39b36bc21a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
