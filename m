Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD42B1FFC59
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778947367; cv=none; b=Drhj4MlDO0wYXboPaQOVR6jOIF5WwnUoNSPayKiOonpmBlMs3tF1soDCmOaIHBDy5JxXzxjQ9dxH4ZXPjK11rs2xT5St0o/2sIzBo0YQVsCJnBe/0CLT1qc6ujHvvd8p/LXLJ0N4XS3ZD8KVZX5nqezho0XVjo0YWSqygw8v0I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778947367; c=relaxed/simple;
	bh=3vx9l85O3N1uuLbAvpzPK/yM7E2cvWYOeJpAt4LXbpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LopQ/IN0GsFdMKpDEanYY27csenBRnlLvud9J3GpWTi8cOaRn/cyXvpscMa6ChifkNzDmzw/LeQ7etfSoF3XLXl8gFwy03vLZvQitaeekrg3zkD8nGo6ZPm454MG+sUQwEd8VEbVNhlJ9r/atUP1Tg1c8eDjlUSOW8EtwwS1kK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PhN2XHRh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PhN2XHRh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3C6C19425;
	Sat, 16 May 2026 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778947367;
	bh=3vx9l85O3N1uuLbAvpzPK/yM7E2cvWYOeJpAt4LXbpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PhN2XHRhr48f1NLigurqsPB7va9081TC128zwArneP/sYg35/iwONDdQkcYTC5YBt
	 q744fZ+xOS8u1KkjsIYfayXD2MKL8lLRZ0XIJavakNrd+i5s73tCm/Eb1h3lUqcCZ/
	 iK8oKEeTFtmOnzFwujHMBk1pnOwK24nr2oivKYWo=
Date: Sat, 16 May 2026 18:02:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/4] staging: rtl8723bs: fix missing brace in
 rtw_efuse_read_1_byte
Message-ID: <2026051608-snowcap-shield-56f3@gregkh>
References: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
 <20260516155025.230865-5-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516155025.230865-5-mokshpanicker.7@gmail.com>

On Sat, May 16, 2026 at 03:50:25PM +0000, Moksh Panicker wrote:
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index ef0cec40d388..a9bbfe2d6fb2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -75,8 +75,8 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
>  		return rtw_read8(Adapter, EFUSE_CTRL);
>  	} else {
>  		return 0xFF;
> -
> -} /* rtw_efuse_read_1_byte */
> +	}
> +}/* rtw_efuse_read_1_byte */
>  
>  /*  11/16/2008 MH Read one byte from real Efuse. */
>  u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
> -- 
> 2.34.1
> 
> 

This really does not look correct at all...

Take some time, work on this again, and resend the series to yourself to
see what they look like and if they make any sense or not.

(hint, checkpatch should have complained about this one...)

thanks,

greg k-h
