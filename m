Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F084377543
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 06:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778825188; cv=none; b=s35WQrk1O7bn+7irESi3xXBFTwv3ZTuc0S/n2KSbgNhQLsYA3HsdzSAl04VfdA3953dHP25OKgZNXxN1kKqz3AT+Vx/lzFKYM9yXu971jOMhRnxdMOmLlNbm6O/ljbtJF/FcxmwUI8L7y8ObyEkRyw6Lmu24lOQIgKlT59LO9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778825188; c=relaxed/simple;
	bh=1TVzW2G697OzGVrTzaSxUYaKEHgZluPIKNFzut/yxbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBZKDXg/Mhi2gojS1XKISSDUtGJHnbW/cNYzZZs3hPqtR7AX1N52WAflq6UKZ79qQvaxHbtoluoaylPfqusR6EVzYXfgqIoJMtAsmPmQtDI5Tme6KhEu/KhOKwqVxlgPuMfp32HIN2hgFAcAUTbCAXpibs+aubmnfFYBkW89uAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qRppjA1G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qRppjA1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F0AC2BCB0;
	Fri, 15 May 2026 06:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778825188;
	bh=1TVzW2G697OzGVrTzaSxUYaKEHgZluPIKNFzut/yxbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRppjA1GRqbs+Mn9N4DcMp9N7Rq1ygS7F3TYvr2q758C/XeTHiKdHqgQrcpmcztjr
	 s4g7DdLmDAeu8gDGYScdcwN3qKlRtks72TgkuP5LzpfZ5hJo39cy0uCHVtUswu+3Ib
	 tLGvIVXIB0HZAPCCfDtZT0xMirns2y3L0QJIfPRg=
Date: Fri, 15 May 2026 08:06:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: rtl8723bs: reformat rtw_efuse_read_1_byte()
 signature
Message-ID: <2026051520-unbaked-perjurer-bfd4@gregkh>
References: <20260515013353.61614-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515013353.61614-1-mokshpanicker.7@gmail.com>

On Fri, May 15, 2026 at 01:33:51AM +0000, Moksh Panicker wrote:
> Reformat multi-line function signature to a single line to fix
> line length and coding style warnings from checkpatch.pl.
> 
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 803a608b74fa..987d05816c5c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
>   * 09/23/2008	MHC		Copy from WMAC.
>   *
>   */
> -u8
> -rtw_efuse_read_1_byte(
> -struct adapter *Adapter,
> -u16		Address)
> +u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
>  {
>  	u8 Bytetemp = {0x00};
>  	u8 temp = {0x00};
> -- 
> 2.34.1
> 
> 

I only see 3 patches in this series, and it was sent twice?

confused,

greg k-h
