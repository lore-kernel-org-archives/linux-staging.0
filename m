Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13372AD0C;
	Mon,  9 Feb 2026 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770619783; cv=none; b=lyoWWDDw1gqMOwC3ZRUjF9Yn6ywc84KQqw3B63sSSevIbdqrZHt+oFWvLT3SP8YMhyENcSp3ZqnmNAJwGS9qgKl9R7GtAcr62UhZJJBhv/obMdoTLYiZDzPtpawiiY2JfvRr+IC0hi6Z0Z/YqZXzJ2WCZ4TNawiOIBbrRU2UYdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770619783; c=relaxed/simple;
	bh=dbko57IRNkAj/GuzkPGsTLtswcKjti9WNirE8QJ2hbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRUy+h33UbueaWnxb/ZiA4VFrm9K+gutROuIYr5AODkdu5xxsn1o4xs+Vo/Mff9LE/ptnPpq31H/EH6CrgdgzQlaB7RQtXQfv22J1BCpQIaAPNmJ+tEbIMtQ1bU/KDzOXbNtOzQn1SQm6T9bfCK2rS5AzNtVJWi/9TCyJ9aEzhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RnN/y40/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RnN/y40/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AED1C116C6;
	Mon,  9 Feb 2026 06:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770619783;
	bh=dbko57IRNkAj/GuzkPGsTLtswcKjti9WNirE8QJ2hbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnN/y40/59Df+Do3npu4/lD/Sd4QGt0T0tXVVlS8Iv5hQVf0uMyHgSuB4AJ43gGEF
	 O0vCsLwFQ+mrE+goRcQ56BoZpu5UC1eYRrFLN9RoPFpvT3+0LUPkC1BJJtspL+yeDn
	 ayQ3tKDR9aQ80aAKcERZNNtR+0rtxqQnjUclB7AI=
Date: Mon, 9 Feb 2026 07:49:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Azamat Rakhim <azamatrakhim8@gmail.com>
Cc: karanja99erick@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: simplify boolean test in
 rtw_btcoex_MediaStatusNotify
Message-ID: <2026020926-stegosaur-single-9cc3@gregkh>
References: <20260208175120.15717-1-azamatrakhim8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208175120.15717-1-azamatrakhim8@gmail.com>

On Sun, Feb 08, 2026 at 10:51:19PM +0500, Azamat Rakhim wrote:
> Remove unnecessary comparison to true and move logical operator
> to the end of the previous line.
> 
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> index f4b19ef7b341..444a602d2868 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> @@ -10,8 +10,8 @@
>  
>  void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
>  {
> -	if ((media_status == RT_MEDIA_CONNECT)
> -		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
> +	if ((media_status == RT_MEDIA_CONNECT) &&
> +	    check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE)) {
>  		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
>  	}
>  
> -- 
> 2.52.0
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
