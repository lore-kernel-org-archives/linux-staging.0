Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C8F4D8CE;
	Tue,  7 Jul 2026 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419730; cv=none; b=aZW+reEQ0xFxwhLxOXkaa3bNCIlzowJooGA9UkZfOyPHqhz0qcFeUAiq80+iPcDeGoiwkuVKF4P+2CmS6Tmf+7DM5nAeFDEOz2GINDr2ogWvZRTsyJzWDGbmYyD9uJSNmNF122n3DbVYAIivn7f4q+bpOJcUvsgb6AJS0Fs26g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419730; c=relaxed/simple;
	bh=mZRE6QTMdRZa+NIKepIIeBkFxbHXKdo3EBNpTUHZNzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2B1ywi3DZZZqFhadgbgyoqwa9TD6hkEiGh75CIwKepYkgkPu4wpi65aKnDYB5MeiQceTHfn0d/uIKMC/+1PzsyB7tfHrOsqqDqYDeUKaVYNASctBDYGve7Q5Hdlfjqmawoj+wbHoWEaiXfrQpor2nlKwj1I0Hz2HhPHJoQvfSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yNHIrzyL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yNHIrzyL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EBC1F000E9;
	Tue,  7 Jul 2026 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783419729;
	bh=4La2nDQmGo7c9lAvmsQwHf+tGKDFGVP/uyo3qEsm4/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yNHIrzyLR/gq8+XAAcySI+bpqXXKFJVXNntg2veIwxuDY8yIU5I4rFja8yPGnqHbK
	 A/FPc7vtKkbUJmr57XZpSNy02sPZr6pAFYD3yN+IDt9j0dXsnN0BPap57SuFBhQlgx
	 QEHbtMECO57bMrcXo8Y1woWfM6cpzpDkLcUw+DYo=
Date: Tue, 7 Jul 2026 12:22:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8723bs: fix coding style for
 PowerIndexOffset initialization
Message-ID: <2026070759-rippling-feast-457c@gregkh>
References: <ahPw0yB7Ax3lfhKu@stanley.mountain>
 <20260525121004.4989-1-igorpetindev@gmail.com>
 <20260525121004.4989-2-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525121004.4989-2-igorpetindev@gmail.com>

On Mon, May 25, 2026 at 03:10:03PM +0300, Igor Putko wrote:
> Remove unnecessary braces around the single statement 'for' loop and
> fix indentation in ODM_TXPowerTrackingCallback_ThermalMeter to follow
> the Linux kernel coding style.
> 
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/HalPhyRf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
> index f67b8d70b..3d45e5e44 100644
> --- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
> +++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
> @@ -230,8 +230,8 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
>  		/* else if (pDM_Odm->RFCalibrateInfo.CCK_index < 0) */
>  			/* pDM_Odm->RFCalibrateInfo.CCK_index = 0; */
>  	} else {
> -			for (p = RF_PATH_A; p < c.RfPathCount; p++)
> -				pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
> +		for (p = RF_PATH_A; p < c.RfPathCount; p++)
> +			pDM_Odm->RFCalibrateInfo.PowerIndexOffset[p] = 0;
>  	}
>  
>  	if (
> -- 
> 2.34.1
> 
> 

No braces were removed.
