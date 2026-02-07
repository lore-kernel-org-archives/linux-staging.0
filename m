Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9DB33E368
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770470303; cv=none; b=mni3jJUZTRp9VU11cSwD5Xo6lpAwLoUelFEeLvQwD5DzZUjBvBNE1q5pthS4cPFU0SvRRk0PNxSg323PFCOFEgTPBcDCDwkAEhRgInII4tzIY1lwaSaYl+U9OFpnqGKRL/XV9upI2Pc56l7uH78nMg7XGGVCPASbn7fhymDCTw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770470303; c=relaxed/simple;
	bh=9HBfrpJxxMhiWE1JMMqVoTtZmgAcoD03KrOlpU0XxkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggLxTJod1P601n1ocpQCt9KjoITIKFNjhGZxQyhlZbCAUnr+qoidsj1JI8XArCmUS1fpN8IdR6500h8YYRDHAYW17fwPNejS5aiOEvkM7sPFSONApxypqv3QjD7J5ndjhwV4jw+S1w9r/mCAPFde0t3E91oR3n34kxKU7XWvNH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Me6H5cfT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Me6H5cfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C966CC19424;
	Sat,  7 Feb 2026 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770470303;
	bh=9HBfrpJxxMhiWE1JMMqVoTtZmgAcoD03KrOlpU0XxkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Me6H5cfTBN7Bd1qT5/BgA3yjTb4zoMtfSwcmnrtrpe8lLgsKGNi1p27e2tIzABjtg
	 8TkLJ/B5hFE0vk0Cdo5a1zSrytqS6oiHIVl87kw4PPSzZCWUOT9XiZsf11R0Zn/0mK
	 90+vLwLcnnrSrOj9r8FVUDefwcv2O2fMs72mgcZ0=
Date: Sat, 7 Feb 2026 14:18:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?B?1i4gRWZlIEQu?= <skylinesytbe@gmail.com>
Cc: Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	=?iso-8859-1?B?1i4gRWZlIEQu?= <skyline@noreply.codeberg.org>,
	=?iso-8859-1?Q?=D6ner_Efe_Dasg=FCney?= <efedasguney@protonmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix whitespace issues in hal_com.c
Message-ID: <2026020741-barometer-implosion-338a@gregkh>
References: <20260202021845.265051-1-skyline@noreply.codeberg.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202021845.265051-1-skyline@noreply.codeberg.org>

On Mon, Feb 02, 2026 at 03:18:45AM +0100, Ö. Efe D. wrote:
> Remove spaces before tabs in comments to fix checkpatch warnings:
> "please, no space before tabs"
> 
> Signed-off-by: Öner Efe Dasgüney <efedasguney@protonmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 70b5b289f9cb..10c34228a595 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -362,8 +362,8 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
>  
>  	if (bWIFICfg) { /* WMM */
>  
> -		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
> -		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
> +		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
> +		/*	0,	1,	0,	1,	0,	0,	0,	0,	0	}; */
>  		/* 0:ep_0 num, 1:ep_1 num */
>  
>  		pdvobjpriv->Queue2Pipe[0] = pdvobjpriv->RtOutPipe[1];/* VO */
> @@ -379,8 +379,8 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
>  	} else { /* typical setting */
>  
>  
> -		/* BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
> -		/*   1,		1,	0,	0,	0,	0,	0,	0,		0	}; */
> +		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
> +		/*	1,	1,	0,	0,	0,	0,	0,	0,	0	}; */

As Dan said, this patch is correct in that it fixes the coding style
issue, but now the table looks just as bad as before.  How about fixing
this up properly so that it both looks correct, AND fixes the coding
style warning at the same time?

thanks,

greg k-h
