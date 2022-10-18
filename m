Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15977F
	for <linux-staging@lists.linux.dev>; Tue, 18 Oct 2022 05:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1A2C433C1;
	Tue, 18 Oct 2022 05:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666070864;
	bh=mD9Bnrr+Blr43HX7VzogX53dclSTqEzRKcE28LHW00o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VvYgZ9mvsXBZ/6Zl1fSK17Y5KhA97Wt54ZSd6/+mJomPBs2kHKdsnvkaWU5PplPqz
	 4ZnNdzpSzF+REf9g17yl+MOXy8G6wm7WSCzPGVFnfVeu/HKArQbPl7wm9FrC7KCfBq
	 hRTaZKhv4O0IzDDVYCNZDBNEjuP4eUwudvO4jN7w=
Date: Tue, 18 Oct 2022 07:28:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Brent Pappas <pappasbrent@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: core: Replace macros RotR1 through
 Mk16 with static inline functions
Message-ID: <Y045f/UzV8Dx5tpp@kroah.com>
References: <20221017171653.12578-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017171653.12578-1-bpappas@pappasbrent.com>

On Mon, Oct 17, 2022 at 01:16:54PM -0400, Brent Pappas wrote:
> From: Brent Pappas <pappasbrent@gmail.com>
> 
> Replace macros "RotR1", "Lo8", "Hi8", "Lo16", "Hi16", and "Mk16" with
> static inline functions to comply with Linux coding style standards.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_security.c | 35 +++++++++++++++----
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
> index ac731415f733..519e141fb82c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -253,12 +253,35 @@ void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_cod
>  }
>  
>  /* macros for extraction/creation of unsigned char/unsigned short values  */
> -#define RotR1(v16)   ((((v16) >> 1) & 0x7FFF) ^ (((v16) & 1) << 15))
> -#define   Lo8(v16)   ((u8)((v16)       & 0x00FF))
> -#define   Hi8(v16)   ((u8)(((v16) >> 8) & 0x00FF))
> -#define  Lo16(v32)   ((u16)((v32)       & 0xFFFF))
> -#define  Hi16(v32)   ((u16)(((v32) >> 16) & 0xFFFF))
> -#define  Mk16(hi, lo) ((lo) ^ (((u16)(hi)) << 8))
> +static inline u16 RotR1(u16 v16)
> +{
> +	return ((((v16) >> 1) & 0x7FFF) ^ (((v16) & 1) << 15));
> +}
> +
> +static inline u8 Lo8(u16 v16)
> +{
> +	return ((u8)((v16)       & 0x00FF));

Odd use of spaces, doesn't checkpatch complain about this?

But the larger question is, don't we already have functions for this in
the core kernel?  Why not just use them instead of hand-rolling custom
functions instead?

thanks,

greg k-h
