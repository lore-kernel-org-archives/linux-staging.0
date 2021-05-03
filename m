Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650D70
	for <linux-staging@lists.linux.dev>; Mon,  3 May 2021 10:35:02 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id u3so7078490eja.12
        for <linux-staging@lists.linux.dev>; Mon, 03 May 2021 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CxPh7I3qDrCPngzrnG8Aq9TBH8oaOCJfSHeyyMQDXN8=;
        b=afG5a73Cf0eIji6Z/JOga4s4/04DQMF/rKpsluV3dmYq1a0niN53TS+XArpa4nlATn
         WvPEq2fh1EdcN8dPwUzxhdm5Lt42mKRpsCUnil2ZnhMHupx1QyaFGtQwmCbJflwaiLht
         zmts1oOIVdZmBDgBnbyF/+GznGw043ILCPQV2xPhQht0vVKT3dDK6EGKNyQhAPQ9fZz7
         90N7MaXJCLQG24JoB2YZlgVQQ43wHqc+IZwgdSBhLU323HzjNoYAsx6tRnVRRH9froLa
         NM7w2TUOwT/b+fwV72VhMcO8YHFKQjzbFSLtH2D5IooIGUh4oJ6NeVapixc6d6OEFViT
         Bt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CxPh7I3qDrCPngzrnG8Aq9TBH8oaOCJfSHeyyMQDXN8=;
        b=OgsMA+R3rfNjZP+dcm5pCe1ekCT/gPSYwGqFcRI+TzGA8ugvvdF3N/wMHf1+vf12t0
         XQj1sj+eSbMP4f9R8sGfD70IDFhNkmlySb6sWuJ/pARWqGdYNFMztsC46f6B9fIFSFaE
         vmHGoLa50X3CJ0P8yaVHArjJlsbFMpOlIVrpN6AKJw/13+nENGeM0363xfpLMMKi6J03
         58rxHEv5bxf1bUsnSDvzQre0G1nNoXwbi8/zF+zLQeDLfKNbM3Culkyc41uAXnwZXTpm
         O4EJVOeV5tiRjkSHTN8xlsgaLXzAxzTNK79ZGvtdUqSxwAIQ2ILj8iQK4lvEkJQAQYp0
         1k3w==
X-Gm-Message-State: AOAM532kV1aNLRmaOCZAecHP+Lad60GaP7PCjBq+5pB4iFqACFkjc3fz
	NKlosw7ml+wxdA+H2KsXB1s=
X-Google-Smtp-Source: ABdhPJyL3QG7MtDA6fjIEEjd8bqgWmuJVrvgE0FD42rFB5BqTXAgmaV7KGyr1KXuzflEy5IAnIcKfQ==
X-Received: by 2002:a17:906:5652:: with SMTP id v18mr16153801ejr.457.1620038100630;
        Mon, 03 May 2021 03:35:00 -0700 (PDT)
Received: from agape.jhs ([5.171.72.252])
        by smtp.gmail.com with ESMTPSA id dk13sm12566895edb.34.2021.05.03.03.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 03:35:00 -0700 (PDT)
Date: Mon, 3 May 2021 12:34:57 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/43] staging: rtl8723bs: clean up driver from
 private debug facilities
Message-ID: <20210503103457.GB8953@agape.jhs>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
 <20210503075201.GN1981@kadam>
 <20210503081717.GA8953@agape.jhs>
 <CAMhs-H9zgiP+u0jg8M4uJ6QPCs-BZ0SKaGzp85DoqnS_KkcFuQ@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H9zgiP+u0jg8M4uJ6QPCs-BZ0SKaGzp85DoqnS_KkcFuQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, May 03, 2021 at 11:24:16AM +0200, Sergio Paracuellos wrote:
> Hi Fabio,
> 
> On Mon, May 3, 2021 at 10:17 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
> >
> > On Mon, May 03, 2021 at 10:52:01AM +0300, Dan Carpenter wrote:
> > > Looks good.
> > >
> > > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > regards,
> > > dan carpenter
> > >
> >
> > thanks Dan,
> >
> > when a tag is offered this way, am I supposed to resend the patchset with
> > the offered tag added on or it's just a tag which Greg is going to add when
> > accept all in his tree?
> 
> Greg will take care of adding this tag when he adds all of these
> patches to his tree.
> 
> >
> > thank you in advance,
> >
> > fabio
> >
> 
> Best regards,
>     Sergio Paracuellos

ok thank you Sergio,

fabio
