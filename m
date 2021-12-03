Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F3268
	for <linux-staging@lists.linux.dev>; Fri,  3 Dec 2021 03:57:34 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id t6so2213222qkg.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Dec 2021 19:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=b1g6znamP/o+sXqh0MmEbs0eNjMFa6xH7xXeAUhEo3E=;
        b=MdinDDH4OFVcc5jcWF/c10RduGORbHRokRkClxhNTV2BBCOMdtiovEB/GuNCnjFN5Z
         I/qQWcft9TT/Aa730JCaAkrExTPFykLEIz/CJeV3OUPX+K3Dg+2IGiDj6ceEoatg/8UL
         PZvbzXFFAzqzcUbMm5qTz/YFExiGsMhwlK+SZgraDw90c8T9Ex+GbAHr1696ft7HTsdS
         uF/uPJvIefaYcIcxxhOqqtTj31Lnx4smqmhDNbfI4jJ6SS7C8X38rr/39n8YX2Z4Gfg1
         tSrF3ts6yil9+qySTA/ar+SY4l781/EmoGYJczUeUyVB2Ry8L3dJ0V2w6Ugu/83oZrtO
         pM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=b1g6znamP/o+sXqh0MmEbs0eNjMFa6xH7xXeAUhEo3E=;
        b=RkdvhcbHeZUZLCWW1fnNrZN/nEebaDIaLSVxbA2AyS8d0OyPGQzkJJZd4MmUZ7drr5
         VdIGygB6kP8O6utuM05YTreG57uY6BSTbTk6M0dAnSaXRDW1Aa9xh8QtqkQmB3gH5HjR
         hOuSPfIcfw/E2B1EL6SA+RydQc4FRqY5WWst3rK+pxoskJSfvfCiHWDSnUOYN80wxYd5
         6o5A3JYeZPoKuEoU3DW4/yao0GPHKOD1Lws4hKUrY2KtvNAf1wi75B9eZDN/Iv5Ik0DD
         wku0iIPTjtoJniuJChgiBzXkCm2uW2GT4x4BUShHFq5l07pqW5fV1Z9vimi0EwdEIaIC
         i9aQ==
X-Gm-Message-State: AOAM532LUYDfAQxB0VI/NLGGJARcDrxiSCIM1D7NIEWbjygaXufcMkpO
	sI1Ij8npK6+3zD7WzAkgEIPUsg==
X-Google-Smtp-Source: ABdhPJzutcbpudZeo05rbBZZri45oX+slCqUqFIbN1dJ2eUHHNM6A31VnwVHxXSkG/j9FF7+yyb6UQ==
X-Received: by 2002:a05:620a:2a05:: with SMTP id o5mr15885891qkp.527.1638503853879;
        Thu, 02 Dec 2021 19:57:33 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id e17sm1473192qtw.18.2021.12.02.19.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 19:57:32 -0800 (PST)
Message-ID: <b30924749421fe30df8a559e9a9ecd21b8d257e6.camel@ndufresne.ca>
Subject: Re: [RFC V3 0/2] arm64: imx8mm: Enable Hantro VPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar, tharvey@gateworks.com, 
 aford@beaconembedded.com, hverkuil-cisco@xs4all.nl, Rob Herring
 <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev
Date: Thu, 02 Dec 2021 22:57:30 -0500
In-Reply-To: <20211202041627.291625-1-aford173@gmail.com>
References: <20211202041627.291625-1-aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 01 décembre 2021 à 22:16 -0600, Adam Ford a écrit :
> The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
> to be related to the video decoders used on the i.MX8MQ, but because of
> how the Mini handles the power domains, the VPU driver does not need to
> handle all the functions, so a new compatible flag is required.
> 
> V3 is rebased from git://linuxtv.org/hverkuil/media_tree.git for-v5.17c
> This branch has support for VP9.
> 
> I set cma=512M, but this may not be enough memory as some tests appeard to run out of memory

Consider passing -j1 to fluster and using patience, this will spare some memory.
You can also increase the timeout (like -t 60), that often helps when CMA is
involved (due to software conversion happening). Thanks for the serious testing,
this is really appreciated that your submission really reflects the state.

> 
> V3 of this series has several changes:
> 
> Update imx8m_vpu_hw to add missing 'reg' reference names for G2 and include references to VP9
> Update device tree to remove IMX8MQ_VPU_RESET, remove some duplicate vpu clock parenting
> Fix missing reg-names from vpu_g2 node.
> Apply patch [1] to manage the power domains powering down.
> [1] - https://lore.kernel.org/linux-arm-kernel/20211016210547.171717-1-marex@denx.de/t/
> 
> With the above, the following Fluster scores are produced:
> 
> G1:
> ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> Ran 90/135 tests successfully               in 74.406 secs

This matches my results on imx8mq.

> 
> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> Ran 55/61 tests successfully               in 8.080 secs

Idem.

> 
> G2:
> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> Ran 127/303 tests successfully               in 203.873 secs

Benjamin reports 129, it could be flux. This is still a bit early, hence the low
score. But most streams do playback normally.

> 
> Fluster and G-Streamer were both built from their respective git repos using their respective master/main branches.

That gave me an idea, I'll try and print the GStreamer version/commit inside
fluster along with fluster own commit (ideally in the short summary).

> 
> 
> Adam Ford (2):
>   media: hantro: Add support for i.MX8M Mini
>   arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2
> 
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi   | 41 +++++++++++++
>  drivers/staging/media/hantro/hantro_drv.c   |  2 +
>  drivers/staging/media/hantro/hantro_hw.h    |  2 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c | 65 +++++++++++++++++++++
>  4 files changed, 110 insertions(+)
> 

