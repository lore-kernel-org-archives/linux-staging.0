Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E3C290C;
	Thu, 16 Mar 2023 10:47:10 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id o12so5666490edb.9;
        Thu, 16 Mar 2023 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678963629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x0Hz8WEisYpXzdaGIOrR9Jz4SMQvRVP+qmKy5k8p/+k=;
        b=kgPjSuUGnFwfvJ+RVYe41N6bfrfzJ8NCKYIEqezBjWtnOOSbFbeZIdd113JTVgSoy3
         fFDEjz7M2SpPa0y60cDrjxmOlL3KpMTqnm59E/eMkKSVoVyphAVA8d87T1qZUi2xPw20
         LIfzxkqrA+pVL0hitGOoN/AipjICg+YQACCwxeK5K5mb/TDbxIfEej47gSTfLeUKvtDS
         v/LVVJQFxcDI9i8LiQdsaDpYMw6mWQtzAPQq5F/Eb2cMSdX4EXJmqSPMlUjrpfhVLKR1
         Wcc3kUh+Wox/wtorvpa4QliWK+EWjjP5fnxJUecDY4Lxs6SnM3TnAB8020Rwl9l4UvX4
         J7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678963629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0Hz8WEisYpXzdaGIOrR9Jz4SMQvRVP+qmKy5k8p/+k=;
        b=XnKls8bNFXKY1wTgiBjQuoZjAveJOIFATZrnq9EvBqbO9D37LbNM0cBm57KrNTAuP6
         TMZoxkjmYfiGMRR3MGWW29bUtaRfQXJ3Fjci05BK3ERJk2sSShTuZjSXso9bW9QpkSJi
         P7oW5ALTdNpp31dfALgO5K1aWv9BquAQ3fzQN34AP8lwSpnjuFAa6i/Xf2Bd4AvIX/WX
         13UwhHP4iEKAoHILXdDgL5j3H3XYYE4BNPDZK0EswTjDPOhvHA8TEBdjnClnZgrHpFqW
         rH7lyr7VlWJRLsZOsgwbWHyw8hlP7Y4fys0wKoJ7+0v4eNhMReMAJ4VC6tphJrFDhk48
         em6Q==
X-Gm-Message-State: AO0yUKUM25ifHBVvJnwhDrLmfGP1mKucjlOc+/kb+CtzlyJyeh549ZLY
	ixQdm+JSZZI/nt4xMO5PRkc=
X-Google-Smtp-Source: AK7set9Ghuk38qFrCd7UZPlxT0cJW0TSdoF4+CTSlvgN9v5vWe7cm1yd5d5jEnhPxf2V+6+R/ZvBzQ==
X-Received: by 2002:a17:906:fe07:b0:92d:2119:65cf with SMTP id wy7-20020a170906fe0700b0092d211965cfmr10640318ejb.74.1678963629037;
        Thu, 16 Mar 2023 03:47:09 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id sc38-20020a1709078a2600b00921278f4980sm3650880ejc.34.2023.03.16.03.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 03:47:08 -0700 (PDT)
Date: Thu, 16 Mar 2023 15:47:03 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBLzp62n1rNgySdn@khadija-virtual-machine>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
 <ZBEJ+8DbhADSBTLr@aschofie-mobl2>
 <ZBG699SriXWy1I2K@khadija-virtual-machine>
 <16148020.1MiD057Pog@suse>
 <ZBHUr7bANuhnOnIV@khadija-virtual-machine>
 <20230315150656.GA2938956@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315150656.GA2938956@dev-arch.thelio-3990X>

On Wed, Mar 15, 2023 at 08:06:56AM -0700, Nathan Chancellor wrote:
> Hi Khadija,
> 
> On Wed, Mar 15, 2023 at 07:22:39PM +0500, Khadija Kamran wrote:
> > On Wed, Mar 15, 2023 at 02:34:31PM +0100, Fabio M. De Francesco wrote:
> > > Aside from what I said and asked for with the other message of this same 
> > > thread, please take note that you can build a specific module if you prefer 
> > > not to re-build the whole kernel and other modules at the same time. 
> > > 
> > > I'm pretty sure that the instructions to do so are in the OutreachyFirstPatch 
> > > tutorial.
> > > 
> > > If they are not there, please let us know.
> > > 
> > > Fabio
> > 
> > Hey Fabio!
> > 
> > In the Outreachy FirstPatchTutorial under the 'Compiling only part of
> > the kernel' section there are ways to compile only some part of the
> > kernel.
> > 
> > I have tried using "make W=1 drivers/staging/axis-fifo/" and it says
> > 'nothing to be done for'. 
> 
> Is CONFIG_XIL_AXIS_FIFO enabled in your configuration?
>

Hey Nathan!
Thank you for all the help. 
'Xilinx AXI-Stream FIFO IP core driver' option in my menufig shows [*]
and I cannot change it to ['m'] following all the intrustcions in
OutreachyFIrstPatch step by step.

> > Should I start with the steps to reproduce? :'(
> 
> I did see a report of this same warning occurring with GCC but the
> report I commented on cane from clang/LLVM; using that toolchain may
> make it easier for you to reproduce this issue. The robot's reproduction
> instructions are fine but I think doing it manually is actually simpler.
> 
> Ubuntu 22.04 should have a pretty modern version of clang/LLVM, which
> you can install via 'sudo apt install clang lld llvm'.
> https://apt.llvm.org is another resource.
> 
> First, we will grab the configuration that was provided in the report:
> 
> $ wget -O .config https://download.01.org/0day-ci/archive/20230314/202303141159.6wN9HNP9-lkp@intel.com/config
> 
> Next, we want to make sure the configuration is synced, since we are
> technically changing compilers:
> 
> $ make -j"$(nproc)" ARCH=arm64 LLVM=1 olddefconfig
> 
> Finally, you should be able to build that object file and see the
> warning:
> 
> $ make -j"$(nproc)" ARCH=arm64 LLVM=1 drivers/staging/axis-fifo/
>

It did not show any warnings. A followed all your instructions step by
step.

Thanks again!

Regards,
Khadija

> drivers/staging/axis-fifo/axis-fifo.c:817:18: warning: implicit conversion from 'long' to 'int' changes value from 9223372036854775807 to -1 [-Wconstant-conversion]
>                 read_timeout = MAX_SCHEDULE_TIMEOUT;
>                              ~ ^~~~~~~~~~~~~~~~~~~~
> ./include/linux/sched.h:296:31: note: expanded from macro 'MAX_SCHEDULE_TIMEOUT'
> #define MAX_SCHEDULE_TIMEOUT            LONG_MAX
>                                         ^~~~~~~~
> ./include/vdso/limits.h:11:19: note: expanded from macro 'LONG_MAX'
> #define LONG_MAX        ((long)(~0UL >> 1))
>                          ^~~~~~~~~~~~~~~~~
> drivers/staging/axis-fifo/axis-fifo.c:822:19: warning: implicit conversion from 'long' to 'int' changes value from 9223372036854775807 to -1 [-Wconstant-conversion]
>                 write_timeout = MAX_SCHEDULE_TIMEOUT;
>                               ~ ^~~~~~~~~~~~~~~~~~~~
> ./include/linux/sched.h:296:31: note: expanded from macro 'MAX_SCHEDULE_TIMEOUT'
> #define MAX_SCHEDULE_TIMEOUT            LONG_MAX
>                                         ^~~~~~~~
> ./include/vdso/limits.h:11:19: note: expanded from macro 'LONG_MAX'
> #define LONG_MAX        ((long)(~0UL >> 1))
>                          ^~~~~~~~~~~~~~~~~
> 2 warnings generated.
> 
> Just repeat the last step as you investigate. If you have any further
> issues or questions, please let me know. For the record, I am not
> associated with Outreachy (I am one of the maintainers of clang/LLVM
> support in the kernel), so if I have messed something up or overstepped
> some boundary, I do apologize.
> 
> Cheers,
> Nathan
