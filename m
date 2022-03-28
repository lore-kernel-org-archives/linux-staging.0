Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD45437E;
	Mon, 28 Mar 2022 17:09:14 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id qa43so30011438ejc.12;
        Mon, 28 Mar 2022 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oz/GhbrsSoiiuJbFSvXUMfpNUWNZ2X3Kmt6C0b9MtEY=;
        b=XLFg6dCmzHI6UVEuH8BLYtKKM4uvH1ZozdUxJhyd9zDVCSiCtUzw6R4eiOcIvKdtp+
         OKddStrGMKY8ErWM/NqQq/kTWdaunQJTqePkGKtU1344Wj+/F/i30ItvbA4IFnBLSQwF
         V54eQVV+UGCyhBuPy2yjZg2dmrMr+eoLRbjvlMQ1nkV1S+tR/6RAYXCgx+dCLXCwTgOu
         w6GK9j/qC32+SQY+8OroKJsE2UtR34akAYW9D+sOA0gZhXFh1I3RJnD6fFQuFmo/0BU/
         PRSsL+VvNUjbki90jg38CzUeCr2IKa7ibdhMwchZvJ3LJYdvrreSSh3J/0os/8ijeegd
         s8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oz/GhbrsSoiiuJbFSvXUMfpNUWNZ2X3Kmt6C0b9MtEY=;
        b=cS1Qger1omawOh3BF+I56h6bx302H77HFv0Fq6MOGKze5DdnV/JsYi9ima+Z4ZUs5P
         7uSs8OZzhamvq2lyDKFZXtfslBRRcAULz41Z9IluR1BI2GmqoQk8Y8ADYT7vT5W7TkWr
         REfpT+a4i9AA6SQZH08xx0bQELbqWbNrA0pjYTj/fSzsZiiq+f0v8UyqK+u5YpLr+4Ut
         M1zRMRx9qEhXVKBpfb5VU+eX75bLrFfHrhnfZrMrJeIPx9WnahjefENGcANsT+CzFuZx
         nRYVh/SkwXjaK8EWjYfJJTkcRvalLLcJg+gzr7oxg2PsnmVycosx7SkrwkxELpNI2L8I
         1xXA==
X-Gm-Message-State: AOAM531VQFeSM44XBgtRhM77nSf7BRAAoY5/YQDrx0AvpsOdpl/Sg47B
	fyEG9Ok4I+0WZfy+8tieqf8=
X-Google-Smtp-Source: ABdhPJxn3BJyJKNC9/61CZcKeOhAnR0kP6RUMvDsLZPNcLzptiHSJT5FmZKkFiS6yu0S2vwJNZhpcA==
X-Received: by 2002:a17:907:7ba3:b0:6df:b07c:ee35 with SMTP id ne35-20020a1709077ba300b006dfb07cee35mr28691222ejc.588.1648487353124;
        Mon, 28 Mar 2022 10:09:13 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id o17-20020a056402439100b0041938757232sm7321011edc.17.2022.03.28.10.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 10:09:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org, Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: acourbot@chromium.org, tfiga@chromium.org, hverkuil-cisco@xs4all.nl, Sebastian Fricke <sebastian.fricke@collabora.com>, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v3 2/2] staging: media: cedrus: Rename H265 to HEVC
Date: Mon, 28 Mar 2022 19:09:11 +0200
Message-ID: <4697363.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20220327084308.9053-3-sebastian.fricke@collabora.com>
References: <20220327084308.9053-1-sebastian.fricke@collabora.com> <20220327084308.9053-3-sebastian.fricke@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sebastian!

Dne nedelja, 27. marec 2022 ob 10:43:10 CEST je Sebastian Fricke napisal(a):
> Rename all instances where the identifier H265 is used with HEVC.
> The codec has multiple identifiers H.265 (ITU-T), MPEG-H Part 2 (ISO),
> but the actual name of the codec is HEVC (High Efficiency Video Coding).
> Also nearly all other related drivers use the term HEVC instead of H265.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

This patch is not constructive. I admit, it's unfortunate it's not using same 
name as other drivers, but anyone dealing with HEVC will know H265 is synonym 
for it. This patch doesn't improve anything and actually makes any fix harder 
to backport, if something cames up. According to diffstat, this rewrites more 
than 50% of cedrus_h265.c, including renaming the file. Additionally, it's easy 
to miss something to rename and we could play this game in the future too, for 
no real benefit.

So NAK.

Best regard,
Jernej

P.S. Please wait at least few days before resending patches, even if you find 
something. After all, RFC patches are meant to get some response, it's not 
expected they will be perfect.

> ---
>  drivers/staging/media/sunxi/cedrus/Makefile   |   2 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  30 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  14 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
>  .../cedrus/{cedrus_h265.c => cedrus_hevc.c}   | 438 +++++++++---------
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |   4 +-
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  | 394 ++++++++--------
>  .../staging/media/sunxi/cedrus/cedrus_video.c |   4 +-
>  8 files changed, 448 insertions(+), 448 deletions(-)
>  rename drivers/staging/media/sunxi/cedrus/{cedrus_h265.c => cedrus_hevc.c}
> (53%)



