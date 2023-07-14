Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4230F6AA4
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 05:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689313599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g6erNp3UvjEscYrwilfxggNErT6dVXbAHpnhEbMDdnY=;
	b=OPfhaJPpXH1sUF9dOmiukhqrQJ2FRbnG74FPEsQv83ufAjopXfafYmEeHQoUC+PpvPxHt4
	FltkAS7qkzDz6D6+DdKVUjcSNzxUBQwcYPzlxznxsSNkdcVaO9wClrbr0H9MkDncR3vs68
	h5PCGPadMzcsY2Ja4Q/bC3cKvLBn6C4=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-XWWnXbUXOJu-DYGhtxCedQ-1; Fri, 14 Jul 2023 01:46:36 -0400
X-MC-Unique: XWWnXbUXOJu-DYGhtxCedQ-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-53fd224ad48so829433a12.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 22:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689313595; x=1691905595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6erNp3UvjEscYrwilfxggNErT6dVXbAHpnhEbMDdnY=;
        b=ZOhvxTckdOcJM3Dwc5NokviXpTwR2z9RJhfhTTuASVNQXzEtNAE7RD3Ve6LUQNTZ/W
         ovFunM66/DTPX5YGVpRcw4J7I7dSBcOaRHxVW22YatRrlEgIR0i25ZCF9Xm52QoLlfHN
         xUMuzy+naI6lWNgVPXXW6zqr+h7WkIeH98/bMItaWvHKsMcgJCZKAomVcNXBI9U2A6AL
         cHZPMBhBVwxS6+b2MVzVPd61cpX0bUKvrjsnPyabM0DP2sfGM94pfGtr5PQ5r6sbp52j
         E1YRtZUlL/eigF/EM8hPqtaVXamyDeHFlqw9qiIWk9HLVy64NRJAyBbhw9Fg4JbqCwOo
         L2Gw==
X-Gm-Message-State: ABy/qLbvo4ixSWRYj7exToPk5yenPwwDU9AGvRW8WyHGXUyWZGLRyIxF
	xdHMdkCTuEN1H+qz7UWeQgyYCmcU3VMyREw+w3cIU50P5ng/xdvdxnvbHEfDdyaGiUJHLoU9bLJ
	DH+VACDBWRpzLSRkmkAcp2zVi9G+7IAr9LdE//HhLOw==
X-Received: by 2002:a17:90a:31c2:b0:262:d7db:2520 with SMTP id j2-20020a17090a31c200b00262d7db2520mr2637621pjf.26.1689313595359;
        Thu, 13 Jul 2023 22:46:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE9N3MGFAnn1VkROCXNjwaIsbqBE+EkGN4kUY6RFkFArDczgQqgr19Xwl5dVkXJYlGtplkT4d2zHi2M2lnZTwo=
X-Received: by 2002:a17:90a:31c2:b0:262:d7db:2520 with SMTP id
 j2-20020a17090a31c200b00262d7db2520mr2637616pjf.26.1689313594973; Thu, 13 Jul
 2023 22:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230713100231.308923-1-hpa@redhat.com> <74cfe990-d36f-5372-9dc5-33f141f205be@redhat.com>
In-Reply-To: <74cfe990-d36f-5372-9dc5-33f141f205be@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 14 Jul 2023 13:46:24 +0800
Message-ID: <CAEth8oGCbEnP3UwEPqa-BVEeAFX8H=YKM8=5gvvsxsr2GLNbhw@mail.gmail.com>
Subject: Re: [PATCH 00/11] #if defined(ISP2401) removal to make driver generic
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans

On Fri, Jul 14, 2023 at 3:38=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Kate,
>
> On 7/13/23 12:02, Kate Hsuan wrote:
> > This patch set is to remove #if defined(ISP2401) to make the driver
> > generic. We focused on removing the #if defined(ISP2401) in isys and
> > necessary files related to it.
> >
> > The changes include:
> > 1. Removed #if defined(ISP2401) in isys and related directories.
> > 2. Removed the debug codes for dumping status.
> > 3. Made two individual enum to define the MIPI format for both types of
> >    atomisp.
> > 4. The input system code should include both input system (ISP2400 and
> >    ISP2401) headers since a generic driver should cover all types
> >    of devcices.
> > 5. The initialization codes of the input system was modified to initiat=
e
> >    atomisp input system in a generic manner.
>
> Thank you very much for all your hard work on this.
>
> The entire series looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> for the series. I'll merge this into my media-atomisp branch
> when I can make some time to do so.
>

Thank you for reviewing

> Regards,
>
> Hans
>
>
>
> >
> >
> > Kate Hsuan (11):
> >   media: atomisp: ia_css_debug: Removed debug codes for dumping status
> >   media: atomisp: Make two individual enum to define the MIPI format
> >   media: atomisp: Included both input system headers
> >   media: atomisp: css_2401_system: Remove #ifdef ISP2401 to make the
> >     driver generic
> >   media: atomisp: isys: Removed #if defined(ISP2401) to make driver
> >     generic
> >   media: atomisp: hive_isp_css_common: Removed #if defined(ISP2401) to
> >     make driver generic
> >   media: atomisp: pipeline: Removed #if defined(ISP2401) to make driver
> >     generic
> >   media: atomisp: ifmtr: Removed #if defined(ISP2401) to make driver
> >     generic
> >   media: atomisp: Compile the object codes for a generic driver
> >   media: atomisp: rx: Removed #if defined(ISP2401) to make driver
> >     generic
> >   media: atomisp: isys_init: Initiate atomisp in a generic manner
> >
> >  drivers/staging/media/atomisp/Makefile        |  12 +-
> >  .../pci/css_2401_system/host/isys_irq_local.h |   3 -
> >  .../css_2401_system/host/isys_irq_private.h   |   2 -
> >  .../pci/css_2401_system/isys_irq_global.h     |   2 -
> >  .../host/input_formatter.c                    |   2 -
> >  .../hive_isp_css_common/host/input_system.c   |  75 -----
> >  .../host/isys_dma_public.h                    |   2 -
> >  .../host/isys_irq_public.h                    |   2 -
> >  .../hive_isp_css_include/host/isys_public.h   |  19 --
> >  .../pci/hive_isp_css_include/isys_irq.h       |   2 -
> >  .../media/atomisp/pci/input_system_local.h    |   7 +-
> >  .../media/atomisp/pci/input_system_private.h  |   7 +-
> >  .../media/atomisp/pci/input_system_public.h   |   4 +-
> >  .../atomisp/pci/isp2400_input_system_local.h  |  89 +++---
> >  .../pci/isp2400_input_system_private.h        |   4 +-
> >  .../atomisp/pci/isp2400_input_system_public.h |  13 +-
> >  .../atomisp/pci/isp2401_input_system_local.h  |  88 +++---
> >  .../pci/isp2401_input_system_private.h        | 112 +-------
> >  .../runtime/debug/interface/ia_css_debug.h    |   6 -
> >  .../pci/runtime/debug/src/ia_css_debug.c      | 256 ------------------
> >  .../atomisp/pci/runtime/ifmtr/src/ifmtr.c     |   2 -
> >  .../pci/runtime/isys/interface/ia_css_isys.h  |   9 +-
> >  .../runtime/isys/interface/ia_css_isys_comm.h |   2 -
> >  .../pci/runtime/isys/src/csi_rx_rmgr.c        |   2 -
> >  .../pci/runtime/isys/src/isys_dma_rmgr.c      |   2 -
> >  .../atomisp/pci/runtime/isys/src/isys_init.c  |  31 +--
> >  .../runtime/isys/src/isys_stream2mmio_rmgr.c  |   2 -
> >  .../media/atomisp/pci/runtime/isys/src/rx.c   | 227 ++++++++++------
> >  .../pci/runtime/isys/src/virtual_isys.c       |   8 +-
> >  .../pipeline/interface/ia_css_pipeline.h      |   2 -
> >  .../pci/runtime/pipeline/src/pipeline.c       |   2 -
> >  drivers/staging/media/atomisp/pci/sh_css.c    |   2 -
> >  drivers/staging/media/atomisp/pci/sh_css_sp.c |   2 -
> >  drivers/staging/media/atomisp/pci/sh_css_sp.h |   2 -
> >  34 files changed, 253 insertions(+), 749 deletions(-)
> >
>


--=20
BR,
Kate

