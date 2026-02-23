Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A29313E14;
	Mon, 23 Feb 2026 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864422; cv=none; b=U5Fxut9l0rCGz7NfHN7MOydz8gtDSfphq9Wfg+7mJ1djSlu+f13aZMMRF2UCRx99JzMh5SwqdT0FRtCOdvZES796Crp8kjKcEF2SeXzLU19B/A9ZbqVUxyImfIH46l9+9xQqWiYyMjQJIVJb4cr+qse0W4delsXNOjlCj2hzv1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864422; c=relaxed/simple;
	bh=oWEe09Prq5FAOSYPDdhqnqEWxZJrgXHputfvoSJ0kXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPIIbT8cCDiUhZM9PLXL/wMJ0FH/u8f/M+pCFKN9TdNC0S9+rKDYV6DtKIJHLNl5iLm2zrqZNj0AsYNb/i7bqmBB8ncnADO8Oh/wkM5ptDRvd3Z760yV2qn7bvjTA3j93uMxirYhoseSgKoGYqlGRJNK+SMgDpw8AH56B8ebvGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MfncQw7I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MfncQw7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B86C116D0;
	Mon, 23 Feb 2026 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771864421;
	bh=oWEe09Prq5FAOSYPDdhqnqEWxZJrgXHputfvoSJ0kXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfncQw7It4Wf5il3wYjwuJIM1Ke/Bel93oewTHXe5Um/68Y+WZzPMJHTjn342OuP/
	 /UrHwzfJHKsiLhtnl32DmLBtB0Htzrob7fbb+5U+hsdvk9toaD0fzbkcfWsbV0QuCx
	 EcyY4xEq/SxW0jml67J0dfu45pyOx6r3hA3+ZQsg=
Date: Mon, 23 Feb 2026 17:32:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: Use sysfs_emit in show functions
Message-ID: <2026022320-implement-supernova-6a00@gregkh>
References: <20260223161610.8596-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223161610.8596-1-chakrabortyshubham66@gmail.com>

On Mon, Feb 23, 2026 at 09:46:10PM +0530, Shubham Chakraborty wrote:
> Refactor sprintf to sysfs_emit in all show functions of the greybus audio manager module. This follows the standard kernel practice of using sysfs_emit for sysfs attributes, ensuring consistent output formatting and newline handling.
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index e87b82ca6..f22ee73eb 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *kobj)
>  static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
>  					 struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%s", module->desc.name);
> +	return sysfs_emit(buf, "%s\n", module->desc.name);
>  }
>  
>  static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
> @@ -85,7 +85,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
>  static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
>  					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%d", module->desc.vid);
> +	return sysfs_emit(buf, "%d\n", module->desc.vid);
>  }
>  
>  static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
> @@ -94,7 +94,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
>  static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
>  					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%d", module->desc.pid);
> +	return sysfs_emit(buf, "%d\n", module->desc.pid);
>  }
>  
>  static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
> @@ -104,7 +104,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
>  					    struct gb_audio_manager_module_attribute *attr,
>  					    char *buf)
>  {
> -	return sprintf(buf, "%d", module->desc.intf_id);
> +	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
>  }
>  
>  static struct gb_audio_manager_module_attribute
> @@ -115,7 +115,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
>  					       struct gb_audio_manager_module_attribute *attr,
>  					       char *buf)
>  {
> -	return sprintf(buf, "0x%X", module->desc.ip_devices);
> +	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
>  }
>  
>  static struct gb_audio_manager_module_attribute
> @@ -126,7 +126,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
>  					       struct gb_audio_manager_module_attribute *attr,
>  					       char *buf)
>  {
> -	return sprintf(buf, "0x%X", module->desc.op_devices);
> +	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
>  }
>  
>  static struct gb_audio_manager_module_attribute
> -- 
> 2.53.0
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

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
