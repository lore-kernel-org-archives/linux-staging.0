Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AE92798E3
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752651471; cv=none; b=cGHfb1R8vnxlNqq7R+thtTOgsAXfG176OMMDplcKV6p8vc4IHSbtpdTWr1LkvOBmzIyShcKF6tdDH7ry+fjnn5IZnTf7wvOp7brPxUYraAXzRsD1wOdhSp1WyZGmkRh0eSpjvjOu1+umqcFYnRRF1BznhAWKEE+CUBx6FhshmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752651471; c=relaxed/simple;
	bh=sax04F7FQ4NPLSW3MhNZN0gOrJs1M6dVQhVWCjAD/v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnkw7DB+L0jcC0N3mlXF6rFnhn2yO+GgMjWBdf6SQQVcSAKOHWcIzoBZgsU6G+2hEJxiFpto+7JlkyKzpXReCpyRDnRoWzNdr4vKlMEsM0qWkqbM34dyOmKJUeGKIZz7H22yn5QBEemIHskBT9skTQRQjKhAa6WyztDHFnF4oK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZnKWvvA9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZnKWvvA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1458C4CEF6;
	Wed, 16 Jul 2025 07:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752651471;
	bh=sax04F7FQ4NPLSW3MhNZN0gOrJs1M6dVQhVWCjAD/v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnKWvvA96eBVoolvwfVk91z5oTuBQi64Yj+cRZs/n81+h30SPZwjpmRyPVk8Jfdi/
	 kpsRJigXKSBYQ3Ito7RRl7oPee8W33JEYm/VsJy17uiG6Iz1Xn++ZPpevMOoR5ANc+
	 sefwW7P6/iObb72TpC+oxxBRc/QfyymyGsNQWv0A=
Date: Wed, 16 Jul 2025 09:37:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/3] staging: rtl8723bs: add missing blank line after
 declaration
Message-ID: <2025071636-dallying-catchable-4330@gregkh>
References: <20250716053604.64798-1-ignacio.pena87@gmail.com>
 <20250716053604.64798-2-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716053604.64798-2-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 01:36:03AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Fix checkpatch warning by adding required blank line after variable
> declaration in Efuse_CalculateWordCnts function.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 1e2b3c456..fc6dee711 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -85,6 +85,7 @@ u8
>  Efuse_CalculateWordCnts(u8 word_en)
>  {
>         u8 word_cnts = 0;
> +
>         if (!(word_en & BIT(0)))
>                 word_cnts++; /*  0 : write enable */
>         if (!(word_en & BIT(1)))
> -- 
> 2.39.5
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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
