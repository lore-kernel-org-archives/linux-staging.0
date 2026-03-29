Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C4E8635D;
	Sun, 29 Mar 2026 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774764870; cv=none; b=ltrZ8SK4unMfKgBIgLSLsa56syF9slMuls9HhPah4enew7y/d0Jickaf/S2e+tFVPZaKRse4Q5KkBNDtu20IdNCamyjQaLdeUVfHLuYxfvWEmBbh8bf8dEv+7TwgJ9vNtBi4Q9jNv7I3iYQn98fiIAfUe6m8KRH7TD0Rt7zg0vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774764870; c=relaxed/simple;
	bh=zlZfpKzPaboBe8XrspGY7IyE1o5ME7otb4HdpFZeRIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNkeU/ENovOFO9DtZpz73Cat/rlRxibSURC0QBZhJRyWGwwt9D/k50c1EqDvtSQcOe+B7P8m7CZYxRZlBudd01k30NZ27PMW5EkgF3wIn8HTq/LiN1mPdeG0UtqLC5u4oX/3gTXaXnK2WOrt5nmK0Yuh8um4BOv+Io6QWJAdh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EMDt9AUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EMDt9AUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7407DC116C6;
	Sun, 29 Mar 2026 06:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774764869;
	bh=zlZfpKzPaboBe8XrspGY7IyE1o5ME7otb4HdpFZeRIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMDt9AUsSwk8nydO7VWmRdaDLEsCu8g3P8fHBZ1DOkeQZu9twXbCuiM77HCASq9dp
	 HXPHpy52xju8M4YqpyboKDIZrhyQn8JjZ6MUK9Ul4C2xJOKQF1OOdGcOTo2+mzPdAW
	 zLb47FYL9OAO+Un0/r4Tz5FZTEUSLip+znl/mdZE=
Date: Sun, 29 Mar 2026 08:14:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: loren coomer <lorencoom@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] vme_user: add missing blank line in struct fake_driver
Message-ID: <2026032948-tuesday-kindle-c768@gregkh>
References: <CALKC8YEZwrLkp1c5uE_bdn7g+1kVt-LFfr_TxGTCTbW-f-=00A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALKC8YEZwrLkp1c5uE_bdn7g+1kVt-LFfr_TxGTCTbW-f-=00A@mail.gmail.com>

On Sat, Mar 28, 2026 at 07:38:57PM -0700, loren coomer wrote:
> Add a blank line to separate fields in struct fake_driver
> 
> Signed-off-by: Loren Coomer <lorencoom@gmail.com>

> From 69ec78179d88ff83d6ff4c0063f376cde5f091b0 Mon Sep 17 00:00:00 2001
> From: lorcoomer <lorencoom@gmail.com>
> Date: Sat, 28 Mar 2026 19:36:40 -0700
> Subject: [PATCH] vme_user: add missing blank line in struct fake_driver
> 
> Signed-off-by Loren Coomer lorencoom@gmail.com
> ---
>  drivers/staging/vme_user/vme_fake.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
> index be4ad47ed526..eb918a8570d5 100644
> --- a/drivers/staging/vme_user/vme_fake.c
> +++ b/drivers/staging/vme_user/vme_fake.c
> @@ -67,6 +67,7 @@ struct fake_driver {
>  	unsigned long long lm_base;
>  	u32 lm_aspace;
>  	u32 lm_cycle;
> +
>  	void (*lm_callback[4])(void *);
>  	void *lm_data[4];
>  	struct tasklet_struct int_tasklet;
> -- 
> 2.53.0
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

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
