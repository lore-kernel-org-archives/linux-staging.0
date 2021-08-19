Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA33772;
	Thu, 19 Aug 2021 16:31:00 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id bq25so14049807ejb.11;
        Thu, 19 Aug 2021 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QemfxSD5xAYzJcfMYMAskCzZR84zFfm2x5hS4t5c4PU=;
        b=pmjJX64apzH4rjdwC3bAALqKQRjlW7kSOsW7daz4GRNCiTaplXRTf6yZpSf+21vVGR
         Vq7KrXR0TVo4RSczoIwSMbXjj/20hT7FvivJvnkU5EztWEInr1kTatGLaU/vWgVU9uU8
         DeRuSUVSgAFSRlRhz4hBxMB+uhRV/AHaGtm4HncKJpnOSCcN8OZp0DIOVVsow56aby3R
         qwFGZeTxMnjCAaHu8ASnl6P4rYJ7I+lHXns1BLhMKc0twKvQrLUuKZy1cmHMF3fx0bHx
         1ZEDQFg06ImTYjsgrVANeAtg3jvBoPgoRwtUhcOsijzgSv9VTDtmKe+ngYcU5XfI5rwf
         DK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QemfxSD5xAYzJcfMYMAskCzZR84zFfm2x5hS4t5c4PU=;
        b=NSyhwsgnSvYLfBSZyv6tedb54sogVFvHs32pL4Sfm0GnrX1unoJXia1EKP6vlt2AvI
         kv5vy4GoucvVwIQOr8N2imWn4wdrNdzjiwW3l7visiE8jQUbQcz/rOdtWGhaFdewR2fV
         oaMj+1kjWq2eNwBA8uv7gkrQDnm9xexx6dhnXRImpCKBYvXWiNPuTgUYQnB+ehd3Yss8
         UsUUdl+dMCC4bRKZCKJBagnJc6wnPt47tqFcP8Iqht/yaMCD4BY5LStVxp5cThvmYmbP
         Ersf4+kbxyfGJTwFsq6TjoHGqzh9Kk0IXrbztHwAXjPQahYE15NJzrLv2mHlquKwLSWY
         NSuA==
X-Gm-Message-State: AOAM531mPyVPqcCfktIWwbJdFMmZ5LzeYMS8aFlafh+cwc7DC1FvFQST
	IVcrN697V5gO/a9AjSc29jM=
X-Google-Smtp-Source: ABdhPJxqv/Sa9apKQ1EZ/4YgyXMKcgHy+Kg0N02TRtir2W4hUhqDr1AnkDpfNTuReCJJp1m0fJXyBw==
X-Received: by 2002:a17:907:2452:: with SMTP id yw18mr16910174ejb.191.1629390659141;
        Thu, 19 Aug 2021 09:30:59 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id r6sm2024595edq.20.2021.08.19.09.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 09:30:58 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: Fix SUNXI tile size calculation
Date: Thu, 19 Aug 2021 18:30:56 +0200
Message-ID: <3519986.qLKfoAsNv3@jernej-laptop>
In-Reply-To: <20210819140009.158156-1-nicolas.dufresne@collabora.com>
References: <20210819140009.158156-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas!

Dne =C4=8Detrtek, 19. avgust 2021 ob 16:00:09 CEST je Nicolas Dufresne napi=
sal(a):
> Tiled formats requires full rows being allocated (even for Chroma
> planes). When the number of Luma tiles is odd, we need to round up
> to twice the tile width in order to roundup the number of Chroma
> tiles.
>=20
> This was notice with a crash running BA1_FT_C compliance test using
> sunxi tiles using GStreamer. Cedrus driver would allocate 9 rows for
> Luma, but only 4.5 rows for Chroma, causing userspace to crash.
>=20
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

=46ixes tag would be nice so it would be picked up for stable branches.=20
Otherwise it looks good. It also aligns logic with libvdpau-sunxi.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


