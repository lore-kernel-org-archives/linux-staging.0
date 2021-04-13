Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1140471
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 09:11:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49B706124B;
	Tue, 13 Apr 2021 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618305101;
	bh=CXFf9eOGEOFFg2jSw8hjvuyc0IJcgo7e7gCJHl6r5ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOSS5qqJUKjV0+GdYJ4diz1gJIWMmavB/rMBrIDaaAKYi3xd815/Ys1syzcEYQoze
	 w65feWLmhPgB5lxSOFFzZKc1ykuxMnhh39qZ4dU9b/d5ndBgaQgR5c19PBWOeAwVzi
	 YI45q9Iko1JkNXX3y0cRXvDSL/GM6vd7dbtn2JD8=
Date: Tue, 13 Apr 2021 11:11:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: joe@perches.com, julia.lawall@inria.fr, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: cocci script hints request
Message-ID: <YHVgSuRCW1fdabrH@kroah.com>
References: <20210413090400.GA5477@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413090400.GA5477@agape.jhs>

On Tue, Apr 13, 2021 at 11:04:01AM +0200, Fabio Aiuto wrote:
> Hi,
> 
> I would like to improve the following coccinelle script:
> 
> @@
> expression a, fmt;
> expression list var_args;
> @@
> 
> -       DBG_871X_LEVEL(a, fmt, var_args);
> +       printk(fmt, var_args);
> 
> I would  replace the DBG_871X_LEVEL macro with printk,

No you really do not, you want to change that to a dev_*() call instead
depending on the "level" of the message.

No "raw" printk() calls please, I will just reject them :)

thanks,

greg k-h
