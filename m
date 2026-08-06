Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A04377A92;
	Thu,  6 Aug 2026 04:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785991969; cv=none; b=Rl26ntYnIKyNK0DNuits8lkGGu8y63uEWWE3wggk7HzaYF4oTeBsci3NEmjx++q0tsQN64NBk7jiqs89y9HpnsKYXjjuV2xSBnwdatXKkbU6k+OV+cc8o7KbTITtokiy/ELAZxeMfpoecP/K/fmTq4rKTPxnVO4F+KJKA/Z1GsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785991969; c=relaxed/simple;
	bh=zFQBQ14JR2qEAxtYKa5vIy2sRNFmz46Lpsv76kP26y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0sM1tesVDWqPJKqVA5r3WshT/3ABQndGJDHTVbXEDW5YXC1+64TeHBgbJg+eblPRjUUw3dUNbm8TQgH//Ti5T4n5+nEGNfx50qWQpRxSnLE5AvDT/uQ3LLmQNgCb+hsd/x4xCZ0yXFsNEGGnETYEgh9XHfMTtKKF3fRF7acBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XXIfRP+a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XXIfRP+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129141F000E9;
	Thu,  6 Aug 2026 04:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785991967;
	bh=K67o/yZpzS0qhIMwBxtiqsvXBapbchhH3ix9BfxWgEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XXIfRP+ayq6EwgMt5B9iT/UnZse708pFpRiMuO7cpQNjZIUIhpsQTzvcE2FV3u4a6
	 V+R00kqz0tHvKwEGmST7NbSrbUcAtViOv/cl1edtaeGxVEkhsid1Zlt22h1IViMf84
	 6stuidKZHAzM8cJ/su2/aRqqzJd8Y9eNJFiIHDeY=
Date: Thu, 6 Aug 2026 06:52:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: mchehab@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Replace custom rtw_cbuf with kfifo
Message-ID: <2026080628-album-pandemic-ddff@gregkh>
References: <20260805183317.85489-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805183317.85489-1-work.ashmitkumar@gmail.com>

On Wed, Aug 05, 2026 at 06:33:16PM +0000, Ashmit Kumar wrote:
> The rtl8723bs driver implemented its own custom circular buffer
> (rtw_cbuf) for c2h event handling. The kernel already provides a standard,
> lockless circular buffer implementation in <linux/kfifo.h>.
> 
> This patch replaces the custom rtw_cbuf struct and its associated
> functions with the standard kfifo API (kfifo_alloc, kfifo_put,
> kfifo_get, kfifo_is_empty, kfifo_free), simplifying the driver code
> and relying on the robust kernel infrastructure. Furthermore, the allocation
> size is simplified to C2H_QUEUE_MAX_LEN, dropping the vestigial + 1 that
> the original naive ring buffer required to disambiguate full from empty.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
> Changes in v4:
>  - Abandoned ternary operator style fixes in favor of completely
>    replacing the custom rtw_cbuf ring buffer with the standard Linux
>    kfifo API, as suggested by Greg Kroah-Hartman.

Great, how was this tested?

> @@ -58,7 +59,7 @@
>  	struct	evt_priv {
>  		struct work_struct c2h_wk;
>  		bool c2h_wk_alive;
> -		struct rtw_cbuf *c2h_queue;
> +		DECLARE_KFIFO_PTR(c2h_queue, void *);

Why did you loose the type of the pointer?  Was a LLM used to create
this change?

thanks,

greg k-h
