Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEEC365
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 04:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0872C433D6;
	Tue,  1 Nov 2022 04:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667278384;
	bh=c5uB2a3E/LYa5L/Er0rR/6WTHDtnfj9MnFRKHgSmjHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Ectvr5JmpE0Tw9FFp1vSi9V4HxsjxoIqsPPAw53WckXD9Y11kbGNdTHq2Yq/jZWo
	 cc/Vywfc1H5+hx/sEU8TSzoyDKZaxdWhe+9c5CzcVb8yAgVwj5m49sG6/DREqLwy5N
	 HXxnovnb7BeciBXejEn0ey7jpjS5xO7S8prJe010=
Date: Tue, 1 Nov 2022 05:53:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gabhyun Kim <kimgaby415@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Remove line breaks to match coding
 style
Message-ID: <Y2CmYKLzKTVqKqcP@kroah.com>
References: <20221101011507.GA3802@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101011507.GA3802@ubuntu>

On Tue, Nov 01, 2022 at 10:15:07AM +0900, Gabhyun Kim wrote:
> Remove redundant line breaks between function definitions to correct the coding style

Nit, your changelog text is too wide, please properly wrap your lines at
72 columns.

> 
> Signed-off-by: Gabhyun Kim <kimgaby415@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtllib_softmac.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
> index 1a3ca3e57623..78828ecac28a 100644
> --- a/drivers/staging/rtl8192e/rtllib_softmac.c
> +++ b/drivers/staging/rtl8192e/rtllib_softmac.c
> @@ -22,7 +22,6 @@
>  
>  static void rtllib_sta_wakeup(struct rtllib_device *ieee, short nl);
>  
> -
>  static short rtllib_is_54g(struct rtllib_network *net)
>  {
>  	return (net->rates_ex_len > 0) || (net->rates_len > 4);
> @@ -147,9 +146,7 @@ static void init_mgmt_queue(struct rtllib_device *ieee)
>  	ieee->mgmt_queue_tail = ieee->mgmt_queue_head = 0;
>  }
>  
> -
> -u8
> -MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee)
> +u8 MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee)
>  {

You are doing two different types of things here, please only do one
"logical" type of thing at a time in a patch.

thanks,

greg k-h
