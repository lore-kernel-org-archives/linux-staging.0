Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DF638E8BE;
	Tue,  7 Jul 2026 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417955; cv=none; b=Nz256stu/Sz41lIZyqJRj4pJvloocGIzB7bPUtQeICFHLMZzMMsg3lYL4ed1WL5phOt4BrU0AlnqG7iA4s1uO0j1KZVBsugGmC5ghpBGDbj1LZCPA05eE0QkOqCyRnQuvY3Oi3p6s4CG1lG/jaGxndC48tZlt3z+Vcl1wCokad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417955; c=relaxed/simple;
	bh=KeUZ5XaSovh1WHwL7hnIQKVtVcyN0irhfCJ9Mw4wZ5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rb4nrY8u2e6l1SrRJFe6E1w00f7jNUrZJc8OLopQOts8X6MjI7eHN6UL0IrkAeqo3BCS8lnvAArzMFEvtFQ4QMYBgdZOKhAOmDiD7Dydus70K7U0tPb0JbQ07sTzpDbNoefdn4gx7YG7BfA6Y2rKTnnPJMPuk+zZU7oqQhywEUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1BeBugKT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1BeBugKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C48E1F000E9;
	Tue,  7 Jul 2026 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783417954;
	bh=+NVG6QAYWNHVBhtHGSkXBH5iaVfONPGH5BGyh4Ktkfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1BeBugKT1Tn2Y7CZcVlvbcpz2x50rhIWeWqx3oOH68BhSkgCvRGBKysir7v5jNgi4
	 RZZRXuY7sEq85FqpTkhk75bVpwsSj0ULTPeYuqOJn1RwePgU0qOMqhWA4unLZ8/s2x
	 yNVkDMGlXAWagpR0T/qEhOWoJlqWDLiM9DX/UZxU=
Date: Tue, 7 Jul 2026 11:52:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Diego Fernando Mancera =?iso-8859-1?Q?G=F3mez?= <diegomancera.dev@gmail.com>
Cc: linux-staging@lists.linux.dev, m.steinmoetzger@gmail.com,
	guojy.bj@gmail.com, straube.linux@gmail.com, error27@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: clean up if-else logic in
 odm_HWConfig.c
Message-ID: <2026070715-polyester-recycling-fb55@gregkh>
References: <20260522054624.190256-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522054624.190256-1-diegomancera.dev@gmail.com>

On Thu, May 21, 2026 at 11:46:24PM -0600, Diego Fernando Mancera Gómez wrote:
> Refactored redundant if-else blocks to a cleaner else-if structure in
> odm_HWConfig.c and fixed indentation to use tabs as required by the
> kernel coding style.
> 
> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
> ---
> v3: Restored accidentally removed comments and blank line.
> v2: Added commit body description and Signed-off-by tag.
> v1: Initial cleanup of if-else logic.
> 
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> index c88d669cb086..abf3d96746b9 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> @@ -227,19 +227,16 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
>  
>  		odm_parsing_cfo(dm_odm, pkt_info, phy_sta_rpt->path_cfotail);
>  	}
> -
>  	/*

Why did you delete this blank line?

thanks,

greg k-h
