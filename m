Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFD05F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 16:20:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E7FE60238;
	Fri, 26 Mar 2021 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616775643;
	bh=sGeQMMUyCKfthnoYlkyFne9XUQZHWtH80Xz18/AFaVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqUu5ia43uoH46rVofPH4b+KKApSPiR5P5JZUf6i3lll9KknyEQApOOGxaO52OooW
	 NxZXIJZuj7EFkyD3g75PBc9rGcqQXR3OkPwFtchUnLVMHeiyVdM05HmXEURxXAZzrw
	 gSnqx0CsqH5i6PE7B4KROUi15iD8EWKxOp5tEli0=
Date: Fri, 26 Mar 2021 17:20:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixes: 65f183001f6e (staging: rtl8723bs: remove unused
 code blocks conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*)
Message-ID: <YF4J2JVz1tHiFsGJ@kroah.com>
References: <YF3qSsH/3vRy7BRy@kroah.com>
 <20210326155252.6746-1-fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326155252.6746-1-fabioaiuto83@gmail.com>

On Fri, Mar 26, 2021 at 04:52:52PM +0100, Fabio Aiuto wrote:
> fix indentation broken by patch removing conditional
> code blocks checked by unused
> CONFIG_INTERRUPT_BASED_TXBCN family defines
> 
> https://lore.kernel.org/r/9157000821fd6febf25566b8c712fad1995c7c78.1615907632.git.fabioaiuto83@gmail.com

No, please use a "Fixes:" tag that points to the git commit id that this
commit fixes.  Look in the kernel tree for loads of examples of how to
do this, and it's even documented in the Documentation/ process guide as
well.

thanks,

greg k-h
