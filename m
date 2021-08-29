Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4105872
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 18:28:45 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id m17so7221707plc.6
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 11:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ag9D8N0fhBIrol0HNSilfA7AMgyYglE49DL9RoGRtsU=;
        b=svC4gFefGSS+cR/UbjmxUfdMp4uT7qfQz8vBEFSDJvv4yVkNw0lAR+cIyAtZtpP2JY
         YDR7PG68+OREMz6GdOh3hpGjHgSDOJ/f/UfvY69fPcQNFd/tKoDj3NeNxCktR3aTXslN
         zW4YMJQLpozi/SQEpm28Eg0O1bwgZd4ImCpgIj8sbIbLb2XR9ApTzHS7rn+UgrXyY11c
         Htn0XXrmIJeFwBNpHLQj3Umhj1xYQ5jJ9SSBNql24qUHoznRI59RCpX8m5i0ZZhfznBM
         vxrVz30o3NSlRUMd/a/OzVBURD31TFeMn2kSoIuy29KITTOOuhmXMemM8eDQuC71ImF/
         B5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ag9D8N0fhBIrol0HNSilfA7AMgyYglE49DL9RoGRtsU=;
        b=Dp3luhrzKC0dhCXPRlp6FcQEWxSVI5tFHwssoOMFC4uuqEG5kFvgCqa/D3mfdvIhzP
         r3SzlRNr6ZvlvqrCXIieqXseIPdfwxVKt+74hnhnWAQ97MfIpEhDQRsmdXegKk2ZfKmP
         zFwbijgI4MMDEHTvqQLRS/IGVteixBfAWk6mP1V8YTKoU5gftYUrtKkFzzwW6qeL3Pip
         ILgO+tBJrBh+85qOpjETY/iMx3SiDvxvB2wNiay389HLJYcPz44zHJWEzDP1xVeTDwOS
         ec6hazPuS8o0feLweqyGoZBcU/Tkd5NT8kwen/uzdjoRXnvqZb/kH114GSjcfJiSFhbS
         ANIA==
X-Gm-Message-State: AOAM533bMGcMGGHu+e2nXCQvIdjSkkKrFUjm+wUgmdBfMZrVcZdWmu/7
	7V53Sq5PjmRKQEGXtlch8MvBYAJEnoDWx+oq0IA=
X-Google-Smtp-Source: ABdhPJxILhmsT/D4BB4XHvQ4sLJiXMQUnZttdEevpvWn2M3282wW2knpdWHPjJtqDm+pn4FTHFSDu2sVyR65npqsmIM=
X-Received: by 2002:a17:90a:ec0a:: with SMTP id l10mr373574pjy.26.1630261724681;
 Sun, 29 Aug 2021 11:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829144531.c2syu4vv4s22dlg7@h510> <CAPGkw+xTFBeH-x-=dsQK-K5KjZZ7JKmQggz2s26=p7g+71kZjA@mail.gmail.com>
 <20210829164921.u5ntqk5jz2v3hlgr@h510> <CAPGkw+ypKOVsJF_Guna+9+q-+cApYzdBGHMPKKr6MAzGQtqy2g@mail.gmail.com>
In-Reply-To: <CAPGkw+ypKOVsJF_Guna+9+q-+cApYzdBGHMPKKr6MAzGQtqy2g@mail.gmail.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Sun, 29 Aug 2021 20:28:33 +0200
Message-ID: <CAPGkw+wGn1oTAO7JXXApDMm4cFfxXam913hOGnnup1nSOpcVPA@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Basically it says "you must have a prebuilt kernel available that
contains the configuration and header files used in the build." Since
for the staging kernel  "make oldconfig" asked me for  more
configurations apart from my old configuration file (as it reads the
existing .config file that was used for an old kernel and prompts the
user for options in the current kernel source that are not found in
the file) . So I *don't* currently have a prebuilt kernel that
contains all the configuration in my staging kernel's .config file. So
do I have to build the kernel once before I can just build the module
with "make CCFLAGS=3D-Werror W=3D1 M=3Ddrivers/staging/android" ?


Thanks again

On Sun, Aug 29, 2021 at 6:56 PM Krish Jain <krishjain02939@gmail.com> wrote=
:
>
> On Sun, Aug 29, 2021 at 6:49 PM Bryan Brattlof <hello@bryanbrattlof.com> =
wrote:
> >
> > On this day, August 29, 2021, thus sayeth Krish Jain:
> > > > >
> > > > > Hi, what option do you mean?  I already ran make allmodconfig and=
 sudo
> > > > > make modules_install install and then make   "CCFLAGS=3D-Werror W=
=3D1
> > > > > M=3Ddrivers/staging/android/" and now I do get output but one lin=
e
> > > > > "WARNING: Symbol version dump "Module.symvers" is missing. Module=
s may
> > > > > not have dependencies or modversions. You may get many unresolved
> > > > > symbol warnings." . Then I tried "make CCFLAGS=3D-Werror V=3D1
> > > > > M=3Ddrivers/staging/android/" and that outputted the following:
> > > > >
> > > >
> > > > Most of the answers you're asking for are going to get vague respon=
ses
> > > > (if any) on the mailing lists. The idea being (and I agree with) th=
at
> > > > giving out the answers will steal your opportunity to explore and l=
earn
> > > > the material yourself.
> > > >
> > > > Yes, it would be faster if we told you the answer, but ultimately, =
we
> > > > would be doing a disservice to you.
> > > >
> > > > Besides, more times than not we (me especially) don't have the answ=
er.
> > > >
> > > > With that said, I will give a (generous) hint. :)
> > > >
> > >
> > > Hi. Do I have to build the kernel once before this works? Or can I
> > > just build a module directly?
> > >
> >
> > Again, do not allow others to rob you of learning how to solve these
> > issues yourself. I *strongly* encourage you to familiarize yourself wit=
h
> > the Kernel Build System in the Documentation.
> >
> >   https://www.kernel.org/doc/html/latest/kbuild/modules.html
> >
> > Specifically the first paragraph of "2. How to Build External Modules"
> >
> > It may seem like a lot for such a simple issue but it *is* worth it.
> > ~Bryan
> >
>
>
>
> That section says
>
>
> "To build external modules, *you must have a prebuilt kernel
> available* that contains the configuration and header files used in
> the build. Also, the kernel must have been built with modules enabled.
> If you are using a distribution kernel, there will be a package for
> the kernel you are running provided by your distribution.
>
> An alternative is to use the =E2=80=9Cmake=E2=80=9D target =E2=80=9Cmodul=
es_prepare.=E2=80=9D This
> will make sure the kernel contains the information required. The
> target exists solely as a simple way to prepare a kernel source tree
> for building external modules.
>
> NOTE: =E2=80=9Cmodules_prepare=E2=80=9D will not build Module.symvers eve=
n if
> CONFIG_MODVERSIONS is set; therefore, *a full kernel build needs to be
> executed to make module versioning work.*"
>
> So I am just trying to confirm with you whether I have to first build
> the kernel with like "make" or not? As you can imagine my hardware
> takes *very* long to build a kernel as I did in my last attempt so I
> am asking whether it is needed. Hope you understand.
>
> Best Regards
