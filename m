Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085E217CA
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 06:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4DCC433C7;
	Sun, 13 Aug 2023 06:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691909724;
	bh=5i2AjKPSHieuDcXs+EsWdltqAbUtkA5hW8kNs2g2JLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTlgbwwtq6S3Eu32iYXR9T6cPizV17b3hLzoGSLLLCuakiXo8fPJO1+wo/0OcFpKu
	 MyVM5oNsoIDBFlpTExY4LbO6wK6MNKtNVeX9sO0RRHEb2hUi93+TvWzLQL6mdJABaV
	 dercvC5z75W0Yxb9NIiYnzxFUIi+7Bjo5S19Mm5I=
Date: Sun, 13 Aug 2023 08:55:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] Staging: rtl8192e: Rename variable pTS in
 function rtllib_rx_ADDBAReq()
Message-ID: <2023081315-grandma-fifth-1e9c@gregkh>
References: <20230813065035.95157-1-tdavies@darkphysics.net>
 <20230813065035.95157-3-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230813065035.95157-3-tdavies@darkphysics.net>

On Sat, Aug 12, 2023 at 11:50:31PM -0700, Tree Davies wrote:
> Rename variable pTS in function rtllib_rx_ADDBAReq() to rx_ts
> to fix checkpatch warning Avoid CamelCase.
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
> v2:Resending in smaller patch series
>  drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index 1eff30533f47..2748ab59545c 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -220,7 +220,7 @@ int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
>  	union ba_param_set *pBaParamSet = NULL;
>  	u16 *pBaTimeoutVal = NULL;
>  	union sequence_control *pBaStartSeqCtrl = NULL;
> -	struct rx_ts_record *pTS = NULL;
> +	struct rx_ts_record *rx_ts = NULL;

This should just be called "ts" as that's what it is being used for, as
the original name says.

I've stopped reviewing the series here, please go through and make sure
all of your renames make logical sense as that is important when reading
the code in the future.

thanks,

greg k-h
