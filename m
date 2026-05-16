Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA592556E;
	Sat, 16 May 2026 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778914719; cv=none; b=pHD1y0OOmp7GFNnw87/pt23eU8+B7lLj3Axulaskz8Ls8im9kfP12HVC3Pq7iGriK4SIAnnHy/j0U8+NrlXCwVCB65XirTKGPFMV6S1RdN3UWsJf8/dXCJh1YgFdRPw2SR4Wd8Pr/NFm2/dW+IYWnGyLwi+VhRKoLJ/M3EUqZa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778914719; c=relaxed/simple;
	bh=wYulCIgVmHuwR3HS0lLL3mUQCLyj7dQ9d2Je3DjzZgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qo6L+BSVhVGJTdW8nuO2wpjgaVMCF/Na2FdiFn3LQ7+T0VKMLoIu0TD5X+xlYmY6hEm3wRidbwu3v+nxtkmp/WVRVuwIbja94XkJxBUvXG7Wk4HQF67/jyTf/MC9IQWQ2Ivr2TQIoH1S+RgS34dgEG8rIo+U9c3a8ti14MMPOfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SVgRAOLT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SVgRAOLT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85796C19425;
	Sat, 16 May 2026 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778914718;
	bh=wYulCIgVmHuwR3HS0lLL3mUQCLyj7dQ9d2Je3DjzZgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SVgRAOLTuaFcxFuEs1WgOTGuFZ9wouoAF0G1o/3JE6BHKKp1bfaQg94EdnkTGkE2v
	 Ac7COiRp6LdO4LhjArm1FqvAk9CIg98PRBQtPfnAA8uM6GP96GGRk18V/yDc6xTnbW
	 GF7u4ziTd3QpDDy9pWDgbHSA0/ffTLMypuFzli1w=
Date: Sat, 16 May 2026 08:57:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: add missing newlines to sysfs_emit()
 output
Message-ID: <2026051636-visitor-mummy-e3c9@gregkh>
References: <20260515223342.40869-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515223342.40869-1-alhouseenyousef@gmail.com>

On Sat, May 16, 2026 at 12:33:42AM +0200, Yousef Alhouseen wrote:
> Sysfs show() callbacks should emit a trailing newline for text output.
> Several Greybus audio manager module attributes currently omit the
> newline, which triggers checkpatch warnings and makes the attributes less
> convenient to read from userspace.
> 
> Append missing newlines to the affected sysfs_emit() format strings.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index dc90cc2d2308..5737f2a32f5a 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
>  static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
>  					 struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sysfs_emit(buf, "%s", module->desc.name);
> +	return sysfs_emit(buf, "%s\n", module->desc.name);
>  }
>  
>  static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
> @@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
>  static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
>  					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sysfs_emit(buf, "%d", module->desc.vid);
> +	return sysfs_emit(buf, "%d\n", module->desc.vid);
>  }
>  
>  static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
> @@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
>  static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
>  					struct gb_audio_manager_module_attribute *attr, char *buf)
>  {
> -	return sysfs_emit(buf, "%d", module->desc.pid);
> +	return sysfs_emit(buf, "%d\n", module->desc.pid);
>  }
>  
>  static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
> @@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
>  					    struct gb_audio_manager_module_attribute *attr,
>  					    char *buf)
>  {
> -	return sysfs_emit(buf, "%d", module->desc.intf_id);
> +	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
>  }
>  
>  static struct gb_audio_manager_module_attribute
> @@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
>  					       struct gb_audio_manager_module_attribute *attr,
>  					       char *buf)
>  {
> -	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
> +	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
>  }
>  
>  static struct gb_audio_manager_module_attribute
> @@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
>  					       struct gb_audio_manager_module_attribute *attr,
>  					       char *buf)
>  {
> -	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
> +	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
>  }
>  
>  static struct gb_audio_manager_module_attribute
> -- 
> 2.54.0
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

- You sent a patch that has been sent multiple times in the past few
  days, and is identical to ones that has been recently rejected.
  Please always look at the mailing list traffic to determine if you are
  duplicating other people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
