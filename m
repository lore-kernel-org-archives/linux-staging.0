Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997BA35676F;
	Tue, 12 May 2026 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588203; cv=none; b=gWY/r2bi46ExLJIlzgGnzsl7JcYJ5gdS7T2kDLpCqZR6Gcmo+mGFwQ9R7XaV91Dns6Nak5etApwRdmMiR2gGq4JaceWfhocJEOHkVdS0tIulaBVYlOpx++7Ww6DxIsatZbiGK2QCorEjt/pOOmDUWHy7PulxpO2Lqc+I8WqG02M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588203; c=relaxed/simple;
	bh=0numcpIoa6bc9N1eEvKLvcplMFQSTxTfQhcHtyzNCH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iF5mTKJAgBhfHoI16Ygh1vG8nLYrOhe3FQKjUjrpIqMhRgACoh/HhqBGWuj3dZk3iBuob/+EXdBmw3YuF1MIi4VsgTaqckxAvhXb459v7QZNWewLQ6S193ZiXFVdRFD4a709d3l7+4b8wMaBgQP0C1nC8ALhMcRncwhksmZ06iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EAROBGwy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EAROBGwy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1D5C2BCB0;
	Tue, 12 May 2026 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778588203;
	bh=0numcpIoa6bc9N1eEvKLvcplMFQSTxTfQhcHtyzNCH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAROBGwyX2eriWR5WX2VS1i7zTySL8iioAdN4uUfbbvt33qFVlI5RYOIsp3QkBVpX
	 dqMLosAtYF1pSn3cqR0fZs2xmtBR792qcx153kWENA+mU0XuOjwIzPiZnhajHs/nqR
	 vsGgZzNVP5i4iHgf7MMNqGdEZ7uJmdE7/SEz+yJc=
Date: Tue, 12 May 2026 14:16:45 +0200
From: gregkh <gregkh@linuxfoundation.org>
To: Ashwin Gundarapu <linuxuser509@zohomail.in>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	linux-staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v8] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
Message-ID: <2026051205-shale-tactile-b85e@gregkh>
References: <19e1c19a323.2dbc56d746976.8507108782933043169@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e1c19a323.2dbc56d746976.8507108782933043169@zohomail.in>

On Tue, May 12, 2026 at 05:41:42PM +0530, Ashwin Gundarapu wrote:
> 
> >From c981cdc1149e5ae7e5163f80be1631fc11c4b14d Mon Sep 17 00:00:00 2001
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Tue, 12 May 2026 17:38:31 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c

Why is this in the body?

> 
> Remove braces around single statement blocks.
> 
> Found by checkpatch.pl --strict
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---
> v8: Fixed double blank lines. One blank line only between statements.
> v7: Added version changelog below the --- line as requested by Greg KH.
> ---

What about v1 - v6?

>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index c14b8dbd478b..3d88a3a185d5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -483,10 +483,10 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>  			break;
>  		}
>  
> +
>  		if (rtw_roam_flags(adapter))
>  			/* TODO: don't select network in the same ess as oldest if it's new enough*/
>  
> -

This is not what you describe above at all :(
