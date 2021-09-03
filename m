Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0848C72
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 17:48:44 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id fs6so69553pjb.4
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 10:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2RwvGxxkwgPp1kC7OUNpSHVKhmd69dXp1tT7aj4N4gg=;
        b=FUaUag50ob2Eqb3yiH+FdjIbjocFosp5iaSENleFndT7apgR77KU3A5ioFl1HKxOZq
         YKREVYFNT5Z+uQdr1cgUgo1uIneWdyQeQ97SzWdiy8N2t5ZBPf8T1SrEahe/5MvE4uFm
         m2/bcenZ7FMb8p+865QmY2ETiregCBuNR3diuL0qKpuxl4/gu6+vhLDvWmTkk+0JNtJQ
         IkibDjcOeHP8vJoB79rCSfPMT0jIO6SD/LcxGZx6Qb51dygHTo6V13QFodvOtc2a4zaB
         0JHveZ6MJQCc583r7YLuZcIFNdRdRD44myJjng0ygqHIWFpK7NuE+UPejRljJ+XC+3Us
         5raw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2RwvGxxkwgPp1kC7OUNpSHVKhmd69dXp1tT7aj4N4gg=;
        b=H4idtlQ8ulXHD+mPcYSe7EmvQpPRUPkkdxjGnol+3bZN3GS6m04QPGsy97FFwqU7H2
         YfbDlIqxrLTeFIV7lqajhKZUUnUT0wmTfqmt7ZWn+u56ZyIVFvCD1sMu9Nqa4JNikinM
         5n1Tx5CLeDeBCoYF8LxFbc0R5MuIC842mr0bIsl1Fy+N2fc/KSUwSuTJtdrdypustWj6
         asvKlf1J3jG4xy16Ouqer7jzferotMzhzuS5LwIem03aqfq00IUyZoxJ+7Ka1kbbGv1R
         BxWwMy/rqFqFQ40Chb6FhKH/tpCDZaZgrO5mHQWQFcH7vYWQF6ZGXv4/JFX7dMwYCR0P
         l6cA==
X-Gm-Message-State: AOAM532nXlpIwBRYvkwvJCY6CO9umAr5aIPFhQQ4eEbPpoo9FgmMB5db
	FTrm68pOvTkxm0seoVZ29uA=
X-Google-Smtp-Source: ABdhPJydzohBvdITs+K1x4HKM7Kxmexw20vOxzGAKL4JzKbqnWDK5Er0TA1+iGiOyGWrEIN7un9/yw==
X-Received: by 2002:a17:90a:8c8b:: with SMTP id b11mr90687pjo.14.1630691324349;
        Fri, 03 Sep 2021 10:48:44 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id i5sm5746049pjk.47.2021.09.03.10.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:48:43 -0700 (PDT)
Date: Fri, 3 Sep 2021 23:18:38 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, martin@kaiser.cx,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH] staging: r8188eu: os_dep: use kmemdup instead of kzalloc
 and memcpy
Message-ID: <YTJf9odBRwxHZTs8@user>
References: <YSp9z2/JmvHGhW5m@user>
 <YTCXef5o9JHtQhuD@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTCXef5o9JHtQhuD@kroah.com>

On 02 Sep 2021 11:20, Greg KH wrote:
> On Sat, Aug 28, 2021 at 11:47:51PM +0530, Saurav Girepunje wrote:
> > Fixes coccicheck warning:WARNING opportunity for kmemdup in ioctl_linux.c
> >
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > ---
> >  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > index 81d4255d1785..495fadd2b8c8 100644
> > --- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > +++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
> > @@ -585,14 +585,12 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
> >  	}
> >
> >  	if (ielen) {
> > -		buf = kzalloc(ielen, GFP_KERNEL);
> > +		buf = kmemdup(pie, ielen, GFP_KERNEL);
> >  		if (!buf) {
> >  			ret =  -ENOMEM;
> >  			goto exit;
> >  		}
> >
> > -		memcpy(buf, pie, ielen);
> > -
> >  		/* dump */
> >  		{
> >  			int i;
> > --
> > 2.32.0
> >
> >
>
> This patch never showed up on lore.kernel.org for some reason.  Please
> resend and see if it was a mailing issue on your side...
>
> thanks,
>
> greg k-h


Ok, I will resend this patch.

Thanks,
Saurav Girepunje
