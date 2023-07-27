Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44778C2E5
	for <linux-staging@lists.linux.dev>; Thu, 27 Jul 2023 08:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540E1C433C9;
	Thu, 27 Jul 2023 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690445152;
	bh=hI1dHJR15QlDn6+LJsqscQtpSytDcyxsnuee5JIyW8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFkiZjLFKiKpljvj7vWwExrxR0zEF2+1S+0hJia2KkSuScTxnPuo1SF1Jk2JnJqHG
	 h8424eeFLhOaQIUy7lTufjLSNzdVH+fxbNZOwqv3j5swHI6eYWjNEGRWNdAnBzNNlS
	 ktWgDq6gTLRYrS8qqvof3G88ijRjWdl1z2snkekc=
Date: Thu, 27 Jul 2023 10:05:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: philipp.g.hortmann@gmail.com, anjan@momi.ca, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] Staging: rtl8192e: Rename function ResetBaEntry
Message-ID: <2023072731-turtle-reassure-568d@gregkh>
References: <20230727061948.579480-1-tdavies@darkphysics.net>
 <20230727061948.579480-6-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727061948.579480-6-tdavies@darkphysics.net>

On Wed, Jul 26, 2023 at 11:19:48PM -0700, Tree Davies wrote:
> Rename function ResetBaEntry to reset_ba_entry in order to Fix checkpatch
> warning: Avoid CamelCase
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
> v2: Sent with git send-email
>  drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
>  drivers/staging/rtl8192e/rtl819x_TSProc.c | 6 +++---
>  drivers/staging/rtl8192e/rtllib.h         | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index 9662d75257ce..cb6450206763 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -54,7 +54,7 @@ static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *pRxTs
>  	return bSendDELBA;
>  }
>  
> -void ResetBaEntry(struct ba_record *pBA)
> +void reset_ba_entry(struct ba_record *pBA)
>  {
>  	pBA->b_valid			  = false;
>  	pBA->ba_param_set.short_data	  = 0;
> diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> index c61fdf73c572..21ffbb6b231f 100644
> --- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> @@ -117,8 +117,8 @@ static void ResetTxTsEntry(struct tx_ts_record *pTS)
>  	pTS->bAddBaReqDelayed = false;
>  	pTS->bUsingBa = false;
>  	pTS->bDisable_AddBa = false;
> -	ResetBaEntry(&pTS->TxAdmittedBARecord);
> -	ResetBaEntry(&pTS->TxPendingBARecord);
> +	reset_ba_entry(&pTS->TxAdmittedBARecord);
> +	reset_ba_entry(&pTS->TxPendingBARecord);
>  }
>  
>  static void ResetRxTsEntry(struct rx_ts_record *pTS)
> @@ -126,7 +126,7 @@ static void ResetRxTsEntry(struct rx_ts_record *pTS)
>  	ResetTsCommonInfo(&pTS->ts_common_info);
>  	pTS->rx_indicate_seq = 0xffff;
>  	pTS->rx_timeout_indicate_seq = 0xffff;
> -	ResetBaEntry(&pTS->rx_admitted_ba_record);
> +	reset_ba_entry(&pTS->rx_admitted_ba_record);
>  }
>  
>  void TSInitialize(struct rtllib_device *ieee)
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index e3ce4431d460..ccc9e7bbbcbb 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -2016,7 +2016,7 @@ void TsInitDelBA(struct rtllib_device *ieee,
>  void BaSetupTimeOut(struct timer_list *t);
>  void TxBaInactTimeout(struct timer_list *t);
>  void RxBaInactTimeout(struct timer_list *t);
> -void ResetBaEntry(struct ba_record *pBA);
> +void reset_ba_entry(struct ba_record *pBA);

Again, this is a global symbol name, please prefix it with rtllib_

thanks,

greg k-h
