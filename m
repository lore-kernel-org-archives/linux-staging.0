Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A481632E7;
	Sun, 11 Jan 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768136132; cv=none; b=ksPyMzFEdcmTZ0b4vLYTxAYNaPqB9EJ1fhygJDFXEZg0xiJmGsdIiHZtQjLxXL9TVDag8fFZdxUL5PxTlMPZQqzO93y4UMCho6TM3tf5TxHDzEFKcJLe86FgqZRMP6wOdclPaspLSQ/VJ2ZbLw7EEOdMYXfya6OCdtCXjeVYZJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768136132; c=relaxed/simple;
	bh=NVtI9XC3IqfjHNnGjw4d1cSW0x2zSEeKWGzbrrWWFZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJdwpNIzGr1RBhMxYR1R7YHYmbt03EBEt9RxPSci1UiTMFa9j5or4UsrkHLP4yI8AHwFvSiggD5G1jjWYUdLrrvXefLqdwkyLfIF02Uc7/+qKCqepo30HTZI3/q3fILXjgmFQSaRnA+r12zQE0NNTgW+tbT7J+geH2qgBymWQ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mz8EIdbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mz8EIdbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B432C4CEF7;
	Sun, 11 Jan 2026 12:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768136131;
	bh=NVtI9XC3IqfjHNnGjw4d1cSW0x2zSEeKWGzbrrWWFZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mz8EIdbZn2eMuMN5p5cPHyxViK9EI9k+tDsyzaWu8lPEapc+k53jW6OvM+FBGH1Lx
	 7oXHWuU6lpniJYSe+3tB2gXI5lp/kS3eclZrzHeJxMISiL8tkjC0KRAKFev7fYi+t+
	 DGrVaLI8/6sbyG9syK7VxniIrUefxf0jhpBPkZok=
Date: Sun, 11 Jan 2026 13:55:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daisuke Iwasa <iwadjp@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove trailing whitespace in
 rtw_mlme.c
Message-ID: <2026011120-appraisal-coziness-23e2@gregkh>
References: <20260108002629.25984-1-iwadjp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108002629.25984-1-iwadjp@gmail.com>

On Thu, Jan 08, 2026 at 09:26:28AM +0900, Daisuke Iwasa wrote:
> Fix checkpatch error: TRAILING_WHITESPACE.
> 
> Signed-off-by: Daisuke Iwasa <iwadjp@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 98704179ad35..ff4e668f199c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
>  	return ielength;
>  }
>  
> -/* Ported from 8185: IsInPreAuthKeyList(). 
> +/* Ported from 8185: IsInPreAuthKeyList().
>   * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
>   * Added by Annie, 2006-05-07.
>   *
> -- 
> 2.34.1
> 
> 

Someone already sent this change before you did, sorry.

greg k-h
