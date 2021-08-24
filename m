Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08F23FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 15:39:34 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id mf2so26707705ejb.9
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 08:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MklQtxppJU9/wteD80SlasLjW5xkfDSiebnSUSQ19Hw=;
        b=NdFXObAT+ku/DrVpXPIXU7LcZvcTC60Tji//NsqcC7EjQav0KCjYjEOlsxFUc2RdnP
         H9WXkQb1bzwUwwWASnZ2+G7H7d1hisEb39dLU/eU/ltgsAFPERezcNV01th6C1bSRNwW
         UtAv1QUOeQj+QPjo2hwQOn5GG1cHQuaxgCx1jNzphLM/h/6BsTHyGU74nvv9kcch3KMp
         oQb1CaYjXNB9p46osJwOgnkzUCkfTUDH6THFke5pgQpDXx91U5MYP/NQ46URlCq4dTcV
         RFRHjxADZ/VHaR/seEpHOTShw/RiRRB9WVuJsdtfx+HVVyqQGkoIV2CNUDUTokttdfO+
         1ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MklQtxppJU9/wteD80SlasLjW5xkfDSiebnSUSQ19Hw=;
        b=LRizaAr1LDUE8YGpmj4HtehQZ3xaLf08NV47IiLEIpRxaAuMSXNRAJErsnNpEQO3bu
         tCjizpmE+LVKECufh820V9Ri4QM9f4lIcG295WSImfTXO9FmfNv6R+hhtlKnOsQCnzjS
         zZ7gxBg5b+FuPur0n39V8qVuSR4IAL8SeVdcWz+InGnAnczkeBw4Dwcyrkmfi6j+OJyz
         p1yWkPKElqA8ABMF4KH6BT0NsEdMbCE1cMgjcNV+557MnAwrNpVHqKekDKlsQZQEB86/
         kyihPrNyLVRmt0PqHpR/qrlkIJVIHNhsXlmedIOS2HJHD5pzKCrY3e7JFASj1/sTmIJk
         y5mA==
X-Gm-Message-State: AOAM530lpgPv/yaDa6UQ5zVO+xZIyyjbMqaiJDykaY7nCrXBBG4nyn4S
	A3jCEXqRyHWvfSx1QcJ2NKI=
X-Google-Smtp-Source: ABdhPJyhJbCRpOLdpDsYxJGNDvVtIZaz+q8IB+LCJoMpYUjbCzqnQeeebrW1hRWWI7rjhH0MIZMfNA==
X-Received: by 2002:a17:906:4bd6:: with SMTP id x22mr42306139ejv.270.1629819573325;
        Tue, 24 Aug 2021 08:39:33 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id t5sm9498113ejr.37.2021.08.24.08.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 08:39:32 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH 2/2] staging: r8188eu: Make some clean-ups in usbctrl_vendorreq()
Date: Tue, 24 Aug 2021 17:39:31 +0200
Message-ID: <2327592.S5L5zkRU50@localhost.localdomain>
In-Reply-To: <17234f07-debc-5b6c-244d-472a3f33bc3f@gmail.com>
References: <20210824142823.16845-1-fmdefrancesco@gmail.com> <3740714.KPokl01s95@localhost.localdomain> <17234f07-debc-5b6c-244d-472a3f33bc3f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, August 24, 2021 5:26:23 PM CEST Pavel Skripkin wrote:
> I found the problem:
> 
> >  	mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
> >  
> >  	/*  Acquire IO memory for vendorreq */
> > -	pIo_buf = dvobjpriv->usb_vendor_req_buf;
> > +	io_buf = dvobjpriv->usb_vendor_req_buf;
> 
> 
> I don't know from where mutex_lock() comes from. In staging-next I have
> 
> _enter_critical_mutex(&dvobjpriv->usb_vendor_req_mutex, NULL);
> 
> instead of
> 
> mutex_lock(&dvobjpriv->usb_vendor_req_mutex);
> 
Oh, I know where it comes from... :)

It's a patch of mine that is in the queue, waiting to be reviewed and applied.
Please see: https://lore.kernel.org/lkml/20210819221241.31987-1-fmdefrancesco@gmail.com/

Thanks,

Fabio
> 
> With regards,
> Pavel Skripkin
> 




