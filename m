Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1F01365
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 10:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A597C3411B;
	Thu, 23 Jun 2022 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655981241;
	bh=2twmGbFjhEE910dyPuHx5o9RdSwIy2ho4kre3nVoo2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PRkSghKzbTsd7Y/F7letXdNHTMDWpiSYAWRESJktQuV+QXJ5urLkavnDxFxp5+Rmc
	 kPbKoQ93y+tTaRJ1hlYY53KQBbtVwHs2I+7IvZcvrZaGBZBkD757bAbuMBOZ/EwMYA
	 TtwlBsLczcunuwsaTRmZ4KiTIoReEatxIcRt3xc8=
Date: Thu, 23 Jun 2022 12:47:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Felix Schlepper <f3sch.git@outlook.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Staging: rtl8192e: Safer allocation and cleaner
 error handling
Message-ID: <YrREqyGC01YIB86o@kroah.com>
References: <AM9P190MB1299A41E3A9B2F9C0916A260A5B59@AM9P190MB1299.EURP190.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9P190MB1299A41E3A9B2F9C0916A260A5B59@AM9P190MB1299.EURP190.PROD.OUTLOOK.COM>

On Thu, Jun 23, 2022 at 12:05:54PM +0200, Felix Schlepper wrote:
> 
> v2:
>   - replaced kmalloc with kzalloc against memory initialization defects,
>     thus also removing a memset
>   - made error handling more consistent
> 
> v3:
>   - Split into smaller commits so that it's easier to review
> 
> v4:
>   - clearer commit messages
>   - added missing kfree
> 
> Felix Schlepper (3):
>   Staging: rtl8192e: Use struct_size
>   Staging: rtl8192e: Using kzalloc and delete memset
>   Staging: rtl8192e: Cleaning up error handling
> 
>  drivers/staging/rtl8192e/rtllib_tx.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> --
> 2.36.1
> 

Why is this not properly threaded with the patches itself?  Please
resend so that our tools will pick them all up correctly.

thanks,

greg k-h
