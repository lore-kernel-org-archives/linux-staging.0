Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5070572
	for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 09:52:54 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id x16so7965635pfh.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Aug 2021 02:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pd1wCrv5QkKvtZBw69zGwhPRLcGnV5BAovXo/G5QtIQ=;
        b=utyuOi3XCxSXBhZgl5UWLcgYduC30cmHQZSw/E2Y+S2UCPBEObLDDqpQjfl9N7xaDJ
         dKNDujezutBIeMT6i+GA7B6gWr/RSr9Z90OpbezRMdwyXeijpb5QR61OnNvBUM5lczDr
         Dhc32SX+qFDRG3bEzoKz035GLN1lKJtco/4+08GKge7tSTFjLKcTI+e5vwiEnEHK2txR
         4EX0ttwj6KBETNkzEIzHtBxmmLXPPsPlBX5j0c9s4+tzVpV6RUqt9+I5DXB0c63pQNhL
         AcBWv3nxbPgn+uo7TQN9tJ+qDFOz1A4agl2vgyfgtJp+Z04noT6ybsbLhrfN0dn7eVGJ
         LoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pd1wCrv5QkKvtZBw69zGwhPRLcGnV5BAovXo/G5QtIQ=;
        b=l4cuC/gwPGoK0PpGwAOluuLxW4CipLnoP2/S+RY7RbnbjxOBWzEd0OyHmbhazd26Nm
         2is1/Fkc6gadFq1Uov74zZx4xMjnKWQ5+b9P2rWwn33NEuDzlh6rOnG3Py8P4xBQabLd
         /0GvmQv8/QU2usx21iN1CtU10+1YJSV66CsyJqt2ag1wQxqdmp3e/uCACWcPPuhAA8qm
         s14LugGqZKV9LmUyHRLLfuhletZkTK3LGuAdWacfXmtQDugeNV9ujfJNjRSZIpkH/4Vi
         3SWneT7qVJ873Dv3PnEeHQQUg4qSZcU0fM/xUZ0KYfHPx0nCWaudYXPMpeygpuTAlqYA
         yBVw==
X-Gm-Message-State: AOAM532+dUCn0gPQQKIDBI/5ukDnDm5VTSnowL9ZWmUMnQcaOY3P4rI1
	xiJHYxAhaLu7lx9Ik1VSwXIEn3UzZyZ1cj/ye5Y=
X-Google-Smtp-Source: ABdhPJyPqZAqmbXScWQg5cLYruq4coSBIYlnDbPPp1EHZ1lnp9ZAUAaJ6r8PevXIREe5PV5n0Ogu1rd5PVi8xD4MgVc=
X-Received: by 2002:a63:fd12:: with SMTP id d18mr11813885pgh.129.1630144373739;
 Sat, 28 Aug 2021 02:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPGkw+x+B1731SL=afoSKiWwH-n-FA5YJ+WOwYdv8iyFhWk1zA@mail.gmail.com>
 <3634721.RBzQ2xsved@localhost.localdomain> <1742120.GgyQvu0Ciu@localhost.localdomain>
 <CAPGkw+yJ=V0OwFE+uqCeWWS8JbJD=YBE3+Uk-OKpmHRnvSTh+A@mail.gmail.com>
 <CAPGkw+w-y+iC3dMDLxi8DR3N+jf8roiJ2Vs_-uHxJ=i57eTiUA@mail.gmail.com>
 <CAPGkw+zyj4e-m19KdrHpAN_vHksNDy=k_cPPAftSN-hNoph0=w@mail.gmail.com>
 <20210827233835.px4az5hyqks2n4o5@h510> <CAPGkw+wq6LcVXSmuoDcTqOo=ULBBT_4DVXqXnpf7S5GW3Vzy2w@mail.gmail.com>
 <YSoF+VcDuW/2ojjF@kroah.com>
In-Reply-To: <YSoF+VcDuW/2ojjF@kroah.com>
From: Krish Jain <krishjain02939@gmail.com>
Date: Sat, 28 Aug 2021 11:52:39 +0200
Message-ID: <CAPGkw+wcZRcr0W2ay6ZJY5yW7-EEMpK-yH-3j=UkDpj3kA-ySg@mail.gmail.com>
Subject: Re: [PATCH] Declare the file_operations struct as const
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 28, 2021 at 11:46 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
> http://daringfireball.net/2007/07/on_top


Now I get it. I've never used this style of email ever before so am a
novice. Forgive me. Also I didn't get what you mean should I include
quotations after my reply?

> On Sat, Aug 28, 2021 at 11:37:50AM +0200, Krish Jain wrote:
> > Hi. Thanks for your response. Changing to  "const static" would fix
> > the first error but looking at the second error indicates that it
> > can't be a const, right? So checkpatch.pl was wrong?
>
> checkpatch.pl is a perl script that does its best here.  You always have
> to then look at the code itself to see if what it is asking you to do is
> correct.
>
> And you always have to at the very least, test build your changes to
> verify that they do not break anything.
>
> thanks,
>
> greg k-h

Thank you so much. I didn't realize that I could have tested it by
just building the driver and not the entire kernel. Anyway, I'd still
love to learn more and contribute to the kernel. Where can I find
"small fixes" I can make?


Warm Regards,

Krish
