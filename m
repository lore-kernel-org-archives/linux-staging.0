Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A387B;
	Thu, 20 Oct 2022 11:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF14DC433C1;
	Thu, 20 Oct 2022 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666264211;
	bh=w1WFkUCsuFyQqm5gIbtA0BNFyxV8B+fFrdl4wWjex2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUErpRO4VMh/7RsU+Q1UJvaPc411910wXfkC0IAUEHWFXF2jKOZIS89Fyqo0/WZIT
	 j4v+40xtxHsaYS0lS1Mv8UhOPQ41Co4UlEtN4hrnRq85L2mOd2ZwU5JOavlFZEfA1E
	 IBw2SrW9bdx1lPSlwMkqIUfASioaeUq7uNZL2fks=
Date: Thu, 20 Oct 2022 13:10:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ubuntu <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: Request for assistance
Message-ID: <Y1EskCZF7qkiPW2O@kroah.com>
References: <Y1Eqa7uKB+Wk+Mb+@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1Eqa7uKB+Wk+Mb+@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Thu, Oct 20, 2022 at 11:00:59AM +0000, Ubuntu wrote:
> Hello,
> I have a diffictly deciding where exactly to split a long line of code. for example, this line of code is too long
> 
> uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
> 
> if i spit it this way:
> uCTSTime =
>         bb_get_frame_time(pDevice->preamble_type, byPktType, 14, pDevice->byTopCCKBasicRate);
> 
> It does not help as the second line is still too long. I considered doing it this way instead:
> uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
>                                 pDevice->byTopCCKBasicRate);
> But i did this on one of my patches and i was told it is not advisable to split a line between
> parenthesis '(' and ')'

Who told you that?

You are close, the code should look like:
	uCTSTime = bb_get_frame_time(pDevice->preamble_type, byPktType, 14,
				     pDevice->byTopCCKBasicRate);

Like millions of other lines in the kernel source tree.  When in doubt,
look at existing implementations.

hope this helps,

greg k-h
