Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE19028E3;
	Thu, 16 Mar 2023 10:17:09 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cn21so5619546edb.0;
        Thu, 16 Mar 2023 03:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678961828;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=svQbsr3A3CYV2L6LBjooIlbLV7d3XJgH49nuHc0ppU0=;
        b=i2wte9xzxQ86ewcPkIDTT5ACtyIwyNOZP+WRQ+EjTN8H4N+bqfaEis7dnb0MSVwwkf
         K5pXf7htoYR++j92MyaXDET+2noRGPf0wn8BrdPV1IHI0Lzbx23B/Qnrfs3WYAG3nZjN
         eKVy6uoRgnKCMD0+UODG+FLfPNLKoZcc4arkIO7q3RuwiZVNE5b9qFFieTtlfkw8CrGs
         SODC4TzI582YgFiXsP9tAxQHxBrij4dJ+CtvpKcEqvkd2QAJrCvjhXTwiL2Unsf06U5q
         D8zFU+s4F75GnvIZ2fM2VBiVkPCpne0hndyRTuvGVKoKO5uoRGpktIhpAvfkimRT+kK1
         gMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678961828;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svQbsr3A3CYV2L6LBjooIlbLV7d3XJgH49nuHc0ppU0=;
        b=O8GcUqiguKYPq/adxqSSwtSe11Ug+Jd11Ga4IR2xAv3qosyUdNO5rN2sqpPr56IV3r
         UKsCKj122UNJvTJSZqAlbbJvk6v1TskK7c6D82ojfZmYMX5XyCVPqcBgT7n4H7gcXKTM
         m60oCWM4CbR8+x8WMpze5klxTgeAXLq9VbWv3ZS1VBHvNchup59GirvmxMHxa67HZgy3
         +JUkklToFK4ApOQ679Q4eWfJGYw0gCTr87SZVA2kHK7/HShXFcTMX7V20W5Nbiukdy0P
         TFu39Zo6g9V3y1w11x3G8ljmnZazXknw+M7RrU4D4lRk80GJzniu6EGjQ3C5PlJcp9cr
         868g==
X-Gm-Message-State: AO0yUKWq/z4R2eRqHV0emx7xFZ5AUJ+5jODYgUALHRByAcpmp4roADcc
	jvTvN/LBolsETDc642lLpj18P2H3aPmvKLUc
X-Google-Smtp-Source: AK7set/W6MqZIQ6MMxv6gQts4zaA93VWDjBldRawSxxrYtThX+ihUvriUisIZyEg8QI7Hz2zBhjmVQ==
X-Received: by 2002:a17:906:1410:b0:8b2:7567:9c30 with SMTP id p16-20020a170906141000b008b275679c30mr10922153ejc.59.1678961827817;
        Thu, 16 Mar 2023 03:17:07 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.209.88])
        by smtp.gmail.com with ESMTPSA id r8-20020a170906c28800b00928e0ea53e5sm3653413ejz.84.2023.03.16.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 03:17:07 -0700 (PDT)
Date: Thu, 16 Mar 2023 15:17:05 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <ZBLsoTBeKbuYbhCi@khadija-virtual-machine>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
 <ZBHUr7bANuhnOnIV@khadija-virtual-machine>
 <20230315150656.GA2938956@dev-arch.thelio-3990X>
 <279821116.9N5E1g01tA@suse>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <279821116.9N5E1g01tA@suse>

On Wed, Mar 15, 2023 at 05:24:23PM +0100, Fabio M. De Francesco wrote:
> On mercoledì 15 marzo 2023 16:06:56 CET Nathan Chancellor wrote:
> > Hi Khadija,
> > 
> > On Wed, Mar 15, 2023 at 07:22:39PM +0500, Khadija Kamran wrote:
> > > On Wed, Mar 15, 2023 at 02:34:31PM +0100, Fabio M. De Francesco wrote:
> > > > Aside from what I said and asked for with the other message of this same
> > > > thread, please take note that you can build a specific module if you
> > > > prefer
> > > > not to re-build the whole kernel and other modules at the same time.
> > > > 
> > > > I'm pretty sure that the instructions to do so are in the
> > > > OutreachyFirstPatch
> > > > tutorial.
> > > > 
> > > > If they are not there, please let us know.
> > > > 
> > > > Fabio
> > > 
> > > Hey Fabio!
> > > 
> > > In the Outreachy FirstPatchTutorial under the 'Compiling only part of
> > > the kernel' section there are ways to compile only some part of the
> > > kernel.
> > > 
> > > I have tried using "make W=1 drivers/staging/axis-fifo/" and it says
> > > 'nothing to be done for'.
> > 
> > Is CONFIG_XIL_AXIS_FIFO enabled in your configuration?
> 
> @Khadija:
> 
> Maybe that you won't find CONFIG_XIL_AXIS_FIFO among the staging drivers 
> entries while using "make menuconfig" (or the other similar commands for 
> working with the configuration). 
> 
> In that case, first enable the CONFIG_OF option if disabled. 
> CONFIG_XIL_AXIS_FIFO depends on the former. 
> 
> For "CONFIG_XIL_AXIS_FIFO depends on CONFIG_OF" we mean that you can the 
> former if and only if the latter is already enabled. 
> 
> Actually, CONFIG_XIL_AXIS_FIFO depends also on two other options. However you 
> shouldn't worry about those others because they are commonly enabled in more 
> than 99% of PC distributions.
>

Hey Fabio!

I have checked in my .config file and both options are enabled. The file
says,
CONFIG_OF=y
CONFIG_HAS_IOMEM=y

The "make menuconfig" shows 'Xilinx AXI-Stream FIFO IP core driver' with
built-in selection [*].
The problem I am having here is that in the OutreachyFIrstPatch
tutorial, it asks you to change [*] -> [m], but I cannot change it.

Kindly help me with this!

Thank you!
Regards,
Khadija



> > > Should I start with the steps to reproduce? :'(
> > 
> > I did see a report of this same warning occurring with GCC but the
> > report I commented on cane from clang/LLVM; using that toolchain may
> > make it easier for you to reproduce this issue. The robot's reproduction
> > instructions are fine but I think doing it manually is actually simpler.
> > 
> > Ubuntu 22.04 should have a pretty modern version of clang/LLVM, which
> > you can install via 'sudo apt install clang lld llvm'.
> > https://apt.llvm.org is another resource.
> 
> @Nathan: Congratulations, you now have another clang/LLVM adept!
> (Obviously, I'm just kidding :-))
> 
> Fabio
> 
> 
> 
