Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD82CA9
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 22:31:14 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id j38-20020a9d1926000000b0059fa6de6c71so716915ota.10
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cspukaFlNuPpy4+8Cpeu4TXQ6/rweaZWRIglmARlXtI=;
        b=HKCNnx+jGJJkADStNKMs4G9pgWeOHv9cJloYZfNPZggjJ50vn6T4vNRKuHrgq1/Npu
         IjUM1bKfceM0gOV10gxAzfz16RUhXSTB4OmNMI3psbedk66R8L9slNMWIi5sdTZ/DKzC
         WPOX46tSKJx4Zh5CMaSt5jaynDyQl4p76rTrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cspukaFlNuPpy4+8Cpeu4TXQ6/rweaZWRIglmARlXtI=;
        b=4BVPH6uzKgdldI8hlvvzkVWu5Pflld5epROQroZWRgspTXjrE2wLR/n+EP+NzFgzdZ
         0dM1Y+0qJoishdVqiaIx9PesTQVI56ytn+5tLvXPGWTeDxD83pBtkPL0MkmLE8YM62CJ
         OInkFB6d4rBZdudUOcTON76vlEQhQwcMlUsBf7iZY6nrmNYql/LsPH/fX6GqpEBNAGwn
         bQHrSq9QV4NyTxN3pjqVqRlQZNsZ1HXg8uEs/RVPbTF45JuYBSUStZ0arb7mrDDoqFvH
         pyLkqul3SR1myEEqngFaz3IWwOb4Zgt0QyJw5EWG7T78oKJgCcmNm5qYXsJHr7uFKGLu
         As1g==
X-Gm-Message-State: AOAM530qhAZ20S7qgFWUu9qA2zQFqyyassHZm4sURIIwCd5ojA0Ls2kZ
	RpSJjaUxvO9k0/ZHQH5+zJwLfrlFNu11N88N4ZTKWg==
X-Google-Smtp-Source: ABdhPJwFd4e23GnR4SX0gCqw43jALR8CbpTM+5jsdmpC+ksI6IzORmC0SPijyruIE5/dthHYq1aiZgd2e6JbzaOqHxg=
X-Received: by 2002:a05:6830:2b25:: with SMTP id l37mr533241otv.323.1643236273720;
 Wed, 26 Jan 2022 14:31:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de> <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de> <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
 <YfFMSkhbvHaR0YNE@smile.fi.intel.com> <f6ffe9bb-8683-4061-c876-1d559267ebae@redhat.com>
 <YfFWmmJFtEB93jUi@smile.fi.intel.com> <3430838d-1c63-da49-b774-c5a883e7085f@redhat.com>
 <YfFZkgE3wfPXLpYA@kroah.com> <20220126144524.GB1951@kadam>
In-Reply-To: <20220126144524.GB1951@kadam>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jan 2022 23:31:02 +0100
Message-ID: <CAKMK7uGEFW4nd+W6PiT=uwSPz=pA6HKZXj6ePcdsAGiMDb3BxA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Dan Carpenter <dan.carpenter@oracle.com>, Dmitry Vyukov <dvyukov@google.com>, 
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-fbdev@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, 
	Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, 
	Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Carlis <zhangxuezhi1@yulong.com>, 
	Phillip Potter <phil@philpotter.co.uk>, Lee Jones <lee.jones@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

dOn Wed, Jan 26, 2022 at 3:46 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The other advantage of staging is the I don't think syzbot enables it.
> I guess it's easier to persuade Dmitry to ignore STAGING than it was to
> get him to disable FBDEV.  :P
>
> The memory corruption in fbdev was a real headache for everyone because
> the stack traces ended up all over the kernel.

Uh Dmitry disabled all of FBDEV? That's a bit too much, since there's
still a lot of distros shipping things. I don't recommend enabling
neither fbdev nor fbcon and some hardening checks look for these
(forgot which one). But if syzbot stops checking fbcon and fbdev stuff
on top of drm drivers (where most of the problems should be gone
because you can't change the resolution through the current fbdev
emulation) then that essentially means fbdev really needs to be
disabled in distros asap.

Disabling the entire pile of hw drivers makes sense, because that's
pretty hopeless imo.

Adding Dmitry to confirm.

-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
