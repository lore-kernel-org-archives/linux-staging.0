Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB377F
	for <linux-staging@lists.linux.dev>; Tue,  7 Jun 2022 16:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5726AC385A5;
	Tue,  7 Jun 2022 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654619796;
	bh=8i5haULdeB2Ou8xLNgGyaqjpMUp/nNMdFFzefBtFQus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJOYP5lV5TwG9gnAjthINUaJCRhaAv5ayjybpS0BpNazzoGwVMj1SxQg/skv+eP2j
	 efB3JHODISGBtLWUuzpgVu+c7ki/+9fNOmc/qm31lf8ENLQGu6USScXIR7Zd28pTdR
	 I7xQe05KIYnjlzNRc9/HGJCmoftFlmEgqMYyxEpLsOT44uN6EThAx4V3w78k8oEVLl
	 Mg/nn5b6OJwEzh6oB1f2a94OudqtGDnidgkmdmRttS3p3DWqamPeIm2veizy34Wt+b
	 BYJXF201xvI3qlVaiD4trtkK1XnW2mq9C9RymqaGNWW8XM8nl6LEyESSq45YPdZeDL
	 AsE7PUYfzdm3w==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nycBz-0002GQ-7u; Tue, 07 Jun 2022 18:36:31 +0200
Date: Tue, 7 Jun 2022 18:36:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Jared Kangas <kangas.jd@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: audio: fix loop cursor use after
 iteration
Message-ID: <Yp9+j7xrjDQWkem3@hovoldconsulting.com>
References: <20220605231806.720085-1-kangas.jd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220605231806.720085-1-kangas.jd@gmail.com>

On Sun, Jun 05, 2022 at 04:18:06PM -0700, Jared Kangas wrote:
> gbaudio_dapm_free_controls() iterates over widgets using
> list_for_each_entry_safe(), which leaves the loop cursor pointing to a
> meaningless structure if it completes a traversal of the list. The
> cursor was set to NULL at the end of the loop body, but would be
> overwritten by the final loop cursor update.
> 
> Because of this behavior, the widget could be non-null after the loop
> even if the widget wasn't found, and the cleanup logic would treat the
> pointer as a valid widget to free.
> 
> To fix this, introduce a temporary variable to act as the loop cursor
> and copy it to a variable that can be accessed after the loop finishes.
> 
> This was detected with the help of Coccinelle.

Please add the missing Fixes tag and a CC stable tag here as Dan
mentioned.

> Signed-off-by: Jared Kangas <kangas.jd@gmail.com>
> ---
>  drivers/staging/greybus/audio_helper.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
> index 843760675876..07461a5d97c7 100644
> --- a/drivers/staging/greybus/audio_helper.c
> +++ b/drivers/staging/greybus/audio_helper.c
> @@ -115,7 +115,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
>  			       int num)
>  {
>  	int i;
> -	struct snd_soc_dapm_widget *w, *next_w;
> +	struct snd_soc_dapm_widget *w, *next_w, *tmp_w;
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *parent = dapm->debugfs_dapm;
>  	struct dentry *debugfs_w = NULL;
> @@ -124,13 +124,14 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
>  	mutex_lock(&dapm->card->dapm_mutex);
>  	for (i = 0; i < num; i++) {
>  		/* below logic can be optimized to identify widget pointer */
> -		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
> +		w = NULL;
> +		list_for_each_entry_safe(tmp_w, next_w, &dapm->card->widgets,

This should be list_for_each_entry() as w is not unlinked in this loop.

>  					 list) {
> -			if (w->dapm != dapm)
> -				continue;
> -			if (!strcmp(w->name, widget->name))
> +			if (tmp_w->dapm == dapm &&
> +			    !strcmp(tmp_w->name, widget->name)) {
> +				w = tmp_w;
>  				break;
> -			w = NULL;
> +			}
>  		}
>  		if (!w) {
>  			dev_err(dapm->dev, "%s: widget not found\n",

Looks good otherwise:

Reviewed-by: Johan Hovold <johan@kernel.org>
