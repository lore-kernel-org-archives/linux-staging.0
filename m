Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79F2C82
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 12:29:36 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id o20so114630047eds.10
        for <linux-staging@lists.linux.dev>; Thu, 02 Dec 2021 04:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YCcTTm4Maa5TXcDLbYXLbRt75Jjc8zsc+pqvwVk93Go=;
        b=p3a5v+dmRty+NzGaTklO7c3S7cmkU6iNa7PdqxChmAB0V5xj1hN63Ofj/42kXmCxiF
         Xdyhex7gLrRinMTJsh7H5RpTa8qc1goG1rYQZI4YNG+AvphUrBJa4iNNNmr+tZwAqGVN
         i/jsZL6UH1XBJ1Sb5gxCfyjDr91HyvwxNjJHRtbdUmqq4DkWiVVjvLJMFQNuH6JIGR9p
         9AfSfuFPZnCvS8LOvMEScb8kioqB6npoyAuAeKdKIg7V+BO8CoLj8Li8lLVLXy8ZssUe
         5CFxHL4dWNDb5S49AhVLVW2vCQSwBuKyyVBRE65vitv3Y7mSLj0EDYN8SFa8HcTbt+TP
         Eu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YCcTTm4Maa5TXcDLbYXLbRt75Jjc8zsc+pqvwVk93Go=;
        b=tYUaqmY8Io+l7qUEc45csP7AXlLIiNNdW0Mz5rYMXl6TP9eas1oSYrlGTVbWPjnIeh
         jDpAeIP5rIRVACc7jzuZ3sI8YAsxlU1oQMg2nF5O0/YSzjIyDNv6O3ygajPhKjHUzxka
         f6T1vRg7e9IfzeEXfM4BMYh4wVFlwaLbbdRYvsGhh7XDU4W/1spbfPpIP/WCYkaL1/LP
         Dh8EoXUxJIhHkFtAUNcYVZ/wUr6ykDiI4P2ba2Z18qlVZK8ds2kmY5Mg+vZqpuPIfaaK
         CykpSWncQ6Ijl7Ca0eCiiHAC6Tt4igSlK1V9eD91zGijZVukujBNfKW5vLdhIBQVsL/l
         v/jA==
X-Gm-Message-State: AOAM532rr3rjfHHH+VlWqyebNtEy3EHqrs9ZwgxgqYw/e2fdt7pYrNxx
	DYAQySyPhcwwE550LV94coJNBcU7Gm0SZxLI6JQ=
X-Google-Smtp-Source: ABdhPJxZShngoNPXgDS47UOI6ZLXwYKwCSeA5fm1NU+vtEE5ZuL/ae0cWNshOkPvmA9ECfEdUoS5U3VQpTZ7DznM8f8=
X-Received: by 2002:a05:6402:3488:: with SMTP id v8mr17723394edc.398.1638448175027;
 Thu, 02 Dec 2021 04:29:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211202041627.291625-1-aford173@gmail.com>
In-Reply-To: <20211202041627.291625-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 2 Dec 2021 06:29:23 -0600
Message-ID: <CAHCN7xJHuOFTQBQWk1yKsk3M0iDB7aKc0=L2DisUoSXVeO3xXQ@mail.gmail.com>
Subject: Re: [RFC V3 0/2] arm64: imx8mm: Enable Hantro VPUs
To: linux-media <linux-media@vger.kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Tim Harvey <tharvey@gateworks.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, Adam Ford-BE <aford@beaconembedded.com>, 
	hverkuil-cisco@xs4all.nl, Rob Herring <robh+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 1, 2021 at 10:17 PM Adam Ford <aford173@gmail.com> wrote:
>
> The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
> to be related to the video decoders used on the i.MX8MQ, but because of
> how the Mini handles the power domains, the VPU driver does not need to
> handle all the functions, so a new compatible flag is required.
>
> V3 is rebased from git://linuxtv.org/hverkuil/media_tree.git for-v5.17c
> This branch has support for VP9.
>
> I set cma=512M, but this may not be enough memory as some tests appeard to run out of memory
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
>
> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> Ran 55/61 tests successfully               in 8.080 secs
>
> G2:
> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> Ran 127/303 tests successfully               in 203.873 secs
>
> Fluster and G-Streamer were both built from their respective git repos using their respective master/main branches.
>

I should note, that both interrupts appear to be triggering.

# cat /proc/interrupts |grep codec
 57:      13442          0          0          0     GICv3  39 Level
  38300000.video-codec
 58:       7815          0          0          0     GICv3  40 Level
  38310000.video-codec




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
> --
> 2.32.0
>
