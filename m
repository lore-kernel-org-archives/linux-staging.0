Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041B53B9DA3;
	Mon, 11 May 2026 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486997; cv=none; b=fIWE2QB4jXLwS9o2+saxOclE2KezCBB9d/S3FtklUed0ShiXK5L4DdFdGGKMjAFCFtVSzQ73T2HAD5+a5Hhvd9rfEhDROdy3MoEkZMTA/evc3I8TbiC8OcBbHNYVrtpYzWO5QctF3WtLAFZlWNrjmc9lMZiWpAQbbaA2e+HMz0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486997; c=relaxed/simple;
	bh=ogvZjdbrSMQoUR88A9gwKrLO42Nd9c8QT/0Ll7BxxTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCed/dWHD8xbMD8Q0S35gtiyLHStHI763YoOMQ+cf4UNPlQIjXmDMlue6MzeBusuMwmzbeF3YE244WxU+ebwSGXUf0ELFOKQGtMVZfi5bs+T5YiWa41HxaUxZxBmiXErwG6FXO4aM3RbLPVqFjzyWH5u/xg7zSxxj6fcfFlkHZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B7C0Tm4I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B7C0Tm4I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49A0C2BCB0;
	Mon, 11 May 2026 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486996;
	bh=ogvZjdbrSMQoUR88A9gwKrLO42Nd9c8QT/0Ll7BxxTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7C0Tm4IJzAZM7M+bDoAeJ7na550P/ru0EBdM1l7Of5uIa9dujV26Rh4e5yhj3Vxs
	 VyHOf+Jm4qNRv0JM5VDpW/GET5Tg6sPUpA7f2OmimhdrJ6mHaRcc/iXVPL9SOw95k2
	 EkktBf5Yfso1nc747FdUqNeKxUo1jpsXXI5qmlak=
Date: Mon, 11 May 2026 10:09:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: Remove extern from function
 prototypes in cmd_osdep.h
Message-ID: <2026051131-refund-credibly-182b@gregkh>
References: <20260510175103.562518-1-pramod.nexgen@gmail.com>
 <20260510175103.562518-3-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510175103.562518-3-pramod.nexgen@gmail.com>

On Sun, May 10, 2026 at 01:51:03PM -0400, Pramod Maurya wrote:
> The extern keyword is redundant on function declarations in header files.
> Remove it from all prototypes in cmd_osdep.h and fix extra whitespace
> in the struct parameter types while at it.
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/cmd_osdep.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
> index 41daa3c339a8..4e52e7240058 100644
> --- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
> +++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
> @@ -7,11 +7,11 @@
>  #ifndef __CMD_OSDEP_H_
>  #define __CMD_OSDEP_H_
>  
> -int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
> +int rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);

This is not an extern change :(

