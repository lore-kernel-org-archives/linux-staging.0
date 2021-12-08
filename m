Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922F29CA
	for <linux-staging@lists.linux.dev>; Wed,  8 Dec 2021 15:13:58 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id x15so9586465edv.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Dec 2021 07:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VdUdxIiaU5pFF+V8DTX3AHEAt5/Eve6LradMf5zXN3A=;
        b=d0DFQxVhQJSsNcwUBQkigMPaxadTwrFHzuGfAQb+ee+piHGEaANf5Z8P2KiO8ik+Kg
         unYXfBOPH4bNGrv9FtChzyEycOQEH9jNIoP4W1aqvEPzEmMC7riKxpp/5uswhlWVRtAa
         RNppAOavenQzJiMdh0LHaUdHLS0hQethRictq9Eeza/eNHNutocJ79BzUh3+JUQzgJdI
         O+nwF2EyE+3BP3JR4MpcQU2kPZgBCK3Bvfp2/bmOufePEV3iBlY+SAtwjOzzhop6Y3lx
         CuulofXSV7VICoQtPy0Yag/CnBJ4bDIjj4Dmn2Tgr8pYZJdlWZI/59EQj/gY7t9qGo44
         A29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VdUdxIiaU5pFF+V8DTX3AHEAt5/Eve6LradMf5zXN3A=;
        b=lAjKdOa2l5dNLouean944HNjHNhhHbM4mdXNMlx1ziZ3Ig/DWNdtaAnNaXhvqqKECy
         ifplL9fABT8ga5Nq+QvnwYDaHOzc2wvfSygZcNbjvY+cgI7re5T6gbxx8iAxTjVB5ggN
         +gXvL72+nLeK60S87qYry9LMVOWZzxkR4/tfZU24tV4FNLz3Y5IdVlJds9cwQzwVArpF
         jqxl7J+OhQRxu78L15SMpECOS4GtGlYvfTzUc2SpDuFLv+1v/eXbjOSvNZbmAJovQM+w
         +SsD8zAYoJPf0ztyApiKmmkplHwoGanrShxVqJfAld/traiX8S5bhP1RZ31x95OL11aY
         emZA==
X-Gm-Message-State: AOAM531rs0/8zlZgAchnkgNwTC5nw02JQtdTjkIBACILmfmMp56G6nXB
	RNvXT00ZDggFPLwXRWtaAM1SdkafL0WFRvm4SYg=
X-Google-Smtp-Source: ABdhPJzPHBFy+YHW8yC/1wHg8+o4FteQqgjl4FzR3P6qHxX2U0B74TAMmXXGyddSKBaRqSt5gXqrFBWeDu0p3AmM+Gg=
X-Received: by 2002:aa7:d288:: with SMTP id w8mr20577138edq.404.1638976435569;
 Wed, 08 Dec 2021 07:13:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211207015446.1250854-1-aford173@gmail.com> <f85da774-ccb3-85de-edd6-5333ed8d0503@collabora.com>
 <5a8b84e91bd8e7670a0d0108e4affe9b964202cb.camel@pengutronix.de> <4cc3404b-7f8a-6c87-8c1c-ace399f9edd3@collabora.com>
In-Reply-To: <4cc3404b-7f8a-6c87-8c1c-ace399f9edd3@collabora.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 8 Dec 2021 09:13:44 -0600
Message-ID: <CAHCN7xJJfBXdK6B1tHXjmja4Lr=Q-Uony+QWcvVqoQp36RLY=w@mail.gmail.com>
Subject: Re: [RFC V2 0/6] media: Hantro: Split iMX8MQ VPU into G1 and G2 with
 blk-ctrl support
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, linux-media <linux-media@vger.kernel.org>, 
	Chris Healy <cphealy@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 8, 2021 at 7:36 AM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/12/2021 =C3=A0 11:32, Lucas Stach a =C3=A9crit :
> > Am Mittwoch, dem 08.12.2021 um 10:32 +0100 schrieb Benjamin Gaignard:
> >> Le 07/12/2021 =C3=A0 02:54, Adam Ford a =C3=A9crit :
> >>
> >>> Currently, the VPU in the i.MQ8MQ is appearing as one codec, but in
> >>> reality, it's two IP blocks called G1 and G2.  There is initializatio=
n
> >>> code in VPU code to pull some clocks, resets and other features which
> >>> has been integrated into the vpu-blk-ctrl for the i.MX8M Mini and a
> >>> similar method can be used to make the VPU codec's operate as
> >>> stand-alone cores without having to know the details of each other
> >>> or the quirks unique to the i.MX8MQ, so the remaining code can be
> >>> left more generic.
> >>>
> >>> This series was started by Lucas Stach with one by Benjamin Gaignard.
> >>> Most patches have been modified slightly by me.  It's in an RFC state
> >>> because I wasn't sure how to best handle the signatures and wasn't su=
re
> >>> if I could base it off the branch I did.
> >>>
> >>> Since the g-streamer and media trees are in a constant state of
> >>> change, this series is based on
> >>>
> >>> git://linuxtv.org/hverkuil/media_tree.git for-v5.17e
> >>>
> >>> The downstream code from NXP shows the G1 and G2 clocks running
> >>> at 600MHz, but between the TRM and the datasheet, there is some
> >>> discrepancy.  Because the NXP reference code used 600MHz, that is
> >>> what was chosen here.  Users who need to adjust their G1 and G2
> >>> clocks can do so in their board files.
> >> Hi Adam,
> >>
> >> Thanks for your patches, I have been able to reproduce VP9 results on =
my side (Fluster 147/303).
> >> In past I have notice spurious errors when using 600MHz clock on HEVC =
decode but not with 300MHz.
>
> The results for Fluster HEVC are 77/147 so no regressions :-)
>
> Regards,
> Benjamin
>
> >> The max supported G2 clock frequency is 660MHz but needs a higher
> >> voltage. The maximum supported  frequency at the default 0.9V is
> >> 550MHz. We should not configure the clocks for the higher than that, a=
s
> >> long as there is no support in the VPU driver to scale the voltage
> >> along with the frequency. Same as with the GPU we should stick to base
> >> frequency levels for the nominal operating mode.

Lucas,

After reviewing the comments from Benjamin, I re-ran the VP9 tests
with the G2 running at 300MHz,and the number of passing VP9 tests
increased to 148 from 144 with an increase of time to 250.502 secs
from 162.665 secs.

While the datasheet reads that the G2 can run faster, the i.MX 8M
Dual/8M QuadLite/8M Quad Applications Processors Reference Manual,
Rev. 3.1, 06/2021, table 5-1  shows the VPU_G2_CLK_ROOT has a max
clock of 300MHz.  I might be inclined to agree with Benjamin on the
300MHz and let people who want to push their hardware overwrite the
default clocks since it increases functionality.

I wonder if someone from NXP can comment

adam

> >>
> >> Regards,
> >> Lucas
> >>
> >> Regards,
> >> Benjamin
> >>
> >>> Fluster Results:
> >>>
> >>> ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> >>> Ran 90/135 tests successfully               in 61.966 secs
> >>>
> >>> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> >>> Ran 55/61 tests successfully               in 7.660 secs
> >>>
> >>>
> >>> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
> >>> Ran 144/303 tests successfully               in 162.665 secs
> >>>
> >>> Changes log:
> >>>
> >>> V2:  Make vpu-blk-ctrl enable G2 clock when enabling fuses.
> >>>        Remove syscon from device tree and binding example
> >>>        Added modified nxp,imx8mq-vpu.yaml from Benjamin Gaignard
> >>>
> >>> Adam Ford (2):
> >>>     media: hantro: split i.MX8MQ G1 and G2 code
> >>>     arm64: dts: imx8mq: Split i.MX8MQ G1 and G2 with vpu-blk-ctrl
> >>>
> >>> Benjamin Gaignard (1):
> >>>     dt-bindings: media: nxp,imx8mq-vpu: Update the bindings for G2 su=
pport
> >>>
> >>> Lucas Stach (3):
> >>>     dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
> >>>     dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
> >>>     soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl
> >>>
> >>>    .../bindings/media/nxp,imx8mq-vpu.yaml        |  58 +++++----
> >>>    .../soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml      |  71 +++++++++++
> >>>    arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  69 ++++++----
> >>>    drivers/soc/imx/imx8m-blk-ctrl.c              |  68 +++++++++-
> >>>    drivers/staging/media/hantro/hantro_drv.c     |   4 +-
> >>>    drivers/staging/media/hantro/hantro_hw.h      |   2 +-
> >>>    drivers/staging/media/hantro/imx8m_vpu_hw.c   | 119 +++-----------=
----
> >>>    include/dt-bindings/power/imx8mq-power.h      |   3 +
> >>>    8 files changed, 237 insertions(+), 157 deletions(-)
> >>>    create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,i=
mx8mq-vpu-blk-ctrl.yaml
> >>>
> >>>
> >>> base-commit: d1888b0bfd2ddef2e8a81505ffa200b92cc32e0c
> >
