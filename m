Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDC42C82
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 14:00:38 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id g14so87170101edb.8
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 06:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QaxZlmGeTiNSpZpCZqH57v2oCRS32AJdCJEiZtFl+fo=;
        b=UAL3sYoqWMmwujNOP724FqBzW5uObd++LAtVKS3v5u5Uf2OdsqcJyTAd46VvaTh5Bd
         CI7BPxy7k5sgJDqLq1RcsS3wNsihI78jdpDJIITTaw/+RdV8uJbwUA5jL3bVoiO2CnZz
         ECP+wZYQCeXwsVT03Cwq3TmyYVTdLKIqSaQxxB77ysN7pTZ6rhWOALXsXCermCrGDEm9
         xTqkC17qeHkGGjhP+HwJkZNAmoWQo1WEBi97ntM6TwL06wMqG3TUZavTpeNmgqXB4xXm
         gxbfUwfLqghdmcJf/K4rHwrkHT+sXq/VtbjNBGcKK6hDHJkwFOSBqyz3GYb+FTIsRGl6
         hXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QaxZlmGeTiNSpZpCZqH57v2oCRS32AJdCJEiZtFl+fo=;
        b=REgxMeg0+DjGI9/jTkrTcmJtTNQzK2Wfid+6nkLEec4Hdth2gwm9PBgFlmZa0tpIfQ
         lBXrX6Og+iZHNrKk6AHw36ce1wOnxBr+yxN/zI+hh+QKSw4TtkoekBhIbWaKJq1gi/zh
         WutgZA7/zwbaK2f0cLvF2nGXS3dTD90TUMq9bzRg7+mL2LfQa6GgLWUDm6qlviY2JTZI
         VL0kPmM2mY0wGAa4x6d8sOwpw9VTvfxwhVTmmYD29TNctvRxza8Nvwkdm1AophvdQWHn
         hpONuI/bNrs/Woju5C3NLlu9G5WfWJM4jT5hEnuTqIUfVheOQbcX2O9ge8CVH/oqIWp2
         S6DA==
X-Gm-Message-State: AOAM530Vj3F7wLfHXoRI+45haOlFe5kUF3g79+3/yJ1+w+kumg0l73d1
	0h7E1OhkSlF2HfqUaNbggepm5udtBbngLL/g4Dxh/w==
X-Google-Smtp-Source: ABdhPJwnUIPwozxEvD8GWiVDDYw5ZDqSXm6R85I9zeuQ3bp/QzgWXBdhWWpkvOKxcxv7W9iIJOUZHicmrUxw7zSXQ5g=
X-Received: by 2002:a05:6402:34c1:: with SMTP id w1mr83741602edc.179.1638280836615;
 Tue, 30 Nov 2021 06:00:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211106183802.893285-1-aford173@gmail.com> <718f7f6d6cd564d031c1963f1590c62d549ae725.camel@ndufresne.ca>
 <CAHCN7xKM9RUE7z-+ug1on+D=nDoEm589R4m03ofys92Aq75ZVQ@mail.gmail.com>
 <8db00a4b6faa99c940d9bc86e17161eb0db5efe3.camel@ndufresne.ca>
 <CAJ+vNU28UJffFv9jQ2KryJMudqYxvCaoVOVcU5dPqRA209iN6A@mail.gmail.com>
 <d91532c2c0772f9aa708ead36b2a97203727a7ea.camel@ndufresne.ca>
 <CAJ+vNU3H-V+bPoZ3qKead45h=W7AhQK6Lhjrx5ssdF4c_qfe=A@mail.gmail.com>
 <CAHCN7x+0LwwU_rEST+TZxGquswGKL19gnTy9WLofsXtGAtWqdw@mail.gmail.com>
 <7f94eaacfddb8c5434c17f1e069ea87a17657ce9.camel@ndufresne.ca>
 <CAHCN7xKRzxMBmPbDobWTuvNNSpTXk5XENvfBnfkhRY3eZKhn6w@mail.gmail.com>
 <CAHCN7xJFLNi_g+HX8PCy1Rkgf0jnWpO5QGYVz8nH19xrJkwHrA@mail.gmail.com>
 <CAJ+vNU3zFd=6k_Emc5aafxKkGwCPp4crgOFezQ-E_MbWsn1_EA@mail.gmail.com>
 <fed6c2fd7cf4971062c417ce41ed1e3812b900e0.camel@ndufresne.ca>
 <CAHCN7xK+wROHaqDcsY-3WYFQ82qX17L-LHNL3siSWnWvwFShzQ@mail.gmail.com>
 <CAAEAJfC1xXvemaFP+vTFVJ3S-SpYtrxyZgDamSOgLC1F3ua5xw@mail.gmail.com>
 <CAHCN7x+UMMP6RXsNm0=OC=UTQzh=RKqQo6B7FD5e4eoJAEfmpg@mail.gmail.com> <CAJ+vNU1epi9SwPMHkuDmKcb68RLemYF=bsp7AVnzz06zKc2efw@mail.gmail.com>
In-Reply-To: <CAJ+vNU1epi9SwPMHkuDmKcb68RLemYF=bsp7AVnzz06zKc2efw@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 30 Nov 2021 11:00:24 -0300
Message-ID: <CAAEAJfCpjk5nWWkJYjjDT-YEpJi4pTZqZbzp_if9OGC0HKspzw@mail.gmail.com>
Subject: Re: [RFC 0/5] arm64: imx8mm: Enable Hantro VPUs
To: Tim Harvey <tharvey@gateworks.com>
Cc: Adam Ford <aford173@gmail.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	linux-media <linux-media@vger.kernel.org>, 
	Schrempf Frieder <frieder.schrempf@kontron.de>, Marek Vasut <marek.vasut@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Adam Ford-BE <aford@beaconembedded.com>, 
	cstevens@beaconembedded.com, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, 
	Lucas Stach <l.stach@pengutronix.de>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
	Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"open list:HANTRO VPU CODEC DRIVER" <linux-rockchip@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

On Mon, 29 Nov 2021 at 16:36, Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Mon, Nov 29, 2021 at 10:59 AM Adam Ford <aford173@gmail.com> wrote:
..
> >
>
> Adam,
>
> What deps did you install in order to get v4l2codecs building? I
> installed libgudev-1.0-dev based on Nicolas' suggestion and rebuilt
> (not sure if I needed to re-configure somehow) but there is still
> nothing in build/subprojects/gst-plugins-bad/sys/v4l2codecs/. A 'meson
> configure' tells me that v4l2codecs is set to 'auto' but I'm not sure
> how to find out what dependencies are needed or what may be missing.
>

At least in my case (Centps-derivative), this is what I've done:

...
gst-plugins-bad| Run-time dependency gudev-1.0 found: NO (tried
pkgconfig and cmake)

Installed gudev ... and then:

...
gst-plugins-bad| Dependency gudev-1.0 found: YES 232 (cached)
...
gst-plugins-bad 1.19.3.1

    Plugins               : accurip, adpcmdec, adpcmenc, aiff, asfmux,
audiobuffersplit, audiofxbad, audiomixmatrix, audiolatency,
audiovisualizers, autoconvert, bayer,
                            camerabin, codecalpha, coloreffects,
debugutilsbad, dvbsubenc, dvbsuboverlay, dvdspu, faceoverlay,
festival, fieldanalysis, freeverb, frei0r,
                            gaudieffects, gdp, geometrictransform,
id3tag, inter, interlace, ivfparse, ivtc, jp2kdecimator, jpegformat,
rfbsrc, midi, mpegpsdemux,
                            mpegpsmux, mpegtsdemux, mpegtsmux, mxf,
netsim, rtponvif, pcapparse, pnm, proxy, legacyrawparse,
removesilence, rist, rtmp2, rtpmanagerbad,
                            sdpelem, segmentclip, siren, smooth,
speed, subenc, switchbin, timecode, transcode, videofiltersbad,
videoframe_audiolevel, videoparsersbad,
                            videosignal, vmnc, y4mdec, decklink, dvb,
fbdevsink, ipcpipeline, nvcodec, shm, v4l2codecs, hls, sctp

GStreamer current master build fails. It's a known issue which will be
fixed today:

[...]
[8/9] Compiling C object
subprojects/gst-plugins-bad/sys/v4l2codecs/libgstv4l2codecs.so.p/gstv4l2cod=
ecvp9dec.c.o
FAILED: subprojects/gst-plugins-bad/sys/v4l2codecs/libgstv4l2codecs.so.p/gs=
tv4l2codecvp9dec.c.o
cc -Isubprojects/gst-plugins-bad/sys/v4l2codecs/libgstv4l2codecs.so.p
-Isubprojects/gst-plugins-bad/sys/v4l2codecs
-I../subprojects/gst-plugins-bad/sys/v4l2codecs
-Isubprojects/gst-plugins-bad -I../subprojects/gst-plugins-bad
-Isubprojects/gstreamer/libs -I../subprojects/gstreamer/libs
-Isubprojects/gstreamer -I../subprojects/gstreamer
-Isubprojects/gst-plugins-bad/gst-libs
-I../subprojects/gst-plugins-bad/gst-libs
-Isubprojects/gst-plugins-base/gst-libs
-I../subprojects/gst-plugins-base/gst-libs -Isubprojects/orc
-I../subprojects/orc -Isubprojects/gstreamer/gst
-Isubprojects/gst-plugins-base/gst-libs/gst/video
-Isubprojects/gst-plugins-base/gst-libs/gst/pbutils
-Isubprojects/gst-plugins-base/gst-libs/gst/audio
-Isubprojects/gst-plugins-base/gst-libs/gst/tag
-I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include
-I/usr/include/gudev-1.0 -fdiagnostics-color=3Dalways
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -O2 -g -fvisibility=3Dhidden
-fno-strict-aliasing -DG_DISABLE_DEPRECATED -Wmissing-prototypes
-Wdeclaration-after-statement -Wold-style-definition
-Wmissing-declarations -Wredundant-decls -Wwrite-strings -Wformat
-Wformat-security -Winit-self -Wmissing-include-dirs -Waddress
-Wno-multichar -Wvla -Wpointer-arith -fPIC -pthread -DHAVE_CONFIG_H
-MD -MQ subprojects/gst-plugins-bad/sys/v4l2codecs/libgstv4l2codecs.so.p/gs=
tv4l2codecvp9dec.c.o
-MF subprojects/gst-plugins-bad/sys/v4l2codecs/libgstv4l2codecs.so.p/gstv4l=
2codecvp9dec.c.o.d
-o subprojects/gst-plugins-bad/sys/v4l2codecs/libgstv4l2codecs.so.p/gstv4l2=
codecvp9dec.c.o
-c ../subprojects/gst-plugins-bad/sys/v4l2codecs/gstv4l2codecvp9dec.c
../subprojects/gst-plugins-bad/sys/v4l2codecs/gstv4l2codecvp9dec.c:92:3:
error: unknown type name =E2=80=98grefcount=E2=80=99
   grefcount ref_count;
   ^~~~~~~~~
../subprojects/gst-plugins-bad/sys/v4l2codecs/gstv4l2codecvp9dec.c: In
function =E2=80=98gst_v4l2_codec_vp9_dec_picture_data_new=E2=80=99:
../subprojects/gst-plugins-bad/sys/v4l2codecs/gstv4l2codecvp9dec.c:106:3:
warning: implicit declaration of function =E2=80=98g_ref_count_init=E2=80=
=99; did you
mean =E2=80=98g_cond_init=E2=80=99? [-Wimplicit-function-declaration]
   g_ref_count_init (&pic_data->ref_count);
   ^~~~~~~~~~~~~~~~
   g_cond_init
../subprojects/gst-plugins-bad/sys/v4l2codecs/gstv4l2codecvp9dec.c: In
function =E2=80=98gst_v4l2_codec_vp9_dec_picture_data_ref=E2=80=99:
../subprojects/gst-plugins-bad/sys/v4l2codecs/gstv4l2codecvp9dec.c:118:3:
warning: implicit declaration of function =E2=80=98g_ref_count_inc=E2=80=99=
; did you
mean =E2=80=98g_strv_contains=E2=80=99? [-Wimplicit-function-declaration]
   g_ref_count_inc (&data->ref_count);
   ^~~~~~~~~~~~~~~
   g_strv_contains
../subprojects/gst-plugins-bad/sys/v4l2codecs/gstv4l2codecvp9dec.c: In
function =E2=80=98gst_v4l2_codec_vp9_dec_picture_data_unref=E2=80=99:
../subprojects/gst-plugins-bad/sys/v4l2codecs/gstv4l2codecvp9dec.c:125:7:
warning: implicit declaration of function =E2=80=98g_ref_count_dec=E2=80=99
[-Wimplicit-function-declaration]
   if (g_ref_count_dec (&data->ref_count)) {
       ^~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

Hope this helps get you started!
Ezequiel
