Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F190C2C88
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 15:42:04 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id j12so6586437qvk.12
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rjs4mCGafYlXNdybb9ZGxlAk2gqqUMvwHU2DzJJHvqI=;
        b=7hgF0Eq+zGYzt7/FS7OTsVJovpU37Wp0bpbTmPwuIhctC10L3AQ1I+TLhrRYa2HzI6
         wGOBbx4x+92vcDIM5BUHEI7xTaaSL+gKuUXnFwW1YdC8+iV0maARKJFNVOvctPEgX9fN
         D9aM4rEiFi6glR1z2u7bGKV+/dd1QVJ+qhRUcesiCwPF7ArKtNX4FZCiu8kdkiMvpqtJ
         IaRE2+pT31G3AZG/bw1QOUFapj6GeolHcSX21KlLmNSh/m6Kw5NaVFwnJvULRJkcUw7M
         DTAitj3SenGQeuIKVivF6cVlBuKi3EC4zjf/dV2R0TCsTVfcVaEOh9NcZPvkz4bcRaq3
         +ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rjs4mCGafYlXNdybb9ZGxlAk2gqqUMvwHU2DzJJHvqI=;
        b=iEZEBBD/R/necs94pBVdvE6huoDCGgJ7tn00lq8WDd3HVVNpK5Lj3mgZYjR5pPMkGD
         MBrvpvddrOAKLVegN/L2G3jXNcaFqBaKPmhAGDkCXltpI3lxshS20uHPY+2sR9MOcqom
         nc34duo9J8ZgIyFq/6j6JZ+GFSjgeddvo98AOBQQt2O6MOz2pzjlexAQqgxsdPOwPskx
         M0UY2vRcTXwaK4wl3ZPwiU4H3OSRM4x4HZlEkkqIbExm2rMxpcg0QHYbQSD6FfyHcGVC
         rKzfHxDGldMAA28+xwAIIwN3Ikk9YAb3cIHN4/NtAllQggJUODqqI8IJYQTOT61pnxwQ
         eBaA==
X-Gm-Message-State: AOAM531z66NsgpNcpOa0NPiRx6Z1evV+9cZPoREa/N6Heb5BVgeHjjDm
	Zt8jr/28joiuzP8vwN4pDYTyvw==
X-Google-Smtp-Source: ABdhPJztze8fJcBoJDAyfAaXu2xI3rtosIxtZNyE1oYjwGkcC0IZe06b8/R0c5Q21brKykmtBw4TKg==
X-Received: by 2002:a05:6214:118f:: with SMTP id t15mr8761837qvv.28.1633707723890;
        Fri, 08 Oct 2021 08:42:03 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 6sm2265371qkc.123.2021.10.08.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:42:03 -0700 (PDT)
Message-ID: <f108f23dadc846222c63c88af826dae9c5082d83.camel@ndufresne.ca>
Subject: Re: [PATCH 0/2] media: rkvdec: Align decoder behavior with Hantro
 and Cedrus
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Chen-Yu Tsai <wenst@chromium.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>
Date: Fri, 08 Oct 2021 11:42:01 -0400
In-Reply-To: <20211008100423.739462-1-wenst@chromium.org>
References: <20211008100423.739462-1-wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chen-Yu,

thanks for looking into this.

Le vendredi 08 octobre 2021 à 18:04 +0800, Chen-Yu Tsai a écrit :
> Hi everyone,
> 
> While working on the rkvdec H.264 decoder for ChromeOS, I noticed some
> behavioral differences compared to Hantro and Cedrus:
> 
> 1. The driver always overrides the sizeimage setting given by userspace
>    for the output format. This results in insufficient buffer space when
>    running the ChromeOS video_decode_accelerator_tests test program,
>    likely due to a small initial resolution followed by dynamic
>    resolution change.
> 
> 2. Doesn't support dynamic resolution change.
> 
> This small series fixes both and aligns the behavior with the other two
> stateless decoder drivers. This was tested on the downstream ChromeOS
> 5.10 kernel with ChromeOS. Also compiled tested on mainline but I don't
> have any other RK3399 devices set up to test video stuff, so testing
> would be very much appreciated.
> 
> Also, I'm not sure if user applications are required to check the value
> of sizeimage upon S_FMT return. If the value is different or too small,
> what can the application do besides fail? AFAICT it can't split the
> data of one frame (or slice) between different buffers.

While most software out there just assumes that driver will do it right and
crash when it's not the case, application that do map the buffer to CPU must
read back the fmt structure as the drivers are all fail-safe and will modify
that structure to a set of valid value s for the context.

As for opposite direction (output vs capture) format being changed, this should
be documented in the spec, if you find it too unclear or missing for sateless
codec (I know it's there for stateful but can't remember, would have to re-read,
for stateless) let us know.

regards,
Nicolas

> 
> Andrzej, I believe the second patch would conflict with your VP9 series.
> 
> 
> Regards
> ChenYu
> 
> Chen-Yu Tsai (2):
>   media: rkvdec: Do not override sizeimage for output format
>   media: rkvdec: Support dynamic resolution changes
> 
>  drivers/staging/media/rkvdec/rkvdec-h264.c |  5 +--
>  drivers/staging/media/rkvdec/rkvdec.c      | 40 +++++++++++-----------
>  2 files changed, 23 insertions(+), 22 deletions(-)
> 


