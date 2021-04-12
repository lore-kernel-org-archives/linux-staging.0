Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BE771
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:30:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5138161209;
	Mon, 12 Apr 2021 09:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618219823;
	bh=WaL4dBUXjfT8rASmI+q10qscE5UnuzaJkLoxDaL8/wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2gscKo63FYh/GFa1acBa/D+w92KL8kgaWb2QhFEBTlrXIOm5vulDcVbkBawwQ7Jk1
	 12zqUGcfb9O1gGGhAcWo8p4k36S4jumhF6BJVIJJ+NwAArGwYoxlGp97GchzvSIU+j
	 1Z6nCyFNEEGyMn5cHBk8Vu1hCDfobzHH6K/ANHBY=
Date: Mon, 12 Apr 2021 11:30:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: tawahpeggy <tawahpeggy98@gmail.com>
Cc: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: Remove line to fix checkpatch error
Message-ID: <YHQTLYM38lZ5yJgg@kroah.com>
References: <20210411204933.GA3524@peggy-Lenovo-V130-15IKB>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210411204933.GA3524@peggy-Lenovo-V130-15IKB>

On Sun, Apr 11, 2021 at 04:49:38PM -0400, tawahpeggy wrote:
> remove one empty line.CHECK: Please don't use multiple blank lines
> 
> Signed-off-by: tawahpeggy <tawahpeggy98@gmail.com>
> 
> ---
>  drivers/staging/comedi/comedi_pcmcia.mod.c | 1 -
>  1 file changed, 0 insertion(+), 1 deletion(-)
>  create mode 100644 drivers/staging/comedi/comedi_pcmcia.mod.c
> 
> diff --git a/drivers/staging/comedi/comedi_pcmcia.mod.c b/drivers/staging/comedi/comedi_pcmcia.mod.c
> index 0904b8765afs96..3984db1a39c8
> --- /dev/null
> +++ b/drivers/staging/comedi/comedi_pcmcia.mod.c
> @@ -0,0 +1,31 @@
> #include <linux/module.h>
> #define INCLUDE_VERMAGIC
> #include <linux/build-salt.h>
> #include <linux/vermagic.h>
> #include <linux/compiler.h>
> 
> BUILD_SALT;
> 
> MODULE_INFO(vermagic, VERMAGIC_STRING);
> MODULE_INFO(name, KBUILD_MODNAME);
> 
> __visible struct module __this_module
> __section(".gnu.linkonce.this_module") = {
> 	.name = KBUILD_MODNAME,
> 	.init = init_module,
> #ifdef CONFIG_MODULE_UNLOAD
> 	.exit = cleanup_module,
> #endif
> 	.arch = MODULE_ARCH_INIT,
> };
> 
> #ifdef CONFIG_RETPOLINE
> MODULE_INFO(retpoline, "Y");
> #endif
> 
> MODULE_INFO(staging, "Y");
> 
> MODULE_INFO(depends, "pcmcia,comedi");
> 
> -  
> MODULE_INFO(srcversion, "ED971F2E01020DFA2B04486");
> -- 
> 2.17.1

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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file, Documentation/SubmittingPatches
  for how to do this correctly.

- Your patch does not match the description at all.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
