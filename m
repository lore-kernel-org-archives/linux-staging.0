Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771D11E47CC;
	Thu,  2 Apr 2026 05:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108053; cv=none; b=MPJIBS2BD95oa3X6X7zt85JpvKGvfOjBVC9S/m14luj/6qNqIS7AWMFGHOtqLQGUfPnisq2vSMFeEqTNHDklnsPlhALla4nk5TKDQTeTUbhkc6hyuUiIQA82ePvZkyJQClXRwHTp4lubdMeNOvHxLp4SVb9mRKbIOmGDA4YVuBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108053; c=relaxed/simple;
	bh=UaBaKqPrKJbzIVOvCLdMR09PlZ/8crmXqzZ6yydrvrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5rGg3lSG4we2qN6POatWKBy7/fkyJT69YKRZUmRoCrKNNxRGgcULxBdxDd/9D5kvm2yaUlC+pTVsmtTZ7FJtjxQH93lGnosEBnZqENbL8gch45KCGODNT1tMuJeBNeFzjoRLAUPH5YyYudb7rTi57mZLAphoRoA7GOjzw6MkPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=r8ZC6205; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="r8ZC6205"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB2DC19423;
	Thu,  2 Apr 2026 05:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775108053;
	bh=UaBaKqPrKJbzIVOvCLdMR09PlZ/8crmXqzZ6yydrvrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8ZC6205EJwbnmbNLXngG7XBn/GgFn6ewOiU/fjcy7/1Dgqryc9gXe3/OVZ/nI8wg
	 /JF0EB03MYi5D1rmtWQaOVh1pwQ2/zlljtb8flUkxjdlz9f5/9Bq4j8vgWgQIayrR/
	 gmqa3x2Ge8F3azZZ0giqIuumSxvN317puTI0a0yU=
Date: Thu, 2 Apr 2026 07:33:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kosugi Souta <k.souta0926@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: greybus: fix unsigned long long type
 warning
Message-ID: <2026040230-princess-okay-519f@gregkh>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260402051124.101197-1-k.souta0926@gmail.com>
 <20260402051124.101197-2-k.souta0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402051124.101197-2-k.souta0926@gmail.com>

On Thu, Apr 02, 2026 at 02:11:23PM +0900, Kosugi Souta wrote:
> Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
> ---
>  drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
> index 3d2c6f88a138a..0ef88b7d24de0 100644
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
> -- 
> 2.43.0
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
