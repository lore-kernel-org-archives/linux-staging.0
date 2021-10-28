Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4525D2C83
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 04:32:34 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id r2so5133709pgl.10
        for <linux-staging@lists.linux.dev>; Wed, 27 Oct 2021 21:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CJbao7PWdbTf66MLx9/hBu9NO8YckP66z62UgG9S3Lc=;
        b=lq3SQNjF25KMAqUd/hOJdOE8DkBPG5Y73rt764+YzehjNCi81b/JXOLVJk1CvseqTS
         gpKcF6afNWoEYguEW8Vdd9kSTebIn/dvPPhmzNpikRF1Mx4iQNbcvwcBMXpoZN63HeQZ
         tbIXWvsX/Nlfh5npBzpN8MNqWI8R3iNMmPrW8HPZRr5xMTPTobCkBlMs8i9ecLd66P2W
         ryCBsrTuZwkZCM4Ct2I1WTR3rDcDhiiWaVqHQUygjXJvX8Jwv0rkL9E/qF9cK/toRXUJ
         0QPRBMv3YfNiSCWpK4060G39ob3b7w9mUuvwTdN7LFLVX1FTklEDqMa4oGlPfK8PPqXi
         wUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CJbao7PWdbTf66MLx9/hBu9NO8YckP66z62UgG9S3Lc=;
        b=24mpUDAX1+qT9AhMTUDbGo+B64vXR48tR4Botvr/oZwdYEKm1EKzkwE+ZXopzdpEZQ
         1DMqkg3JZ+7S2npv0As2QaNAa56dPm6vJ9YsxGFubC8nmJmg92svwKJxXHJxMfR8+oxn
         UIF6jsgYvGA8oJvgKvSDn5jvfA/xT1zo2Azt/x9SjUgiGbPvTSxj635zv2dq4xacjBlZ
         4bOWVHp57mvcPRJdPPiPq+cTmXxDCZ/fiaorqjcOyEDlaytlF2KkudOunp8t5HS1THAb
         MVeQCzpE9CojDyCre65pxC9GViuA3SSyq5682KjrSFxdbKA7oIadtF13jNBzUXQ/erPR
         0z1A==
X-Gm-Message-State: AOAM532DAR5FCn2aArNdjw+zUposQcmadcXnLDuRRDhy5OgiejkhYbiu
	8T0yQnihwaIfHDiyGzTP5UU=
X-Google-Smtp-Source: ABdhPJy9qYBuTIK99v/KgpvuZwZX8l3gtC0Ktko1v9tNBSkA+ClLofat6rVA95UVWTDXJIz6ToZL3Q==
X-Received: by 2002:a63:af44:: with SMTP id s4mr1503935pgo.219.1635395553461;
        Wed, 27 Oct 2021 21:32:33 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id g5sm1480994pfv.107.2021.10.27.21.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 21:32:33 -0700 (PDT)
Message-ID: <00dd9a0286e194696f6cc083a98de47d709b1d9e.camel@gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
From: Tsuchiya Yuto <kitakar@gmail.com>
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-kernel@vger.kernel.org, Nable
 <nable.maininbox@googlemail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
 "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Patrik Gfeller
 <patrik.gfeller@gmail.com>
Date: Thu, 28 Oct 2021 13:32:29 +0900
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<Fixed Cc list>

On Mon, 2021-10-18 at 01:19 +0900, Tsuchiya Yuto wrote:
> [...]
>   ## taking a picture with atomisp
> 
> Note that to try to take a picture, please also apply at least the
> this RFC patch ("[BUG][RFC] media: atomisp: pci: assume run_mode is
> PREVIEW") I'll send as almost a BUG report later.
> 
> You need to use firmware version irci_stable_candrpv_0415_20150521_0458,
> which is available from the intel-aero [1]

Just in case, the hash (as well as version) of firmware which I
downloaded from intel-aero and I use to capture is the following:

        $ sha256sum /lib/firmware/shisp_2401a0_v21.bin
        e89359f4e4934c410c83d525e283f34c5fcce9cb5caa75ad8a32d66d3842d95c  /lib/firmware/shisp_2401a0_v21.bin

        $ strings /lib/firmware/shisp_2401a0_v21.bin | grep 2015
        irci_stable_candrpv_0415_20150521_0458

Regards,
Tsuchiya Yuto

> The atomisp (ipu2), like the ipu3, needs userspace support. The libcamera
> has now decent ipu3 support but does not have atomisp support yet.
> 
> I found some userspace tools for atomisp that run on Linux:
> 
>   - capturev4l2 from intel-aero/sample-apps
>     (https://github.com/intel-aero/sample-apps/tree/master/capturev4l2)
>   - hd-camera from intel-aero/sample-apps
>     (https://github.com/intel-aero/sample-apps/tree/master/hd-camera)
>   - intel/nvt
>     (https://github.com/intel/nvt)
> 
> It looks like the nvt is the most feature-rich, like exposure and white
> balance. Note that current upstreamed atomisp dropped 32-bit support.
> So, you need to build it with `-m64` (change it in Makefile). Here is
> the example of usage I use on mipad2:
> 
>         $ ./v4l2n -o testimage_@.raw \
>                 --device /dev/video2 \
>                 --input 0 \
>                 --exposure=30000,30000,30000,30000 \
>                 --parm type=1,capturemode=CI_MODE_PREVIEW \
>                 --fmt type=1,width=1920,height=1080,pixelformat=NV12 \
>                 --reqbufs count=2,memory=USERPTR \
>                 --parameters=wb_config.r=32768,wb_config.gr=21043,wb_config.gb=21043,wb_config.b=30863 \
>                 --capture=2 \
> 
>         ./raw2pnm -x1920 -y1080 -fNV12 testimage_001.raw testimage_001.pnm
>         feh *.pnm # open the converted image
>         rm testimage*
> 
> Note that I see the following warn/err after capture:
> 
>         kern  :warn  : [72660.793335] atomisp-isp2 0000:00:03.0: stop stream timeout.
>         kern  :err   : [72660.973629] atomisp-isp2 0000:00:03.0: atomisp_reset
> 
> but I see the same message on the Android kernel, too. So, I think this
> is not a real issue (I hope).
> 
> [1] https://github.com/intel-aero/meta-intel-aero-base/tree/master/recipes-kernel/linux/linux-yocto
>     filename shisp_2401a0_v21.bin


