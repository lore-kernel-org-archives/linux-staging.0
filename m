Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FA81C03;
	Wed, 26 Oct 2022 13:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BA1C433D6;
	Wed, 26 Oct 2022 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666792251;
	bh=2TCF+GRWI0MqrB/KOyIKP2v35SPhwI1B51gp2H/KcyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B40wPC7JsKMoTby01XbXH84xWTv6qpmXSSjfJCDxoWNV8zC4IK1GmX2I1deZQ/pbo
	 IAuDzYvNd4LKHclCiHQvPBSR/0NkS+tUgH5LP60WvstnaovVxV5JAWCfPoU4yBBtRx
	 dLbn3RQOXM620KnE721i6QHmUyup0AO8Es8ZkCB4=
Date: Wed, 26 Oct 2022 15:51:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH 05/17] staging: vt6655: changed variable name: pvRTS
Message-ID: <Y1k7cDP4Dpdr5EOe@kroah.com>
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
 <47da976cd02d262cebe520b21a0bf2451de6731b.1666740522.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47da976cd02d262cebe520b21a0bf2451de6731b.1666740522.git.tanjubrunostar0@gmail.com>

On Tue, Oct 25, 2022 at 11:37:01PM +0000, Tanjuate Brunostar wrote:

Philipp has pointed out most of this already, but I'll just be specific
and say what isn't ok in all of these patches:

> 	change variable names pvRTS to meet the

"name" not "name"

>         linux coding standard, as it says to avoid using camelCase naming

"Linux" not "linux"

>         style. Cought by checkpatch

Why is this all indented?

Please do not do that, look at existing accepted changes in the git log
and match up what they look like.

But worst of all, you didn't really fix the variable name at all.  You
just appeased a tool that was trying to say "don't use camelCase, use
sane names".

> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 56 +++++++++++++++++------------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 2cac8f3882df..e97cba014adf 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -87,7 +87,7 @@ static const unsigned short w_fb_opt_1[2][5] = {
>  /*---------------------  Static Functions  --------------------------*/
>  static void s_v_fill_rts_head(struct vnt_private *p_device,
>  			      unsigned char by_pkt_type,
> -			      void *pvRTS,
> +			      void *pv_rts,

"pvRTS" is using Hungarian Notation.  Look it up on Wikipedia for what
it means, and why people used to use it.

For us, we don't need that at all as the type of the variable is obvious
in the code and the compiler checks it.

So "pvRTS" is trying to say "this is a pointer to void called "RTS".

We don't care about the "describe the variable type in the name" thing,
so it should just be called "RTS", or better yet, "rts", right?

But then, step back.  Why is this a void pointer at all?  This is really
a structure of type struct vnt_rts_g_fb.  So why isn't that being passed
here instead?

So try to work on both, fixing up the names to be sane, and then,
getting rid of the void * stuff, to better reflect how data is flowing
around and what type that data is in.

thanks,

greg k-h
