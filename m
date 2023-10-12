Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3C8266C6;
	Thu, 12 Oct 2023 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H3B1r42X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8F4C433C8;
	Thu, 12 Oct 2023 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697128969;
	bh=N7Ln3/7jFFi5dIEaPqUeVOm/valMyUNZ+yFVCH2HfD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3B1r42Xk4qZTefHVM1u2WWTJtLS7u0LOelj+YTy6A7TaPA60KyCwYW65jmTQQNQ7
	 M8RsZax/OyV606kLidRx9BP0JMbKLlJ/wQ/nCGWAEw2hnDKICtHVigmW7ybQkbPxwW
	 feJRadJVHz7PgVL7cTzM37Ifn8tO8KnEKX3jrPsM=
Date: Thu, 12 Oct 2023 18:42:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Archana <craechal@gmail.com>, Dan Carpenter <error27@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging/wlan-ng: remove strcpy() use in favor of
 strscpy()
Message-ID: <2023101234-extenuate-regain-2e36@gregkh>
References: <ZSf8VcH8JQ+L+Z/r@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSf8VcH8JQ+L+Z/r@lab-ubuntu>

On Thu, Oct 12, 2023 at 05:01:57PM +0300, Calvince Otieno wrote:
> In response to the suggestion by Dan Carpenter on the initial patch,
> this patch provides a correct usage of the strscpy() in place of the
> current strcpy() implementation.
> 
> strscpy() copies characters from the source buffer to the destination
> buffer until one of the following conditions is met:
> 	- null-terminator ('\0') is encountered in the source string.
> 	- specified maximum length of the destination buffer is reached.
> 	- source buffer is exhausted.
> Example:
> 	char dest[11];
> 	const char *PRISM2_USB_FWFILE = "prism2_ru.fw";
> 	strscpy(dest, PRISM2_USB_FWFILE, sizeof(dest));
> 
> 	In this case, strscpy copies the first 10 characters of src into dest
> 	and add a null-terminator. dest will then contain "prism2_ru.f" with
> 	proper null-termination.
> 
> Since the specified length of the dest buffer is not derived from the
> dest buffer itself and rather form plug length (s3plug[i].len),
> replacing strcpy() with strscpy() is a better option because it will
> ensures that the destination string is always properly terminated.
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
>  drivers/staging/wlan-ng/prism2fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
> index 5d03b2b9aab4..3ccd11041646 100644
> --- a/drivers/staging/wlan-ng/prism2fw.c
> +++ b/drivers/staging/wlan-ng/prism2fw.c
> @@ -725,7 +725,7 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,
>  
>  		if (j == -1) {	/* plug the filename */
>  			memset(dest, 0, s3plug[i].len);
> -			strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
> +			strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len);
>  		} else {	/* plug a PDR */
>  			memcpy(dest, &pda->rec[j]->data, s3plug[i].len);
>  		}
> -- 
> 2.34.1
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
