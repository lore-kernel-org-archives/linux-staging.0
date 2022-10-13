Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CF820E3
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 05:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF1FC433C1;
	Thu, 13 Oct 2022 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665640492;
	bh=0faaBvGMv/nSpPq9s6sKAsi2OwnbYUTEMLf3Q82FFN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zIo/so1Dl+qwBWK+KBzT89MEXtSD9c+sxwtJFueoPQsw2W5x7x2gqks3FBHuBPIf8
	 u/rUKhhTmidq9ASPjEYO5RBIsJs/EzCMB/iHcASq7Zf1+DL3L2/DH3kRxSNGxeBqz8
	 a1DVATglSEsAzgTf2wz68bJJs8LhmU+XgGF9djpg=
Date: Thu, 13 Oct 2022 07:55:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	GUO Zihua <guozihua@huawei.com>, Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com, fmdefrancesco@gmail.com,
	skumark1902@gmail.com, asif.kgauri@gmail.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 5.4 06/27] staging: rtl8712: Fix return type for
 implementation of ndo_start_xmit
Message-ID: <Y0eoWDmylWzZjcNA@kroah.com>
References: <20221013002501.1895204-1-sashal@kernel.org>
 <20221013002501.1895204-6-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013002501.1895204-6-sashal@kernel.org>

On Wed, Oct 12, 2022 at 08:24:38PM -0400, Sasha Levin wrote:
> From: GUO Zihua <guozihua@huawei.com>
> 
> [ Upstream commit 307d343620e1fc7a6a2b7a1cdadb705532c9b6a5 ]
> 
> CFI (Control Flow Integrity) is a safety feature allowing the system to
> detect and react should a potential control flow hijacking occurs. In
> particular, the Forward-Edge CFI protects indirect function calls by
> ensuring the prototype of function that is actually called matches the
> definition of the function hook.
> 
> Since Linux now supports CFI, it will be a good idea to fix mismatched
> return type for implementation of hooks. Otherwise this would get
> cought out by CFI and cause a panic.

And another that should be dropped from all stable branches, thanks.

greg k-h
