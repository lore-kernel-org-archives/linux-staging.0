Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370170
	for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 07:58:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id n35-20020a05600c3ba3b02901cdecb6bda8so3428591wms.5
        for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+ffX+rO4NU79OrIv37Fic6T6B6n82nghu+Qcor+9aKQ=;
        b=khEMvz/xpNC7eciELINDeN7LKTuzFSUcTHzlZHA7x8Or4GgRSU9TX6jMGAgtM6NyHI
         8Uxt0uqgbdzb68N7iq3qm0d5LEJrEWMwxkt0lfdjCx2Ehj9IN6fqLvcK7zgoIc6vYZEk
         dSkCjga5oRMigy2mGyOKFiNbmBZcSWdza6xyrTJ2lAaaqaTcgBboNTttxZLb8TXqV6qq
         YsQT7tSPgMVKaEaSKx2DUaQY2S1KQBGIGE1YEjBuuvWPyp/kX5hupMpHkIPSkAHF0kap
         keiSMCiZys2NF4mfDKKYlem9SxGvc9VJxQ675dR6Cs2KAkfb+igAJLJPVbOIpcLIo5Tk
         ecIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+ffX+rO4NU79OrIv37Fic6T6B6n82nghu+Qcor+9aKQ=;
        b=QwjSB3uP/dVPe3lZAzSM+h3p0An8EILwz3d78+Pb9BI3m+NapM9Mrh2j+n08w7B7tH
         XUOd6e6101nSelowqZWOJbsPNKPb/7JY+p8RO2aqGY3TIZjbGOOR5hKDEyA90eOyRqgt
         fv1WktJrlr43d0U/0agk9x+x/2hJ5TNtj2YBZtCIve0udWfCknTyA6I2Ay7Tcfj3RTd5
         5+kFPRG1fv8gyuem98ncHgis9M7kKUE5n9qiEyL1CHhXEHq7pTx4k++QdMIe7+wV1+H5
         koMOpFx3a8IRJsEXnNSO0ErxXHKnOhtqZ/T6BALBiAx66XUXEDsjITGanbwNHmURCMfU
         IN2Q==
X-Gm-Message-State: AOAM533otLGczeIdrnGuVXBWi/+yrOpVzj2hu8TJ6BL9AGb3o5T1Ed6g
	rQUWnMAvt5TxIPL2VCipditmZg==
X-Google-Smtp-Source: ABdhPJyh7SCmM/AkMVqOKuJVpTeverxMXB77brs8CerM8SErrcYCOWXGFs/nKybnXJblsyPyVwkXDA==
X-Received: by 2002:a1c:de8a:: with SMTP id v132mr2511044wmg.27.1623830320831;
        Wed, 16 Jun 2021 00:58:40 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id r3sm1059528wmq.8.2021.06.16.00.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 00:58:39 -0700 (PDT)
Date: Wed, 16 Jun 2021 08:58:37 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/7] Fixup unused variables and warnings
Message-ID: <YMmvLfJmoso0xWdJ@equinox>
References: <20210615223607.13863-1-phil@philpotter.co.uk>
 <YMmnKSWJNIk/XJR7@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMmnKSWJNIk/XJR7@kroah.com>

On Wed, Jun 16, 2021 at 09:24:25AM +0200, Greg KH wrote:
> On Tue, Jun 15, 2021 at 11:36:00PM +0100, Phillip Potter wrote:
> > This series fixes an empty goto label by removing it and converting its
> > associated goto to a return. It also changes a decrement operator to
> > prefix to make it clearer, and provide expected behaviour. Finally, it
> > removes a lot of unused variables warned about by the kernel test robot,
> > which are a result of my previous DBG_88E removal series, and removes an
> > entire function as well which is surplus to requirements.
> > 
> > Phillip Potter (7):
> >   staging: rtl8188eu: remove empty label from
> >     mlmeext_joinbss_event_callback
> >   staging: rtl8188eu: use prefix decrement operator on trycnt variable
> >   staging: rtl8188eu: remove unused variables from core/rtw_efuse.c
> >   staging: rtl8188eu: remove unused variables from core/rtw_mlme_ext.c
> >   staging: rtl8188eu: remove unused variable from os_dep/ioctl_linux.c
> >   staging: rtl8188eu: remove unused variables from hal/rtl8188e_cmd.c
> >   staging: rtl8188eu: remove _dbg_dump_tx_info function
> 
> In the future, can you use "staging: rtl8188eu:" on the prefix of your
> 0/X email so these can be caught easier by those of us who filter on
> stuff like this?
> 
> And thanks for fixing these so quickly, I'll go apply them now.
> 
> thanks,
> 
> greg k-h

Dear Greg,

Yes, absolutely, my apologies. I don't know why I wasn't doing this
already, seems obvious in hindsight - I put it down to my brain
malfunctioning :-) Many thanks for taking the patches.

Regards,
Phil
