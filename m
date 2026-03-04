Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C50F34846E;
	Wed,  4 Mar 2026 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639084; cv=none; b=hNrLyjZ6zZuoxaTPsFIy9mItrBbRCHI91rCXyxOiKXQfXNe/93bKG9UpFyZrOIsQZ+3tHbBwJZlD4ljPVbOUpoMMjXsqnehDH4crdLjsOuVWASirLQ7TfPgcYV9vPgYEl3ozAA/Uw2NTUsfCARB/hraFRNjN4e/5JDDZzSjKOiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639084; c=relaxed/simple;
	bh=pbYi3f4NR6ND9hXGcPxbquRqHFlfGwimmW63h/KLoBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rElnO1w/gDRhdBe87JPR2PYSmlJ36NXkTViMMDWUjs46MRaIJVo/ZP+jAZRNlqYL/Jt5D2H7nX4Iyh+EUf4nUZjjcdIj/vyz4N8CDUGy1zoutqRP9e0cIQCvWv5rQ0JbHy4NwdCImApU7yJRDQKhTur7SrHp1U0kwL9OUs8Js/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=svAtCDaK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="svAtCDaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1C9C4CEF7;
	Wed,  4 Mar 2026 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772639084;
	bh=pbYi3f4NR6ND9hXGcPxbquRqHFlfGwimmW63h/KLoBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svAtCDaKnPvtCIAECYMSwpKfaNZD/A3UFl8lOq5Ds4Qb7cH8X2/y6aDwyfznLMA/r
	 6O5kKeZmX2KVUmw9K6EAgbADNv1SSj33AM0ahSXVMLNar3rAzXFMk9gTnFtKB1alqE
	 xVQGK056i5EfNqT7I/ns7jbElwghCgDcqneUPzcI=
Date: Wed, 4 Mar 2026 16:44:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: broonie@kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, daniel.baluta@nxp.com,
	simona.toaca@nxp.com
Subject: Re: [PATCH v2] staging: rtl8723bs: Clean up unnecessary parentheses
 and braces
Message-ID: <2026030416-stowaway-wrath-d871@gregkh>
References: <20260304153426.2217417-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304153426.2217417-1-egbostina@gmail.com>

On Wed, Mar 04, 2026 at 03:34:26PM +0000, Eduard Bostina wrote:
> Increase code readability and follow Linux kernel coding style by
> removing unnecessary parentheses and braces.
> 
> This also fixes the following checkpatch.pl issues:
> WARNING: Unnecessary parentheses - maybe == should be = ?
> WARNING: braces {} are not necessary for any arm of this statement
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 1a52d3e1d285d..a1c2220ac476b 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1339,11 +1339,10 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
>  
>  	}
>  
> -	if (ret == _FAIL) {
> +	if (ret == _FAIL)
>  		goto exit;
> -	} else if (ret == RTW_RX_HANDLED) {
> +	else if (ret == RTW_RX_HANDLED)
>  		goto exit;
> -	}
>  
>  
>  	if (!psta) {
> @@ -1593,7 +1592,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
>  	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
>  	pattrib->eth_type = eth_type;
>  
> -	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
> +	if (check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) {
>  		ptr += rmv_len;
>  		*ptr = 0x87;
>  		*(ptr + 1) = 0x12;
> -- 
> 2.43.0
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
