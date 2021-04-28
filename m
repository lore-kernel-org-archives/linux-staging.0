Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C242F82
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 06:02:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0698661418;
	Wed, 28 Apr 2021 06:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619589757;
	bh=kcmuxZ34uqFq9GE4wl1DeJi7Sr/MXOr2RMW9KsnXcO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=14k/rnzNJJQirnoXmYWMShKRg/Sl+/mlALFp1YTiZOXhvYTggB8fs6R9VQR8aO18N
	 9tPACnJTRuxqXQkwiB12z3Ro5E9SvSHFrN99Z678aQyjwHjLuScz2s880MmkQRelZq
	 jIXGZUFJmE7aznFHzAGMNGb1qGia6witd6nGCLiQ=
Date: Wed, 28 Apr 2021 08:02:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ashish Kalra <eashishkalra@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wlan-ng: silence incorrect type in argument
 1 (different address spaces)
Message-ID: <YIj6dw5afJ1bBYWK@kroah.com>
References: <20210427165844.GA35857@ashish>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427165844.GA35857@ashish>

On Tue, Apr 27, 2021 at 04:58:44PM +0000, Ashish Kalra wrote:
> Corrected data type for variable data adding __user to make it cleaner and silence the Sparse warning. This is version 2 of patch, version 1 can be found at https://lore.kernel.org/linux-staging/20210420090142.GA4086@ashish-NUC8i5BEH/
> 
> Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
> ---
> 
> Changes from v1: removed type casting of (void __user *) for req->data and corrected type for data to include __user

Did you send this twice?

And please wrap your changelog text and put proper information in it,
not references to previous patches.

thanks,

greg k-h
