Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1970
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 08:46:01 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id g8so21482379ejx.1
        for <linux-staging@lists.linux.dev>; Sun, 06 Jun 2021 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wvh6MEtvVWMlRewCXrhxu3/PUZtiVlDvYPuCTtfaY8g=;
        b=MoyoSqG508f5ZZdMrDqrIv4nTOOy8hGTiZci9eV5WtN65+mdFvyEvtwGg96r2D12Yo
         BSWQ3mqy+FZT6xUYewMrRfO5sKLUyLJK2YzuUhWnhKau4naipGVNoUYgUQS/cNst8ARZ
         /yMzXxQO60ty7pZLJaoxIxqkcdCKaq0i/XgZQP39OVybgT99juvBoZplBXlKeSgMHw3e
         HrdY3/9KsQSz1qbsDi/xLTvPTlc2rn7nzz5+x9Ly8UUb9OtM0X0Mmn6OdVUrZ3wHBAXq
         FOBQz4UA6XrV5i6Lc92EJklui9gpZN3XgopVwvJSC4OhHC4qyyqVGcvnbLaEHSKtHC3U
         z5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wvh6MEtvVWMlRewCXrhxu3/PUZtiVlDvYPuCTtfaY8g=;
        b=EiOFIJwFLrL8BTQqeolTsENAsuUCZ7ohQh3taJcdoUB9oOCkBP8VLpX970I6Iyf0rZ
         jI2CtfJAFg9hbmXmfWY8WcSrd7fxknD+QcYHTbVo+QniURR29keuAnhOVFdpiSoUCyq9
         5t54HfiekSB3VFt0dd95X6qFwai/7gaAkXUDzWw40ykVp21BhtbFPA2wFlhVWKy/OX+D
         6Tuh0K3sEios3ypn1r+0hwWjRfk287iI5Fwp9MfyefVx7iiEfoOPh+zMPRlxksWlvapz
         j59BskHATwyeGFPOzwyvxjrHGZ4ocU5sjrwQ0ZhGwasl551yBfI7f/US3NNC0arM2yGX
         mIFA==
X-Gm-Message-State: AOAM531yMJg2NMDGnRn4iRg1PrY4J33bNO/Wg5lUmTs5fyKCYVsfC8MA
	MUI6PKazWkB47YkSa/P7J4M=
X-Google-Smtp-Source: ABdhPJx7IY22Uwds+zWFhKE84x/W9uv4or3bZjOkRn3IvfVAttKz3pPm2AIeJCGC+MRKGVWXq8Zfew==
X-Received: by 2002:a17:906:3016:: with SMTP id 22mr12459078ejz.28.1622969159887;
        Sun, 06 Jun 2021 01:45:59 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id f21sm6101770edr.45.2021.06.06.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 01:45:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Wenli Looi <wlooi@ucalgary.ca>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix uninitialized variable
Date: Sun, 06 Jun 2021 10:45:58 +0200
Message-ID: <7256195.zb9d8qvCYo@linux.local>
In-Reply-To: <CAKe_nd0fNE=+CP4O0cUtOPO5vRC8_gHxjLtH80r_4GO2MW5u4g@mail.gmail.com>
References: <20210606070021.116284-1-wlooi@ucalgary.ca> <10029109.FgdUXNWx4t@linux.local> <CAKe_nd0fNE=+CP4O0cUtOPO5vRC8_gHxjLtH80r_4GO2MW5u4g@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Sunday, June 6, 2021 10:09:39 AM CEST Wenli Looi wrote:
> On Sun, Jun 6, 2021 at 1:00 AM Fabio M. De Francesco
> 
> <fmdefrancesco@gmail.com> wrote:
> > On Sunday, June 6, 2021 9:51:35 AM CEST Wenli Looi wrote:
> > > On Sun, Jun 6, 2021 at 12:13 AM Greg Kroah-Hartman
> > > 
> > > <gregkh@linuxfoundation.org> wrote:
> > > > On Sun, Jun 06, 2021 at 12:00:21AM -0700, Wenli Looi wrote:
> > > > > Uninitialized struct with invalid pointer causes BUG and prevents 
access
> > > > > point from working. Access point works once I apply this patch.
> > > > > 
> > > > > https://forum.armbian.com/topic/14727-wifi-ap-kernel-bug-in-kernel-5444/
> > > > > has more details.
> > > > > 
> > > > > Signed-off-by: Wenli Looi <wlooi@ucalgary.ca>
> > > > > ---
> > > > > 
> > > > >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > > > b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c index 
2fb80b6eb..
> > 
> > 7308e1185
> > 
> > > > > 100644
> > > > > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > > > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > > > @@ -2384,7 +2384,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct
> > 
> > adapter *padapter,
> > 
> > > > > u8 *pmgmt_frame,> >
> > > > > 
> > > > >       DBG_871X(FUNC_ADPT_FMT"\n", FUNC_ADPT_ARG(padapter));
> > > > >       
> > > > >       {
> > > > > 
> > > > > -             struct station_info sinfo;
> > > > > +             struct station_info sinfo = {};
> > > > 
> > > > What caused this bug to show up?  Did it happen from some other 
commit?
> > > > 
> > > > Are you sure that all of the fields are being cleared properly here,
> > > > what about any "holes" in the structure?
> > > > 
> > > > thanks,
> > > > greg k-h
[CUT]
> > > 
> > > Do you think kzalloc() would be preferable?
> > 
> > You cannot use kzalloc there: 'sinfo' is instantiated automatically on the
> > stack. The example you took had a pointer to the struct.
> 
> The stack variable could be replaced with code like:
> 
> struct station_info *sinfo;if (!sinfo)
>
Why that "if (!sinfo" before kzalloc?
>
> sinfo = kzalloc(sizeof(*sinfo), GFP_KERNEL);
> ...
> cfg80211_new_sta(..., sinfo, ...);
> kfree(sinfo);
> 
> which is what the linked code basically does. I'm not sure if this is 
preferred?
>
I don't know that code, but I think that:

(1) It is generally preferred that big structures should be allocated 
dinamically: kernel stack is a scarce resource.
(2) Passing address of variables from the stack to other functions is 
generally a good source of troubles.

I think you are closer to the proper solution.

Fabio 
>
> > 
> > > Sorry, I'm not familiar with "holes" in the struct.




