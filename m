Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23685168
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 10:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643020686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oY1+F+7+lQCyicydQp7OGXWHFnBHZl1TNVGMoANmImg=;
	b=WGBiQjc7CtVjYaY0manGMNpcMZdMQQyDBTUSjfppPli0X/n1qNmKVkP7tSQLbgq+5ZQvhl
	nEo2UbjKH+deEkD7/wav5AZgTbRWLFhtJcCwcQoGe/2ak9Gj4ffKHeyhI6AFG3A6bUF9lf
	LXU0UTBYg7b634g3sJcozzHx3hw6e7g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-mNotCC4hNji13g0CY6K-Qw-1; Mon, 24 Jan 2022 05:38:01 -0500
X-MC-Unique: mNotCC4hNji13g0CY6K-Qw-1
Received: by mail-ej1-f71.google.com with SMTP id l18-20020a1709063d3200b006a93f7d4941so1905552ejf.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 02:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oY1+F+7+lQCyicydQp7OGXWHFnBHZl1TNVGMoANmImg=;
        b=7kN+V+FA3a2Oli5wB/JURo/4ZTUlj0Vce1BrFpvb8i3b3IVGo08TwbBDnH27u/Dgal
         r1v1gslCc+J8jus9x7FXBbcpdRwrhJkdxHy8s2rnMpAcXpw2Zpl55ZvND8em9cDm+MPf
         CPcPBfuO8VsXWUSWN9mlbE7JxHpQisxJ542oKVMZ6KCaYyny0eSjxoA94aaV5zHLbJp2
         uOi8NgbEXnQqo8NxRqwxAyuVIW+CRe4nlS2yR70P3pGc0jlb2w+s2sFkh4tKWg93dBSg
         9HnYGUUf+WNFLSvUqUjM8bH71D/lZRf3jMwkD2EI6r7+X3YmWzkarmR0gxlJNCtUNee4
         T31Q==
X-Gm-Message-State: AOAM530rv3zdmG/crt6PI/aD9mQmKwuJb+0j4FYZQFrvRx6j//Ov63XM
	7z82DFMG57RG75L1ScpnPDZPF0ZxIlS6mnuBd8HZw5CEd2OatMLXMkMI4rgxG1TsXFOD1iel09q
	+zsAJbOpGJkrtBSoRebazFru+2A==
X-Received: by 2002:a17:906:dc93:: with SMTP id cs19mr1889605ejc.220.1643020679410;
        Mon, 24 Jan 2022 02:37:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybYBEBLwr22/krj7xRl1ZmNlYsoDRiUlGHaVL0YdMO4vZj6CSIcQWAkOyCHNkUXRTSS+MFzQ==
X-Received: by 2002:a17:906:dc93:: with SMTP id cs19mr1889588ejc.220.1643020679134;
        Mon, 24 Jan 2022 02:37:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id d15sm4796307ejw.143.2022.01.24.02.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 02:37:58 -0800 (PST)
Message-ID: <b345aac6-70fb-c278-195c-1761e0af7821@redhat.com>
Date: Mon, 24 Jan 2022 11:37:58 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Bay Trail atomisp support update (was [PATCH 0/9] media: atomisp:
 ...)
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220116215204.307649-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 1/16/22 22:51, Hans de Goede wrote:
> This series also contains some code to try and get things to work on
> Bay Trail devices. This at least makes the driver load, but it does
> not work yet and actually getting it to work may very well be quite
> tricky.

I've spend some more time on Bay Trail this weekend, I decided to
start with a49d25364dfb9f8a64037488a39ab1f56c5fa419 which is the
first commit adding atomisp to staging, since the commit msg
there suggested that at least that commit was tested to work on
Bay Trail.

And indeed with the current knowledge about clks + regulators
and using the right magic nvt commandline on /dev/video2 I
got both the back ov2680 and front gc0310 (300k sensor, ugh)
to work on a Chuwi Hi8 tablet easily.

So now I've a mainline kernel with working atomisp on BYT,
only problem is, it is kernel 4.11 :)

A full git log of drivers/staging/media/atomisp is 15k lines
(I decided to go with a full log and not --oneline because
the commit msgs contain useful info).

So my plan is to move forward in time / to newer kernel versions
by around 1k lines of the log at a time.

The first 1000 lines took me to 4.12 and that did not work,
but after a couple of hours of debugging I found the culprit 
(which is actually fixed by a later commit already in mainline).

So after that another 1k lines in the changelog jump took me to
4.13 (lots of activity when the driver just got merged) and that
worked in one go.

The next jump again does not work and annoyingly it hangs
the entire system when I try to use the cams,
so I need to bisect that one, so to be continued.

Hopefully this way I will be able to find fixes to make
atomisp in the current mainline work on BYT. This is my main
working item wrt atomisp atm because I believe it would be good
to have both working (and be able to regression test both)
before doing any further refactoring.

If anyone is interested my work on this can be found in
various atomisp-byt-chuwi-hi8-4.xx-rcx branches in:
https://github.com/jwrdegoede/linux-sunxi/

When every I've got a newer kernel version working I'll push
a branch with the working code there. The idea is to be able
to later retest other modes then the preview mode if we
ever try to get other modes working; and then if the mode
does work in the initial version and not in later version
easily be able to find out when it broke.

Regards,

Hans


p.s.

Mauro I see that you have been merging various new patches
into https://git.linuxtv.org/media_stage.git/ now that 5.17 is
out. I assume you will eventually get around to this patch-set
too ?



> Hans de Goede (9):
>   media: atomisp: Don't use ifdef on IS_ISP2401
>   media: atomisp: Don't use ifdef ISP2400
>   media: atomisp: Use irci_stable_candrpv_0415_20150423_1753 fw for byt
>   media: atomisp_gmin_platform: Fix axp_regulator_set() writing to the
>     wrong register
>   media: atomisp_gmin_platform: Add enable-count to
>     gmin_[v1p8|v2p8]_ctrl()
>   media: atomisp_gmin_platform: Set ELDO1 to 1.6V on devices with an
>     AXP288 PMIC
>   media: atomisp_gmin_platform: Do not turn ELDO2 off from axp_v1p8_on()
>   media: atomisp_gmin_platform: Base CsiPort default on detected CLK
>   media: atomisp_gmin_platform: Add DMI quirk to not turn AXP ELDO2
>     regulator off on some boards
> 
>  .../media/atomisp/pci/atomisp_compat_css20.c  |   4 +-
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 148 +++++++++++++-----
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |   2 +-
>  .../media/atomisp/pci/sh_css_firmware.c       |   4 +
>  4 files changed, 114 insertions(+), 44 deletions(-)
> 

