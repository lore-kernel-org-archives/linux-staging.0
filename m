Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464063FC4
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 18:46:28 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id 2so10397491pfo.8
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 11:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zeO+3lPYMNGwRKEtHxPKV6qic32UC3XQu55qWVNaf2E=;
        b=U7d9nH4JbXRkR8k66XIJtrEg3hUF2Dpv4j+11w8V5qWfuG08pY9cfMGuXJ3QX4yhlj
         mSBnQZRrSVT9vR0Thw7BoIw52rug0qAW/Ua2GGulnx0x/TNnKOSCT39Tt9LJnFCVq1iN
         D7rR8k7u61/VaXSr+9+WfpYyOJ5+LbK6Bx+QAXYO9BabGfD5cMGswoPXrqGVqcYdwg+x
         9yowIXRW1yk80xTIhF5JtV9IvLIJLbKnR54A4Swf1TycPcgKWXi7XPA9Kj+poql+9ul5
         Vif1g2Z4uuy83kgPVI1ZdxKrq3aecutMX18vAoRRehQrr2pyGt9eWfiUqCgKwAu7Xdzk
         4cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zeO+3lPYMNGwRKEtHxPKV6qic32UC3XQu55qWVNaf2E=;
        b=uLrGmfsOPjM1p5qp/qx9GFU4Z3KfZy9dfpD49PaTpZD83PN4ZxG4U/ewzZDXe0y5SC
         gPFSCTgmb9DH1JSzGNGAsGN3vozkOcHhRSDHwce4k2FREt98xcfPbC6Le49wuq6baOKi
         OGDwx0MsZqz2FybvHdAhX42Tt7JZ3zS1O5jxC1A3PSzxkxzIVdiPF4E4SomlUx+AmGB8
         eFoZX/GhOjRat9QDwlhHjEBIL9W4ZKbaedB+PXa7C4P1RX45Kmzy+8v2EtyMFpSa1xN/
         oYOaOtp3WcLIFSoeM0ylOjHqe2/HVQSPNvdP1Dg7XAFeZH1ki6kQCDuBmwFa7OE0qXZF
         u5zw==
X-Gm-Message-State: AOAM5339Chh7w7KCKfcleAi4kqdz9AZjevE2XGCqS0jlpSmcDz1RbK7/
	ENOwurJd+7Stjr1GkwfgQfldftino9z1WzMw0oA=
X-Google-Smtp-Source: ABdhPJybaFeJBQl9UxNtQLetqb4u2+i/Q3sHs+GdoECA4rLSiC5LjxQoBDAZyKH1Q2fmYyuJ9i/IudQNfa1PIUuO/U8=
X-Received: by 2002:aa7:9d02:0:b0:3f3:df3b:81ae with SMTP id
 k2-20020aa79d02000000b003f3df3b81aemr13380855pfp.19.1630262787711; Sun, 29
 Aug 2021 11:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829144531.c2syu4vv4s22dlg7@h510> <CAPGkw+xTFBeH-x-=dsQK-K5KjZZ7JKmQggz2s26=p7g+71kZjA@mail.gmail.com>
 <20210829164921.u5ntqk5jz2v3hlgr@h510> <CAPGkw+ypKOVsJF_Guna+9+q-+cApYzdBGHMPKKr6MAzGQtqy2g@mail.gmail.com>
 <CAPGkw+wGn1oTAO7JXXApDMm4cFfxXam913hOGnnup1nSOpcVPA@mail.gmail.com>
In-Reply-To: <CAPGkw+wGn1oTAO7JXXApDMm4cFfxXam913hOGnnup1nSOpcVPA@mail.gmail.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Sun, 29 Aug 2021 20:46:16 +0200
Message-ID: <CAPGkw+xroJmxa9i6X++un6tQFQ-3F5uMRCatzufWsdfw7cQ2LQ@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Keeping you updated. Small win. The "Symbol version dump
"Module.symvers" is missing. " error disappeared. Now I still don't
know why

ERROR: Kernel configuration is invalid."; \
echo >&2 "         include/generated/autoconf.h or
include/config/auto.conf are missing.";\
echo >&2 "         Run 'make oldconfig && make prepare' on kernel src
to fix it."; \


is still present.

How can I fix this?


Best Regards

On Sun, Aug 29, 2021 at 8:28 PM Krish Jain <krishjain02939@gmail.com> wrote=
:
>
> Basically it says "you must have a prebuilt kernel available that
> contains the configuration and header files used in the build." Since
> for the staging kernel  "make oldconfig" asked me for  more
> configurations apart from my old configuration file (as it reads the
> existing .config file that was used for an old kernel and prompts the
> user for options in the current kernel source that are not found in
> the file) . So I *don't* currently have a prebuilt kernel that
> contains all the configuration in my staging kernel's .config file. So
> do I have to build the kernel once before I can just build the module
> with "make CCFLAGS=3D-Werror W=3D1 M=3Ddrivers/staging/android" ?
>
>
> Thanks again
>
> On Sun, Aug 29, 2021 at 6:56 PM Krish Jain <krishjain02939@gmail.com> wro=
te:
> >
> > On Sun, Aug 29, 2021 at 6:49 PM Bryan Brattlof <hello@bryanbrattlof.com=
> wrote:
> > >
> > > On this day, August 29, 2021, thus sayeth Krish Jain:
> > > > > >
> > > > > > Hi, what option do you mean?  I already ran make allmodconfig a=
nd sudo
> > > > > > make modules_install install and then make   "CCFLAGS=3D-Werror=
 W=3D1
> > > > > > M=3Ddrivers/staging/android/" and now I do get output but one l=
ine
> > > > > > "WARNING: Symbol version dump "Module.symvers" is missing. Modu=
les may
> > > > > > not have dependencies or modversions. You may get many unresolv=
ed
> > > > > > symbol warnings." . Then I tried "make CCFLAGS=3D-Werror V=3D1
> > > > > > M=3Ddrivers/staging/android/" and that outputted the following:
> > > > > >
> > > > >
> > > > > Most of the answers you're asking for are going to get vague resp=
onses
> > > > > (if any) on the mailing lists. The idea being (and I agree with) =
that
> > > > > giving out the answers will steal your opportunity to explore and=
 learn
> > > > > the material yourself.
> > > > >
> > > > > Yes, it would be faster if we told you the answer, but ultimately=
, we
> > > > > would be doing a disservice to you.
> > > > >
> > > > > Besides, more times than not we (me especially) don't have the an=
swer.
> > > > >
> > > > > With that said, I will give a (generous) hint. :)
> > > > >
> > > >
> > > > Hi. Do I have to build the kernel once before this works? Or can I
> > > > just build a module directly?
> > > >
> > >
> > > Again, do not allow others to rob you of learning how to solve these
> > > issues yourself. I *strongly* encourage you to familiarize yourself w=
ith
> > > the Kernel Build System in the Documentation.
> > >
> > >   https://www.kernel.org/doc/html/latest/kbuild/modules.html
> > >
> > > Specifically the first paragraph of "2. How to Build External Modules=
"
> > >
> > > It may seem like a lot for such a simple issue but it *is* worth it.
> > > ~Bryan
> > >
> >
> >
> >
> > That section says
> >
> >
> > "To build external modules, *you must have a prebuilt kernel
> > available* that contains the configuration and header files used in
> > the build. Also, the kernel must have been built with modules enabled.
> > If you are using a distribution kernel, there will be a package for
> > the kernel you are running provided by your distribution.
> >
> > An alternative is to use the =E2=80=9Cmake=E2=80=9D target =E2=80=9Cmod=
ules_prepare.=E2=80=9D This
> > will make sure the kernel contains the information required. The
> > target exists solely as a simple way to prepare a kernel source tree
> > for building external modules.
> >
> > NOTE: =E2=80=9Cmodules_prepare=E2=80=9D will not build Module.symvers e=
ven if
> > CONFIG_MODVERSIONS is set; therefore, *a full kernel build needs to be
> > executed to make module versioning work.*"
> >
> > So I am just trying to confirm with you whether I have to first build
> > the kernel with like "make" or not? As you can imagine my hardware
> > takes *very* long to build a kernel as I did in my last attempt so I
> > am asking whether it is needed. Hope you understand.
> >
> > Best Regards
