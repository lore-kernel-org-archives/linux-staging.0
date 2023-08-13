Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0729B17CA
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DCEC433C7;
	Sun, 13 Aug 2023 06:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691909656;
	bh=ag/sonhJHQ4OPOZJFKO88rQ6YYnY3PpOaN5Nh+0WmGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzE8a1KOCP6pMjMRGtrWfTxHnbaba5UMOMHQNQHAW72wUQsPVImKPR5Bv7AHufvUy
	 xzRhFTWogAQS2a+tQbwfKQGL6zB4owLz0dNZ82ZqrngOPLDm5wz/I2YT+qv2BE/lRB
	 3drFfzm+KBvFVIQQtqhMPwTJRn3q3Wlkt6qB+oB8=
Date: Sun, 13 Aug 2023 08:54:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] Staging: rtl8192e: Rename variable pBa in
 function rx_ts_delete_ba()
Message-ID: <2023081344-graveyard-frivolous-7d98@gregkh>
References: <20230813065035.95157-1-tdavies@darkphysics.net>
 <20230813065035.95157-2-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230813065035.95157-2-tdavies@darkphysics.net>

On Sat, Aug 12, 2023 at 11:50:30PM -0700, Tree Davies wrote:
> Rename variable pBa in function rx_ts_delete_ba() to rx_ts
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
> v2:Resending in smaller patch series
>  drivers/staging/rtl8192e/rtl819x_BAProc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index 0e3372868f97..1eff30533f47 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -41,9 +41,9 @@ static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs
>  	return bSendDELBA;
>  }
>  
> -static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *pRxTs)
> +static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *rx_ts)
>  {
> -	struct ba_record *pBa = &pRxTs->rx_admitted_ba_record;
> +	struct ba_record *pBa = &rx_ts->rx_admitted_ba_record;

I think your description is wrong here, you are not renaming the pBa
variable.

thanks,

greg k-h
