Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0517F4409
	for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 18:21:17 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id m15so17154998edb.13
        for <linux-staging@lists.linux.dev>; Sat, 22 Oct 2022 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g4dYS00nmatIUppAOJMsP1CIwXCPkE0shI+FzsyxnF4=;
        b=LmsTgBInlO6kroK4y9Vmss5gmswOC1txnttsCS3kuthbS4jYNShmFMorKezy+HwLp0
         ph+7SuEK1hjWE308mr8ICh9Hiiy4Mrwc3sAyDlLgLiPkeDIsskXq5FhzQgpMmgJnc/Oq
         JhjimpnmcEC8TTuj9Z4+4NZ1jgaFQSLwbC3mrR4O6NiNW89laVMceb1jObc0nYBxE26S
         8UiYMpHTun2oIT4G6X0KPyyo31oxluZmqmyy9chTD900m2vcMTiE4mVIfbe5HrnBQPOT
         IfjdkYol9PXEglTBCDofdye9o3N5KFCNw/Jf8xagYHfGpBBy6aE2iFpDt7vT1Rc55zKn
         hLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4dYS00nmatIUppAOJMsP1CIwXCPkE0shI+FzsyxnF4=;
        b=JiLZ9tg4okNEzGXYwYGXs6pZdvdHi0TDRtW6CisNOZCxplp5D9c0K6ViNF2IPbaj4K
         +tnp4wMI804uagtV6rvIo1Cn2tx98cEkweNq5Q+3kfjOnf2rMhv2+s2xmzkav8UzqxCq
         cH8T9P5hqUAxRCszEuMc8CFTmi5zfEB1+nQnIe/slVls+CZV4c00Fl5buR/iv8UZCb+q
         +zbT791E98GjqMXX78PRbpY1nfOLYkR5AOw7nSg+IxRdv+9z0XeCqNmA6wHyAZ5Ma3Yi
         E8/01PWryFPZ6EyujRo/Cn+PKDS/UqOJjmiv1Rm0S7dP4bJKIAujvk/CrwXn2cc9cPRR
         CqQA==
X-Gm-Message-State: ACrzQf2eIIL5q4YLvlQPk0OHupWWCbQ1QTOvx96BhBoo2v5RKq5EHAly
	F9U2I7sES/yJXoBmlTuQWes=
X-Google-Smtp-Source: AMsMyM5AeL9qecsAzr2PPgmUzAbMNBCFuJt2dcdQq+5/re0WcpjAVUw3m8z+VJgMD04SUV9WD9d7sQ==
X-Received: by 2002:a17:906:cc0b:b0:78d:f3b9:ab15 with SMTP id ml11-20020a170906cc0b00b0078df3b9ab15mr20534634ejb.367.1666462876256;
        Sat, 22 Oct 2022 11:21:16 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id k15-20020a17090632cf00b0078d38cda2b1sm13060242ejk.202.2022.10.22.11.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 11:21:15 -0700 (PDT)
Date: Sat, 22 Oct 2022 20:21:00 +0200
From: Nam Cao <namcaov@gmail.com>
To: t4rmin@zohomail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Staging: rtl8192e: rtl819x_HTProc: fixed missing
 blank space
Message-ID: <20221022182100.GA16464@nam-dell>
References: <d4898956a848c85fc93c3f7d25cafbfc49a46e60.camel@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4898956a848c85fc93c3f7d25cafbfc49a46e60.camel@zohomail.com>

On Sat, Oct 22, 2022 at 10:48:08PM +0700, Aaron Lawrence wrote:
> >From e6635103e3cf2426220767955b99d2e2b62a7329 Mon Sep 17 00:00:00 2001
> Message-Id: <e6635103e3cf2426220767955b99d2e2b62a7329.1666450553.git.t4rmin@zohomail.com>
> In-Reply-To: <cover.1666450553.git.t4rmin@zohomail.com>
> References: <cover.1666450553.git.t4rmin@zohomail.com>
> From: Aaron Lawrence <t4rmin@zohomail.com>
> Date: Sat, 22 Oct 2022 20:46:25 +0700

I think you messed up something here. These are not supposed to be in
the email description. All your patches are sent separatedly, instead of
being in the same thread.

I can recommend follow the instructions in this website:
https://kernelnewbies.org/FirstKernelPatch

> Subject: [PATCH 1/3] Staging: rtl8192e: rtl819x_HTProc: fixed missing blank
>  space
> 
> Added a missing blank space as per the Linux kernel coding-style
> regulations. The issue was flagged by the checkpatch script as a
> warning.
> 
> Signed-off-by: Aaron Lawrence <t4rmin@zohomail.com>
> ---
>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index ef3dca51cf99..b763cf0ba356 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -70,6 +70,7 @@ static u8 LINKSYS_MARVELL_4400N[3] = {0x00, 0x14, 0xa4};
>  void HTUpdateDefaultSetting(struct rtllib_device *ieee)
>  {
>  struct rt_hi_throughput *pHTInfo = ieee->pHTInfo;
> +
>  pHTInfo->bRegShortGI20MHz = 1;
>  pHTInfo->bRegShortGI40MHz = 1;
> -- 
> 2.38.1
> 
> 
