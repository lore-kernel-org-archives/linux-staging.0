Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A88DA3D
	for <linux-staging@lists.linux.dev>; Tue, 23 Aug 2022 06:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFF3C433D6;
	Tue, 23 Aug 2022 06:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661236007;
	bh=Q7vLxtIDKxtCXjU6HAkTItasd2FgQsnEtDJYozoQIoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zCplgUpBJItOrLKag+nd1ERhg0xJGMLHrUwt/VFLJgW4G/uuNwdm9o5MxCaIoMK0U
	 44Asdtol9eu8vYb8Vd1Rip7D7P6Pwxvamp25bLd3kS5YOa16GXvrKXZGw0oJGwUa99
	 ynyUKm7ZHyr5FIEssv8tSEp2KAQvNssBYDNFCisQ=
Date: Tue, 23 Aug 2022 08:26:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christopher Carbone <chris.m.carbone@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: split multiple assignments to lines
Message-ID: <YwRzJN5yORAtq8md@kroah.com>
References: <YwQGaLoBHH9C0aXN@valhalla>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwQGaLoBHH9C0aXN@valhalla>

On Mon, Aug 22, 2022 at 06:42:48PM -0400, Christopher Carbone wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: multiple assignmentst should be avoided
> 
> Signed-off-by: Christopher Carbone <chris.m.carbone@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index dbd1159a2ef0..6f4c31635cc4 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -386,7 +386,8 @@ static int lynxfb_ops_set_par(struct fb_info *info)
>  
>  	ret = lynxfb_set_color_offsets(info);
>  
> -	var->height = var->width = -1;
> +	var->height  = -1;

Odd spacing on this new line.  Did you run your change through
checkpatch?

Also, this is a new version of a previously-submitted patch, it needs to
be called "v2", and the changes you made from v1 listed below the ---
line, as the documentation asks you to do.

Please fix this up and submit a v3.

thanks,

greg k-h
