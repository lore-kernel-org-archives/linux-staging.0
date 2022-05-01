Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8A32C9E
	for <linux-staging@lists.linux.dev>; Sun,  1 May 2022 20:29:34 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id bn33so16356729ljb.6
        for <linux-staging@lists.linux.dev>; Sun, 01 May 2022 13:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0WCdfVPEiIZbfwmSuN4pUHlfdRjDkBGXXq+S9mIzLMw=;
        b=aBHtGzDZ4qi+VE9Rk91uFJa58dwO9qAdJDh6FRARUFdk71fL/zPNFxPSkRoP9NeGmh
         s9YO/oxx/Ryl4lRK21Q6tW951kP/GrzfpZH1lTBoQ7lbQzLLSuxJCp6C7aOPJXlCO6Ne
         mDj53KCXjFDgtdoxLNONkrBR+GF1izY1YvzO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0WCdfVPEiIZbfwmSuN4pUHlfdRjDkBGXXq+S9mIzLMw=;
        b=hprySmWQqCHci05P1D7mEqZ9Pzx2zykc1Ms7AeGlDQ7I/HpvpheutnKeJQUySD8iNI
         U7KSshseQfBqRfKY8Z+yYzuAkP9VnHLHWvaEyeKJiruJeB4IJRmtxgN94mO042offhcQ
         GQQiEKkJwOyaTLf4vrtx9vUIdFZCp2Ntbj6GrbaSZpaFotqvIcprlF3m73KKH+laQWPY
         gjwS4IbC6GlWXEGdO5QJflAJtxGUOBkSHqxPB1TDCvbMD3KwAceYzTEWdkJu1CXWps0e
         nCjKujZMMt8teX/OjJcHnngbU3mk81rqhw7xcOprR/wBLJKY8WdZmX9TNWg85B9npyZD
         485w==
X-Gm-Message-State: AOAM531HJY/SDStBpuW/xsNq+4iag8CgkDp5ZrlCqTpLZ/SPwnfBeW2c
	7uMXb2J7SijWuU61tUp10beaN7vlQIW3xPMauEcOZQ==
X-Google-Smtp-Source: ABdhPJwq0bqP3CIpf7H7b5QMwov+3I4DdcADmIkwqdINAd18fkcLIrD4+yERs89l89xgBUyELXGd+WMuVUjSjvUU+fA=
X-Received: by 2002:a05:651c:890:b0:248:5819:b949 with SMTP id
 d16-20020a05651c089000b002485819b949mr6240103ljq.476.1651436973033; Sun, 01
 May 2022 13:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOFRbG=mGdbR72moLtW87ZQW_T1HkhZtcpHRGzZy3NZ7afGVqQ@mail.gmail.com>
 <CAHk-=whXp7Ps9ML5ThsX1tvdRg6SKRH3r6MM1-EA_Y8-n+6v2A@mail.gmail.com>
In-Reply-To: <CAHk-=whXp7Ps9ML5ThsX1tvdRg6SKRH3r6MM1-EA_Y8-n+6v2A@mail.gmail.com>
From: Ozgur Karatas <ozgurk@ieee.org>
Date: Mon, 2 May 2022 00:29:21 +0400
Message-ID: <CAADfD8wdze1z4UX4w54hkumziwD0huJTxYVY+ojkOAXuVa1E=Q@mail.gmail.com>
Subject: Re: [5.18.0-rc4+] report: kernel compile
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ozgur Kara <zgrieee@gmail.com>, linux-staging@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 2, 2022 at 12:13 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, May 1, 2022 at 12:44 PM Ozgur Kara <zgrieee@gmail.com> wrote:
> >
> > Samsung RC530 (notebook) - FAIL (1)
> > Raspberry PI Model B - FAIL (2)
> >
> > Fail Log:
> >
> > + nvidia driver fail.
> > + scripts/Makefile.build:497: recipe for target 'arch/arm/kernel' failed
>
> Is there full information available somewhere?

Hi Linus,

this was an e-mail that automatically tests and informs on existing
hardware now i'm interested understanding issues because i wanted to
see if its kernel related or not, both seem to be caused by drivers
and in both of them driver was used with dkms (nvidia and rtl8812au
wireless).

I will be setting up the bot to send mail with details only in the
perpetrator and perpetrator logs.
Sorry, Regards.


  NVIDIA driver fail output:

nvidia-legacy-390xx-uvm.ko:
 - Uninstallation
   - Deleting from: /lib/modules/5.10.0-13-amd64/updates/dkms/
 - Original module
   - No original module was found for this module on this kernel.
   - Use the dkms install command to reinstall any previous module version.

depmod....

DKMS: uninstall completed.

------------------------------
Deleting module version: 390.144
completely from the DKMS tree.
------------------------------
Done.
Loading new nvidia-legacy-390xx-390.144 DKMS files...
Building for 5.18.0-rc4+
Building initial module for 5.18.0-rc4+
Error! Bad return status for module build on kernel: 5.18.0-rc4+ (x86_64)
Consult /var/lib/dkms/nvidia-legacy-390xx/390.144/build/make.log for
more information

   Raspberry PI fail output:

dkms build -m 8812au -v 5.6.4.2_35491.20191025

Kernel preparation unnecessary for this kernel. Skipping...

Building module:
cleaning build area...
'make' -j4 KVER=5.18.0-rc4+
KSRC=/lib/modules/5.18.0.-rc4+/build..........................................(bad
exit status: 2)
Error! Bad return status for module build on kernel: 5.18.0-rc4+
make: *** [Makefile:2304: dkms_install] Error 10

>
>             Linus
