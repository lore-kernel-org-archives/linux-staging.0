Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352F82C9F
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 16:46:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4ED6260F56;
	Tue, 26 Oct 2021 16:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635266800;
	bh=Z3FjBer3srN93t/2Uf7lu/L5rOeofkEIMvasXqp1PmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Uk5IJex1IypM0jZd9RDdxc9g5l12pzKuuCnPx24gPmAxtGHu5BTSvuMH0nZOckAA
	 283VYCiCetAfQpyCsjk/5gnZ/yuKwW+Wh3gOQD8Qo9h17ExmFMT4CQ1EvAuIbw9rY2
	 RueeAztIi7APihq5SQSyFtsBSmSzPpVwLUtwF7TI=
Date: Tue, 26 Oct 2021 18:46:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH v2] staging: r8188eu: avoid use of goto statement
Message-ID: <YXgw7tOmgO3almYe@kroah.com>
References: <YXbA0BgvKZKXApaW@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXbA0BgvKZKXApaW@Sauravs-MacBook-Air.local>

On Mon, Oct 25, 2021 at 08:06:00PM +0530, Saurav Girepunje wrote:
> Remove the goto statement from _rtw_init_cmd_priv(). In this function
> goto statement can be replace by return statement. By replacing the
> goto statement with return statement local variable "res" is also not
> required. As on goto label exit, function only return it is not
> performing any cleanup. Avoiding goto statement will simplify the function.
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
> 
> ChangeLog V2:
> 
> 	-Add space after line end on changelog.
> 	-Remove addition blank link after the local variable res
> 	 as per the coding guidelines for linux kernel.
> 

This does not apply to my tree, please rebase and resubmit.

thanks,

greg k-h
