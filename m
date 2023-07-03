Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BAF9C6
	for <linux-staging@lists.linux.dev>; Mon,  3 Jul 2023 13:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39712C433C9;
	Mon,  3 Jul 2023 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688390649;
	bh=VZy2IJH5Zp0zLi0PzjAHnGOCdKj0aY+Y8o+P9lCkN1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8F8HmNdG9BW6Pn4dfstQ/++oGyIpGpnFDwBv6EyIJeOEdyYDkgIV5YWLJfCW0+tC
	 o6mCKWnNKCf2IN6T7HZx9RGCl7mo5S7T9t2qvOoBcXxXlYC5buXgKjENv8PgmitGG9
	 4npV7+PBamAUU6t68b1Z1l6Ci2FxPDe5d2TyfGDI=
Date: Mon, 3 Jul 2023 15:23:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tuo Li <islituo@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, baijiaju1990@outlook.com,
	BassCheck <bass@buaa.edu.cn>
Subject: Re: [PATCH] staging: greybus: fix a possible data-inconsistency due
 to data race in get_serial_info()
Message-ID: <2023070352-upscale-bankable-76a7@gregkh>
References: <20230626084339.998784-1-islituo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626084339.998784-1-islituo@gmail.com>

On Mon, Jun 26, 2023 at 04:43:39PM +0800, Tuo Li wrote:
> The variables gb_tty->port.close_delay and gb_tty->port.closing_wait are
> ofter accessed together while holding the lock gb_tty->port.mutex. Here is 
> an example in set_serial_info():
> 
>   mutex_lock(&gb_tty->port.mutex);
>   ...
>   gb_tty->port.close_delay = close_delay;
>   gb_tty->port.closing_wait = closing_wait;
>   ...
>   mutex_unlock(&gb_tty->port.mutex);
> 
> However, they are accessed without holding the lock gb_tty->port.mutex when
> are accessed in get_serial_info():
> 
>   ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
>   ss->closing_wait =
>     gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
> 	ASYNC_CLOSING_WAIT_NONE :
> 	jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
> 
> In my opinion, this may be a harmful race, because ss->close_delay can be
> inconsistent with ss->closing_wait if gb_tty->port.close_delay and 
> gb_tty->port.closing_wait are updated by another thread after the 
> assignment to ss->close_delay.

And how can that happen?

Also you have trailing whitespace in your changelog text :(

> Besides, the select operator may return wrong value if 
> gb_tty->port.closing_wait is updated right after the condition is 
> calculated.
> 
> To fix this possible data-inconsistency caused by data race, a lock and 
> unlock pair is added when accessing different fields of gb_tty->port.
> 
> Reported-by: BassCheck <bass@buaa.edu.cn>

As per the documentation for research tools like this, you need to
explain how this was tested.

thanks,

greg k-h
