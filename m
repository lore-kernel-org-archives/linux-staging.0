Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009C2F7EEF;
	Tue,  7 Jul 2026 11:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423700; cv=none; b=r/7yrxVhXO4yIyPHm66Go5q3Gjs5QMGqQRyORHhIZl025KmRyGSIqtuFgwfgznQ5Ofy94Me2L2LxQtWO+J4AVUatEmoFE5ZYVzlilBKeHX0YJV53P8Sh7qVbEzWn1otDYQkkprshdOSMssA0e9zYNVJBJ1/KNDa9yCrgvG2RGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423700; c=relaxed/simple;
	bh=KDIj6HY1yMUyplaSYIOtUJPEwNCewAdCq9dxAOKGPDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSxGrSNy8HWyTLfCSnB2R0zRoA8vL/IOz8LqVOAyG0KoXn4li9jEqHw6uOmxl7k+xdSq7LNApsYuyaoKcsNaR2M1H+A1+9fUe+ozvonklMCU2ICo3NzqEZJKLf9NJ0nosP5uN/5MeTHDy/bsy6JGoefacDFE7MRnSODt9AsfiEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dKqEa2DW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dKqEa2DW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ABA01F000E9;
	Tue,  7 Jul 2026 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783423698;
	bh=NFaUkUDCtGLHV3j4c5VlLkLuiQaeTRJBrbYORRrXy5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKqEa2DWO+tm4ZP9Yvi8CafMg4klxWQiyZK/UjExRIDucbgaIJ2dboVDqqfV1YFAa
	 8RsuvJojYdWwZXUT2ghw2k9MFBEQntsJ1PF3nxWi3jE7bRdeEOEV79LuwyQUSTYbPz
	 KSgWXeqIavVZ0j+HFKbGqc3DG91g0in6So0UdvBw=
Date: Tue, 7 Jul 2026 13:28:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix CamelCase warning for OnAssoc
Message-ID: <2026070725-napped-decimal-3768@gregkh>
References: <ajpXBI0GxOGkmTUF@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajpXBI0GxOGkmTUF@koolguy>

On Tue, Jun 23, 2026 at 09:51:00AM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> Rename OnAssoc values from CamelCase to snake_case to conform to
> linux kernel coding style:
> OnAssocReq	  -> on_assoc_req
> OnAssocRsp	  -> on_assoc_rsp
> WMMOnAssocRsp     -> WMM_on_assoc_rsp
> HTOnAssocRsp	  -> HT_on_assoc_rsp
> OnAssocReqFail	  -> on_assoc_req_fail

Why just these?  It's a miss-mash of different things all at once.
Please make this a series that does one function at a time.

Also, when you change the function names, make them more obvious they
are in this driver as they turn into some pretty horrible global symbol
names, right?

thanks,

greg k-h
