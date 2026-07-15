Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D431AAAA;
	Wed, 15 Jul 2026 14:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124556; cv=none; b=T3TzbzUM2+21vNJh1XvGzr7L32Nuxf5nvPFfnS9awJpOhIa/veXDoedoCyiQro/6yc6f+J3njAhXoaVor7FWbRkPaE9AnzlcgbBhMTPBZWk8TOv6LlCCj8+EsbdCVG1qc5TANfI9I9hNzbtgQ7Cki/DhE+mCrhvw3gtcgFTMEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124556; c=relaxed/simple;
	bh=2eJdG55r/UC8M9VS+Si7IEF2yFXNHYydHAYznJ3vnVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHLwLodV1yzAgQNNEznMmRwRgC83PUo+FaW9ec6osmiRxxIz7VhEu1BU8IuC00exSJQ4Ia1EJw5YajUj/Js7uA2bAQqRtgQLebkbwluniABWRT4lubRpCKvAijSi5/6e+LmIIajRuc4zljvn7aX/f6ejUpDn9ZO3TCHQWn5g9cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VYhx0AkK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VYhx0AkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57191F000E9;
	Wed, 15 Jul 2026 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784124555;
	bh=fe+ft7CpRW/sBBmG/+LkiEmJMa7rczQfD2Ttgg7mSrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VYhx0AkKhPoY1O0lM2RH02Sm/31GizCMRl5s+rbW/GOq2L5PAl/8iVZ5+0QZWv1xZ
	 vsWSHeqhMAG7UzadHYL9hhXTtQo1jyiS4C3AuhzpKNLC4uJXe88+nFtQg1Zuz4LXzm
	 eYeUwc+M0UUWETTHthuAgh8aXrY1sCujUCuZ4vGQ=
Date: Wed, 15 Jul 2026 16:09:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: use kfree_sensitive() for key
 material
Message-ID: <2026071557-overhand-cattishly-72fb@gregkh>
References: <20260713233401.48262-1-skunkolee@gmail.com>
 <20260713233753.50816-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713233753.50816-1-skunkolee@gmail.com>

On Mon, Jul 13, 2026 at 05:37:53PM -0600, Ivy Lopez wrote:
> The set_stakey_parm struct contains a 16-byte encryption key.
> Use kfree_sensitive() instead of kfree() to ensure the key
> material is zeroed before the memory is freed, preventing
> potential information leaks.
> 
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index b932670f5d63..a34ee407285b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -899,7 +899,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
>  	if (enqueue) {
>  		ph2c = kzalloc_obj(*ph2c);
>  		if (!ph2c) {
> -			kfree(psetstakey_para);
> +			kfree_sensitive(psetstakey_para);
>  			res = _FAIL;
>  			goto exit;
>  		}
> @@ -907,7 +907,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
>  		psetstakey_rsp = kzalloc_obj(*psetstakey_rsp);
>  		if (!psetstakey_rsp) {
>  			kfree(ph2c);
> -			kfree(psetstakey_para);
> +			kfree_sensitive(psetstakey_para);
>  			res = _FAIL;
>  			goto exit;
>  		}
> @@ -918,7 +918,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
>  		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
>  	} else {
>  		set_stakey_hdl(padapter, (u8 *)psetstakey_para);
> -		kfree(psetstakey_para);
> +		kfree_sensitive(psetstakey_para);
>  	}
>  exit:
>  	return res;
> @@ -958,7 +958,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
>  		psetstakey_rsp = kzalloc_obj(*psetstakey_rsp);
>  		if (!psetstakey_rsp) {
>  			kfree(ph2c);
> -			kfree(psetstakey_para);
> +			kfree_sensitive(psetstakey_para);
>  			res = _FAIL;
>  			goto exit;
>  		}
> -- 
> 2.55.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
