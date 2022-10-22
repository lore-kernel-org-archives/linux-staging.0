Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A64428F3;
	Sat, 22 Oct 2022 08:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F02C433D7;
	Sat, 22 Oct 2022 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666426593;
	bh=mNeH4WeyGSHFqhdspyYlVFsq2U3x4IUacITdhdMQuFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CZCzN1MsxYG+IXMPEnNJfz9yQWpdNlVxsAU5hYH/xBroM9khylrnoyVvSumlCO0Q3
	 kUNrTdKby5Qls0yYBb4HaQF+v9h5GjsoIDePTw2NQpgBRapje56MKOurWM9PnYKteM
	 jCabtobW5vPkKtyNu4vy02+S1YAJhegwpWh0I4KY=
Date: Sat, 22 Oct 2022 09:58:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: remove commented debug printk messages
Message-ID: <Y1OikehVJv/teZ9e@kroah.com>
References: <Y1H5tJXjMZqiB6rh@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1H5tJXjMZqiB6rh@debian-BULLSEYE-live-builder-AMD64>

On Fri, Oct 21, 2022 at 07:15:24AM +0530, Deepak R Varma wrote:
> printk messages are added for program flow tracing and are left
> commented. These commented log messages should be removed as they
> are no more useful for program execution.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/wlan-ng/p80211netdev.c | 22 ----------------------
>  1 file changed, 22 deletions(-)

I recieved 3 different copies of this patch, and do not know which one
to take at all.

So please resend this as a v2 patch, only once, and I will be glad to
review it.

thanks,

greg k-h
