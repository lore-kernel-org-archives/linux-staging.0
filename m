Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C5A1FECB0
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667287; cv=none; b=HGBK9T6Er4TpIGdSQtQz3ukXDkZvclTkHsOlM8L0o0cJUsIBE9wc5V6JRTwJPqrj9oWecAy+lXMplaKfJON14oL9VfeqvZ14fyeMfbEeqG7tUXcAsRSz5P9JCfrLr1yzNSniWcZibIa/WOEJQ8hXie27R4O0wmp1mExXTt828tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667287; c=relaxed/simple;
	bh=ttqxGZ8VvlQYc2rg7Z0/EVfy3Gc/GJdRxHNpXlOMZ8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=na1Py9kyMW5lkXcX5svm4QtS9JBUQybI42uC9DkBl1lXCk2iv2zP335oOyn04RCNzgmbhOydY7Ybnl05rpa4nX5wK0zXHfpW1kU3iLn0ATS+dWAohWezaiwk2h4CcpF/vdCYOftLa+bjD6qZq2VNANvzoAu42pQwinFRdKtaEB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=q5UNZbmb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="q5UNZbmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72442C4CEF0;
	Wed, 16 Jul 2025 12:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752667286;
	bh=ttqxGZ8VvlQYc2rg7Z0/EVfy3Gc/GJdRxHNpXlOMZ8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5UNZbmblUQumxc2bl8ZFXdkR4MjoreJ4WcyKyWnWNxkO8BdmHaixGwXTrqPLMT4U
	 9yp3edBOSQtvzJyWpXESIKL8x42xUN6n6WswBllW/8Zpn9fyKD0BNmNo1tAZkdc6HJ
	 XzyvyiYXbe/CLrU6cpZMO4Al84eUpLmlEvmkqL7o=
Date: Wed, 16 Jul 2025 14:01:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/4] staging: rtl8723bs: fix block comment alignment in
 rtl8723b_cmd
Message-ID: <2025071604-mammogram-swimming-d956@gregkh>
References: <20250716113808.73115-1-ignacio.pena87@gmail.com>
 <20250716113808.73115-3-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716113808.73115-3-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 07:38:07AM -0400, Ignacio Peña wrote:
> +/*
> + * offload to FW if fw version > v15.10
> + *		pmlmeext->DrvBcnEarly = 0;
> + *		pmlmeext->DrvBcnTimeOut =7;
> + *
> + *		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
> + *			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
> + */

Why is this even still needed?  Shouldn't it just be deleted instead?

thanks,

greg k-h
