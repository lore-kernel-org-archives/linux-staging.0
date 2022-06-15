Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631102CA7
	for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 21:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655327481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OE7SBqSvpBno5WO11OmYTr9HeoQs4zsPycrh2e4+jis=;
	b=K1yFxXvVgbxKzYsUYp3ZZ/ai66WMeTvL6uEOBpwHjoW++vWe4JALARRkDaatifMbM45Kr9
	EsbOi/uDy9LnglH9SmWoaHpf+/J8z61XthPdb+WK3PZ/My7n02q2bWAcQW/ooG3fwgFjtF
	a76fYMtMar3rp0AAjp3X5+NQGgGaOPI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-Qvs2mqb0NY6Ozrm6Ejx8jw-1; Wed, 15 Jun 2022 17:11:20 -0400
X-MC-Unique: Qvs2mqb0NY6Ozrm6Ejx8jw-1
Received: by mail-ej1-f72.google.com with SMTP id h16-20020a1709070b1000b00713a3941a27so4656207ejl.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jun 2022 14:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OE7SBqSvpBno5WO11OmYTr9HeoQs4zsPycrh2e4+jis=;
        b=jSSV+1HRUq+BVJ5NIOoIwmIEbemA1wzYmGB3KCLhF7t1IbwLkX1AHq+xx8fCWC+UI9
         nhD2W7mNJe2iK7ijqRfaOfJCi31OQrNP4o67Idtp07OcFEn6GTGOL/QJfrmLLsvSLL8b
         nhuuqOu+9lCZag+qyQpc+AwCIH6fwcH3tlH2E+p0/oKmP/NJ8mKdFgFEHTZuMNWEnLS5
         vKAd+TTcGTqsbqLXov4x+7ZbCzd9FEphpR16O4FPuCxeiSALNhN0T/niBJetmBqc4SWM
         c0WxLe55tK2kEfRucv3vomyey8EGOax9UA5VVeq77ofl40Acbuqik+TZDhtMD5AW2Q7q
         Gt6w==
X-Gm-Message-State: AJIora9QqbmTjKl6R4lc2jh6ec49hlCofRN5D1dIiJywqk4sh09OcY9Z
	T29jK3yY923DI2Ic48zp6r6iozaJDkmaDAm605oLN4SZw9jBFEfjjSUD4IcborMhUeYGS+2J+2D
	AvpMCEwAftGnwPiKLKJF4qI4qhg==
X-Received: by 2002:a17:906:5a4d:b0:70f:7d1c:664b with SMTP id my13-20020a1709065a4d00b0070f7d1c664bmr1619374ejc.540.1655327478894;
        Wed, 15 Jun 2022 14:11:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uOOSvnVBhMqC6wYDmjEhQ4CX7bfzKMDHTrqzurfBEIXXFMyMZgx3ltFkKrduOo3bd1jsdUEw==
X-Received: by 2002:a17:906:5a4d:b0:70f:7d1c:664b with SMTP id my13-20020a1709065a4d00b0070f7d1c664bmr1619362ejc.540.1655327478693;
        Wed, 15 Jun 2022 14:11:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ss19-20020a170907039300b006febde6d771sm6714624ejb.160.2022.06.15.14.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 14:11:18 -0700 (PDT)
Message-ID: <629baf5f-17d3-2f0e-40b5-136d4d226b94@redhat.com>
Date: Wed, 15 Jun 2022 23:11:17 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 00/40] media: atomisp: Various hmm and other cleanups
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220615205037.16549-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220615205037.16549-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/15/22 22:49, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my atomisp hmm (and other) cleanups series. As mentioned
> in the coverletter of v1, this is part of slowly working towards porting
> the code to videobuf2 to add/fix mmap support.
> 
> v2 addresses a few small remarks from Andy and adds Andy's Reviewed-by
> to all the patches, thank you Andy!

Note I just noticed that this applies on top of
this series:

https://patchwork.kernel.org/project/linux-media/patch/20220408223129.3844-1-fmdefrancesco@gmail.com/
https://patchwork.kernel.org/project/linux-media/patch/20220413212210.18494-1-fmdefrancesco@gmail.com/
https://patchwork.kernel.org/project/linux-media/patch/20220413225531.9425-1-fmdefrancesco@gmail.com/

Which I've been carrying in my tree after testing it, assuming
that it would get merged soon.

Regards,

Hans

> Hans de Goede (40):
>   media: atomisp: remove the unused RAW_BUF_STRIDE macro
>   media: atomisp: remove unused ia_css_frame_allocate_contiguous*()
>     functions
>   media: atomisp: drop contiguous argument from
>     ia_css_frame_allocate_with_buffer_size()
>   media: atomisp: drop contiguous argument from
>     frame_allocate_with_data()
>   media: atomisp: drop contiguous argument from frame_create()
>   media: atomisp: drop IA_CSS_FRAME_FORMAT_MIPI support from
>     ia_css_frame_init_planes()
>   media: atomisp: drop contiguous flag from struct ia_css_frame
>   media: atomisp: drop ATOMISP_MAP_FLAG_CONTIGUOUS
>   media: atomisp: remove hmm_pool_[un]register()
>   media: atomisp: remove dynamic and reserved pool code
>   media: atomisp: remove hmm pool code
>   media: atomisp: remove hmm_mem_stats
>   media: atomisp: remove pool related kernel cmdline options
>   media: atomisp: remove unused attribute argument from
>     ia_css_frame_map()
>   media: atomisp: drop hmm_page_type
>   media: atomisp: removed unused hmm_bo_get_page_info() function
>   media: atomisp: remove bogus comment above hmm_bo_allocated()
>     prototype
>   media: atomisp: remove private acceleration ioctls
>   media: atomisp: remove atomisp_acc.c
>   media: atomisp: remove unused atomisp_*css_* functions
>   media: atomisp: asc.acc.pipeline is always NULL
>   media: atomisp: remove no longer used atomisp_css_acc_done() function
>   media: atomisp: remove atomisp_is_acc_enabled()
>   media: atomisp: drop unused ATOMISP_ACC_FW_LOAD_* defines
>   media: atomisp: drop ATOMISP_MAP_FLAG_CLEARED
>   media: atomisp: drop unused ATOMISP_MAP_FLAG_* flags
>   media: atomisp: remove unused hmm address translation functions
>   media: atomisp: add hmm_create_from_userdata() helper
>   media: atomisp: Simplify hmm_alloc() calls
>   media: atomisp: drop highmem var/arg from the hmm code
>   media: atomisp: drop HMM_BO_SHARE type
>   media: atomisp: remove hmm_page_object
>   media: atomisp: fix __get_frame_info() error handling
>   media: atomisp: add error checking to atomisp_create_pipes_stream()
>   media: atomisp: add error logging to
>     atomisp_destroy_pipes_stream_force()
>   media: atomisp: use atomisp_create_pipes_stream() in more places
>   media: atomisp: use atomisp_css_update_stream() in more places
>   media: atomisp: use atomisp_destroy_pipes_stream_force() in more
>     places
>   media: atomisp: remove force argument from
>     __destroy_[stream[s]|pipe[s]]()
>   media: atomisp: Add a notes.txt file
> 
>  drivers/staging/media/atomisp/Makefile        |   3 -
>  .../staging/media/atomisp/include/hmm/hmm.h   |  32 +-
>  .../media/atomisp/include/hmm/hmm_bo.h        |  37 +-
>  .../media/atomisp/include/hmm/hmm_common.h    |  26 -
>  .../media/atomisp/include/hmm/hmm_pool.h      | 116 ----
>  .../media/atomisp/include/linux/atomisp.h     | 146 ----
>  drivers/staging/media/atomisp/notes.txt       |  30 +
>  .../staging/media/atomisp/pci/atomisp_acc.c   | 625 ------------------
>  .../staging/media/atomisp/pci/atomisp_acc.h   | 120 ----
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  33 +-
>  .../media/atomisp/pci/atomisp_compat.h        |  29 +-
>  .../media/atomisp/pci/atomisp_compat_css20.c  | 365 ++--------
>  .../atomisp/pci/atomisp_compat_ioctl32.h      |  58 --
>  .../staging/media/atomisp/pci/atomisp_drvfs.c |   7 +-
>  .../staging/media/atomisp/pci/atomisp_fops.c  |  13 -
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  73 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   1 -
>  .../media/atomisp/pci/atomisp_subdev.c        |   3 -
>  .../media/atomisp/pci/atomisp_subdev.h        |  10 -
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  32 -
>  drivers/staging/media/atomisp/pci/hmm/hmm.c   | 186 +-----
>  .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 261 ++------
>  .../media/atomisp/pci/hmm/hmm_dynamic_pool.c  | 234 -------
>  .../media/atomisp/pci/hmm/hmm_reserved_pool.c | 253 -------
>  .../media/atomisp/pci/ia_css_frame_public.h   |  40 --
>  .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |   2 +-
>  .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |   2 +-
>  .../pci/isp/modes/interface/isp_const.h       |   6 -
>  .../pci/runtime/debug/src/ia_css_debug.c      |   2 -
>  .../runtime/frame/interface/ia_css_frame.h    |   7 +-
>  .../atomisp/pci/runtime/frame/src/frame.c     | 105 +--
>  .../pci/runtime/isp_param/src/isp_param.c     |   2 +-
>  .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |   3 +-
>  .../atomisp/pci/runtime/spctrl/src/spctrl.c   |   2 +-
>  drivers/staging/media/atomisp/pci/sh_css.c    |   5 -
>  .../media/atomisp/pci/sh_css_firmware.c       |   2 +-
>  .../staging/media/atomisp/pci/sh_css_mipi.c   |   3 +-
>  .../staging/media/atomisp/pci/sh_css_params.c |  47 +-
>  38 files changed, 205 insertions(+), 2716 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_pool.h
>  create mode 100644 drivers/staging/media/atomisp/notes.txt
>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.c
>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.h
>  delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c
>  delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c
> 

