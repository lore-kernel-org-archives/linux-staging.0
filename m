Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A9F507;
	Sun, 23 Aug 2026 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787503898; cv=none; b=h0Q8xdmNqnV4lEP2LCsiD8Ci3+mXF0vHNKA54Ksh+iyRpURA37wWCzsHeGrJjQqq3jWS/BORSjw+aRHpTMzUvdyOKYTXcxU3/uNwVF62Z1DYpDrTI37IagIwN1InLiBK6789ejHsL3NYE+binLpDncWU8DnF+t3EmHPMfhwvLp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787503898; c=relaxed/simple;
	bh=N9PV3dA0Fl+tAnJr6nxhU+qlCq3W6LF1Xsq5GY+o7QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twfJluVpiUW1Gz93fqLbX18Sf3mGag8JtNyEeK6T69okkb2GyVTsrpb9QPNpvsyXNt7GBnMemM28MADNsHdxh+QKHZMXD9UmYRRJvV71gOn2Md1qPfaKuy/yXcnagBsX3vfXTCyG03uVmHKEnHs2Gv7MGiasUpZXDkAfxxXlr38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kja8rGU4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kja8rGU4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0351F00A3A;
	Sun, 23 Aug 2026 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787503896;
	bh=IGfEifdUdf0m2zFYPB55H/vVJoporuWbvjFf0iHN7tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kja8rGU4tQrYf/eii30y0z4PfuwBvK2VpuFFF6k7vX5JB+y2WkvaSO+JoFT36hwjU
	 zvkS919NEmfv19qJMI6B8PD7gYjShZolBJgRk9DXTsc3BWMz18Rc41q6ukvH+m/cb4
	 XIPmtrqiodlC/LplwBSVyPRXSIG8CaiGvs8LCPeA=
Date: Sun, 23 Aug 2026 18:49:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix space before tab in
 rtl8723b_cmd.c comment
Message-ID: <2026082321-supper-gravy-5366@gregkh>
References: <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c.ref@yahoo.pl>
 <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823-rtl8723b-cmd-space-before-tab-fix-v1-1-452d83d8718c@yahoo.pl>

On Sun, Aug 23, 2026 at 06:01:43PM +0200, Tomasz Unger wrote:
> Remove stray spaces and tabs before a commented-out line.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified with checkpatch.pl - no new warnings introduced by this change.
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index d2b44ad60a4c..d39ddf396f64 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -895,7 +895,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
>  		DLBcnCount++;
>  		do {
>  			yield();
> -/* 			mdelay(10); */
> +/* mdelay(10); */

Does that look correct?

Also, you have sent a bunch of patches, they should be a patch series,
otherwise how do we know what order they should be applied in?

thanks,

greg k-h
