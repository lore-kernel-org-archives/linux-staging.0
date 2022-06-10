Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30536394
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 06:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879D9C3411B;
	Fri, 10 Jun 2022 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654844380;
	bh=3MbVWbyw7TIf4Dfh3LwQ1pZ1oRf8WOwlckiDaqMZ310=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hocI8WtyuEdo8Hob8jFB1Pnoobi+412TSiL1rp9mpfgq6VafhzsZfj5JZ99H6jenD
	 uPycvopAhXlhzqIzJdVkIvzfOd2YLS1+sGjxRvyrZBwgvcxHTb1Kc6KwoeZRj13cyj
	 fhgafIZx7wQw278zq1Ep420V3KYFeIClCu0wWTfE=
Date: Fri, 10 Jun 2022 08:59:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: olpc_dcon: Replace flush_scheduled_work() with
 flush_work().
Message-ID: <YqLr2psGA7Fp/oby@kroah.com>
References: <faaabb8b-1d69-9ee6-e593-aaa3dc52e05b@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faaabb8b-1d69-9ee6-e593-aaa3dc52e05b@I-love.SAKURA.ne.jp>

On Thu, Jun 09, 2022 at 02:52:46PM +0900, Tetsuo Handa wrote:
> This driver defines dcon_set_source() and dcon_set_source_sync(), where
> the latter calls flush_scheduled_work() which we want to remove.
> 
> Since "struct dcon_priv" is per a device struct, I assume that
> dcon_set_source_sync() needs to wait for only one work associated with
> that device. Therefore, add bool argument to dcon_set_source() and
> wait for only one work using flush_work().
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
> using a macro") for background.
> 
>  drivers/staging/olpc_dcon/olpc_dcon.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/olpc_dcon/olpc_dcon.c b/drivers/staging/olpc_dcon/olpc_dcon.c
> index 7284cb4ac395..e0b1c91bb1a7 100644
> --- a/drivers/staging/olpc_dcon/olpc_dcon.c
> +++ b/drivers/staging/olpc_dcon/olpc_dcon.c
> @@ -369,21 +369,18 @@ static void dcon_source_switch(struct work_struct *work)
>  	dcon->curr_src = source;
>  }
>  
> -static void dcon_set_source(struct dcon_priv *dcon, int arg)
> +static void dcon_set_source(struct dcon_priv *dcon, int arg, bool sync)
>  {
>  	if (dcon->pending_src == arg)
> -		return;
> +		goto flush;
>  
>  	dcon->pending_src = arg;
>  
>  	if (dcon->curr_src != arg)
>  		schedule_work(&dcon->switch_source);
> -}
> -
> -static void dcon_set_source_sync(struct dcon_priv *dcon, int arg)
> -{
> -	dcon_set_source(dcon, arg);
> -	flush_scheduled_work();
> +flush:
> +	if (sync)
> +		flush_work(&dcon->switch_source);
>  }
>  
>  static ssize_t dcon_mode_show(struct device *dev,
> @@ -459,13 +456,13 @@ static ssize_t dcon_freeze_store(struct device *dev,
>  
>  	switch (output) {
>  	case 0:
> -		dcon_set_source(dcon, DCON_SOURCE_CPU);
> +		dcon_set_source(dcon, DCON_SOURCE_CPU, false);

Ick, no, please don't add random boolean flags to parameters, it's now
impossible to remember what that means without having to go and dig up
the function itself.

Leave the _sync() call, just have it call dcon_set_source() and then do
the sync and that should make a much smaller patch, right?

thanks,

greg k-h
