Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABE11A682D;
	Sun,  8 Mar 2026 18:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772995735; cv=none; b=lxM0dTFfLwFBk6MDUi5t5HQqdflsU3IeOUPJuFfNdySekbVpEqw7Z89pFbEoBchvXqwg/mPLOZDFZfV6v+fG2NZMS5qQM4E50CMy4jYq/85z+tJj6xS+WYku0mkBWH5bA2fLIYDnrSGgdNzxPZ7vN7zxMa7cTVb6ZEy9oc0McV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772995735; c=relaxed/simple;
	bh=UIW5Y/nitsGt9rpNnO9TUyL4/fetcdl2/J6gG7vz2h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S36qJmaUzERjYsI50PrpQ2Zuxn3lqokRwlxo/WW+EDl2a8axWOU8AMMmcxjHvRET+gvZ8GmHdFp0yKY3EUZwh80/kjVe43evC7kDeF3sBjWVMMlCEoTGaNfSBNbqSJw4fA1TagO1u2PcKI6FF584N7NMM4MgeBpBqWNfubgMr3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r0lNfoNo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r0lNfoNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E878BC116C6;
	Sun,  8 Mar 2026 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772995735;
	bh=UIW5Y/nitsGt9rpNnO9TUyL4/fetcdl2/J6gG7vz2h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0lNfoNoeNOMI/5bsO6TWmJM7kpib4F055kprMVgCyEDW+IvSxX8uq97t2RrEm2CZ
	 3uLHJWcDKDoK5544FfJHVgUoc67oCaa5gOpQ3cp8pL2WwzD/gM4+U3Y48EKAOpuzuK
	 8FpDhXQHro7cMxwiBTJSxEZr1WS/rk4pYkna84zg=
Date: Sun, 8 Mar 2026 19:48:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] staging: greybus: standardize data type and fix
 alignment to parentheses
Message-ID: <2026030840-linked-curliness-3f47@gregkh>
References: <20260301095154.144809-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301095154.144809-1-activprithvi@gmail.com>

On Sun, Mar 01, 2026 at 03:21:54PM +0530, Prithvi Tambewagh wrote:
> Standardize code in the file:
> drivers/staging/greybus/Documentation/firmware/authenticate.c
> by making the following changes:
> 
> 1. Remove redundant 'int' from 'unsigned long long int' as suggested by
>    checkpatch when printing the obtained device UID:
>    printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
> 
> 2. Fix alignment of multi-line printf statement to match opening
>    parentheses:
>    printf("Authenticated, result (%02x), sig-size (%02x)\n",
>           authenticate.result_code, authenticate.signature_size);
> 
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---
>  drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> index 3d2c6f88a138..ba4b16b04557 100644
> --- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
> +++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> @@ -58,7 +58,7 @@ int main(int argc, char *argv[])
>  		goto close_fd;
>  	}
>  
> -	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
> +	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
>  
>  	/* Get certificate */
>  	printf("Get IMS certificate\n");
> @@ -85,7 +85,7 @@ int main(int argc, char *argv[])
>  	}
>  
>  	printf("Authenticated, result (%02x), sig-size (%02x)\n",
> -		authenticate.result_code, authenticate.signature_size);
> +	       authenticate.result_code, authenticate.signature_size);
>  
>  close_fd:
>  	close(fd);
> 
> base-commit: eb71ab2bf72260054677e348498ba995a057c463
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
