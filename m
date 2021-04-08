Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EEA6D00
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 11:25:54 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id k23-20020a17090a5917b02901043e35ad4aso2975065pji.3
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=495/Mma5t8WtW6O0PDJ3WLF/I9NqnxGNvXlyNCulN+w=;
        b=ACrdyJbo9p9Oy+FoSw2p+jHGxGky5oXtxbT/LeLz4YstN8nXbc74xExdgcP645utV8
         iTGv3mwcQS8dZPmKApvOIqyWA9LwfgloBQKhsa2OIA5RztWW0tMLrD8Jmk86tFmQT3mT
         zLng3dCm+jy74lpnXbEtdCKsXInaLLqfacVx3C+Q+Q3OBTGpYQCigxY9P25E8wGbktVq
         qx3lQyOxhgNenWWf36zh1+BH8JVN+8AiXJhBUaQ9jojABXQKPH7RLc9+07q5PLvnchOA
         SUNwt3K5WoyRF91UNcKKo304TtMKiqOxYqWf7JcMSeqih2filHA7AJ/v6wZrFKc708wV
         AeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=495/Mma5t8WtW6O0PDJ3WLF/I9NqnxGNvXlyNCulN+w=;
        b=cIGijRzDJOkV9BHOTbIWfqJBbWg80vY+xmGP4DawFdwYrT83ONsJDgaz7v1bV7B5a6
         Ppayo8O+fdeMAXoQH7duXmXoelU/5vAbkha1ApZ4ToNYhm7G4VRUtcLL9CGbkGmk0HMy
         38I/Hnq70noEmxMFbmY4uSN1txEHSPmJh+AWxyzW+hDhD792RwCeXF6NQxPgNuiAgaaX
         I78tzWppDj7ScMFvcdk21vo3gQ/3DSget7WIZY7MnXruAj+kM7DJDetGdKIBmrU1zc5H
         Uawm7strK73ec7bJe9GK2azeI5/8X3b+iARfb1JV3SngrlWqxbym6wvt3M/KdMjar7ud
         V1ZA==
X-Gm-Message-State: AOAM531hhvaaGWjQw/dOzuxlHS+F5OG3wGbaDROo5s3WA88a1STM/JEV
	I0wn7pysVaBiCnPrDhN1VmY=
X-Google-Smtp-Source: ABdhPJxvQ7metANC3n7diwoY46jlO4euSlcKCa1sstBxi92yy5mXjTs4Pa4wTKj3E2QZF0hYzHsRaA==
X-Received: by 2002:a17:902:7886:b029:e7:1052:adad with SMTP id q6-20020a1709027886b02900e71052adadmr7264350pll.75.1617881154077;
        Thu, 08 Apr 2021 04:25:54 -0700 (PDT)
Received: from kali ([152.57.46.75])
        by smtp.gmail.com with ESMTPSA id fv9sm9234517pjb.23.2021.04.08.04.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 04:25:53 -0700 (PDT)
Date: Thu, 8 Apr 2021 16:55:45 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: Re: [Outreachy kernel] [PATCH] staging: rtl8712: added spaces around
 '+'
Message-ID: <YG7oOezBpYsi3Fr8@kali>
References: <YG690ZIRdCEcjoM6@kali>
 <alpine.DEB.2.22.394.2104081027100.3155@hadrien>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2104081027100.3155@hadrien>

On Thu, Apr 08, 2021 at 10:30:09AM +0200, Julia Lawall wrote:
> The subject line should be in the imperative, so "add" instead of "added".
> 
Ok Ma'am
> On Thu, 8 Apr 2021, Mitali Borkar wrote:
> 
> > Clean up Check:spaces preferred around that '+' (ctx:VxV)
> > Reported by checkpatch
> 
> Please try to rephrase to explain what you did and why.  "Clean up" kind
> of states what the goal is, but your opinion about what is a clean up
> might be different than someone else's.  It's also not necessary to cite
> the checkpatch warning exactly.
> 
OKay Ma'am, will rewrite the appopriate commit message. May I know while
resending this patch, what should I write in subject description, 
RESEND PATCH or PATCH v2

Thanks
Mitali

> julia
> 
> >
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/rtl8712/wlan_bssdef.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/rtl8712/wlan_bssdef.h b/drivers/staging/rtl8712/wlan_bssdef.h
> > index b54ccaacc527..ec3749813728 100644
> > --- a/drivers/staging/rtl8712/wlan_bssdef.h
> > +++ b/drivers/staging/rtl8712/wlan_bssdef.h
> > @@ -176,7 +176,7 @@ struct NDIS_802_11_WEP {
> >  #define MIC_CHECK_TIME	60000000
> >
> >  #ifndef Ndis802_11APMode
> > -#define Ndis802_11APMode (Ndis802_11InfrastructureMax+1)
> > +#define Ndis802_11APMode (Ndis802_11InfrastructureMax + 1)
> >  #endif
> >
> >  struct	wlan_network {
> > --
> > 2.30.2
> >
> > --
> > You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/YG690ZIRdCEcjoM6%40kali.
> >
