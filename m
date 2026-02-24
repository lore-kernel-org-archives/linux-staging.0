Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09903A7F4B;
	Tue, 24 Feb 2026 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955726; cv=none; b=NKszF+mWFh9qyknfiU9Ktzbadtl9u8VfyQ7w8xj7GjqMYS0TKUJN0Kt9jsT1Tz7J3Xn+gIU6fbpJlX35brYtJ6CHqbhJmwJDnK8Lyauqv9/bHAtWXTKvLqjzeDOT1Ny5TbNqCknKLk+AHy57kKrPG40IMoSGF1fIJqYgf10lR+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955726; c=relaxed/simple;
	bh=CL99OBhMEfqF4WnRgB7muXKQpH8rGyxyIuprKokrOiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAddGkGxemuzsRp/rd2i+wdTQBFZCp8QX8gsdcr9MCqWr4am0nLejJtgEAeSIQkRFRxDEZW0aPURiNA8qI9W0/0Pyxw1qsxG5sfG5asRIVEITgDA/lxS6ftrFBDTJfMtd1I4fd2jO/L7G8MiFfM1bI3XlTav8kQNclpRv+kSsno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zxAHW9q3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zxAHW9q3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A78FC116D0;
	Tue, 24 Feb 2026 17:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771955726;
	bh=CL99OBhMEfqF4WnRgB7muXKQpH8rGyxyIuprKokrOiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zxAHW9q3WkjA82TfHKEO8Obqmz92N//1UKp9WARj+ktvTTLaf7CFqwd2ycAydVkIo
	 859/wmSwAWJyfgZOHO3NZSOgbaDa86lfGk2CgyD+OWW4REe6jO8tZ4ItvMes9/c4J6
	 q2NHFmKzTB7TFZDguUkp8j4AFEF2eRz8yt5ciyFg=
Date: Tue, 24 Feb 2026 09:55:19 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: most: dim2: clean up error handling in
 fsl_mx6_enable
Message-ID: <2026022422-dreamless-tantrum-eae8@gregkh>
References: <20260216201921.1788-1-iprintercanon@gmail.com>
 <20260224043723.1828-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224043723.1828-1-iprintercanon@gmail.com>

On Tue, Feb 24, 2026 at 04:37:20AM +0000, Artem Lytkin wrote:
> This series cleans up error handling in fsl_mx6_enable(), split into
> separate logical changes per Dan Carpenter's review of v1.
> 
> Changes since v1:
>   - Split combined patch into 3 separate patches (one change per patch)
>   - Extended string indirection fix to all three enable functions
> 
> Patch 1 replaces IS_ERR_OR_NULL() with IS_ERR() since devm_clk_get()
> never returns NULL.
> 
> Patch 2 replaces dev_err() + hardcoded -EFAULT with dev_err_probe()
> and PTR_ERR() to propagate correct error codes and handle probe
> deferral properly.
> 
> Patch 3 removes unnecessary string indirection in dev_err() calls
> ("%s\n", "message" -> "message\n").
> 
> Artem Lytkin (3):
>   staging: most: dim2: replace IS_ERR_OR_NULL with IS_ERR for
>     devm_clk_get
>   staging: most: dim2: use dev_err_probe and proper error codes for
>     clock
>   staging: most: dim2: remove unnecessary string indirection in dev_err
> 
>  drivers/staging/most/dim2/dim2.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> -- 
> 2.43.0
> 

I see 2 different copies of this series, as can be seen on
lore.kernel.org:
	https://lore.kernel.org/all/20260224043723.1828-1-iprintercanon@gmail.com/

which is "correct"?

Can you send a v3 so I know what to do?

thanks,

greg k-h
