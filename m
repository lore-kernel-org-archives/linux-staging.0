Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D322A3BED5B
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847562; cv=none; b=JZ6yRlRgw6AukvOrH2jdqv48W2WAgg3ult0xoy3VGX4uWVFdDbq0C+S6INKoBnvGPJA3JLKxDuFoidsj3hb96yi7dXymOCVUvDOXS2uUTYddYwhNrN2wXitTOrHdk/3ioxZIIEvrsphCReJ7L85oHQtEzZ8ZMi3f4yB9fUfLdsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847562; c=relaxed/simple;
	bh=wgm9Kg8ao/fkCvWFD2dHZNgnxkxpGTOa2EY6hr12efM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTitca2xYr8a9UYPQx+4L6CTTsxl0uGmCycc+ECnpElrH8zHymSbrx+WHGCbJeSbWstsnl6foYlbjbF08L1Y7G87SWPz3RN+JLvZ1fb3I7lAXaOCOA9SGJXq+pny0ePEL8C5mFMY5X4Vsu57yPuKaFDyVQxX26iukPNhh65pMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C69VgcRT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C69VgcRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E080BC19421;
	Wed, 18 Mar 2026 15:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773847561;
	bh=wgm9Kg8ao/fkCvWFD2dHZNgnxkxpGTOa2EY6hr12efM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C69VgcRTZhiBFa/5yI5fvA2QOtPGWsk+n/WRH53WquKS6Ll2c9sYGpmRBqG6OLfHe
	 O+8PCIZdf23RKLnk0vkPNyeMSgIP1kr/ILG/x8elVTUyBdiIXPv6tf9Y03CgSRAk9T
	 C/6AwIvmwsD6FgHmF2MBf3UFGoy15KWhrgR4lDJc=
Date: Wed, 18 Mar 2026 16:25:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: sm750fb: fix CamelCase naming crimes
Message-ID: <2026031847-resilient-handwash-6f4d@gregkh>
References: <20260317174226.167865-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317174226.167865-1-inasj268@gmail.com>

On Tue, Mar 17, 2026 at 05:42:26PM +0000, Jad Keskes wrote:
> The sm750fb driver had several variables using CamelCase, which is
> discouraged in the Linux kernel coding style.
> 
> Rename the following variables to use snake_case:
> - pvMem -> pv_mem
> - pvReg -> pv_reg

Please look at these names, "pv" was trying to use "Hungarian notation"
and describe a void pointer.  That's not a proper way to name a kernel
variable, so pick a correct one instead.

Also, it's usually best if you rename one structure at a time.

thanks,

greg k-h
