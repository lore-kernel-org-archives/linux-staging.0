Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E423C3BE6;
	Tue, 12 May 2026 05:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564200; cv=none; b=gw3I0yLke2MDsaxad2gGNyc4h3m74wsWkOclkLYmt5rI3ws6WV/wqLQRzLb0EshvpJm0r8skssr4zv7WeYfzRpsj4b8jfEl8Wdau8cwiGSopcLEoFej+joSjL41VqfbfVcywY5FedMsCNP8bXjiClnREkU/trCNjClLnQwk3Cl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564200; c=relaxed/simple;
	bh=xfFsFtsDakbrNqsqZLxOrs/j5C5aaRhg1tce9eGqvn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2q/p0BWNId7MKnSQTegt5QMwwczFA3BfOXMk1ylSDDjRV01g6gfcRklK1DZjRgV+JPG1TyRooTzBr0BTvZHc2nmtpZRbpl/Rsf8W30/UkBgjh76qun2yHeJvQ77FUlMjW756Yzv4AJwPUtMkCFjoicQQtO2e5y/fEhiDrlxmf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pZjYmoY8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pZjYmoY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A64CC2BCB0;
	Tue, 12 May 2026 05:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778564199;
	bh=xfFsFtsDakbrNqsqZLxOrs/j5C5aaRhg1tce9eGqvn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZjYmoY8yzYAu4255MnxVjFRsrtl5vmqmfaURns3XLQKamqlthvFwEt1hw/SfJORK
	 23tXIAZCP581nPcD+s0VZ+jeB0yweP3WFf3ot7X/aEEi1PsgFa2NvIpAxsT6XQf6le
	 HS5LlhMBPjp7Lx72q0MB16Py3uNk8saxxyeCAHCM=
Date: Tue, 12 May 2026 07:35:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Dan Carpenter <error27@gmail.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Pankaj Bharadiya <pankaj.bharadiya@gmail.com>
Subject: Re: [PATCH v2] Greybus audio protocols drivers: correct sscanf()
 return value check
Message-ID: <2026051243-factual-lyricism-6c54@gregkh>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
 <agGdJFofiZYKqqhr@stanley.mountain>
 <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>

On Mon, May 11, 2026 at 10:10:16PM +0200, Alexander A. Klimov wrote:
> manager_sysfs_add_store() passes 6 pointers to sscanf(),
> but required latter to return 7 which failed the operation.
> I corrected it to 6.
> 
> Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot field")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> index fcd518f954..ff323ca815 100644
> --- a/drivers/staging/greybus/audio_manager_sysfs.c
> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> @@ -23,7 +23,7 @@ static ssize_t manager_sysfs_add_store(struct kobject *kobj,
>  			desc.name, &desc.vid, &desc.pid, &desc.intf_id,
>  			&desc.ip_devices, &desc.op_devices);
> 
> -	if (num != 7)
> +	if (num != 6)
>  		return -EINVAL;
> 
>  	num = gb_audio_manager_add(&desc);
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
