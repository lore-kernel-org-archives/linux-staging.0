Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939A43EE1C0;
	Tue, 14 Jul 2026 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014766; cv=none; b=oa+EAxZ83LM9hCnzCghxPXoIeoIOVxRtJw8YiBdRq5yI4Ynq0LtkgvAeAEsAbVM00Jus8YeOqZwxB129hg7tyZEvgY33AH3gG9H1VJwLLfhW/Xgx8DjwJAY5s6y6jvNqj++dWxDopn81zwNwxcJAmIlK1l6AKs2SUTybiW5+/dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014766; c=relaxed/simple;
	bh=Rtwc2ZMlRC3h4nj8nNdqcI5PwxmVD+bOfY2OoFPVJ0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6I6Ujq2JMPPqYt6m2pXxZTcXLRvs95lAk5mfvZ0JrGpwuyx4JFHIeKyXD12t0H29Qt/8fAYdQ21rCXTkNiQriE0DAvD8mD/q15XRrdg6JxwZcQDVfAnYfGMfcc+ssB7H8pBq87V8h2O1XRrvBH0DwdQyr2Dnaf/l+uTe6whKoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UicaHG+j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UicaHG+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE24F1F000E9;
	Tue, 14 Jul 2026 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784014765;
	bh=AoVOJidFmWtN4CGApV3MiB3v3N7FZ12vnAjGAFZmxTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UicaHG+j+q7j95Yz56XaC8NbooVWTIhyzWhxSYY5FGEMFfGFVG9RKBASh/dEdaH+G
	 iUCwj5v7uz9ppC+8NBua/X1qLoK7VZih8HEpWsdaVX+ividT+mb/hum0Q0w9S2EV/O
	 v2ZMXWy5o8r3TZF3uSyr9/f73+LlfUYgERUerBds=
Date: Tue, 14 Jul 2026 09:39:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v2] staging: greybus: uart: return tty_alloc_driver()
 errors
Message-ID: <2026071408-growing-thespian-b521@gregkh>
References: <CAHp0ZPPbdc+5PgFUDVgamt_Ds8xAY=K_GgH3abx3ucpndGepFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp0ZPPbdc+5PgFUDVgamt_Ds8xAY=K_GgH3abx3ucpndGepFg@mail.gmail.com>

On Tue, Jul 14, 2026 at 12:42:04PM +0530, Alfie Varghese wrote:
> gb_tty_init() maps any tty_alloc_driver() failure to -ENOMEM.
> tty_alloc_driver() currently always returns -ENOMEM on failure,
> so this does not change behavior in practice. However, returning
> PTR_ERR(gb_tty_driver) is more correct and consistent with kernel
> conventions, preserving any future error codes the function might
> return.
> 
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---
> v2: updated commit message per Dan Carpenter's review to clarify
> that tty_alloc_driver() currently only returns -ENOMEM, making
> this a style fix rather than a behavioral change.
> 
> drivers/staging/greybus/uart.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 7d060b4cd33d..24b4dab069c3 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -951,7 +951,7 @@ static int gb_tty_init(void)
> if (IS_ERR(gb_tty_driver)) {
> pr_err("Can not allocate tty driver\n");
> - retval = -ENOMEM;
> + retval = PTR_ERR(gb_tty_driver);
> goto fail_unregister_dev;
> }

Something went really wrong with this patch, it is corrupted :(
