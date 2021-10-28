Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A0F2C81
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 04:12:50 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id l186so5113487pge.7
        for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 21:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Xa/s2qxLOUtJOm4LajgR3Js6mInXEqTgYry1ESfBaYs=;
        b=Z9gwOCiAy4Q4Ak4QXv+a8whutaK205/uJyhVt7uh/TGgXcY/IODnOS58HSNSoxQ+op
         gOAyCT+IGq76vJuhzma/aMpST5VtUtFMkoEUoWMCull4g/MqqFymskjnbtEJqlOJXDoa
         hAmPzTa1zwiTYUSgujDMfr4Z8MVodWQIPB2oSl7psOzE2CPtqedOmxKG9OXVRK4penJx
         qvdrChx0aw0mfa9A57GmgzESsOocvsoCSgM91me49unBR95RaUh/38fGPwCfq00n7nNu
         xcpIw3TcWFVObZzifaVd8BqK9cQfWTYoCIm6W8YMLPKczl7m/dUW2QEGlbvv+MyU48dQ
         ERoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Xa/s2qxLOUtJOm4LajgR3Js6mInXEqTgYry1ESfBaYs=;
        b=e9wLujbcExyyMEFI8GNe27W1M/H3OBF1K4jFHBp+h6WbWpgyiJUO0W7cKX0xL6mPnu
         xN+JwCQgrFZwVWkuL2c/IebQ2ZnOo+PjZSQ1UFF4jaHjapFoBCCGkjTvYwoYa0+i/r8Q
         mRhHfHkRKY1GIPKQL4qBNXy1LOZmzm/qtU+ADVQOic/JhuLoMVLlV2fqzIQ8J09TV7sc
         Iib74gAeobGLRxeWYnxm5gdRu41TqCE6a2U8oHvv1GaJ4veN1bYnkXac4vNcEFxIs/B5
         dvw5GGb+bTl7bPGfWhvxLssce/PMEZuk5jvCIhlFyznp3YStBQRRtdlzBWVf6CPVYOJw
         9rGA==
X-Gm-Message-State: AOAM531CtnwoWsvVzotKvmXzWnSdsSacwbMZogBni+QsC9qaH4rmj56o
	op27G8AvEBQB2+ZgSN8WylQ=
X-Google-Smtp-Source: ABdhPJzmybam+CqtEI+R7p2Dr/E4ERxr8+gkvsnBFXjnK9COqjkYiYd7uZCKMwkWUd7f/eDbaxJ5lQ==
X-Received: by 2002:aa7:8a0e:0:b0:47c:1116:3ce with SMTP id m14-20020aa78a0e000000b0047c111603cemr1819453pfa.76.1635394369905;
        Wed, 27 Oct 2021 21:12:49 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id 141sm1178962pge.23.2021.10.27.21.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 21:12:49 -0700 (PDT)
Message-ID: <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
From: Tsuchiya Yuto <kitakar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Nable
 <nable.maininbox@googlemail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
 "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Patrik Gfeller
 <patrik.gfeller@gmail.com>
Date: Thu, 28 Oct 2021 13:12:45 +0900
In-Reply-To: <20211026092637.196447aa@sal.lan>
References: <20211017161958.44351-1-kitakar@gmail.com>
	 <20211017161958.44351-5-kitakar@gmail.com>
	 <20211026092637.196447aa@sal.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<Adding back people/list to Cc>

On Tue, 2021-10-26 at 09:26 +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 18 Oct 2021 01:19:44 +0900
> Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> 
> > Currently, the `port >= N_CSI_PORTS || err` checks for ISP2400 are always
> > evaluated as true because the err variable is set to `-EINVAL` on
> > declaration but the variable is never used until the evaluation.
> > 
> > Looking at the diff of commit 3c0538fbad9f ("media: atomisp: get rid of
> > most checks for ISP2401 version"), the `port >= N_CSI_PORTS` check is
> > for ISP2400 and the err variable check is for ISP2401. Fix this issue
> > by adding ISP version test there accordingly.
> > 
> > Yes, there are other better ways to fix this issue, like adding support
> > for ISP2400 to ia_css_mipi_is_source_port_valid(). In this way, we can
> > unify the following test:
> > 
> > 	if (!IS_ISP2401)
> > 		port = (unsigned int)pipe->stream->config.source.port.port;
> > 	else
> > 		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> > 
> > However, the IS_ISP2401 test here (formerly `ifdef ISP2401`) is not
> > a result of real hardware difference, but just a result of the following
> > two different versions of driver merged by tools [1]:
> > 
> >   - ISP2400: irci_stable_candrpv_0415_20150521_0458
> >   - ISP2401: irci_ecr-master_20150911_0724
> 
> No.
> 
> While I don't have any internal information from the hardware manufacturer,
> I guess you misinterpreted things here. 2400 and 2401 are different
> hardware versions. See atomisp_pci_probe() logic.
> 
> Basically, Cherrytail and Anniedale comes with 2401. Older Atom CPUs
> (Merrifield and Baytrail) comes with 2400.

Yes, indeed, 2400 and 2401 are different hardware. When they (I mean who
originally wrote atomisp driver non-upstream) needed to distinguish
between ISP2400 and ISP2401, they used the ifdefs like the following:

  - USE_INPUT_SYSTEM_VERSION_2    (for both ISP2400/ISP2401)
  - USE_INPUT_SYSTEM_VERSION_2401 (for ISP2401)
  ...

I think this is a sign that the atomisp driver supports both
ISP2400/ISP2401 in a single version.

Indeed, the upstreamed atomisp uses irci_stable_candrpv_0415_20150521_0458
for ISP2400 and IIUC it was working on Bay Trail. On the other hand,
intel-aero is a kernel for Cherry Trail and uses the same version
irci_stable_candrpv_0415_20150521_0458.

So, both ISP version ISP2400/ISP2401 can be supported by a single
driver version.

> > We should eventually remove (not unify) such tests caused by just a
> > driver version difference and use just one version of driver. So, for
> > now, let's avoid further unification.
> > 
> > [1] The function ia_css_mipi_is_source_port_valid() and its usage is
> >     added on updating css version to irci_master_20150701_0213
> >     https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
> >     ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")
> 
> What happens is that there is a 2401 and a 2401 "legacy". It sounds
> that this due to some different software stacks that are reflected both
> at the firmware and at the driver.

Yeah, I'm not sure what the "legacy" is. It might be a reference of
`ISP2401_NEW_INPUT_SYSTEM` (css_2401_csi2p_system) and
non-`ISP2401_NEW_INPUT_SYSTEM` (css_2401_system).

> -
> 
> On other words, this patch requires some rework, as otherwise it will break
> support for Baytrail.

You mean "this patch"? then, I intended this patch is rather a fix for
ISP2400 case! The err variable for ISP2400 case is always true because
it is not used before the error check:

        int
        allocate_mipi_frames(struct ia_css_pipe *pipe,
        		     struct ia_css_stream_info *info)
        {
        	int err = -EINVAL;
[...]
        	if (!IS_ISP2401)
        		port = (unsigned int)pipe->stream->config.source.port.port;
        	else
        		err = ia_css_mipi_is_source_port_valid(pipe, &port);
        
        	assert(port < N_CSI_PORTS);
        
        	if (port >= N_CSI_PORTS || err) {
        		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
        				    "allocate_mipi_frames(%p) exit: error: port is not correct (port=%d).\n",
        				    pipe, port);
        		return -EINVAL;
        	}

The first usage of err variable is ia_css_mipi_is_source_port_valid()
for IS_ISP2401 case, but it's not used for ISP2400 case. This causes
the evaluation `port >= N_CSI_PORTS || err` always true for ISP2400 case,
meaning it will be always treated as a error.

> Also, patch 13 should be dropped, as the firmware versions for 2400 are
> different

The firmware version for 2400 on the upstreamed atomisp is
irci_stable_candrpv_0415_20150521_0458 :-)

        static const char *isp2400_release_version = STR(irci_stable_candrpv_0415_20150521_0458);
        static const char *isp2401_release_version = STR(irci_ecr - master_20150911_0724);

The intention of that patch is rather, it clarifies ISP2401 is now using
the same driver (css) version as ISP2400.

> - and maybe patches 8 to 12 may need more work in order to not
> touch 2400.

Those patches do not break ISP2400, because what they do for ISP2400
is that, they remove members from `struct`s which were initially inside
of `ifdef ISP2401`. And because these removed members were initially
inside of the ifdefs, the usage was also inside the ifdefs.

Regards,
Tsuchiya Yuto

