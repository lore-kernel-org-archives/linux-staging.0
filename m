Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A45669;
	Wed, 15 Mar 2023 16:42:30 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id cy23so77834854edb.12;
        Wed, 15 Mar 2023 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678898549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s2zZ+qS7JXhqAHFfOrjSrvxFCZYvAc/AtrFDzlHxzgQ=;
        b=C44ZNFkrw/cC3QvoPM0ptdhPv3/AF19dgxA5CtW9UEaV/5gWUX1XMUBbehM9EX551W
         3kc5mSzwiO1sOohsBT9mrzjJ+Y7jYAwDmb1ApDvraDeLapzmAtoRAaJerDCVak0bf2rl
         VOANyjsyE+mno6joaHywe+TiGkLvlQUPHX211Hiyjes1b19Y8m70XGwrdbg8B6eJkVoU
         gE2vq/wDKDLHXKyJEZG9O2whHKqJGUrUJ6+r3Xd4hkxi6PhNA8aGuYt8kqFysO4Ij0I+
         xF/o8S2LCUdGbvkrK5XrFxZF9FTLN24LHNYY5eSFgwWPp4me/Mgv74rAWUTu8rXhekGu
         /1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678898549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2zZ+qS7JXhqAHFfOrjSrvxFCZYvAc/AtrFDzlHxzgQ=;
        b=ehbRDe7QN4H+V3icmWqZ7zE3GDfHAIL2jdwwqy+Wx7Hr5+6WJ4SrQ1oVqVtbTU2NFR
         dPNrjDytnU54w+ZXiBUjODl+1nZg/zgWHItukvo4Rsh6CyijL/Wsd94Fbn+bCc+NRPS8
         CkqD3eXqVq57yr/IhsP8xUA0/VnHDRZCnVR7XluBpZwFObfox63509OI4GjutFWLU5rW
         8Delmbo/+V+zKUrOO0mEspBsry+YUR9IjEfjConhzi7m2rGMKhR0CdrvEu3ras/6QAMO
         AF9zIFvklpBtnFxH7VLi+exuXhM8XsfpwkNYeGnirXEJKv/uffYfOHWeyAtSB6I/Dxnz
         YVOw==
X-Gm-Message-State: AO0yUKU4b+UwqIg0g61rWKhjL0MxetGjDbhXEcBMBy7VgHgCo9zszWQP
	mWJ0tsTeFFywmbcQQgijsz4=
X-Google-Smtp-Source: AK7set+KiEq4DeAanZxaTVwhRvEVxe+7sEdv+cArt2WJQ7Eon9DS2b90wTpN13CsYuiJEl0ERadPWw==
X-Received: by 2002:a17:906:e206:b0:8b1:bab0:aa3d with SMTP id gf6-20020a170906e20600b008b1bab0aa3dmr7170114ejb.8.1678898548907;
        Wed, 15 Mar 2023 09:42:28 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id z19-20020a170906271300b008cda6560404sm2729912ejc.193.2023.03.15.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:42:28 -0700 (PDT)
Date: Wed, 15 Mar 2023 21:42:26 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBH1cmB2dVAi42Gs@khadija-virtual-machine>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
 <ZBEJ+8DbhADSBTLr@aschofie-mobl2>
 <ZBG699SriXWy1I2K@khadija-virtual-machine>
 <16148020.1MiD057Pog@suse>
 <ZBHUr7bANuhnOnIV@khadija-virtual-machine>
 <ZBHtrGjgKOiVwjSF@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBHtrGjgKOiVwjSF@aschofie-mobl2>

On Wed, Mar 15, 2023 at 09:09:16AM -0700, Alison Schofield wrote:
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
> > 
> > Should I start with the steps to reproduce? :'(
> 
> Khadija,
> 
> I've applied your patch and it fails to compile with the warnings
> that LKP reports.
> 
> If you are doing: $ make drivers/staging/axis-fifo/
> 
> and it is saying 'nothing to be done...'
> 
> You either have not changed anything since the last compile, or you
> do not have the module configured.


Hey Alison!
I might've written the statement wrong. Actually, here is the output of
make drivers/staging/axis-fifo

YACC    scripts/genksyms/parse.tab.[ch]
  HOSTCC  scripts/genksyms/parse.tab.o
  HOSTCC  scripts/genksyms/lex.lex.o
  HOSTLD  scripts/genksyms/genksyms
  CC      scripts/mod/empty.o
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  CC      scripts/mod/devicetable-offsets.s
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CC      arch/x86/kernel/asm-offsets.s
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  DESCEND bpf/resolve_btfids
  INSTALL libsubcmd_headers
make[3]: Nothing to be done for 'drivers/staging/axis-fifo/'.


> 
> I suspect it has never compiled for you and you need to look at
> the direction in the tutorial for 'Recompiling the driver' section
> and learn how to use make menuconfig.
>
> This driver has a couple of dependencies described in the Kconfig
> file. You will not even see the 'XIL_AXIS_FIFO' option until you
> turn on 'OF' and HAS_'IOMEM'.
> 
> See the drivers/staging/axis-fifo/Kconfig
> 
> Please confirm that you have compiled the driver before chasing
> after the build env that lkp reports.
>

Sorry, I made a mistake here.

I did not change the driver 'Xilinx AXI-Stream FIFO IP core driver' to
being compiled as a module by typing 'm'. 
Is that the problem here?

Also, now when I try to change it by pressing 'm', it is not working.
And I have tried many times but I cannot change the driver from '*' to
'm'.

Thank you!
Regards,
Khadija


> Thanks,
> Alison
> 
> 
> > 
> > Thank you!
> > 
> > Regards,
> > Khadija
> > 
> > 
> > > 
> > > 
> > > 
