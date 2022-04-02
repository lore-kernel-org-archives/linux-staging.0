Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B191366
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 09:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F67C340EC;
	Sat,  2 Apr 2022 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648890921;
	bh=cmXUTzA3SwdO26GO+w95ET9rjyIfmQ1A+0zYKFbqny8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NP2r0HcjmaX6Gv+hRfR13xNgNH0Mb9CORjNyYVFU/tKWWk5sUVKfZSewk2Sti/Pcz
	 FY3gQlHlinVwzr8l9Wqh5vj9MOCJj6NoQ6j5eL7/3ZYcTlZvnZmXJi1t/zg0rA4Q6R
	 cBjZ4XyhtVuE5evNfhA/jE6CBzcEB9eyS7Jxy+HI=
Date: Sat, 2 Apr 2022 11:15:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sathish Kumar <skumark1902@gmail.com>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fix multiple blank lines warning
Message-ID: <YkgUJq8fU+CslCEl@kroah.com>
References: <20220401093449.6872-1-skumark1902@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401093449.6872-1-skumark1902@gmail.com>

On Fri, Apr 01, 2022 at 03:04:49PM +0530, Sathish Kumar wrote:
> This patch fixes the checkpatch.pl warnings like:
> CHECK: Please don't use multiple blank lines
> +
> +
> 
> Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl871x_ioctl_rtl.c | 1 -
>  drivers/staging/rtl8712/rtl871x_ioctl_set.c | 1 -
>  drivers/staging/rtl8712/rtl871x_recv.c      | 1 -
>  drivers/staging/rtl8712/rtl871x_security.c  | 1 -
>  4 files changed, 4 deletions(-)

I see 2 patches that do differnet things, yet have the same subject and
changelog text.  Please fix up and resend a v2.

thanks,

greg k-h
