Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B1F72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 16:49:48 +0000 (UTC)
Date: Sun, 29 Aug 2021 16:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanbrattlof.com;
	s=protonmail; t=1630255780;
	bh=2ff+10G4Dt6XXoNpjZ+1qlAIxYbBmewJrQRU+zrTaMM=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=ds5M/OHkjvRmXC+YKe3MbnlIvxCbNG/SyqbVp7UmhAc5iTIdfHl6sguKo+1p/fu8w
	 JXYlMZRVcjcjk68IhLoxf8uVZR2m5UQ4N+PXnSC2UHcE1YHDlkZZmhOtkZxfunF1go
	 3ax48pTGL2F2WhtscwoyEx/koTs+TE0rg4Jo1C5BfQLkIRNRPC918Ewbg+i/qEJgYT
	 mO4U6H4wNytuS8QFqLm0irovV6fOB10Z0SGaOIjG7FeYHJDWG7jTreHFVKZeJ59qg3
	 OhuWJFWwIey5Wk7exoSh2KmTlzm+8ZnHJjUlqAObP/KcSDd6oDE8bTVXsIHhmwza0S
	 0t2z6jco/pWHA==
To: Krish Jain <krishjain02939@gmail.com>
From: Bryan Brattlof <hello@bryanbrattlof.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Reply-To: Bryan Brattlof <hello@bryanbrattlof.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
Message-ID: <20210829164921.u5ntqk5jz2v3hlgr@h510>
In-Reply-To: <CAPGkw+xTFBeH-x-=dsQK-K5KjZZ7JKmQggz2s26=p7g+71kZjA@mail.gmail.com>
References: <20210829144531.c2syu4vv4s22dlg7@h510> <CAPGkw+xTFBeH-x-=dsQK-K5KjZZ7JKmQggz2s26=p7g+71kZjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

On this day, August 29, 2021, thus sayeth Krish Jain:
> > >
> > > Hi, what option do you mean?  I already ran make allmodconfig and sud=
o
> > > make modules_install install and then make   "CCFLAGS=3D-Werror W=3D1
> > > M=3Ddrivers/staging/android/" and now I do get output but one line
> > > "WARNING: Symbol version dump "Module.symvers" is missing. Modules ma=
y
> > > not have dependencies or modversions. You may get many unresolved
> > > symbol warnings." . Then I tried "make CCFLAGS=3D-Werror V=3D1
> > > M=3Ddrivers/staging/android/" and that outputted the following:
> > >
> >
> > Most of the answers you're asking for are going to get vague responses
> > (if any) on the mailing lists. The idea being (and I agree with) that
> > giving out the answers will steal your opportunity to explore and learn
> > the material yourself.
> >
> > Yes, it would be faster if we told you the answer, but ultimately, we
> > would be doing a disservice to you.
> >
> > Besides, more times than not we (me especially) don't have the answer.
> >
> > With that said, I will give a (generous) hint. :)
> >
>
> Hi. Do I have to build the kernel once before this works? Or can I
> just build a module directly?
>

Again, do not allow others to rob you of learning how to solve these
issues yourself. I *strongly* encourage you to familiarize yourself with
the Kernel Build System in the Documentation.

  https://www.kernel.org/doc/html/latest/kbuild/modules.html

Specifically the first paragraph of "2. How to Build External Modules"

It may seem like a lot for such a simple issue but it *is* worth it.
~Bryan

