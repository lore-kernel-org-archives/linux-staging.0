Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D62C80
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 10:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64146C36AE9;
	Thu, 30 Dec 2021 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640861735;
	bh=dMxn6IBbP5mUEAprk6i4m7xLYEImuyofVPmBHIqkSTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JomEsqMZbiAIIbzwfzQ2avuBfrAVxV+KhbbIPI9Okc8zQDudEn/C6kGHncgFtNArX
	 Xd+D8DmenRWjUvDOEsFkt3yG9jv7nRSwP9RVHLs95py8xvsDn3dexVt2uS6GxaVKzP
	 E82GP6nRb0B6JeAU75lsn9o8Pv2tDPcr+RIXDjYM=
Date: Thu, 30 Dec 2021 11:55:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH v5] staging: r8188eu: Remove useless function rtw_test()
Message-ID: <Yc2QJHT0Z3EMxJrv@kroah.com>
References: <20211227113305.86407-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227113305.86407-1-jiapeng.chong@linux.alibaba.com>

On Mon, Dec 27, 2021 at 07:33:05PM +0800, Jiapeng Chong wrote:
> This function does nothing, so it should just be deleted entirely.
> 
> Fix following coccicheck warning:
> 
> ./drivers/staging/r8188eu/os_dep/ioctl_linux.c:4253:8-15: WARNING
> opportunity for memdup_user.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
> Changes in v2:
>   -Modified subject line and commit message.
> 
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 38 --------------------
>  1 file changed, 38 deletions(-)

Does not apply to my tree at all anymore, please rebase and resend.

thanks,

greg k-h
