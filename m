Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E6C23372C;
	Thu, 21 May 2026 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372667; cv=none; b=Ii/SpwHkX3Z+D10UVsh5aosVwXSxRot6If6gw+LQFO1wtWkGbemw+eACwGQG5FVuFMa9w86xnLm38q/jqsIDiNOk+QsZ8gLimCyoEaG1W+QhavuqcGsYjCNLgjRTP7BP24DNeFI1iVWVqgb8WS0bus90k3yfCh9op8J6pQuBJe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372667; c=relaxed/simple;
	bh=JAcoLuEeAPl5JSR0Uy5SLwN64luWufvlj93cLLliFVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUO1YLGPQYMXsZdiInNdoK8PpNe2TfeApVeCDHxjRZK7ilmk4aGESju2b8wtDRk8NrXJzVg6NwiakC0/xKXNm28ZLthJG8Ra+qinEKAi/8vRDia4JMdMzbGXj1Ayt3yqFjihtrv7qP2KKLeFEf2fei4+VyiUCJsW4JKqDMBiKHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=prLqqxQm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="prLqqxQm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B061B1F000E9;
	Thu, 21 May 2026 14:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779372666;
	bh=MtMHAPPirH6FGwjqfGFDzvfQD/XJyJzv9wRMJBW5a3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=prLqqxQmnnvA2QoDijHGMzp45YULOFgtlVkPLiW59Av8tjUxJsFhKNGnJfEyNeora
	 D1D3Z7ogVnxVlfNLjpUT1GeBLAEYq1s7JEaAxN/JLrsMmfwno8GmUtUvzDQReGCs53
	 FareacCGJ7SXp4paz7ZOQbE1VvXTCeR5iOsPmDTs=
Date: Thu, 21 May 2026 16:11:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v6 0/7] staging: rtl8723bs: fix OOB reads and writes in
 IE/attribute parsing
Message-ID: <2026052158-mumps-margarita-afcd@gregkh>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521130330.754181-1-hossu.alexandru@gmail.com>

On Thu, May 21, 2026 at 03:03:23PM +0200, Alexandru Hossu wrote:
> Fix out-of-bounds memory accesses in several IE and attribute parsing
> paths of the rtl8723bs driver.  All affected functions iterate over
> attacker-controlled IE data from over-the-air frames without validating
> header or payload bounds before dereferencing.
> 
> v6: add two patches addressing issues found during v5 review.
>     Patch 6 adds IE header bounds checks and payload length guards to
>     is_ap_in_tkip().  Patch 7 adds header and payload bounds checks to
>     rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr().
> 

You have to show all the version info for all versions :(
