Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B06172
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 11:06:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2870613BD;
	Tue, 27 Apr 2021 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1619521586;
	bh=3JPNz4QHvRgaT51rdG6M27l4WPls5bAceUeZJjjnBPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ab5vCK9D+ZsU5FLMMOj3qRzZq/mkMGsgyw9ZpNNpPLhd1AiBZLqBcmNumHuUUSVAD
	 SAu9oRf0wjQDfw2/MG0drcmBJdrzSESZK9R+qR7hfy0oo7/vV9dDfH9ij4+/RVb9xF
	 6PccCR7OZoOk5nuGOrYuOPRAOFIqTrHhSuIxyAGw=
Date: Tue, 27 Apr 2021 13:06:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: joe@perches.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/50] staging: rtl8723bs: remove all remaining debug
 macros in rtw_debug.h
Message-ID: <YIfwL3s5hdRTCNrm@kroah.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>

On Sat, Apr 24, 2021 at 11:01:43AM +0200, Fabio Aiuto wrote:
> This patchset removes all remaining debug macros in rtw_debug.h
> 
> DBG_871X_SEL macro is replaced with netdev_dbg() for it does
> a raw printk call which is not best recommended for a driver.
> 
> @@
> expression sel;
> expression list args;
> identifier padapter;
> identifier func;
> @@
> 
> func(..., struct adapter *padapter, ...) {
>         <...
> -       DBG_871X_SEL(sel, args);
> +       netdev_dbg(padapter->pnetdev, args);
>         ...>
> 
> unused _DBG_871X_LEVEL macro declaration is removed.
> 
> Beautified register dump in core/rtw_debug.c 
> 
> Some code cleaning is done and all other private component tracing
> macros are removed.

Nice work, thanks for doing all of this!  Now queued up for 5.14-rc1.

greg k-h
