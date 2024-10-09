Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FBE189528;
	Wed,  9 Oct 2024 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728466861; cv=none; b=OvBVTfHAiEySXcdQjcOvA60rrHJZhybfH5YAe1hdQzjv3RA1wjhN1F3NAWXkBTp86l8/blG3vpBrbxpqglek0oBMdRf9qkhgvJSv7YNy+BZbDYYVdezVhzQvb/ueQIhcIGTCen/KJ3Z+p6RGjsbOGJkBoWzJjFlyBusy+epXB8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728466861; c=relaxed/simple;
	bh=abR1oJ1ZFLJeeEmDjccsvuHZ43bUmNhs4edIgiTYJWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AA/jjBGi2nfBbQH+vsrM5KsMH/X9OtcQDcpnHvZnuB+jew0VPbCE5EtuI9hNuUU3CYprPEay0mHG5GeAH89OHcJoM7+RXQwl+a1tZzHH48VHwH97UQIWxdgafxkgfdJzPmHarTMRgTUci17fdtIkgRKaSu1wWZL6siy2nmcS+bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=koC3rjxC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="koC3rjxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EE4C4CECE;
	Wed,  9 Oct 2024 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728466861;
	bh=abR1oJ1ZFLJeeEmDjccsvuHZ43bUmNhs4edIgiTYJWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koC3rjxCsA61RNe9s/U8Xz0fbFMtK2h7C06G1hDGBQCGV+gVXzPPcQLo1HlC7TwSM
	 5CbrmYqv2UIe8iOExnVPkMzsYXboXMdc6c+ssnHNqWX5a9/LcXlOFlG9Dc/gqSPaEo
	 eiU2XARqkYks62/3SLoltBNkbfb/wgT/uVpTk6Ss=
Date: Wed, 9 Oct 2024 11:40:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Micky Ching <micky_ching@realsil.com.cn>,
	wwang <wei_wang@realsil.com.cn>,
	Wei Yongjun <yongjun_wei@trendmicro.com.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Justin Stitt <justinstitt@google.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: Re: [RFC] staging: rts5208: Proposal to delete driver rts5208
Message-ID: <2024100943-shank-washed-a765@gregkh>
References: <b7b646d2-6987-4557-94c1-5fcd8d3d5ebc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7b646d2-6987-4557-94c1-5fcd8d3d5ebc@gmail.com>

On Sun, Sep 29, 2024 at 02:37:16PM +0200, Philipp Hortmann wrote:
> Dear Sirs,
> 
> Wei Wang from Realsil contributed this driver in 2011.
> 
> The following points let me propose to delete the driver:
> - This driver generates maintenance workload
> - Did not find minimal documentation on the web.
> - No blog entries about anyone using the rts5208 and rts5288 during the last
> years.
> - Did not find any device that may has it in and is still available on the
> market: Dell Latitude 2120, Lenovo ThinkPad Edge 130, Lenovo x121e
> 
> The staging subsystem needs to focus on drivers that support usable hardware
> that is available. Newbies can then get the hardware for some dollars and
> play around which is fun.
> 
> Please consider that support will remain for years in the longterm kernels.
> 
> Thanks for any response about your thoughts.

Again, no objection from me, please send a patch to delete it.

thanks,

greg k-h
