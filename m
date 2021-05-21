Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AC270
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 11:52:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C95AD613D0;
	Fri, 21 May 2021 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621597965;
	bh=W4B3B9in/QqiNCeeJuu5Xijiq25S/MfrfNhYB4WI5/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAqtKr8oHFuAJJWu4Xrhpx42n5lw7Et1VuaADhV1tefAxb82gu1MUBSdYeA5qB7Sr
	 fv3iEO5yx7PpAfKrFZtTtL8lSnbWW+HGbWPvYqKXZB2VWK36Ja0qj3TireV5Tnw3Dk
	 9mJB09M0Qac2CwjoW6vjDIxmIHFevmRy8dTjxQMs=
Date: Fri, 21 May 2021 13:52:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Evgeny Novikov <novikov@ispras.ru>
Cc: Johan Hovold <johan@kernel.org>, Nikolay Kyx <knv418@gmail.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Abheek Dhawan <adawesomeguy222@gmail.com>,
	Lee Gibson <leegib@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] staging: fwserial: Fix potential NULL pointer
 dereferences
Message-ID: <YKefCpAnVWLCDVtg@kroah.com>
References: <20210521114339.8469-1-novikov@ispras.ru>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521114339.8469-1-novikov@ispras.ru>

On Fri, May 21, 2021 at 02:43:39PM +0300, Evgeny Novikov wrote:
> If fwtty_install() will be invoked with such tty->index that will be
> not less than MAX_TOTAL_PORTS then fwtty_port_get() will return NULL and
> fwtty_install() will either assign it to tty->driver_data or dereference
> in fwtty_port_put() (if tty_standard_install() will fail). The similar
> situation is with fwloop_install(). The patch fixes both cases.

But how can those cases ever happen?

> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> ---
>  drivers/staging/fwserial/fwserial.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
> index 1ee6382cafc4..d0810896511e 100644
> --- a/drivers/staging/fwserial/fwserial.c
> +++ b/drivers/staging/fwserial/fwserial.c
> @@ -1069,6 +1069,9 @@ static int fwtty_install(struct tty_driver *driver, struct tty_struct *tty)
>  	struct fwtty_port *port = fwtty_port_get(tty->index);
>  	int err;
>  
> +	if (!port)
> +		return -ENODEV;

there's already a valid tty pointer here, so the index can not be "too
big".

> +
>  	err = tty_standard_install(driver, tty);
>  	if (!err)
>  		tty->driver_data = port;
> @@ -1082,6 +1085,9 @@ static int fwloop_install(struct tty_driver *driver, struct tty_struct *tty)
>  	struct fwtty_port *port = fwtty_port_get(table_idx(tty->index));
>  	int err;
>  
> +	if (!port)
> +		return -ENODEV;
> +

Same here, how can this ever happen?

thanks,

greg k-h
