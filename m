Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1382529CA
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 14:17:26 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so16847187oth.8
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jf0M/UYksM4f8cyl+048fyKCWQmP2lNg2nNyEcj8d5E=;
        b=Kg+qziM6aievX5zkie0Ox1cxPv/RgTLRIFDmVRgZRMXs/Lc2IV5tMQ9A96lhR6U02O
         dCKmoQZ6lR8dEPOPb6hSQ7vnarkgXFjNFyc6CHNX6RpGJRDSmQMcxG7prI7JKFLy4rIS
         UEbaNa+S03Qqvnf7zdu099d9pBK3o3secmq5qBl6ecDhlm/zJAfJ9CauZMlzQ8j25tQe
         4CgrqBYnPZfA0niEbJxAZJAlfWZV9eNrovUAYQYNrbgYs8KZc5U2wtcGFpL/+vFeDad0
         k2S23VLG25eTJEf05b4TNtdSpW2muSbRDhiO3dYTuvJrjbNRprjm7jJVwRnEn/QCkrTq
         LeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jf0M/UYksM4f8cyl+048fyKCWQmP2lNg2nNyEcj8d5E=;
        b=VS4uYAQDk/dac1sZTVsJI5NlCqQowzcvASmwBFZdFiTeA1Ff1EKR3GvDd4xOkTycGa
         inhci8nPI6tEZRlxIU+iwkwFSkgCt74oLiEbs/9lx7ldaHX5eTCGXti/mLcbtRNMKgKY
         Id3hzf/K9LglVPPBRTHWteHBmDOhcsIwHfkYL3lZGXYHqvp+dk4Ibjgoa3g7J66JKpTl
         hY/+8FJO+4+lYdfWro6/l02pOUqIMuTyaFecQ9xv0Pdha6+NHaMoxqeURiN71cxf6EqJ
         gyAxRKCSs+83Qz4GSsfH6A7oC1FmMYNrrDH6N8WcJwY1gX1pHKqrsSo4OU3ugODy/VBn
         ibdQ==
X-Gm-Message-State: AOAM531Xa5UUEZYoNapsVHJYJUWLHSykIti2cDolc2JmpWWvIoop2gCr
	tNR1FKKw/soHkEP1jeKIXMesSfC1GBqhNSU9gvE=
X-Google-Smtp-Source: ABdhPJy6VceyJx88snu3bvR7arK1gj3G/AgPgWPLTcnJJK5cNvvp7CyFcATRq7MOIGMl8zVBLmkD2SYz42XX3x+6ilE=
X-Received: by 2002:a05:6830:19d9:: with SMTP id p25mr14163998otp.236.1623075445270;
 Mon, 07 Jun 2021 07:17:25 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210605073023.21435-1-sergio.paracuellos@gmail.com>
 <20210605073023.21435-6-sergio.paracuellos@gmail.com> <20210607065934.GM1955@kadam>
 <CAMhs-H9MC7weYpkdZy_eNw01-tc+6DU58tciQt7J8BtSqazGxw@mail.gmail.com>
 <20210607103736.GR1955@kadam> <CAMhs-H_6g86wF+M-0iGUqFYRQhHdkuciTLgjSvbPdvxE7q+5WQ@mail.gmail.com>
 <20210607132019.GV1955@kadam>
In-Reply-To: <20210607132019.GV1955@kadam>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 7 Jun 2021 16:17:14 +0200
Message-ID: <CAMhs-H-rOiSZG3dPYuFez_Qzd5Zo3BX9sKkW3Wuap_Mob-DLGA@mail.gmail.com>
Subject: Re: [PATCH 5/5] staging: mt7621-pci: parse some dt properties from
 root port child nodes
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 3:20 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Jun 07, 2021 at 01:10:57PM +0200, Sergio Paracuellos wrote:
> > Hi Dan,
> >
> > On Mon, Jun 7, 2021 at 12:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Mon, Jun 07, 2021 at 09:11:13AM +0200, Sergio Paracuellos wrote:
> > > > Hi Dan,
> > > >
> > > > On Mon, Jun 7, 2021 at 8:59 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > On Sat, Jun 05, 2021 at 09:30:23AM +0200, Sergio Paracuellos wrote:
> > > > > > Properties 'clocks', 'resets' and 'phys' have been moved from parent
> > > > > > node to the root port childs. Hence we have to adapt the way device
> > > > > > tree is parsed in driver code to properly align things and make all
> > > > > > the stuff work.
> > > > > >
> > > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > >
> > > > > It sounds like this commit needs a fixes tag?  What does "to properly
> > > > > align things and make all the stuff work." in terms of what the user
> > > > > sees?
> > > >
> > > > I submitted this driver to get mainlined and when bindings have been
> > > > reviewed I've been told to move this stuff into child nodes. Until now
> > > > all was also being properly working but with these properties defined
> > > > in the parent node. So I don't think any Fixes tag is needed here. So
> > > > hopefully changes on this patchset are the last need to get this
> > > > properly mainlined. I've been told to just make a 'git mv' without
> > > > zero changes from the staging driver, that's why I am submitting
> > > > changes to staging before.
> > >
> > > I'm really trying to understand how this affects the user experience but
> > > it sounds like you don't know either but you were told it was the
> > > correct thing and it seems to work?
> >
> > What do you mean with "user experience" here? So to work with the
> > future mainlined driver we need the dts file to be aligned with device
> > tree parsing code. If we move these properties into child nodes
> > (previous patch do this) and the code is properly aligned, for the
> > user the change is transparent. This SoC is mostly used in openWRT
> > where new versions compile new code and device tree completely so I
> > don't expect any compatibility problems also because of these changes,
> > AFAICT.
> >
>
> Basically what I want from the commit message is that "I do not expect
> most users to notice this change, but it is the correct thing to do".
> The original commit message said "make all that stuff work" and it
> wasn't clear which things were not working...

I expected the part of "properties xxxx have been moved"  and the
"align things" stuff to be clear enough but it seems I failed in my
intention :).

>
> regards,
> dan carpenter
>

Best regards,
    Sergio Paracuellos
