Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD8F225417;
	Fri, 16 Jan 2026 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578014; cv=none; b=pMhi8ITeGBpsG0+8aZc3cTnBtCqsz9lfpq53NcH34vDC9fQweIEO1/rYDMO1texYIdTj3GfCNi0zlujZ8H9nO40cGpmG2EFGZ0eIkp4H0+FsVLmqj6Z6K6Yrn7mRH8i0G5/LopAzhoEIknkt0KD8tfE1QYtCNfWRSC+BoUBO5hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578014; c=relaxed/simple;
	bh=psE1qGIAQkU6bubUQ78oBK8Hh7EjQG248ZjSHjIu1x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W63TlGAP+ghP5jhMhr0zmtz92IRp4v5gEQrv4pp4n9CF2x2qG23iYBS0C30fFE0oHFqvootkSCe31+v1oBuP0VBLxyzsWVt10AbVpFdeu+guDRJWzTn+rhrBtY8HYD2RGjhDyjdK6II9pxHQfS2Bzyyi+3OUM4hKqakNKEET3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gPPiq0AG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gPPiq0AG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A560C116C6;
	Fri, 16 Jan 2026 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768578014;
	bh=psE1qGIAQkU6bubUQ78oBK8Hh7EjQG248ZjSHjIu1x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPPiq0AGzXRFgYmwyonOAQ8zXPClpQeei6980s2sEExEOtQ/+TOrv+PD1X1VqckxT
	 qnKU25chVjaJUQWqK4faeCbvNwlWrQ0Lr9/9FxbjEuvDO+eLUuZzn/P70CxWeLW1IA
	 g7N18nMDMq1UIr5d9Egwe6r44W6LLvUYbHSJwJJQ=
Date: Fri, 16 Jan 2026 16:40:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Archit Anant <architanant5@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Add missing spaces around mathematical and
 logical operators (+, -, /, |, ?, :) and remove multiple spaces around
 operators to comply with the Linux kernel coding style.
Message-ID: <2026011655-antiques-hypertext-354b@gregkh>
References: <20260116151038.23519-1-architanant5@gmail.com>
 <20260116151038.23519-2-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116151038.23519-2-architanant5@gmail.com>

On Fri, Jan 16, 2026 at 08:40:37PM +0530, Archit Anant wrote:
> Issue identified by checkpatch.pl and review feedback.
> 
> Signed-off-by: Archit Anant <architanant5@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 26 ++++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Something went wrong with your subject line :(

Can you fix up and do a v3?

thanks,

greg k-h
