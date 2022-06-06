Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1249323A0
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 05:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EE3C385A9;
	Mon,  6 Jun 2022 05:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654494568;
	bh=bvq1JRPilmHtlKkjFDH6DUlt2t9c+LWSpYiZiLwBmsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taW66KvRj6AIi30v46IlXtETnYb24uA43Fe6oFUn4ZV8732w13Ica+/dv5tzlWuBJ
	 lHn+x1L4lesdvnTLqVx4yrei5ixU98wzoho/BRqzBgH5bsmK6H75CuB0zrKOsvn2gA
	 4WwEVo34B6KKzydPVGwrZ+vXKbaMa85N9A/fJYOg=
Date: Mon, 6 Jun 2022 07:49:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, dan.carpenter@oracle.com,
	fmdefrancesco@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add myself as r8188eu reviewer
Message-ID: <Yp2VZkfEv2pemEDi@kroah.com>
References: <cover.1652993983.git.paskripkin@gmail.com>
 <7656c9eb3d430524373f4826714f7d205480c3e2.1652993983.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7656c9eb3d430524373f4826714f7d205480c3e2.1652993983.git.paskripkin@gmail.com>

On Fri, May 20, 2022 at 12:10:08AM +0300, Pavel Skripkin wrote:
> I was reviewing r8188eu patches for a while, but I am missing some of
> them, since I am not in CC list. I want to be CC'ed to help reviewing
> and testing more patches.
> 
> Acked-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
> 
> Changes since v1:
> 	- Added Dan's Ack. Thanks to Dan! :)
> 
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0a635f2ae5b9..bd38a2e465cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18716,6 +18716,7 @@ F:	drivers/staging/olpc_dcon/
>  STAGING - REALTEK RTL8188EU DRIVERS
>  M:	Larry Finger <Larry.Finger@lwfinger.net>
>  M:	Phillip Potter <phil@philpotter.co.uk>
> +R:	Pavel Skripkin <paskripkin@gmail.com>

For obvious reasons, I can't take changes like this unless the
maintainers agree with it.

thanks,

greg k-h
