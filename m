Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C930F3A8384;
	Tue,  4 Aug 2026 07:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830293; cv=none; b=mq+8YFJtaiTmi+OrZBpCDHUvIo6JjqeeUC01nA6bGEGq2PDWpmEnPkq2tC7e0wEWg34bv7h4Z6y/lPZZME/ezGACckt6DBSKp2ijGaomllhYkkPitrBN81s0jZnSLLWwFCPnajNR1GP3rzOj+hOy7Ec6e8dF7DZWNzOve3BTzd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830293; c=relaxed/simple;
	bh=DfIC2d8Lasz3kVV/py2kvx+SO42SYv6pyCm+8KRyQVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kP2VowL4VL165Wo5IDkpqKIOa+LTA+063RtKGyhTnIdc5uTtkJHDHpniyd1A7MYc11gxykhp8fog+PDCtypLdJyJg/3JMDuKTCLCcg4T4M/UE7PsqAI/+9EKQwDeywmq3g3UF+/zKbqJKSXjqsSowNCTDRIvZzala/ucCrG8X/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fbj0W8zS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fbj0W8zS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA0B1F000E9;
	Tue,  4 Aug 2026 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785830291;
	bh=yLmZGxMlybZUum5lGd4Viah/ThFQPG99AI9d55pWE0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fbj0W8zS0rwt3QbjWmTObHYkwz+igrk6NO0/+cKXAvKQBmx0ZKGtuSweVOTJy/z4N
	 EfEaUmtv+5fP5FxQLnClUyTsrP6r9dHuqYbTiFZmKgxE3gzkAT58wipCUiAv+6A8Ib
	 1W8MaG11Zb1ATKQy1uRoYxkxQoX4uzOATIiTWCaM=
Date: Tue, 4 Aug 2026 09:57:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashmit Kumar <work.ashmitkumar@gmail.com>
Cc: mchehab@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: av7110: remove unnecessary
 parentheses from return
Message-ID: <2026080451-giveaway-squid-ea37@gregkh>
References: <20260804074951.14915-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804074951.14915-1-work.ashmitkumar@gmail.com>

On Tue, Aug 04, 2026 at 07:49:51AM +0000, Ashmit Kumar wrote:
> The Linux kernel coding style specifies that return is not a function
> and therefore parentheses are not required.
> 
> Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
> ---
>  drivers/staging/media/av7110/sp8870.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
> index 29fb4934c03..83c6ee305d6 100644
> --- a/drivers/staging/media/av7110/sp8870.c
> +++ b/drivers/staging/media/av7110/sp8870.c
> @@ -92,7 +92,7 @@ static int sp8870_readreg(struct sp8870_state *state, u16 reg)
>  		return -1;
>  	}
>  
> -	return (b1[0] << 8 | b1[1]);
> +	return b1[0] << 8 | b1[1];
>  }
>  
>  static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmware *fw)
> @@ -167,7 +167,7 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
>  
>  static int sp8870_read_data_valid_signal(struct sp8870_state *state)
>  {
> -	return (sp8870_readreg(state, 0x0D02) > 0);
> +	return sp8870_readreg(state, 0x0D02) > 0;
>  }
>  
>  static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
> -- 
> 2.51.0.windows.1
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
