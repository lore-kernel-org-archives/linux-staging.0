Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494D7D;
	Sun, 13 Feb 2022 11:33:56 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id q7so22413918wrc.13;
        Sun, 13 Feb 2022 03:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=02vp1JcshzGAmd266InAE4p0SMLcVM41XUbfgVtkk8w=;
        b=OK0IROEtmVHSd6bnjgTZAXeNZrVBxdV791WH8w6dkmD8N9Rc4BOr1zMpPhM0oAZXUu
         F5+8tdpFeHqnUYZviWCBWzlZ2ikr2llcEWe2hHPNQg6igNlyv09Bv68r6NlXQUNEZpz6
         YcMc3pe37dtNU0ALFTxUqgVf86I1ffFURsf3MdcQndVytg90HmTZCJb756kytkkqTQtI
         dcPT6EL5NDuYJd8o9tSAWNY3Li7cEkY/rZW0c0BS0vTv8hfMvTEwzXxpaDF3dnt7JW3f
         UPvTSd+ff+mcbppFm0AnkM2BufIEg5BbEtHreOY8Qynr2HRYSjgO3THIXWe4xdJDVtF8
         adUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=02vp1JcshzGAmd266InAE4p0SMLcVM41XUbfgVtkk8w=;
        b=6IHXDUToeid8NAhR2VEmCRh/uxRLpd9ozsA125aKn6uqJ2fs5S5zFN1U73ntzFAgqI
         CZP76CY3xa4Uf9bNobaeV9SuGIyBe+dE6GACOL05KPUN+1msIhNtbwCxgH/wQA1xXeff
         TQvAFC3mikpj2d0v4Xz67vPTjTuVDA9O/nQH1B7K1xUiAN8jTY16KoDgtUL9bUX2UKgf
         gerj75EXK2SCtU/OoP2vFk9BQZe0149TVmp6LD6/QBoQ1GOS3YQXWZAaHFYuSnMX+MKW
         nHzNLD0fjKmA09AntTJdprVWTR21IIfGOPvgAIrRq+b/lCgwMkSzZJxDEKpPYnOIf02I
         NUkA==
X-Gm-Message-State: AOAM531gAYeYRL0dkl4rtO4yxU0C73oCiu6YaNNnD1NT3JQBaB98fzZz
	R6v0Sp9djmfxqLc0Nc9nVjU=
X-Google-Smtp-Source: ABdhPJyTwqnXzmlapAqyauG6oyW/56U04p6xjFiix7W8KKn7b5P3uTYi4MmaqWyzQZ3BYqmtZlTA1A==
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr7611085wrw.673.1644752034944;
        Sun, 13 Feb 2022 03:33:54 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id p27sm9091564wms.39.2022.02.13.03.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 03:33:54 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, gregkh@linuxfoundation.org, mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org, hverkuil-cisco@xs4all.nl, jonas@kwiboo.se, nicolas@ndufresne.ca, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, kernel@collabora.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Alex Bee <knaerzche@gmail.com>, jc@kynesim.co.uk
Subject: Re: [RFC] media: uapi: Move HEVC stateless controls out of staging
Date: Sun, 13 Feb 2022 12:33:53 +0100
Message-ID: <8038233.T7Z3S40VBb@kista>
In-Reply-To: <20220201123439.353854-1-benjamin.gaignard@collabora.com>
References: <20220201123439.353854-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Benjamin,

CC: Alex, John

Sorry for late response, but I've been very busy last week.

First of all, thank you for doing this! It's about time that HEVC moves 
forward.

Dne torek, 01. februar 2022 ob 13:34:39 CET je Benjamin Gaignard napisal(a):
> The HEVC stateless 'uAPI' was staging and marked explicitly in the
> V4L2 specification that it will change and is unstable.
> 
> Note that these control IDs were never exported as a public API,
> they were only defined in kernel-local headers (hevc-ctrls.h).
> 
> While moving the controls out of staging they are renamed and
> control IDs get new numbers.
> Drivers (Hantro, Cedrus) and Documentation are updated accordaly.

accordaly -> accordingly

> 
> Additional structures fields has been added for RKVDEC driver usage.

You should do separate patch for that, preceding this one. One patch should 
only do one thing.

I also suggest that you add additional patch for removing bit_size field in 
struct v4l2_ctrl_hevc_slice_params. Similar fields were already removed from 
MPEG2 and H264 structures. Bit size can be deduced from output buffer size and 
it doesn't hurt if bit size in Cedrus is set to bigger value than actual slice 
bit size.

> Hantro dedicated control is moving to hantro-media.h
> Since hevc-ctrls.h content has been dispatched in others file, remove it.
> 
> fluster tests results on IMX8MQ is 77/147 for HEVC codec.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Note that Cedrus still needs additional information in order to decode some 
HEVC videos. Missing info is num_entry_point_offsets and list of all 
entry_point_offset_minus1 (obviously, num_entry_point_offsets in size).

I suggest that this is represented in a new control, which would use dynamic 
array feature, written by Hans. While Cedrus supports max. 256 entries, it can 
be much bigger in theory, but in reality, it's much smaller (like 4-8 
entries).

Last but not least, data_bit_offset should be better defined. Currently it 
points right after last header bit, just like Cedrus needs it. However, there 
is padding after that, at least 1 bit and 8 bits at most, so slice data always 
starts from byte aligned address. It probably make sense to rework that field 
to be byte offset, not bit, just like in VA-API. Note that RPi HEVC driver also 
uses byte aligned address directly. Cedrus would need some kind of workaround 
and only one that works is this one:
https://github.com/bootlin/libva-v4l2-request/blob/master/src/h265.c#L191-L209

Best regards,
Jernej


