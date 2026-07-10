Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1A33E1683;
	Fri, 10 Jul 2026 07:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669977; cv=none; b=XPkoXuYpsHZrkd9vtMJgCcu1DJ4x1W5DaW15d0zCQwDNAw0Tr0W93H+luznowPFF1HgSekr2XyE1jomAjnDicN3LuAvdvHy/xd0T0zFEdy47eLXihiJ7orEE82XN9F6xFkwDLnrm5ySkS3deE8SjDlbs+sVaD1TSgSg5CtjEfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669977; c=relaxed/simple;
	bh=Xl3MrcNL5OxYBbdkniVHAe4W+sTdVOCKfWcmH07o8KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0yaU+6ab2OQ185F4Oz6nuZKcb3IRK0SmJSXlTsi0fFUQj0yndPLtOdM+W3FJvoaNpsQxpYk3gNVWfFPxMC2md3FDfokWBzcr4gx1lLBHHvGtmHMl9qGP+VO5/n06tqD6LflvAj9UNsLazU7F4OWZHm5gT3lhyjQvrTaYBm2P64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KmVZa5S1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KmVZa5S1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919491F00A3F;
	Fri, 10 Jul 2026 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783669976;
	bh=VDxtZhYL25qUkgpPENR2tPTEKobnLnGwxtgnKpZC/eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KmVZa5S1WE0P/9PXf+ztAIchjDdc/lAAD6kwHmydjLBQJ42KQpPv1ydK0tuwl0wrg
	 oiR3JspfKVM/9Lg4r7JPbRMWxP2pdPuQzinzOD0TZT6J5b/xi/7JAut5X7zj9xhQrc
	 lSbh9tYRw8pt6e5BuiwpViSmpCUa80cmcJwFNsBU=
Date: Fri, 10 Jul 2026 09:52:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: fliegbert2@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/6] staging: rtl8723bs: Replace spaces for tab
Message-ID: <2026071027-wise-hamburger-1f62@gregkh>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260708121603.2393-1-fliegbert2@gmail.com>
 <20260708121603.2393-3-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708121603.2393-3-fliegbert2@gmail.com>

On Wed, Jul 08, 2026 at 12:15:59PM +0000, fliegbert2@gmail.com wrote:
> From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> 
> Resolving checkpatch warning by removing spaces and using tab instead.
> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/rtw_mlme.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
> index 180891e49971..b42fb1fc7658 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
> @@ -13,8 +13,8 @@
>  /* define   MAX_JOIN_TIMEOUT	2500 */
>  #define   MAX_JOIN_TIMEOUT	6500
>  
> -/* Commented by Albert 20101105 */
> -/* Increase the scanning timeout because of increasing the SURVEY_TO value. */
> +/*	Commented by Albert 20101105 */
> +/*	Increase the scanning timeout because of increasing the SURVEY_TO value. */

That's very odd, why is checkpatch complainig about this?  The original
is just fine, no tabs are needed here.

thanks,

greg k-h
