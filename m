Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484FF233956;
	Mon, 22 Jun 2026 19:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782158334; cv=none; b=BJIcoRTaxOsI7JtfQYWXQOA6uhuZoUZ7fqUXiEhWiazqOnPXPpf6pkkPWgF3TbaR+tZGliAgkqPNNvbLV8DVUNR0u96tXKihZzfpkoqpLp9PEpQrIQAGpNEFPlGHQS9/G9Ou0wcRRnmR9xZghf76ycdEc1G3bh6d93hq/HCMMkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782158334; c=relaxed/simple;
	bh=awZ0hOrxI7hHrp3CPeJjCjGtg1C6MTNEn9nmWX0Iv48=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pINzgLVHkLkdMbrRG+rHba1P1hf914bLBXgJhfId0ttNBe01MAEENpe5HK0nhmw5yblDPg65NFuTaeMm4ijsIBE+/alZvY3MqKgck8E4dtgqWSEtJw7Oxyz4gONmg7c5CswHsELg9UHitJHs/f56X94a/FfCscUUiI/qTMc2I0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBoHCUVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBoHCUVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE371F000E9;
	Mon, 22 Jun 2026 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782158333;
	bh=qNa27OTJ8zc44xnx6A7WsQgVc+4Sutl5BmkHCgCsphM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RBoHCUVaiCYy//yQfyNq2cGYEuuGwCG24bxqB9wJwDWZdIGWXt/Eh+Rz3PkQ+uEwJ
	 UPCei5t8WW+DBMXFMVB31m28aorrmY5qrsGXVk2ZUySe6gXO/7ZEDKU00k8ScWL+uo
	 X7oFQJnWCN7cfwkeQ/8SsfokNxUQjDczMvgr8aCpJAtmbfJVV1zV1miKSodyNV0SyP
	 /8zGQIVbbpm6jYlOTmYSohkQcxhIcf/K7YhEp8+9qUa6B7vIZVLogWywRaNI1+IfZ7
	 NkVfgT/zS8yjZZJHmLeAtP0waVcn+YI+umCsPy6bFcBlttMKyG9MlOaaupFkgA4OFw
	 dJUv6Tt9BUBPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D098E3930922;
	Mon, 22 Jun 2026 19:58:44 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver changes for 7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ajk7ca-9XOfMAZTC@kroah.com>
References: <ajk7ca-9XOfMAZTC@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <ajk7ca-9XOfMAZTC@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc1
X-PR-Tracked-Commit-Id: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4708cac0e22cfd217f48f7cec3c35e5922efcccd
Message-Id: <178215832338.1395317.13972145782737407748.pr-tracker-bot@kernel.org>
Date: Mon, 22 Jun 2026 19:58:43 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The pull request you sent on Mon, 22 Jun 2026 15:41:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4708cac0e22cfd217f48f7cec3c35e5922efcccd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
