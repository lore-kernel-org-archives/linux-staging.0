Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27057B;
	Sat, 11 Mar 2023 14:09:52 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p16so5160892wmq.5;
        Sat, 11 Mar 2023 06:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678543791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCBO1BOGc+gpZPFsXFe7s7eySat3RMIoHMBOKQxhii8=;
        b=Lmi5jlO/TN7FhmYnwjoz/ZHpojzzKxOHrgJnr1cAbEGOKGBuXro0tUNdmMD1EX3XPa
         4ZV4Ij6UNKvrmiCHza97eWmex9L5el0z2OXzO0/UUsdtX7MCU87Qd+Q1dNS0MsvpnTAR
         cstcY1aCKj7chxXZoZZI8/AIPIGq3k/CB4R1CMUMHc3WVRiLv5Qu/2UC6QWeAMyvSFJ9
         Z0iDXjbH7SMo95LK8jSu0E2PjkbFfCbNG6R6RvP2/eZd813HzzT3rNtYasKwhN7cP/kC
         VbWhxvNXZLr9U3/esnBfAe7CtH1Q4XXTcWQHB8nKJuuD9Huag7Ab61eWfv3u6CNxUnqx
         M8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCBO1BOGc+gpZPFsXFe7s7eySat3RMIoHMBOKQxhii8=;
        b=tWljxNDKjAdzUqzAR+/bh2SGuPxvmMN7c1dGmc6mhkXBbNvRhnlnrTUdfv5U3oj6cM
         eMH9Gn4LeP4NbVxe5/fzAo9SPZmlXG/8jKEkUnTtbEsboXxX2jfPs7V8ZMOLiXAk6bj3
         2gKo1tHkt7cN54o42VX+y/KJT+jbUAlIHzBcYB+9Tk56UmHNULK6KnC8xMNVEeGON06W
         R6mPfwNkZUk5kpvl8xi4xikFT85iPzgf99rzvhQBhVp942zrceWVRYeDfO0gVaefRYyg
         EuacafO97TgkV+hMzsYbkiytfjJ2T083Fvz+4nWlpypiTpYTwwarK/QV9/sklrZ4oQM7
         oWzg==
X-Gm-Message-State: AO0yUKW7rbEfnDNc0LcgY9PYVIjOSXbnkgNde7rIMMnsPwv8Oz/LYEqe
	kc5U1TzxdOnp/SO9G4ZCn0S/tDmMd1ezgjVI
X-Google-Smtp-Source: AK7set+TEixJO4w7KLuOsc6WmFAXS+b/OLRARH6dptmq1uxzMLeA0gLMuagwnrZbIZVSla3HzzIqYQ==
X-Received: by 2002:a05:600c:4751:b0:3ea:f0d6:5d36 with SMTP id w17-20020a05600c475100b003eaf0d65d36mr6153712wmo.29.1678543790898;
        Sat, 11 Mar 2023 06:09:50 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d12-20020a05600c3acc00b003e2052bad94sm2906135wms.33.2023.03.11.06.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:09:50 -0800 (PST)
Date: Sat, 11 Mar 2023 17:09:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sumitra Sharma <sumitraartsy@gmail.com>
Cc: outreachy@lists.linux.dev, manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: qlge: Remove parenthesis around single condition
Message-ID: <e4caf380-bac5-4df3-bb98-529f5703a410@kili.mountain>
References: <20230311140409.GA22831@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311140409.GA22831@ubuntu>

On Sat, Mar 11, 2023 at 06:04:09AM -0800, Sumitra Sharma wrote:
> At line #354 checkpatch.pl:
> CHECK: Unnecessary parentheses around 'i == 0x00000114'
> CHECK: Unnecessary parentheses around 'i == 0x00000118'
> CHECK: Unnecessary parenthesis around 'i == 0x00000140'
> CHECK: Unnecessary parentheses around 'i == 0x0000013c'
> 

Greg likes the extra parentheses so don't bother sending these sorts of
patches to staging.

> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>  drivers/staging/qlge/qlge_dbg.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
> index 66d28358342f..b190a2993033 100644
> --- a/drivers/staging/qlge/qlge_dbg.c
> +++ b/drivers/staging/qlge/qlge_dbg.c
> @@ -351,10 +351,10 @@ static int qlge_get_xgmac_regs(struct qlge_adapter *qdev, u32 *buf,
>  		/* We're reading 400 xgmac registers, but we filter out
>  		 * several locations that are non-responsive to reads.
>  		 */
> -		if ((i == 0x00000114) ||
> -		    (i == 0x00000118) ||
> -			(i == 0x0000013c) ||
> -			(i == 0x00000140) ||
> +		if (i == 0x00000114 ||
> +		    i == 0x00000118 ||
> +			i == 0x0000013c ||
> +			i == 0x00000140 ||

The weirder thing about this code is the indenting.  It should be:
[tab][tab][space][space][space][space](i ==.

regards,
dan carpenter

