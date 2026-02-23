Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F399331213;
	Mon, 23 Feb 2026 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868078; cv=none; b=QjBZRySG/EBwQkwoQriZHfUdNNFKHjSbmgadDTmwxuGIOSajnSiOrL+m67osb9+B+C5xyi0dkapS7LTlSTfvqQaKaXTHKcTDt4X6P4KfgBhnKyMTx/ogULynABCu/85URGyBdbeLi0UOKxsxxdMwDKk5KCK0FSH9se+vYU/gbUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868078; c=relaxed/simple;
	bh=Ari0QK+PO5grNlhItctrbBl97mNCeIP+sfuwcEExsbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRwaKXrmyzn5GMCqCWsq0iWhUx/cCF1Hp3QUu+reJdsqb9fcr8CZSMnDU/0yBbvjS9MgRaTSblP5TyIQxE+MEX9HXiJtIJmpvnr13r3K/jIFSSuMkAAymkoqPqJ4HNpWBSDQQQktIjxubfbEtZlzoABWr/zLSa5xFv9XZaZ4aEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a3O0CHVm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a3O0CHVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9320CC116C6;
	Mon, 23 Feb 2026 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771868077;
	bh=Ari0QK+PO5grNlhItctrbBl97mNCeIP+sfuwcEExsbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3O0CHVmpoDeRAsVLcgvHgN0mVMcKBM2ebigMx5pfxrjGdPGI5X+dnlfRP8vujE9S
	 n3EmUe0HFfP3VyN6MfypLTIm2FUwPgu+6GvJC5JJlLwxNZk0dEalwmiRNntuq4n0+O
	 +sLyqQeHtJxpCLs9cFBk+Kafsw993gzEB75dWzwE=
Date: Mon, 23 Feb 2026 18:34:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: greybus: audio: Use sysfs_emit in show
 functions
Message-ID: <2026022303-ranking-crushing-6026@gregkh>
References: <20260223170849.10912-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223170849.10912-1-chakrabortyshubham66@gmail.com>

On Mon, Feb 23, 2026 at 10:38:49PM +0530, Shubham Chakraborty wrote:
> Refactor sprintf to sysfs_emit in all show functions of the greybus
> audio manager module. This follows the standard kernel practice of
> using sysfs_emit for sysfs attributes, ensuring consistent output
> formatting and newline handling.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
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
