Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225387F;
	Mon, 17 Oct 2022 20:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VVnD7+tSbnV4cvLHj8ObB9d0TuGj+DjaKoHMAwKQtZg=;
  b=AVdXC6gGCzj2FYHGAGEuJsPSZrJ3XcIAXJBhp8mNGlwf26shXwOc5Cli
   qnkRAovNw5FCxolZurZXpMATIIOS8Q6nSlxHnMBpI4OPUHfbjFYIXOX4v
   aBeoTDF9z2fuPiOfe1FcbOfMUJ5q5zkmUW0dJKlLeWe5oyJT3M7uAthVU
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,192,1661810400"; 
   d="scan'208";a="31694701"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 22:56:04 +0200
Date: Mon, 17 Oct 2022 22:56:03 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Deepak R Varma <drv@mailo.com>
cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH] staging: most: dim2: read done_buffers count locally
 from HDM channel
In-Reply-To: <Y022wjdPGYwyx7lB@debian-BULLSEYE-live-builder-AMD64>
Message-ID: <alpine.DEB.2.22.394.2210172255250.16433@hadrien>
References: <Y022wjdPGYwyx7lB@debian-BULLSEYE-live-builder-AMD64>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 18 Oct 2022, Deepak R Varma wrote:

> The done_buffer count can be directly read from HDM channel instead of
> calling the dim_get_channel_state function. This change also results in
> obsoleting the dim_channel_state local structure variable.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>
> PLEASE NOTE: I have only built the module on my machine, but have not tested it.
> I am not sure how to test this change. I am willing to test it with appropriate
> guidance provided I have the necessary hardware.

For non experts, maybe it would be helpful to explain what motivated you
to do this?

julia

>
>  drivers/staging/most/dim2/dim2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index ab72e11ac5ab..4c1f27898a29 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -259,7 +259,6 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
>  static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
>  {
>  	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
> -	struct dim_ch_state_t st;
>  	struct list_head *head;
>  	struct mbo *mbo;
>  	int done_buffers;
> @@ -271,7 +270,7 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
>
>  	spin_lock_irqsave(&dim_lock, flags);
>
> -	done_buffers = dim_get_channel_state(&hdm_ch->ch, &st)->done_buffers;
> +	done_buffers = hdm_ch->ch.done_sw_buffers_number;
>  	if (!done_buffers) {
>  		spin_unlock_irqrestore(&dim_lock, flags);
>  		return;
> --
> 2.30.2
>
>
>
>
>
