Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A43B9607;
	Wed,  4 Feb 2026 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198820; cv=none; b=sPbLkB4d2QbWv+0oIzKbxkLXcTRW/dL7V4cNDZ4UcoMaKQRAw7QNFAwPdQYHDLdd6uLR6vQRRfTh9mtzIejCAkJgkR+dzkfiM9mjHSDTGkDc5h2PSVc/oVEzN0Ivb01kbwybZNBoVDnC9fMKll8tEvbNqHIo2F7JZAVBrkCnPn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198820; c=relaxed/simple;
	bh=QF/Iu7L8vFPkGs4Cf0JcaFtCVVT1sYt+mMFrelSWkFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaPQWTUXubJG+NJJYji1kXgM6Mk0AzJuVaqosRm4koX78Iuu3ORxi2bIq2E7baBkOnOlDOo+39Pt7ZsesQ+Kn+FjNxleMuzxD/ZvpBcjkCi207in7hNU/SFA4tHAPca3k0RVbpcmH+I5XoIdrcM1vooqHgZepJQcDgUgeZAq0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fRSQNsbN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fRSQNsbN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF89C16AAE;
	Wed,  4 Feb 2026 09:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770198819;
	bh=QF/Iu7L8vFPkGs4Cf0JcaFtCVVT1sYt+mMFrelSWkFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRSQNsbNmNBzjhi3V/LJfE3AwvKDO40J3f2B+/omgY1auQBDAoG9dJzcmN1AT6BHu
	 fygA5BKY+mu3AcDBNGs/Hup2zAaazAyOPzWV30jWD4YXLO5e04E/n3tzkObVkQv1qO
	 FqnMDx6X0JwEFRcPlOHiEsk+zE7+a3MZ55UXQxtE=
Date: Wed, 4 Feb 2026 10:53:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eitan Collett <eitan.collett@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_codec.c: Remove unnecessary
 parentheses in if statement
Message-ID: <2026020400-unopposed-graffiti-5657@gregkh>
References: <aYCnemXK-f6Htojh@fakie>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYCnemXK-f6Htojh@fakie>

On Mon, Feb 02, 2026 at 03:32:42PM +0200, Eitan Collett wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Unnecessary parentheses around 'w->id != snd_soc_dapm_aif_in'
> CHECK: Unnecessary parentheses around 'w->id != snd_soc_dapm_aif_out'
> 
> Signed-off-by: Eitan Collett <eitan.collett@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 444c53b4e08d..44aee8268d14 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -305,7 +305,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
>  	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
>  		enable ? "Enable" : "Disable");
>  
> -	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
> +	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {

I hate this checkpatch "warning" sorry.  Now you need to go and try to
remember if && is higher priority than !=, right?

Please just leave this as-is.

thanks,

greg k-h
