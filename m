Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E46D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:23:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0D77610CB;
	Wed,  7 Apr 2021 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617808994;
	bh=LoDcrAeLj2cIGYDihQohQ8HAxhMR3ppOEnDlucGC+nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IR/OmnxjYxWKxsZsrFBBY3m1M4fuZPZxTPPSVCY6T+5Zz8PTWOWvx1btgwKoiM82H
	 DmyLyp7NZFbvsB2M++/fBm/uR/TmhawS1v3NbFxWmLbUSmAjsRT86WeabhwIxuBs1Q
	 cj1WW7NtHOXzKfcM1NugImXcTN+FQQrS/T0XL9gY=
Date: Wed, 7 Apr 2021 17:22:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] tty: TIOCSSERIAL fixes and clean ups
Message-ID: <YG3ORQcI5DRw7QL/@kroah.com>
References: <20210407102334.32361-1-johan@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>

On Wed, Apr 07, 2021 at 12:23:18PM +0200, Johan Hovold wrote:
> TIOCSSERIAL is a horrid, underspecified, legacy interface which for most
> serial devices is only useful for setting the close_delay and
> closing_wait parameters.
> 
> This series fixes up the various ways in which driver authors have
> gotten the implementation wrong over the years, like, for example,
> jiffies conversions, permissions checks and error handling.
> 
> The de-facto standard for error handling is to ignore any unsupported
> features and immutable parameters (cf. UPF_FIXED_PORT and deprecated
> ASYNC flags).
> 
> Permission checking should prevent an unprivileged user from changing
> anything but the ASYNC_USR flags (and custom divisor) by returning
> -EPERM.
> 
> These patches are against tty-next, but the staging ones could otherwise
> go through either tree.

I've taken all of these through my tty tree, thanks for cleaning this
mess up.

greg k-h
