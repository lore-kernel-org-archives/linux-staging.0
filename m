Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DC82C87
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 01:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E7146610C7;
	Thu, 28 Oct 2021 01:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635383408;
	bh=hEOR8Q3YtSb8zC9D7cWDTp1gxnO0aUh/PAlhZbXDr5E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Lpx0zuwIt72iCP4d6dHvg8CHyvVUq1W4befzuW/IzXsTI9+T7eFdXa+aXz/Sb+YoA
	 Fxfkin5HVQbAUpojwaqN3WI63cDH9ogT0FcqeNFs5bJaei3+U0p3noYy5XrWvuDVQs
	 q1imb1kCeI2A9SQsO9bRCx2Wqh0xxUjl4EdTMKjCxWEfR5KRqA6pAo1GoaHaRvf3QK
	 WVRR0YXofLiJiYz/J7nIRxLkJ57h40JN6/mWQRtqYFswUHzYyTXsYG7KCnCeRxzLHH
	 OX7OR8Z5EoR/aYoEbLtbYKTUjEVIH0Gjq3LrS28xLMGMA1Jqy1iKUlwdnCYd+9ONXI
	 VewVCThRcRJ7Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D586760A5A;
	Thu, 28 Oct 2021 01:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] staging: use of_get_ethdev_address()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <163538340787.2556.1122800068266015255.git-patchwork-notify@kernel.org>
Date: Thu, 28 Oct 2021 01:10:07 +0000
References: <20211026175038.3197397-1-kuba@kernel.org>
In-Reply-To: <20211026175038.3197397-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, gregkh@linuxfoundation.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 26 Oct 2021 10:50:38 -0700 you wrote:
> Use the new of_get_ethdev_address() helper for the cases
> where dev->dev_addr is passed in directly as the destination.
> 
>   @@
>   expression dev, np;
>   @@
>   - of_get_mac_address(np, dev->dev_addr)
>   + of_get_ethdev_address(np, dev)
> 
> [...]

Here is the summary with links:
  - [net-next] staging: use of_get_ethdev_address()
    https://git.kernel.org/netdev/net-next/c/8b6ce9b02672

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


