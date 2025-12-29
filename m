Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAA347C6;
	Mon, 29 Dec 2025 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767027157; cv=none; b=SjtNA2fQDzrcR7PMzuUQNCtlviQdkMkwnCFNIfm/4yI3jINHCcx+0tQRfQhLd4P4qroaXptYD8YojV2wEQK0oN31F+36H76lZ1SUAcVqp+neS16NuHMwrD51kn9XjJ48l7io2Rqzn/e+TXvKl+YHv4ULCzBNBTP70yXoS+AbBBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767027157; c=relaxed/simple;
	bh=SHLSEAVL1aZpGLSoxEotwI04ykQfGfsOtO/Ecx/xb+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edu90Q0Dtt7lDtdMeVofwE5sF7LQUT+k1ddMvRN4FQYgoeN+taZJgV4KBcpRjCJ1xaBwR3anCujX5YanIRfQ/brFeSp/CrAXnHTK4IfWbH7BmLkUwQ1fI+EHbgwt2fGuT8kUjGipGFLoXQ8zfixfIO8utIDUaGTT3K8vANwz0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cgS4cJyi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cgS4cJyi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4742C4CEF7;
	Mon, 29 Dec 2025 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767027157;
	bh=SHLSEAVL1aZpGLSoxEotwI04ykQfGfsOtO/Ecx/xb+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cgS4cJyiCZNw2JuP/KY2dB7wjX+u/0EVHA91S20Q8WNdfLejKuKkuq3t2kAAqd3D1
	 EIg5ir8AX+UrRdRoH/Gl/tGJaZ9u9eQOKbZqaBU5e5lIuGW4E2F9phO2/X8AFrs/i9
	 FeZTp7JCW7j9KRFVcj4zaqI7L8ejtShV25b2gOqc=
Date: Mon, 29 Dec 2025 17:52:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Johan Hovold <johan@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>, Alex Elder <elder@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: audio: avoid snprintf truncation
 warnings
Message-ID: <2025122922-wrath-elevating-bd85@gregkh>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
 <20251229161346.188805-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229161346.188805-1-sun.jian.kdev@gmail.com>

On Tue, Dec 30, 2025 at 12:13:46AM +0800, Sun Jian wrote:
> W=1 reports possible truncation when formatting widget/control names
> with snprintf() and a %s argument. Use a small helper and hide the %s
> pointer from the compiler's truncation analysis via OPTIMIZER_HIDE_VAR(),
> while keeping the existing snprintf() formatting.
> 
> No functional change intended.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 76146f91cddc..4293ab899390 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>  
>  	/* Prefix dev_id to widget control_name */
>  	strscpy(temp_name, w->name, sizeof(temp_name));
> -	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
> +	scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
> +	strlcat(w->name, temp_name, sizeof(w->name));
>  
>  	switch (w->type) {
>  	case snd_soc_dapm_spk:
> @@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
>  		control->id = curr->id;
>  		/* Prefix dev_id to widget_name */
>  		strscpy(temp_name, curr->name, sizeof(temp_name));
> -		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
> -			 temp_name);
> +		scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
> +		strlcat(curr->name, temp_name, sizeof(curr->name));
>  		control->name = curr->name;
>  		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
>  			struct gb_audio_enumerated *gbenum =
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
