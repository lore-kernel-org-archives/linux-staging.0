Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E040F2BD5BF;
	Tue, 30 Dec 2025 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767080452; cv=none; b=bSweHdsa4FkNaYQ2Uz9ayi6J9CIfOgCG4hX7M79lG8JpzqsNgg2SxJ7i7QOdQz8guKlhdm1jjLk3loGV5iTEFGeKvoXItrB2c+JqVhQP6c6cgHCQXWpiD7qoPx5gSM5UIKktr6xG0VP11Oh+NjgYwpCa6jzGUmu36TpJd/eIuq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767080452; c=relaxed/simple;
	bh=3sQqO0OWQ5uZmsVAwqEf+DbTHYSJ+DEQYED3X1WPebE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJdmWaAt0Cd/YmpdeYcEt5ZXramWMsg928ZLxXyctH75eZ/AQpQoTUxZGyemAsR4rjHuJHqF3lLt8XiGqBo3bNovoQ+KKnrInovwHQeBXC768EhirIbgPGri5QEyfGqrK7YXMbEboTABkhLnPdCkxGNDbG9z91dXNzbTSnrnuNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dGIJq0Qe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dGIJq0Qe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A2AC4CEFB;
	Tue, 30 Dec 2025 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767080451;
	bh=3sQqO0OWQ5uZmsVAwqEf+DbTHYSJ+DEQYED3X1WPebE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGIJq0QeTeTR+gMxM+bL5st01NAAbYEY5jeRPBehHrLAv1KaGJa1bNWhmd/QH0TMi
	 tXBTsvj0rLemeCohZPaZTKL3xHm46VF+GewvETWETqur666V6surYVrCA9VsaZIPrZ
	 J1Upopj4fR9ypwqXC/+X1sNWyaTn+lUetDkUdSyA=
Date: Tue, 30 Dec 2025 08:40:48 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Johan Hovold <johan@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>, Alex Elder <elder@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: audio: avoid snprintf truncation
 warnings
Message-ID: <2025123028-transform-nutshell-81fa@gregkh>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
 <20251230012908.214959-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230012908.214959-1-sun.jian.kdev@gmail.com>

On Tue, Dec 30, 2025 at 09:29:08AM +0800, Sun Jian wrote:
> W=1 reports possible truncation when formatting widget/control names
> with snprintf() and a %s argument. Use a small helper and hide the %s
> pointer from the compiler's truncation analysis via OPTIMIZER_HIDE_VAR(),
> while keeping the existing snprintf() formatting.
> 
> No functional change intended.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> 
> Changes in v3:
> - Replace the earlier scnprintf()/strlcat() approach with a helper
>   keeping snprintf().
> - Hide the %s argument from compiler truncation analysis using
>   OPTIMIZER_HIDE_VAR().
> - Add a small local length limit macro with a short comment.
> ---

The "changes" go below the --- line, as the documentation asks for.  And
please include what changed from versions prior to that as well.

But:

>  drivers/staging/greybus/audio_topology.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 76146f91cddc..35775067897c 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1009,6 +1009,19 @@ static const struct snd_soc_dapm_widget gbaudio_widgets[] = {
>  					SND_SOC_DAPM_POST_PMD),
>  };
>  
> +/* Limit %s length to avoid -Wformat-truncation with snprintf() */
> +#define GB_NAME_TMP_LEN 32
> +
> +static void gbaudio_prefix_dev_id(char *name, size_t name_len,
> +				  unsigned int dev_id)
> +{
> +	char temp_name[GB_NAME_TMP_LEN], *cp = temp_name;
> +
> +	strscpy(temp_name, name, sizeof(temp_name));
> +	OPTIMIZER_HIDE_VAR(cp);

What?  Why?  That feels wrong.  Let's not add hacks for broken
compilers.

> +	snprintf(name, name_len, "GB %u %s", dev_id, cp);
> +}
> +
>  static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  				      struct snd_soc_dapm_widget *dw,
>  				      struct gb_audio_widget *w, int *w_size)
> @@ -1018,7 +1031,6 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  	struct gb_audio_control *curr;
>  	struct gbaudio_control *control, *_control;
>  	size_t size;
> -	char temp_name[NAME_SIZE];
>  
>  	ret = gbaudio_validate_kcontrol_count(w);
>  	if (ret) {
> @@ -1086,8 +1098,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  	}
>  
>  	/* Prefix dev_id to widget control_name */
> -	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	gbaudio_prefix_dev_id(w->name, sizeof(w->name), module->dev_id);

This feels like a broken tool, let's not do foolish things just to make
compilers quiet.  W=1 is not a good reason to just make things "silent"
by moving code around like you did here.

sorry,

greg k-h
