Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFA942EEBF;
	Fri, 10 Jul 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695005; cv=none; b=dItsGxW88GNy69AghktifChmox+NmoUytBF480sPGrLgwRzgizh9n6Fe8c7LdN5D0YLqG124XpP5MJscLQgsG1d3tRjMBMb9PKut3TVDpz0Fi6UXQEKFOQYTRe3lG5QBAv+NUAQAFzAczyVXBVEzPmcUVYuYkg478cIaCr5b+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695005; c=relaxed/simple;
	bh=7sznWnUziJinsC6vasIhXLuQqs4Ve3lmXUyCVn60kxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUsE7ZI993wAYMU0Sr0rQp6vLO8h4GXk3FkSYnNa6NukBqFaYeM0VuoPRZZqWRAAeMOOZI15MeHW8WJG2CgQOUDPSfnqp/QppRIaHe/kWrRD7Tr1fK6KhEMN4/dVK3yLbsvc+ogyfWRn8UEiiSVJbTI8sOxTE6YmvQbZFepw1oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oV0mgDyj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oV0mgDyj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679BF1F000E9;
	Fri, 10 Jul 2026 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783694999;
	bh=7V2ZelPszUHZ7aTJILZHD9q6dtSaV1+b0ZZpP+yqteM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oV0mgDyjzqtX8+sXY6AsvcuISoi96j/0xQ1VVIjM2WL4uX4Z/liGOMaFkvlCEL3JW
	 nAs1A4s7hpBHoti6DnJwn1u460g3AqlYg1eYZ86n2bONnnkp5bk3RrgNPxNn46CATe
	 jyWCaLBeRsLow64J5MW1/CqqnEf2RS6zqYxDV8IE=
Date: Fri, 10 Jul 2026 16:49:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: fliegbert2@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: spaces preferred fix
Message-ID: <2026071037-floral-linked-fd2f@gregkh>
References: <ajUOSj9A8AUxNZQC@koolguy>
 <20260708202826.3099-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708202826.3099-1-fliegbert2@gmail.com>

On Wed, Jul 08, 2026 at 08:28:26PM +0000, fliegbert2@gmail.com wrote:
> From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> 
> Adding spaces around operators to match kernel coding style.
> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> ---
> - Rebased onto latest staging-testing
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 194 +++++++++---------

This does not apply to my tree at all, are you sure you made it against
the right branch?

thanks,

greg k-h
