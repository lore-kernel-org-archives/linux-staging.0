Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B4D68
	for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 16:29:52 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id w15so10780579ill.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Nov 2021 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NA+2l6X3VrlJxsJamfaAblN1iQr9G5GeyeDjrzqWldE=;
        b=pWYGr8brYDg2I9xcuGuhurThossAPr1q87fBQPqCiM2BAja4C7uFnX65Fix38gLbMR
         at4/FYFXGd1o9zn1i0YRa4Hl3P62bx1s2GsXPKOGSzrVsAT1Xw8HlYNWbORdzoDIOeqe
         0qslCNUJ66VzbM5OECQeydfyhNNqUWwGP6afEEwmpoOMoNIZnNaZfchouPoszwNYzV1v
         y1bimltU6qqxfdJSKgW6NjHgo6foggqrexAHaTR5BhNExaTs0kreVzSvKeiuvCJBGMM5
         4hhlHH8MqKp2ss3LA9dpdsxQOKHOGkUr880PDTOgcILg0r5nps7M4Bb//54zUt1tJBXH
         UXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NA+2l6X3VrlJxsJamfaAblN1iQr9G5GeyeDjrzqWldE=;
        b=7As5YMpkTV8va2H9rpHBy8b9HSBrxYMwmH3a5RZ4SgVRf2fAmyF3vdegbHl7Crc7TV
         9eeIBKJmBw4yns98+V8p86yInPpTsguc0mb3uq2NyjQZdaNfG1p35EeedbzK2ttkIPSn
         Sp+6E1oAe5tTMrumcQ4l/H05sOPSeQNl1TXDSdzQ2oK+kLl8vwZC5GERFUGT6SZMzbW/
         Y8i62slY/i+v+OvKrYxWG2zr77rwLWx3uh0Mdmf82FNhhknzMRN9BvHAeao4ADkP+9nV
         mX7+IP67q6W0apD3PQbOLHpHNR9PPcpTgWC6zBbqoLHkwhg5//TgctpvoeDpHyKtHhjU
         BSCQ==
X-Gm-Message-State: AOAM532Ut4aMTVlGcDX2Iue4yJNrTiF2deQu/iswSgf44vwOjWVKR3lD
	/zmisca7ngAd1CnSkq1Agi7Neg==
X-Google-Smtp-Source: ABdhPJy9+PK69iHyuVZcAK9TkCljtUM0G3YiAMHQdYjwnsW/n1HgnSVsWmM0mEP/36cqcfaj9/5ecQ==
X-Received: by 2002:a92:d343:: with SMTP id a3mr5688828ilh.136.1637339392190;
        Fri, 19 Nov 2021 08:29:52 -0800 (PST)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id c7sm108143iob.28.2021.11.19.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:29:51 -0800 (PST)
Message-ID: <7f94eaacfddb8c5434c17f1e069ea87a17657ce9.camel@ndufresne.ca>
Subject: Re: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Adam Ford <aford173@gmail.com>, Tim Harvey <tharvey@gateworks.com>
Cc: linux-media <linux-media@vger.kernel.org>, Schrempf Frieder
 <frieder.schrempf@kontron.de>, Marek Vasut <marek.vasut@gmail.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Adam Ford-BE <aford@beaconembedded.com>,
  cstevens@beaconembedded.com, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner
 <heiko@sntech.de>, Lucas Stach <l.stach@pengutronix.de>, Joakim Zhang
 <qiangqing.zhang@nxp.com>, Alice Guo <alice.guo@nxp.com>, Peng Fan
 <peng.fan@nxp.com>, "open list:HANTRO VPU CODEC DRIVER"
 <linux-rockchip@lists.infradead.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>,  "open list:STAGING SUBSYSTEM"
 <linux-staging@lists.linux.dev>
Date: Fri, 19 Nov 2021 11:29:48 -0500
In-Reply-To: <CAHCN7x+0LwwU_rEST+TZxGquswGKL19gnTy9WLofsXtGAtWqdw@mail.gmail.com>
References: <20211106183802.893285-1-aford173@gmail.com>
	 <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
	 <CAHCN7xKM9RUE7z-+ug1on+D=nDoEm589R4m03ofys92Aq75ZVQ@mail.gmail.com>
	 <8db00a4b6faa99c940d9bc86e17161eb0db5efe3.camel@ndufresne.ca>
	 <CAJ+vNU28UJffFv9jQ2KryJMudqYxvCaoVOVcU5dPqRA209iN6A@mail.gmail.com>
	 <d91532c2c0772f9aa708ead36b2a97203727a7ea.camel@ndufresne.ca>
	 <CAJ+vNU3H-V+bPoZ3qKead45h=W7AhQK6Lhjrx5ssdF4c_qfe=A@mail.gmail.com>
	 <CAHCN7x+0LwwU_rEST+TZxGquswGKL19gnTy9WLofsXtGAtWqdw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Adam, Tim,

[...]
> > > > Nicolas and Adam,
> > > > 
> > > > For the H1 patches in this series: I've been able to test the IMX8MM
> > > > H1 JPEG encode using GStreamer 1.18.5:
> > > > $ gst-inspect-1.0 | grep -e "v4l2.*enc"
> > > > video4linux2:  v4l2jpegenc: V4L2 JPEG Encoder
> > > > $ gst-launch-1.0 videotestsrc ! jpegenc ! rtpjpegpay ! udpsink
> > >                                   ^ v4l2jpegenc
> > > 
> > > This is just a transcript error ?
> > 
> > Nicolas,
> > 
> > No! Thanks for catching my mistake. I was testing with software encode... ooops!
> > 
> > 'gst-launch-1.0 videotestsrc ! v4l2jpegenc ! fakesink' actually hangs
> > the board so likely a power-domain issue there?
> 
> The v4l2-compliance tests fail on the h1 decoder with a hang, but I
> think we're writing to registers which are not documented in the Mini
> TRM.  The Mini TRM doesn't explicitly show the JPEG encoding as a
> feature, but some of the registers state JPEG, but because some of the
> registers written for the H1 are not documented in the TRM.  If those
> registers are restricted or not in this SoC, I am concerned that it
> might be related.  I'll try to run some more tests this weekend to
> check on the status of the power-domain stuff.

To verify if the HW support JPEG encoding you can read SWREG63 bit 25. This is
in the TRM, just not labelled properly. To mimic the decoding side, would be "HW
synthesis config register X" with the bit labelled SW_ENC_JPEG_PROF (but
PROF/profile is on or off). If your board hang while reading this, you likely
didn't get the power bit right.

IMX8 has an undocumented control block thing that we have been fighting with in
imx8q,  perhaps that's your issue. Few driver was proposed, we are still pending
on NXP solution to be submitted (they asked us to wait, still waiting =)).

> > 
> > > 
> > > > host=192.168.1.146 port=5000
> > > > viewed on client@192.168.1.146 via:
> > > > $ gst-launch-1.0 udpsrc port=5000 ! application/x-rtp,payload=96 !
> > > > rtpjpegdepay ! jpegdec ! autovideosink
> > > > 
> > > > For the G1/G2 patches in the series I don't see any Gstreamer
> > > > 'v4l2.*dec' elements. Perhaps I need a newer version of Gstreamer.
> > > 
> > > Most likely yes, I suggest building gstreamer/ branch "main", GStreamer has now
> > > a single repository. We are very close to 1.20, which will include stable API
> > > support of H264, MPEG2 and VP8 decoding.
> > > 
> > 
> > Ok, let me see if I can navigate through the build process and I'll
> > get back to you.
> > 
> > Thanks,
> > 
> > Tim
> > 
> > > > 
> > > > I have CSI capture and DSI display currently working on
> > > > imx8mm-venice-gw73xx-0x that I can play with. The CSI sensor only
> > > > supports RAW8/RAW10 (and gstreamer currently only supports RAW8) and I
> > > > can't efficiently convert to something the JPEG encoder likes without
> > > > bayer2rgbneon (a libneon version).
> > > > 
> > > > I see from the IMX8MMRM that the 2D GPU supports scaling etc with a
> > > > wide range of data formats but I'm not sure how to tap into this as
> > > > that hardware is managed by the vivante driver. On the IMX6QDL there
> > > > is a separate IPU block that Philipp Zabel wrote a nice mem2mem
> > > > csc/scaler driver for but I don't see any equivalent currently for
> > > > IMX8MM.
> > > > 
> > > > Best regards,
> > > > 
> > > > Tim
> > > 

