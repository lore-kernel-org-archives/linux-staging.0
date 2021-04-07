Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAC86D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 15:15:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC5F0611CC;
	Wed,  7 Apr 2021 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617808518;
	bh=0gKlucClZANrvM10NcqqxJIEiJI53s3hk98gtZbECtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxff0jEUkSUFZXdNVjGtHveHh8h1e2ExUWkaV5+58FB6oE8uj5eBUMTST+NH5/lxz
	 M8rqwWuyhdOUIQGo4gpbfHq/owhX1WL45+A5ZKR/vA+/p3cjnMBJeM0stiqWA6z3B6
	 kxV1X7aA1ta8dV/Fr53JBjQxaaOksdW3XiLLTOOE=
Date: Wed, 7 Apr 2021 17:14:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/19] staging: rtl8723bs: remove DBG_871X trace macro
Message-ID: <YG3MVGBomCeVicj+@kroah.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>

On Wed, Apr 07, 2021 at 03:49:24PM +0200, Fabio Aiuto wrote:
> This patchset removes all DBG_871X usages and definitions.
> 
> The whole private tracing system is not tied to a configuration
> symbol and the default behaviour is _trace nothing_.
> 
> DBG_871X macros require the code to be modified by
> hand in order to be turned on. This obviously has not happened
> since the code was merged, so just remove them as they are unused.
> 
> First patch fix a DBG_871X call. It has three args over only two
> placeholders in the first format string argument.
> If I would not make this fix, the semantic patch
> used to bulk remove all macro occurences would ignore the abnormal
> macro (the one with three args) and all subsequent occurrences in
> the same file (core/rtw_recv.c).
> 
> The second patch applies the cocci script.
> 
> This is the semantic patch:
> 
> @@
> expression a, b, c, d, e, f, g, h, i, j, k;
> constant B, C, D, E;
> @@
> 
> (
> -	DBG_871X(a);
> |
> -	DBG_871X(a, b);
> |
> -	DBG_871X(a, B);
> |
> -	DBG_871X(a, b, c);
> |
> -	DBG_871X(a, B, c);
> |
> -	DBG_871X(a, b, C);
> |
> -	DBG_871X(a, B, C);
> |
> -	DBG_871X(a, b, c, d);
> |
> -	DBG_871X(a, B, c, d);
> |
> -	DBG_871X(a, b, C, d);
> |
> -	DBG_871X(a, b, c, D);
> |
> -	DBG_871X(a, B, C, d);
> |
> -	DBG_871X(a, B, c, D);
> |
> -	DBG_871X(a, b, C, D);
> |
> -	DBG_871X(a, B, C, D);
> |
> -	DBG_871X(a, b, c, d, e);
> |
> -	DBG_871X(a, B, c, d, e);
> |
> -	DBG_871X(a, b, C, d, e);
> |
> -	DBG_871X(a, b, c, D, e);
> |
> -	DBG_871X(a, b, c, d, E);
> |
> -	DBG_871X(a, B, C, d, e);
> |
> -	DBG_871X(a, B, c, D, e);
> |
> -	DBG_871X(a, B, c, d, E);
> |
> -	DBG_871X(a, b, C, D, e);
> |
> -	DBG_871X(a, b, C, d, E);
> |
> -	DBG_871X(a, b, c, D, E);
> |
> -	DBG_871X(a, B, C, D, e);
> |
> -	DBG_871X(a, B, C, d, E);
> |
> -	DBG_871X(a, B, c, D, E);
> |
> -	DBG_871X(a, b, C, D, E);
> |
> -	DBG_871X(a, B, C, D, E);
> |
> -	DBG_871X(a, b, c, d, e, f);
> |
> -	DBG_871X(a, b, c, d, e, f, g);
> |
> -	DBG_871X(a, b, c, d, e, f, g, h);
> |
> -	DBG_871X(a, b, c, d, e, f, g, h, i);
> |
> -	DBG_871X(a, b, c, d, e, f, g, h, i, j);
> |
> -	DBG_871X(a, b, c, d, e, f, g, h, i, j, k);
> )
> 
> The third one removes an unmatched macro call,
> maybe due to the trailing \, because the occurrence is
> inside a macro expansion.
> 
> The fourth one deletes all commented out call spread all over
> the rtl8723bs code.
> 
> Fifth one removes definitions.
> 
> All remaining patches do some code cleaning on all
> places where DBG_871X has been removed.

Nice work, thanks for doing this, all now queued up!

greg k-h
