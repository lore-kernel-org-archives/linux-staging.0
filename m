Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A3172
	for <linux-staging@lists.linux.dev>; Tue,  7 Sep 2021 22:10:06 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so31154wmh.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Sep 2021 15:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jvwyaUQt5n0mIy7xaampJ1fxHnCzRU2G9ORyorTcaFg=;
        b=Z4rmr9kIvWxpCZB7IlbES4y5ojyL37h9G+fB4bQ6OtiadOHiY5YXZ4Ogh2qASFEQtr
         EGuKvVEt6NBZH8MSZqGGhf41wkdqlwIzt82Bv7oLn09LFnE26opQDzF/NkDVpTF2JOiA
         0KnC38oF2p+v3u7AtMuhD70OcSxmD0xcKy5UqM6DcBU50A6A8pjO8i2Mu58lrWfJQSUm
         AJL/DOVUkuq2zzUNhXAAovXCNleAuEm9fIShv6/RRQUFNHmWaHCGDlqoMzvsych/UksC
         rKAuUjrHwevf/uiPUf1BE18PSrJlTiagDegF+45oe9/aT1/HRpDyLQfWyXGQ6wmuewmI
         Scnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jvwyaUQt5n0mIy7xaampJ1fxHnCzRU2G9ORyorTcaFg=;
        b=EWtK9jWWjDuAtFd3Pm4PuC6pU4G/kR/C3sTrRN4Mg9dPRIPET3diefFdTpc4pk34Ai
         Nw79RlFuEXtV8gqeffhN2IZn1IbTXR4l5yS+0bRBC0Y/Uh6Z4ZI7LvQs8N9kO30SZwhw
         FBM6A1/4CiHh5eOCqjJns8MzV9y8SoPv6sHFwMKAux88U0K+dW/YWqoORxx07pIbzCoM
         1u1UuYSOSDusM/5QNI9FatQ5rL2Kysw31WB0+3OjKBhMMDvun7xhzozKMkjsMWCcqtKl
         wdnT1qN29ekVwNfhhP5Z2PC+NQGiEaIyaKur4fBSzpZehVofbhHN4qtBAQPPGphQ2Dlo
         wneQ==
X-Gm-Message-State: AOAM531DnlL+RE4u2+4kO7omZ100epyTr7Z2hU2Og626kUZfeKYkeurS
	BxlHbOUZAvEZtwt9se1q/ExGdw==
X-Google-Smtp-Source: ABdhPJxP+dFd1KsQhgXsGzKnROx0wlUsDamiYbTKMztXUuGDFqaZrpO3mEzk7mcnUsvSILyh1AsIcg==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr408853wmb.5.1631052605160;
        Tue, 07 Sep 2021 15:10:05 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id h8sm265028wmb.35.2021.09.07.15.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 15:10:04 -0700 (PDT)
Date: Tue, 7 Sep 2021 23:10:02 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Colin King <colin.king@canonical.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: remove redundant variable hoffset
Message-ID: <YTfjOtrlaZscXVTm@equinox>
References: <20210907085302.10672-1-colin.king@canonical.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907085302.10672-1-colin.king@canonical.com>

On Tue, Sep 07, 2021 at 09:53:02AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable hoffset is being assigned values but it is never being
> used. The variable is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index 14758361960c..7c12ca548c47 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -1143,7 +1143,7 @@ static u16 hal_EfuseGetCurrentSize_8188e(struct adapter *pAdapter, bool bPseudoT
>  {
>  	int	bContinual = true;
>  	u16	efuse_addr = 0;
> -	u8 hoffset = 0, hworden = 0;
> +	u8 hworden = 0;
>  	u8 efuse_data, word_cnts = 0;
>  
>  	if (bPseudoTest)
> @@ -1156,18 +1156,15 @@ static u16 hal_EfuseGetCurrentSize_8188e(struct adapter *pAdapter, bool bPseudoT
>  	       AVAILABLE_EFUSE_ADDR(efuse_addr)) {
>  		if (efuse_data != 0xFF) {
>  			if ((efuse_data & 0x1F) == 0x0F) {		/* extended header */
> -				hoffset = efuse_data;
>  				efuse_addr++;
>  				efuse_OneByteRead(pAdapter, efuse_addr, &efuse_data, bPseudoTest);
>  				if ((efuse_data & 0x0F) == 0x0F) {
>  					efuse_addr++;
>  					continue;
>  				} else {
> -					hoffset = ((hoffset & 0xE0) >> 5) | ((efuse_data & 0xF0) >> 1);
>  					hworden = efuse_data & 0x0F;
>  				}
>  			} else {
> -				hoffset = (efuse_data >> 4) & 0x0F;
>  				hworden =  efuse_data & 0x0F;
>  			}
>  			word_cnts = Efuse_CalculateWordCnts(hworden);
> -- 
> 2.32.0
> 

Many thanks Colin, looks good to me.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
