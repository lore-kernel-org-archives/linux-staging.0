Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6FA72
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 09:28:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C924461058;
	Thu,  2 Sep 2021 09:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630574927;
	bh=fUOx3RPY+JkEhnWQkrq5pibbynHmCRSVbkLIIy/K9nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=03dDXfS3oONFchOlowgS9EjFgv0kxw9zCFvntxPSiLakgXv+eM0BI3RBDAjMRDLKT
	 zt4Gw8h8vBuQVQaZ/3aUXqijreQqKIe6bwTNCqkQi8mmvNdVq0LohrxZ7id0Q7ZVlP
	 tBSexhZHpAyxS1btCgGZ6PKqzUosBYBsWsmOfiQs=
Date: Thu, 2 Sep 2021 11:28:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] staging: r8188eu: incorrect type in assignment
Message-ID: <YTCZTY1WsHhTBjUE@kroah.com>
References: <cover.1630148641.git.aakashhemadri123@gmail.com>
 <74c156553614f44a900e987f1185f3388dd740f6.1630148641.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74c156553614f44a900e987f1185f3388dd740f6.1630148641.git.aakashhemadri123@gmail.com>

On Sat, Aug 28, 2021 at 04:40:46PM +0530, Aakash Hemadri wrote:
> Fix sparse warning:
> > rtw_br_ext.c:516:57: warning: incorrect type in assignment
>     (different base types)
> > rtw_br_ext.c:516:57:    expected unsigned short
> > rtw_br_ext.c:516:57:    got restricted __be16 [usertype]
> 
> *pMagic holds __be16 change it's type to __be16

I do not understand this sentence, what are you trying to say?

Remember, "it's" is short for "it is".

> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index 38f1bd591da9..bce73e8cbd52 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -474,7 +474,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>  		/*                Handle PPPoE frame                 */
>  		/*---------------------------------------------------*/
>  		struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
> -		unsigned short *pMagic;
> +		__be16 *pMagic;
>  
>  		switch (method) {
>  		case NAT25_CHECK:
> @@ -512,7 +512,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
>  						tag->tag_len = htons(MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN+old_tag_len);
>  
>  						/*  insert the magic_code+client mac in relay tag */
> -						pMagic = (unsigned short *)tag->tag_data;
> +						pMagic = (__be16 *)tag->tag_data;

Is this whole function ever actually called?

Can someone run a ftrace on the driver to see if this function ever
runs, and if not, remove it?

thanks,

greg k-h
