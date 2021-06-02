Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32772
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 15:43:15 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id i14-20020a9d624e0000b029033683c71999so2815567otk.5
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 08:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8tyanviLNguYjdHyB5/9BULlk+3d/ekam7+w/MuyW2s=;
        b=boMPMQNRdiXV8/6uOQG1j4VkxRBI7KhVmUPkz2+HcRYJaeAcNBfUcoUyaDFyd7WyjO
         ovgu88CcW1BQJU8Nqf0HeAjncX7tvYNH3nKS/y8SAJOmvTzsoAPge/dXofF2L2451Orb
         h5R5Vfi8MEU8bgtXfjCgp4MaQ7S3ksOzYzSgLQe1jhAJVfbzjttO9pfVht5P7XR7Q4B5
         4+hb/kzqTEZpSJVtClrz6UhutTj14bW0FakHjlb5IAHdXrFZyqvOTnquVuJ0P5++JCB7
         aOx3WOxrRCHHcoCFUFv4kgZwd8tSZ0Zrioi7T3fKHvqTJyAI2QhfAZI2fhsAi5xP+xsZ
         kS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8tyanviLNguYjdHyB5/9BULlk+3d/ekam7+w/MuyW2s=;
        b=mR+Kkjz1xKRKv8cHWP0QXmVENalTEZU0kgmdwtJKh8DeHTGi3Mtw5qtJoDrfKZJhDP
         BxnVj8QYLYqfnqH25AJ2d8oqGCAmhOf6WJc19YfzipijpdbYjiK7kDSaZxq47E5R9FAN
         gWuUCI2l4BCP1T95R3RQgNeW279WdUIWgRZwUytfXjUbbhIrJTpZCP7ll850h9Js6/oX
         D9JO7I7F49UJ4oYOhu0s4Hpf/JcUOC06epz2eKGvMlYFo804VfaP5nkj4IPxdBPDEIcU
         8PkbAaCvdyhwUghAiKJ6klKkCKqJ20cFsa4oobRO3bU6/Rw7M5g0zrpI4KIEiiLgoPnW
         qKNA==
X-Gm-Message-State: AOAM530EcxZGxeAeh2LvdxjHKK4BtufMLjOpMTNem9h65ahmLlRBMr5n
	0t1dhwBQgx/s1pYLKOomcd8VrPbhy5g1Szbx+VE=
X-Google-Smtp-Source: ABdhPJwLT90PmyY3UsGqkDcyX6yRtn7S6AN7eBVtcxIp2kxJV+dHTXil3pmYptM+vM2pFhtWWr8iGQJmjDiRFu1ytiE=
X-Received: by 2002:a9d:729d:: with SMTP id t29mr5454098otj.256.1622648594616;
 Wed, 02 Jun 2021 08:43:14 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210602151038.53794-1-manikishanghantasala@gmail.com>
 <YLehYmLYBMmI8MOk@kroah.com> <a5b5c871537bcc6931894e8f61ca7b28950c114a.camel@perches.com>
In-Reply-To: <a5b5c871537bcc6931894e8f61ca7b28950c114a.camel@perches.com>
From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
Date: Wed, 2 Jun 2021 21:12:38 +0530
Message-ID: <CAKzJ-FOT8hnHqpYB8WiMOd5FgK9_BPgrv8FmvxXnSFA_9mhsOA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8192u: fix coding-style issues in r8192U_hw.h
To: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Joe,
Thank you for the response, I am changing the mismatch with the real name.
Should I also prepare a new set of three patches separately as bot suggested?

Regards,
Manikishan Ghantasala
B.tech CSE
twitter | GitHub | amFOSS

On Wed, 2 Jun 2021 at 21:06, Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2021-06-02 at 17:18 +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jun 02, 2021 at 08:40:33PM +0530, sh4nnu wrote:
> > > staging: rtl8192u: r8192U_hw.h: Clear the coding-style issue
> > >
> > > "Macros with complex values should be enclosed in parantheses"
> > > by enclosing values in parantheses.
>
> parentheses
>
> > > Signed-off-by: sh4nnu <manikishanghantasala@gmail.com>
> []
> > - It looks like you did not use your "real" name for the patch on either
> >   the Signed-off-by: line, or the From: line (both of which have to
> >   match).  Please read the kernel file, Documentation/SubmittingPatches
> >   for how to do this correctly.
>
> Might be useful to have the patchbot script reduce the content of the
> message when it's identifiable.
>
> The patch itself looks OK.
>
>
