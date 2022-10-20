Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B3B7E
	for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 20:16:00 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id h12so505348pjk.0
        for <linux-staging@lists.linux.dev>; Thu, 20 Oct 2022 13:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wikui5zgMClbBeCdN445jqfppxsvsQZJYe9z/nf05m0=;
        b=ASoOmFYLo5BTraLYzv/b7dLlDyzP0vgBCEknTYECrAhZkt+PpKZ1PTM75k0/hhInvx
         1Ysx98awdp1c/ubfYxfmV8fc1f26ao0wGB1psiiU1Avz6SZif3CxTM670a1fC1CC/zgH
         tgiiWPhk7gQ2OXf+ASObEMmn+Z51DONYr+9RYGVr/JDM1iboSxcXoxY+5GYGTGRNa7pd
         MiZeqA90vWubpr4ZlT+f0MK/SwtiHrI0Kv5dl5f2UaS/+fjS/Ie7nzfVNIWukOsxnfpQ
         UVSzZAxE+Yc4vxEz0DKdSvG/oCKe5wTtFZQy0+DWA9B+Rbmtv7xZpIJjzPevAfGROyM5
         Fxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wikui5zgMClbBeCdN445jqfppxsvsQZJYe9z/nf05m0=;
        b=i3S+a6N9ssY7IKdIWP9TlrfbpPWEVUSwtOTdlGCfqMMvtBUrfSHqAbYuREP4h755Xv
         OAYOVQIBS39DS1vnF8Qf8jOXD3bJ0M2tYEZ3ohwJDVT6HhOEkb9OwreJMlir8PsfFhj7
         KRDQq9Ltcsr6OQL6ZFLt6sPkPN9UMEbu45jFMSYZH7sxAUD84e9lUWO0R5D4vVQ8aN0b
         cn5LEqM33YQjYGb+BnoiJcWQ6+EfzlDn4GTuC+vxAili+fow1Vc4cJbKz/dbWL+WO7fj
         r/xe2VkICGbadkonzPb08hEUN/o53fgKwqJ/sAokfPUto3Q0ITTliTSZiQ+rciQzLkZH
         xB5Q==
X-Gm-Message-State: ACrzQf3y0x2uSnXitBl0BFuOjPw3+IDO7DKBhbcVHsUCoxIrEmY6bwN0
	DMvxSqFS99R82h+RLCbIEa4=
X-Google-Smtp-Source: AMsMyM4/3D1Pz5sNpGtnA0LdFxLhp4bIZISRVx0CyF1f15UBM6lrxC5MlxiDLjFeba2y6inz18ilqw==
X-Received: by 2002:a17:90a:e393:b0:20a:eded:cbae with SMTP id b19-20020a17090ae39300b0020aededcbaemr54542555pjz.168.1666296960090;
        Thu, 20 Oct 2022 13:16:00 -0700 (PDT)
Received: from mail.google.com ([202.36.29.252])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b00176ba091cd3sm13538528plh.196.2022.10.20.13.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 13:15:59 -0700 (PDT)
Date: Fri, 21 Oct 2022 09:15:53 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Gautam Menghani <gautammenghani201@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/pi433: Change data type of bit_rate to
 be u32
Message-ID: <Y1GseU1Z+CCHJs9I@mail.google.com>
References: <20221020181815.31245-1-gautammenghani201@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020181815.31245-1-gautammenghani201@gmail.com>

On Thu, Oct 20, 2022 at 11:48:15PM +0530, Gautam Menghani wrote:
> A TODO asks to convert the bit_rate variable to be a u32 so that bit 
> rates up to 300kbps can be supported as per the spec.
> 
Thanks for sending this patch. Comments added in-line.

> diff --git a/drivers/staging/pi433/pi433_if.h b/drivers/staging/pi433/pi433_if.h
> index 25ee0b77a32c..c958dcfa9f96 100644
> --- a/drivers/staging/pi433/pi433_if.h
> +++ b/drivers/staging/pi433/pi433_if.h
> @@ -51,7 +51,7 @@ enum option_on_off {
>  #define PI433_TX_CFG_IOCTL_NR	0
>  struct pi433_tx_cfg {
>  	__u32			frequency;
> -	__u16			bit_rate;
> +	__u32			bit_rate;
>  	__u32			dev_frequency;
>  	enum modulation		modulation;
>  	enum mod_shaping	mod_shaping;
> @@ -99,7 +99,7 @@ struct pi433_tx_cfg {
>  #define PI433_RX_CFG_IOCTL_NR	1
>  struct pi433_rx_cfg {
>  	__u32			frequency;
> -	__u16			bit_rate;
> +	__u32			bit_rate;
>  	__u32			dev_frequency;
>  
>  	enum modulation		modulation;

Cutting a long story short, you won't be able to change bit_rate's type before 
addressing the fact that both pi433_tx_cfg ans pi433_rx_cfg are part of the UAPI.

Usually there are 2 approaches that most people go for when talking about
changes in drivers:

1) Add changes in a backwards compatible way, so whether users are using the
        bitrate member as u32 or u64, it would simply work. But that leads to
        sometimes hard-to-read code.... but this is still a card up your sleeve.

        One suggestion given by Dan Carpenter was to leave the IOCTL impl alone
        and start a sysfs implementation. That way you could have a u64 bit_rate
        synthetic file.

        https://lore.kernel.org/all/20220119053410.GW1978@kadam/

2) Change the tools that make use of this driver at the same time as you change
        the UAPI. This can be tricky. There is a thread I started in the
        kernelnewbies mailing list on the subject which I think might be relevant
        for you to read.

        https://lore.kernel.org/all/YjHvLFSV06w%2FORgV@kroah.com/

Happy coding :-)

Paulo A.

