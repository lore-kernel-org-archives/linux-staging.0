Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9597A72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 16:57:01 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id e7so11093992pgk.2
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YLvZ3sGYfQ+oBKbVK1D5xdIEOxEaX+9yoh7blhMmsNA=;
        b=g7Msz3v6Ze5CPdGMYauSyD7ARokHfkuyVOJio2FhPVX6HhbGZncTsYpF9R9O9aQ+Lh
         f1ebMTbgx5QxuW/JLHEjhtGBh0O3yhiL0mysNwZ2IM06J9gQzfKrwGRq3f0pYipM82tK
         8Md7P+Tz5t/OKKmBwJC5VJZvDmabAwbKQtLOJ+icx74HvFEW5vKw96csqz/IwjXy0ftg
         rLPSCP+fezQsLwBYcNMjcsjDWe9ogliuVnQIl/rgc+XsWSICghtzQfOJsaQ70TOt5Wpk
         pZWBc1cONHSF/EKkdjUKXt7Eqm9fsmWSkjieOzWX4UZeVVmdHF+ikiEF4My6Hc9YsGm3
         ifdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YLvZ3sGYfQ+oBKbVK1D5xdIEOxEaX+9yoh7blhMmsNA=;
        b=lYu7ysJTMYZw9GvVnI71MosPrE796o3lClh/oDN/xZukkBMXuo3dmCaN6LAOyGBp20
         l8hTqMauT2N0wny5oTn5vNuPq+hYrq8VtHt55zaycmDpA913zwN/hjzhSwhipKyPkoWn
         +OjOYtZQ9WzxQx6M0p37XnpNCR1qi5QzSf5CBkEpaphLG8H8xugHQw3v1jxzMIlUbtjm
         bRIlk89ugk7BSOJTo3BxaY81ZdjQcozECYquRlnAjETc2cTi9Yoebcp9iev/CCCoiZET
         RCAPJKc8ekn9AjPUyWOsROmRxt5oYNLs/pjxC5RrWAWN4c+A5N7KEAmaKERC0JS5gQWK
         wKtQ==
X-Gm-Message-State: AOAM531NzT+vYIAVnCe/GyQS8BiTspPuB4aHnHbp3TZTIjpzfQBnEHXD
	xtZ5r8eppXq/8r6OKA+EBwiwXPiItjt/9xURXDo=
X-Google-Smtp-Source: ABdhPJzQ0OdZ3rm2lo4nYwGvHAVStdkUBD4qFAEcbAzPEX0aqXGOMbEvcDK+fmJOPaJMnmPzy8jMJmGYECqinZyS4A0=
X-Received: by 2002:aa7:9d02:0:b0:3f3:df3b:81ae with SMTP id
 k2-20020aa79d02000000b003f3df3b81aemr13026930pfp.19.1630256221133; Sun, 29
 Aug 2021 09:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829144531.c2syu4vv4s22dlg7@h510> <CAPGkw+xTFBeH-x-=dsQK-K5KjZZ7JKmQggz2s26=p7g+71kZjA@mail.gmail.com>
 <20210829164921.u5ntqk5jz2v3hlgr@h510>
In-Reply-To: <20210829164921.u5ntqk5jz2v3hlgr@h510>
From: Krish Jain <krishjain02939@gmail.com>
Date: Sun, 29 Aug 2021 18:56:50 +0200
Message-ID: <CAPGkw+ypKOVsJF_Guna+9+q-+cApYzdBGHMPKKr6MAzGQtqy2g@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2021 at 6:49 PM Bryan Brattlof <hello@bryanbrattlof.com> wr=
ote:
>
> On this day, August 29, 2021, thus sayeth Krish Jain:
> > > >
> > > > Hi, what option do you mean?  I already ran make allmodconfig and s=
udo
> > > > make modules_install install and then make   "CCFLAGS=3D-Werror W=
=3D1
> > > > M=3Ddrivers/staging/android/" and now I do get output but one line
> > > > "WARNING: Symbol version dump "Module.symvers" is missing. Modules =
may
> > > > not have dependencies or modversions. You may get many unresolved
> > > > symbol warnings." . Then I tried "make CCFLAGS=3D-Werror V=3D1
> > > > M=3Ddrivers/staging/android/" and that outputted the following:
> > > >
> > >
> > > Most of the answers you're asking for are going to get vague response=
s
> > > (if any) on the mailing lists. The idea being (and I agree with) that
> > > giving out the answers will steal your opportunity to explore and lea=
rn
> > > the material yourself.
> > >
> > > Yes, it would be faster if we told you the answer, but ultimately, we
> > > would be doing a disservice to you.
> > >
> > > Besides, more times than not we (me especially) don't have the answer=
.
> > >
> > > With that said, I will give a (generous) hint. :)
> > >
> >
> > Hi. Do I have to build the kernel once before this works? Or can I
> > just build a module directly?
> >
>
> Again, do not allow others to rob you of learning how to solve these
> issues yourself. I *strongly* encourage you to familiarize yourself with
> the Kernel Build System in the Documentation.
>
>   https://www.kernel.org/doc/html/latest/kbuild/modules.html
>
> Specifically the first paragraph of "2. How to Build External Modules"
>
> It may seem like a lot for such a simple issue but it *is* worth it.
> ~Bryan
>



That section says


"To build external modules, *you must have a prebuilt kernel
available* that contains the configuration and header files used in
the build. Also, the kernel must have been built with modules enabled.
If you are using a distribution kernel, there will be a package for
the kernel you are running provided by your distribution.

An alternative is to use the =E2=80=9Cmake=E2=80=9D target =E2=80=9Cmodules=
_prepare.=E2=80=9D This
will make sure the kernel contains the information required. The
target exists solely as a simple way to prepare a kernel source tree
for building external modules.

NOTE: =E2=80=9Cmodules_prepare=E2=80=9D will not build Module.symvers even =
if
CONFIG_MODVERSIONS is set; therefore, *a full kernel build needs to be
executed to make module versioning work.*"

So I am just trying to confirm with you whether I have to first build
the kernel with like "make" or not? As you can imagine my hardware
takes *very* long to build a kernel as I did in my last attempt so I
am asking whether it is needed. Hope you understand.

Best Regards
