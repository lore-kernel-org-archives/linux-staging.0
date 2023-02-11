Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8274408
	for <linux-staging@lists.linux.dev>; Sat, 11 Feb 2023 16:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E429C433EF;
	Sat, 11 Feb 2023 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676133625;
	bh=Uha+P4PhIb4YOtL9aeudGoAjNXpwH88uCbfBBvksCjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRRxqCc2dpKSAUpWga+mNdBkBqa9BDpltitsaLTfLmbiigdbFT7p5Dj6Sd7T+575i
	 sU1GL9uj6SVzcHWYNoP1Tb5+zsTEHmGRatXiCJ9cXRllhVMsSrBKkVC+Vf6fKrKlXY
	 5/Iz85ky0JM+b6mx9c2gmxGv75gcbOx0DRTHno9E=
Date: Sat, 11 Feb 2023 17:40:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tom Rix <trix@redhat.com>
Cc: philipp.g.hortmann@gmail.com, dragan.m.cvetic@gmail.com,
	wjsota@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: set dm_rx_path_sel_table
 storage-class-specifier to static
Message-ID: <Y+fE9kpVMdcW6EZ1@kroah.com>
References: <20230211152856.2129062-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230211152856.2129062-1-trix@redhat.com>

On Sat, Feb 11, 2023 at 07:28:56AM -0800, Tom Rix wrote:
> smatch reports
> drivers/staging/rtl8192e/rtl8192e/rtl_dm.c:147:21:
>   warning: symbol 'dm_rx_path_sel_table' was not declared. Should it be static?
> 
> dm_rx_path_sel_table is only used in rtl_dm.c, so it should be static
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> index d8455b23e555..3bc5dabf2e2c 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
> @@ -144,7 +144,7 @@ const u8 dm_cck_tx_bb_gain_ch14[CCK_TX_BB_GAIN_TABLE_LEN][8] = {
>  /*------------------------Define global variable-----------------------------*/
>  struct dig_t dm_digtable;
>  
> -struct drx_path_sel dm_rx_path_sel_table;
> +static struct drx_path_sel dm_rx_path_sel_table;

So now you have a local variable in the chunk that says "global
variable" :(

Please always be aware of the context of the code you are changing.

thanks,

greg k-h
