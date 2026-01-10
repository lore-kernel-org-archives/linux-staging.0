Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501A28003A;
	Sat, 10 Jan 2026 20:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768075245; cv=none; b=c3Ib5Ni3rvEZDDAemYdmeQ4jwVG30Bjo1TIiEfYl/OSmmHaJ61TxLBDC9VoZq0fe2ByrfFcwgBH1nWSHPHx/9i5H5J5UlADp7vHXrXgdq1M4sXKmMZ4fB4TU2jrUiVcKENViWAiwGdAQB08d8AailZMAh6P95udX0ItR7MyfOcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768075245; c=relaxed/simple;
	bh=qcCPcGUv5lJNgfKt9q+DNdIqoLf3Scbsrfp1lXslG/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCG92h9dI+/jCxh6hwGoFMVcebv7HAXHIEh05u0p/Asv2DLBao67CGjQVsCd/EAmIwXbrphhR6dAYAPvDnf7vsm7anyfEPfUPJRxtGITzKQ1y9mNDTp7nIh+z3TrdomMHbY2jQSxyRwyadyoFvKqxqueZGmjZ4u9V9FD2xnz3qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wpqLLniz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wpqLLniz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F68EC4CEF1;
	Sat, 10 Jan 2026 20:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768075244;
	bh=qcCPcGUv5lJNgfKt9q+DNdIqoLf3Scbsrfp1lXslG/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wpqLLniz5Fr8D4EFMuTNDNPfhwG2sTvTfd/q0DnAnUyXqnsZU3LXYmQj4VhM/Bmqg
	 Ym2ElZdP2NcTFuuPTi/lcZtmoZ4Zo/mazzK/TK34dG35KceukcXgCCRY89KA0z63L/
	 TrTyF1tVPRyrKZlXdtuo0p63OS5zxfd+EpjcbYsE=
Date: Sat, 10 Jan 2026 14:22:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: 2023060904@ycu.edu.cn
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	guagua210311@qq.com
Subject: Re: [PATCH 1/3] rtl8723bs: io: Add independent
 rtw_check_continual_io_error function
Message-ID: <2026011019-worried-monstrous-7837@gregkh>
References: <20260110101801.5820-1-2023060904@ycu.edu.cn>
 <EE88D4787656615D+20260110101801.5820-2-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EE88D4787656615D+20260110101801.5820-2-2023060904@ycu.edu.cn>

On Sat, Jan 10, 2026 at 06:17:58PM +0800, 2023060904@ycu.edu.cn wrote:
> From: changjunzheng <guagua210311@qq.com>

Please use your real name (either in native characters, or not, but with
spaces where correct.)

> Add a new function to check if the error count exceeds the MAX_CONTINUAL_IO_ERR
> threshold. This function follows the single responsibility principle and
> prepares for the subsequent removal of the global continual_io_error variable.
> 
> Changelog v3 -> v4:
> 1. Split the single v3 patch into 4 logical patches (per Greg KH's request)
> 2. Fix all coding style errors (trailing spaces, missing assignment spaces, indentation)
> 3. Add clear, purpose-driven commit messages for each patch
> 4. Add version changelog as required by kernel documentation
> 5. Add blank line before new function declaration to comply with coding style

I think my bot pointed you at the documentation, that says this all goes
below the --- line, right?

And what about the changes from 1 -> 2 and 2 -> 3?

Please fix up and resend a new series (v5?)

Also, the subject line does not have the version in it :(

thanks,

greg k-h
