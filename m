Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5130A73478
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661416; cv=none; b=bFVw7Ht59snsCymtKkY9QmcpvrTJr3In2PnEoDybp8bnJKxL/9S0M3XMka5TJjNYRqr9/Go/75fJQkaAhkKz0nsbh9btaG3lZ0G0Pyov/a1/WcLxEwuoSklPXVgXQPoz9oKqqfYWTg1IEeVzuJgFeenCX9xpgZGb38qsASvtDl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661416; c=relaxed/simple;
	bh=n3CIJNLyzGeqG3nDgil8AKYIze1p6GZww+31Duon/Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/5yRW50P/CA4YVYZnlY7hnMWYw93VEyujDkktOoSwd5d1s842PRF8DR5ocB6DFBSaePl6+r61GP3o5L2M187pMyQz3+4TrQFPc69l/u7KHivkar6h/709N5gvEH3nmqq1zMrknh2YHvdNxea/N1YW5NFnulVCEDcQmj3fj8iJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pDjorypg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pDjorypg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD64C58120;
	Mon, 26 Aug 2024 08:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724661415;
	bh=n3CIJNLyzGeqG3nDgil8AKYIze1p6GZww+31Duon/Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDjorypgwJXSQYljBX2QhyN/Bt5XWzOLCa+r36Y8BLi0aEb7ezDLZ2w8oQBDo4SSx
	 jxtUDUc+0tAnTMFZ4pmf3Ttym8WgTzvv7CnlDfMumHZWvIAMfJwz4eWFHJPNlr/i9i
	 kDQTZr/GzqONZXMIY4rzPwCL2iYLKwxEr8zGRy3g=
Date: Mon, 26 Aug 2024 10:36:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH] staging: greybus: Enclose multi-statement Macro in a
 do-while loop
Message-ID: <2024082639-direction-ibuprofen-729c@gregkh>
References: <20240826083213.23499-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826083213.23499-1-dorine.a.tipo@gmail.com>

On Mon, Aug 26, 2024 at 08:32:12AM +0000, Dorine Tipo wrote:
> Update the gb_loopback_stats_attrs() macro to use a do-while(0) loop.
> This ensures that it is treated as a single statement, preventing
> potential issues when used in conditional or loop constructs.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1f19323b0e1a..0f3e4c43e2de 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
>  static DEVICE_ATTR_RO(name##_avg)
> 
>  #define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +	do {
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field);
> +	} while (0)
> 

Please always test-build your patches before sending them out :(
