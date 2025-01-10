Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD4210F5A;
	Fri, 10 Jan 2025 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736521392; cv=none; b=I60mGjHSp1T0cfD1ytL/5teXP6p0Vi3GoFuTq6ulxqdmgx5iWIZ5UtPZRfYWt+BdWF634vx8sJ1yEwgNO1+rAL5e3TB9P9PbOaeQQ47TKv+UxEZwSoK/R1f2XTlaqZfKS6eKaHSxOFiROpzcXcxaGJOrJoIUfdZ9a2cKdsztQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736521392; c=relaxed/simple;
	bh=i4Jc5yLgdD3DIlRmnmuSJ+TNgPaT7StMKPcEBCYKpLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnMS0h689dQFVVf+yB9FPXc8ZeogDr8gZKChSQDgt/7lnXd/Vr1subZqU+hi47bqrewAcC9tJOELrJTAmivJV05YiYQEGLfMHtDMYpR7suw+7uIRr3U1zwNG5MkxJpx3iOWLjnCmfnkxSrnkBe9Zzv29TAhxAZChGMV3FTGMHJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wreWIehy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wreWIehy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F40C4CED6;
	Fri, 10 Jan 2025 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736521392;
	bh=i4Jc5yLgdD3DIlRmnmuSJ+TNgPaT7StMKPcEBCYKpLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wreWIehyMe7JzU0FPxcD11MVWp58Za/rxpJH8Rxby79AiS6T7xKDbGqBIh0WXKyKs
	 2ehcQt74BS+8/fo+Ih47ZPavlIs3wX/hEPH5jmFM96x7PXo+92KzqgdGbArGO/4pO0
	 Zs5ouC6fu1thDHk6bmTiVAFcK+GzeWWm3IaBAHGg=
Date: Fri, 10 Jan 2025 16:03:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: Modernize gpib_interface_t
 initialization and make static
Message-ID: <2025011054-amused-award-88f8@gregkh>
References: <20250108174121.23044-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108174121.23044-1-dpenkler@gmail.com>

On Wed, Jan 08, 2025 at 06:41:21PM +0100, Dave Penkler wrote:
> All interface drivers were using the old style initialization of
> this struct
> 
> field : value;
> 
> This generated the followng sparse warning, for example:
> agilent_82357a/agilent_82357a.c:1492:1: warning: obsolete struct initializer, use C99 syntax
> 
> Change the initialization to use the C99 syntax
> 
> .field = value;
> 
> This also resolves the checkpatch constraint of no indentation.
> 
> These structs were also not declared as static, unnecessarily polluting
> the symbol namespace and generating the following sparse warnings,
> for example:
> 
> agilent_82357a/agilent_82357a.c:1465:18: warning: symbol 'agilent_82357a_gpib_interface' was not declared. Should it be static?
> 
> Declare them as static and remove any conflicting extern declarations
> in the corresponding include files.
> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
> v1 -> v2 Add subsystem prefix to subject

Please test-build your changes before sending them out :(

thanks,

greg k-h
