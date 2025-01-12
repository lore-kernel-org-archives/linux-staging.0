Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56651C1F27;
	Sun, 12 Jan 2025 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736721372; cv=none; b=YJPyO6AempIhd+zrjrcJgXGO28NXNZ3zqyiJr6o2HJpwYiOF6gczijt16nlNpy+IhKj3E4ng04o58wFcsquZx/jlRorgl2GdBp6uULSdZR8IQ+q6LmMUiLZ65eiLsO5pFpOwUIUbSknwLaqA98Rwl3D8PyNr+SddWrfX4AyVvqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736721372; c=relaxed/simple;
	bh=jzkvLvkYGnRoDKK3J28OMYFme5MTUuVnHTMGcFEMMWY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=a8oBrFZxf1AyCHEae+ALnBPTODanWXJgrB6nutOASWRgCuzYaNdbo1IJgItNp+9FpnhH4R9vt8K3mGeMW5jzWngzyUeIrQFSJycxYvZfjnKDo6fkistlzB4IBDgscsxBeculmBX6QUiRVV9yehsm621HMmpKmX7kCUDEFdIODCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKlSpuCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKlSpuCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9275C4CEE1;
	Sun, 12 Jan 2025 22:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736721371;
	bh=jzkvLvkYGnRoDKK3J28OMYFme5MTUuVnHTMGcFEMMWY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JKlSpuCV6Y0rqquSBdCYWxIZ8HQer/rVIbfBDAqC5RLoyeiHk7geOsjIMPBuZ/w5K
	 G63YZ4h4F+SmtgJ4hZD4vQA+pVmLnsl1Uk0f6BkJtL9sxtPqtug3ClQgySdWVl/krK
	 Eo/mpxwx2YCJzbVK/OgT4FSP5xakiSznXnv20B9mFu8E7VRth72NCMoHfNFnNadKqT
	 AJGRvTWIR2XFXT1AsnXKBhYVJrOmEkFDy7jD37jR/vKexHSy9OWIJ4JZST8iob4qlZ
	 fe6XBJG5pi1saJT7QtWn0xB6glhIBxyKfxG5gkPV3KeGA/P+znFz5M+tmFvFWZXe5q
	 umYzM2s1QlO4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EE5380AA5C;
	Sun, 12 Jan 2025 22:36:35 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver fixes for 6.13-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z4PMO3PX6837NuL6@kroah.com>
References: <Z4PMO3PX6837NuL6@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <Z4PMO3PX6837NuL6@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.13-rc7
X-PR-Tracked-Commit-Id: 6f79db028e827b023623a6ff825952e0d5fb619f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 91fff6fa94cbe13d28caa978ce3f600749304e11
Message-Id: <173672139413.2663698.242227771139807367.pr-tracker-bot@kernel.org>
Date: Sun, 12 Jan 2025 22:36:34 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 12 Jan 2025 15:05:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.13-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/91fff6fa94cbe13d28caa978ce3f600749304e11

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
