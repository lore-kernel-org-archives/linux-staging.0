Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AB92F80
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 08:50:53 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id q3so26417659edt.5
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3QxsAwmTrTeB18+OyhXDgjAvk7BaTLmBXsRYKyRJCcI=;
        b=Velx31fB81eddg504YD3UoiFlJ202ncCk6DSnXWHl8jOVqQ4CBO+fx9OM+cGevTz5f
         cZLWrujKyoTh6fwYY3UgCZMmZDzPgLvQKljphZlyajZBeNy7lAmBQuPxPPV6praiQKk6
         25sslycvfQBoCrXfonPohSf/iFjgSD5ij0t2XLkvo7Ojyg+yZinI4PqVExUjEPrk2rtS
         KdFd4DFrqQionb339l6Uwommm35n3s7pTW5j6GEnZisKNY8b8q6fPxy1RgqLuyQCBNQd
         7HO8aEG1b3QHOmmZ2Wl5aHHwLP3rzfVNgvYUe6n5xJoQ60KRWWDHWcI2ZyA3iRnY2SKA
         HIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3QxsAwmTrTeB18+OyhXDgjAvk7BaTLmBXsRYKyRJCcI=;
        b=a5G39E0+aLz6IPlVzP71m5NS1dyoFRhd7ldBo+37Lz58Qt+4OEt9ak802GkYSjylvv
         k593Bns6jdi+GZqax86CJdiqG8tv7iH5GFsNq9ZtRwwZSUyZFXOIkBhBzE7lbiSSLMpV
         VH2C600f2XNYCAnN0fz7sE3eHqz6CpM2t9Oez8UrPRo2YM5gRIPgHwK44O5eNlVI0k2D
         s4Zjm7lng15p2XY4seOpupUfjJKbu7tlcRXw9bHvN+8J1wfPh72aS/gUSz5NOsucSq8v
         T+6cFrlsOElAvLeiOom6j3Z/JdLVVy86JHWzqzb6f5mIFh2hr7cLEhVXLDuXTVP+9iXu
         sG3g==
X-Gm-Message-State: AOAM531cQFuiXpvQF4i3n6gyA9wI7gzb5IMtmRnD5wXHINV++mZJyQN9
	FoRJVkEguPvtFA27y7HjL30=
X-Google-Smtp-Source: ABdhPJzqf6jFhXcFY16uzDOrtqySbrQ3vdFOoxPRCj+S+ihDNd9Kn2xk3pn2QLzi8eSC+PXSNMsURw==
X-Received: by 2002:aa7:d946:: with SMTP id l6mr2881942eds.81.1629190251496;
        Tue, 17 Aug 2021 01:50:51 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id m25sm703205edv.81.2021.08.17.01.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 01:50:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] staging: r8188eu: Remove unused code
Date: Tue, 17 Aug 2021 10:50:49 +0200
Message-ID: <2687424.dsZdMDUqJ2@localhost.localdomain>
In-Reply-To: <YRqXNyX+fY9qKh3Q@kroah.com>
References: <20210816160617.11949-1-fmdefrancesco@gmail.com> <YRqXNyX+fY9qKh3Q@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 6:49:59 PM CEST Greg Kroah-Hartman wrote:
> On Mon, Aug 16, 2021 at 06:06:14PM +0200, Fabio M. De Francesco wrote:
> > Remove unused code from the r8188eu driver.
> > 
> > Fabio M. De Francesco (3):
> >   staging: r8188eu: Remove unused nat25_handle_frame()
> >   staging: r8188eu: Remove all code depending on the NAT25_LOOKUP method
> >   staging: r8188eu: Remove no more used variable and function
> >  
> >  drivers/staging/r8188eu/core/rtw_br_ext.c    | 263 +------------------
> >  drivers/staging/r8188eu/include/recv_osdep.h |   1 -
> >  drivers/staging/r8188eu/include/rtw_br_ext.h |   1 -
> >  3 files changed, 1 insertion(+), 264 deletions(-)
> 
> Patch 2/3 did not apply, can you please rebase and resend the remaining
> 2 patches against my latest tree?

Sure. I've already sent them:

"[PATCH v2 2/3] staging: r8188eu: Remove code depending on NAT25_LOOKUP", 
https://lkml.org/lkml/2021/8/16/1082;
"[PATCH v2 3/3] staging: r8188eu: Remove no more used variable and function",
https://lkml.org/lkml/2021/8/16/1094.

Thanks,

Fabio
 
> thanks,
> 
> greg k-h




