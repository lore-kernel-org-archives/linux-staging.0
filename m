Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256741C04
	for <linux-staging@lists.linux.dev>; Thu, 23 Mar 2023 04:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7090AC433EF;
	Thu, 23 Mar 2023 04:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679547324;
	bh=L8V8tdH9v0Pzz/Q+0e1Gx1r0FWztww1FBu2Dj3c0Zd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y276/HWlE/usJ9mOqeGEygGMOaJ873CjPrJP0yUashiHXnS55OsV9kHzk5LpwNmc6
	 HxyurKiolWUokkf3wvgF+W8GixkYYq7DsxycdlRWe+5kgRZZFTyNFQFs/IRmhJJHYs
	 G1OLwZWgRcb+I1ihBrL6TkvNbspht8ZJSLHrPuQ4=
Date: Thu, 23 Mar 2023 05:55:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rohit Chavan <roheetchavan@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: Fixing coding style issues reported
 by checkpatch
Message-ID: <ZBvbufoYo/wPp4qY@kroah.com>
References: <20230322142923.723-1-roheetchavan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322142923.723-1-roheetchavan@gmail.com>

On Wed, Mar 22, 2023 at 07:59:23PM +0530, Rohit Chavan wrote:
> Fixing alignment should match open parenthesis issue on multiple lines,
> reported by checkpatch script.

You might want to mention on the subject line that this is a parenthesis
issue, right?

> Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.c | 102 +++++++++++++-------------
>  1 file changed, 51 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
> index 2f5eafd50934..716de1d7fe21 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -55,14 +55,14 @@ static struct pci_driver tsi148_driver = {
>  };
> 
>  static void reg_join(unsigned int high, unsigned int low,
> -	unsigned long long *variable)
> +		     unsigned long long *variable)

For many of these, you can just move the line to the previous one,
making it a single line, right?  That would make the code much more
readable.

thanks,

greg k-h
