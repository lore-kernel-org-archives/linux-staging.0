Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0983F624
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 10:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2942EC3411E;
	Thu,  7 Jul 2022 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657191169;
	bh=cRZmEvhq3mkvO9CFf2gncqX2zdzXsEPflfQTcsk6ojM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owrk7JzN0soODypmpkaL+lysRCGSQc06WnHyCmBP92nkBhUf9yLZo9mj+RQ+wEE7q
	 /yY7+Zai3DNrujSqlPQVe8w3Qaq8mUoN+S+awMvU3PKZVqhuSD4hro6aDXvNBJ3rkO
	 vpucQn2Hp8wsfumfI/OEQBDsmua0KW/yS+MUS9Yo=
Date: Thu, 7 Jul 2022 12:52:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Karthik Alapati <mail@karthek.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: don't use index pointer after iter
Message-ID: <Ysa6/gEg1VV4mEq1@kroah.com>
References: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>

On Thu, Jul 07, 2022 at 03:59:54PM +0530, Karthik Alapati wrote:
> There are some usages of index pointer of list(w) which may not point to
> the right entry when the required entry is not found and the list traversal
> completes with index pointer pointing to the last entry. So, use w_found
> flag to track the case where the entry is found.

That is already being done here with the use of the w variable.

Look at commit 80c968a04a38 ("staging: greybus: audio: fix loop cursor
use after iteration") and then d2b47721a100 ("staging: greybus: audio:
replace safe list iteration").

> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
> index 843760675876..7c04897a22a2 100644
> --- a/drivers/staging/greybus/audio_helper.c
> +++ b/drivers/staging/greybus/audio_helper.c
> @@ -116,6 +116,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
>  {
>  	int i;
>  	struct snd_soc_dapm_widget *w, *next_w;
> +	bool w_found = false;
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *parent = dapm->debugfs_dapm;
>  	struct dentry *debugfs_w = NULL;
> @@ -124,15 +125,18 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
>  	mutex_lock(&dapm->card->dapm_mutex);
>  	for (i = 0; i < num; i++) {
>  		/* below logic can be optimized to identify widget pointer */
> +		w_found = false
>  		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
>  					 list) {

You are working off of an old kernel version here, please see the above
commits which do not seem to be in your tree.  Always work on linux-next
for issues so that you do not duplicate work that others have completed.

thanks,

greg k-h
