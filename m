Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA426D0D
	for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 17:38:57 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id o3so9481096wri.8
        for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zc5UZZSa3ySEXVarFqXVRJeSGls1BBSSN2jPWTbN13I=;
        b=SELjJCU4h+/WZ7uorJ6FiJQw00/Gn4ivVL05A8YIpfCs/+p0MiR4MhdDDQFsjzKGJw
         f2WrHtm02jmT3E/5BIgNwf/vUTsmrSmQfyJXhMvj/3iuDm+PseaFRbXpJlH0LD3nQL/9
         c8eeLK+43U4DGqxIKqE/J4R8SwP6zSZBLdXtp59GGmpXc2R/95MKHSLds8vZodZx1Hic
         4Z+pk2UBn29nxUjTuO76IJ7b38CqsKBig9GAuJFCzQiKTtjZ1Vk4vY4TGGoLFGT5MHaY
         oN32MRn0B2UAbBs/Afyp+HymBCLX4D0ecMJ1On+00OPJDrZjfyk7RYGu2mrD0kJ2qfwV
         Z0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zc5UZZSa3ySEXVarFqXVRJeSGls1BBSSN2jPWTbN13I=;
        b=H05SutKQrLqJvVENoIn/HSF8YfplSPNPteByiyo0PxrvDmhDwi1AEQkNtMFWXH6xDx
         evaYMFkAz2k+Jjm1FdASOvyhjFaD2V0lkROWQtH5HHB0Oadc+NAAj7WCYAsnegUrCwA8
         m/78HqZmWEcPZkAzzUd8FeRam+/7dmgwOp1loXkMsFhEFHBLwGG0rVCms+ZU6A4BQpae
         q1xOowYVpy/DLnPGENrO9BSj3CYnm6OYNWwAwtMC6G1C9LPkBg5pb5xUsyryCuUrcC8S
         /8mCvJ3g+8ckQNX/gXb/+3o20yXGye75T8rjvXhJOSl/35jNMG+//20l9Odyc6r+XV+K
         S0KQ==
X-Gm-Message-State: AOAM5338Vk34pv49l4mntaoSGAOQVz443s5oSqpX12vSqeGC+qigfUg2
	hkHwK0VZThgi87GtOc8uvjU/2g==
X-Google-Smtp-Source: ABdhPJy8Yurr0n1n8na2fQmGEgZjA/cbHa4Zd88YONWWQl7/0D6AamPpruinTzfk3sL7NoG9qJ7YyQ==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr10246432wrt.269.1623519536413;
        Sat, 12 Jun 2021 10:38:56 -0700 (PDT)
Received: from KernelVM (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id a12sm9152006wmj.36.2021.06.12.10.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 10:38:56 -0700 (PDT)
Date: Sat, 12 Jun 2021 18:38:54 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Martin Kaiser <martin@kaiser.cx>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	straube.linux@gmail.com, kaixuxia@tencent.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	liushixin2@huawei.com, unixbhaskar@gmail.com, gustavoars@kernel.org,
	bkkarthik@pesu.pes.edu
Subject: Re: [PATCH 0/6] staging: rtl8188eu: remove hal/odm_debug.h
Message-ID: <YMTxLsrbzr6iPYsx@KernelVM>
References: <20210611002504.166405-1-phil@philpotter.co.uk>
 <20210611091010.GE10983@kadam>
 <20210611153550.7p2deovau37rlpju@viti.kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611153550.7p2deovau37rlpju@viti.kaiser.cx>

On Fri, Jun 11, 2021 at 05:35:50PM +0200, Martin Kaiser wrote:
> Thus wrote Dan Carpenter (dan.carpenter@oracle.com):
> 
> > On Fri, Jun 11, 2021 at 01:24:58AM +0100, Phillip Potter wrote:
> > > This series removes hal/odm_debug.h, which contains various preprocessor
> > > definitions, as well as an unwieldy ODM_RT_TRACE macro which is not best
> > > practice. It also removes all uses of this macro, and the associated
> > > fields in struct odm_dm_struct which are only used by this macro.
> 
> > > This makes the code cleaner, thus moving it closer to getting out of
> > > staging.
> 
> > Looks good.
> 
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> same here: looks ok and doesn't break anything
> 
> Reviewed-by: Martin Kaiser <martin@kaiser.cx>
> Tested-by: Martin Kaiser <martin@kaiser.cx>
> 
> Best regards,
> 
>    Martin

Dear Martin,

Thank you for reviewing and testing.

Regards,
Phil
