Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763BB38C2DC;
	Thu, 12 Mar 2026 05:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773292259; cv=none; b=rl2/dshAB4fNA4YeaSKt3Dca1taxzy2DPLUbsyjzSP+5+v0VSxkOx7t6ZorvG5LosiGzCcujaPugQgxfTvbVqXenAKPtFNL/IEl6gwEo8MZXsK7oIU2KwmtDE/mKZDPsAEhueJTmn59S6bSRr2kU2CZSFoJ94RGfpZR/GG+3iyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773292259; c=relaxed/simple;
	bh=YbOefRkvCODlkLVaQJiF+wWSIFtMm8ByQPWRkalTLYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sftHwbX5RKmnavkJJVM1b496yUxUqci16d3hs5PgMXi7/NfTjLsXrNvHggoQq4Nai93wxbdSaEKf/7x2Uo87Qp590OAwCBNvxYl24PTOIPlHhXdDcjwCpuR0Zr9BP2HzfGXGiF6C7gapU+n9zrXbX9pGt+/tLrbu5WdtSdVxx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UbawL0rM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UbawL0rM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92462C4CEF7;
	Thu, 12 Mar 2026 05:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773292259;
	bh=YbOefRkvCODlkLVaQJiF+wWSIFtMm8ByQPWRkalTLYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbawL0rM7rk7daNbo0/1stlIvFK2Ljj1AYQ2FBTO65elThfihJkZzw1XoM7coB/yJ
	 C4ZG0BPdO2eB0+jotOekF5u0JqEZjOOBEtAmpz3kqExfee2dO9B53TC9FN3EdaL9JB
	 tYYe4rbVynUjvpQIPOg7ARytKVSppjGHyzpxJG4A=
Date: Thu, 12 Mar 2026 06:10:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rahul Joshi <rj5547884@gmail.com>
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: uart: replace DEFINE_IDR with
 DEFINE_XARRAY_ALLOC
Message-ID: <2026031227-stubborn-cymbal-e83a@gregkh>
References: <20260311194200.542783-1-rj5547884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311194200.542783-1-rj5547884@gmail.com>

On Thu, Mar 12, 2026 at 01:12:00AM +0530, Rahul Joshi wrote:
> DEFINE_IDR is deprecated in favour of DEFINE_XARRAY_ALLOC. Replace the
> tty_minors IDR with an XArray and update all call sites:
> 
>   idr_alloc()  -> xa_alloc()
>   idr_find()   -> xa_load()
>   idr_remove() -> xa_erase()
>   idr_destroy() -> xa_destroy()
> 
> Also remove the now-unused <linux/idr.h> include and add
> <linux/xarray.h>.
> 
> Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)

I am pretty sure I have rejected this same patch multiple times in the
past.  Please see the mailing list archives for why.

thanks,

greg k-h
