Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D410E5;
	Mon, 20 Mar 2023 06:00:33 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id x3so42189898edb.10;
        Sun, 19 Mar 2023 23:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679292031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=veambP/By7T5Hxu034EoGJJmumyAD0rK44yBNqBMtSc=;
        b=ZfqY/sPPBLmpM1WFQaCN82+dSR+sonNJlaXCm6BYYPValO7L/LicEtKeJdaf9z57rt
         dQP6fBj3db757NpmkfKJoZFwQoooxy8fAcTOtZNhruCc5S1Plme5KPaS3taICwr/22Ng
         DDgCATQ1kkfL9kPqcQ78+vBtVlz8GGaOJMWiTOe8hWr97LBkAAWMQ71dinUO0XPQp4Gk
         otB1AGvQ9nFVy9yu8CkIM5gSfspIatjejJPKAT2Y0vDREx2+bzg57zsDWebVpYAaGzES
         A26FmZjVLSsQt+N2Qcw0TGcgxdXv+P+x5HuXd3s+E5QQj/VkFs3/RWe05Qrd8K+KnAs7
         uANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679292031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=veambP/By7T5Hxu034EoGJJmumyAD0rK44yBNqBMtSc=;
        b=03rghv5aG6Qi588XD54u5bECBpwE3w2Bk9ncnA4HYxy5VBjPEDJSTbApeSn4EZMQOA
         bF78HUjSns57LhRlhAaHhTm1Np4TKR2jb8H3zG/x577G+E+cxLMcmpDQHX6NWoDzHcnC
         a+M0KHTwh2D5sz16Y9UB+eRInIiOpU1H8cV0uYzbotOr4BXnTsvz5r54B+TMvwWGEvZe
         qDzSBsNiS2QJr/vL63WfaW87UzHz+hwrE3LjxJYlYS38fnPAh2GyYuZy3CahlADUsyST
         xGLfYSHRpmS7Kjua8c18YF27mVjJWNcTPVzWT2G2gLQN08vpUWacODCMDdswjfBpvBen
         ihOw==
X-Gm-Message-State: AO0yUKUpJxt2XNzPuzDaqzfAbkFdxSZ3ONVUDPMfP5QT2OLDN5ia6eIk
	prXumP9MnWPTEGiAgo+/T/iUtclidgaJFEsN
X-Google-Smtp-Source: AK7set82uAPE0wTn6SQf9hY+jxylpMl6gCp3yb96/AxvHRFD+YRO0K7lB+LJsJ41i681aYDIpc6dyA==
X-Received: by 2002:a17:906:6545:b0:930:6d59:d1f8 with SMTP id u5-20020a170906654500b009306d59d1f8mr7616940ejn.10.1679292031250;
        Sun, 19 Mar 2023 23:00:31 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id ml23-20020a170906cc1700b0092ce8344078sm3965444ejb.33.2023.03.19.23.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 23:00:30 -0700 (PDT)
Date: Mon, 20 Mar 2023 11:00:28 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBf2fNF4AC3ovR1B@khadija-virtual-machine>
References: <ZBMR4s8xyHGqMm72@khadija-virtual-machine>
 <2162728.C4sosBPzcN@suse>
 <ZBNhXc3sVVLdibUF@khadija-virtual-machine>
 <2599595.k3LOHGUjKi@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2599595.k3LOHGUjKi@suse>

On Thu, Mar 16, 2023 at 09:07:09PM +0100, Fabio M. De Francesco wrote:
> On giovedì 16 marzo 2023 19:35:09 CET Khadija Kamran wrote:
> > On Thu, Mar 16, 2023 at 05:17:47PM +0100, Fabio M. De Francesco wrote:
> > > On giovedì 16 marzo 2023 16:09:08 CET Khadija Kamran wrote:
> 
> [snip]
> 
> > Hey Fabio!
> > 
> > Hope you are doing well. After  spending a lot of time on this I am
> > stuck now. Kindly help me resolve this issue or understand it better.
> > 
> > Following your instructions I deleted my config file and copied one from
> > the /boot/ directory. After that I enabled the dependencies(CONFIG_OF=y
> > and CONFIG_HAS_IOMEM=y). I was successfully able to enable axis-fifo as
> > a module.
> > 
> > I then ran the following commands:
> >  - make drivers/staging/axis-fifo/
>

Hey Fabio!
Sorry for reaching out to you very late. For the past two days I have
had problems with my Virtual Machine. It is stuck at boot, and this
happened after it accidentally shut down. I have tried to resolve this
problem but nothing is working. Currently I have boot into an older
kernel version from the GRUB menu. 

I am also sharing the error here:
Gave up waiting for root device. Common problems:
-Boot args (cat /proc/cmdline)
  -Check rootdelay= (did the system wait long enough?)
-Missing modules (cat /proc/modules; ls /dev)
ALERT! UUID=718ed077-947d-4018-80ad-59825678e81d does not exist.
Dropping to a shell!
BusyBox v1.27.2 (Ubuntu 1:1.27.2-2ubuntu3.2) built-in shell (ash)
Enter 'help' for a list of built-in commands.

I have Windows10 installed and I have created Ubunutu 22.04.1 VM on VMWare with
13GB RAM and 2 processors(4 cores each).

(initramfs)_
> No, this is not the right command... you are not invoking the linker to make 
> the .ko object.
> 
> Use "make M=drivers/staging/axis-fifo/"
> or "make M=drivers/staging/axis-fifo/ W=1 -j8" (the latter to enable level '1' 
> warning and run on your 2 * 4 logical cores).
>

This command gives error saying: 
scripts/Makefile.build:41: /drivers/staging/axis-fifo/Makefile: 
No such file or directory
make[1]: *** No rule to make target '/drivers/staging/axis-fifo/Makefile'.  Stop.
make: *** [Makefile:2028: /drivers/staging/axis-fifo] Error 2

> >  - sudo make modules_install install(this command took hours) :'(
> 
> This is odd, it shouldn't :-/
> 
> As I said in another message, I'll set aside some time to help you check if 
> you need to fine tune your VM and Hypervisor configuration. 
> 
> I'm returning on the same subject we have been talked about because you said 
> at least twice that your builds and install are too slow. We'll try to 
> diagnose it in an IRC session on #kernel-outreachy (I'm pretty sure for the 
> first days of next week - I'll send an invite).
>

Yes I would love that. Kindly help me with this.
Thank you!

Regards,
Khadija Kamran

> > > When you are done with build, install, and final reboot to test if your
> > > module can "modprobe" or "insmod" (i.e. link with the running custom 
> kernel
> > > you built, installed and boot), try to compare the output of the following
> > > commands:
> > > 
> > > # uname -a
> > > Linux suse 6.2.2-1-default #1 SMP PREEMPT_DYNAMIC Thu Mar  9 06:06:13 UTC
> > > 2023 (44ca817) x86_64 x86_64 x86_64 GNU/Linux
> > 
> > The above command works
> > 
> > > AND
> > > 
> > > # modinfo <name of the module you are testing here>
> > 
> > On running 'modinfo axis-fifo' I get error saying module axis-fifo not
> > found.
> 
> Try again after building with "M=drivers/staging" (as said above). Don't 
> forget to run "make modules_install install" and then reboot into your custom 
> built Kernel, not the distribution's kernel.
> 
> While you are there, run "lsmod" to see all loaded modules. Pick one randomly 
> from the output list and run "modinfo name_of_the_module_you_want_info_about".
>  
> > > I'm running "modinfo kvm" (but showing only two of many lines):
> > > 
> > > # modinfo kvm
> > > filename:       /lib/modules/6.2.2-1-default/kernel/arch/x86/kvm/
> kvm.ko.zst
> > > vermagic:       6.2.2-1-default SMP preempt mod_unload modversions
> > > 
> > > Can you see that the kernel in "uname -a" and the filename and vermagic 
> have
> > > the same "6.2.2-1-default"? Well, so I'm sure I'm running the right Kernel
> > > and inserted the appropriate "kvm" module.
> > > 
> > > Furthermore, before rebooting your custom kernel, you may also look at the
> > > directory in the Kernel where you compiled your module and search for 
> "*.o"
> > > "*mod*" and "*.ko" files. If you have them, you built your module 
> properly.
> > 
> > There is a "*.o" file and "*.mod" file but there is no "*.ko" file in
> > the axis-fifo directory.
> > 
> > Kindly help me with this.
> > 
> > Regards,
> > Khadija
> > 
> > > Thanks,
> > > 
> > > Fabio
> 
> Let me know if this time it works.
> 
> Fabio
> 
> P.S.: Have you had time to read that "Linux Kernel Module Programming" guide I 
> sent you the link of? You can find a lot of information about modules there. 
> I'd strongly recommend you to read it. 
> 
> 
