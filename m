Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898A2C82
	for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 14:47:41 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id m20so43155401edc.5
        for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 06:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mgaqjk8sgzbSZfMvDCSzKXjRpwlwJK3+PAYiZNEuOBE=;
        b=nV/7kFKtbhV4ChQ9ucaq7lglpxHn2UyUeU00RAxwvn0aQn9ywvmJO1dJCH2H3rlnT/
         RPoVFac2heZmhtOPq+gwUaBv9O6eqNaFfyIczRVZI5bg3d92EZYiHpEf7uwk2pAHpVPd
         nIeRMcDdxUZr4zE1jkv6OMYH0zk1YjndhjSNI/4Aj3t2l3q5XcWVseL9+06iStE9i+W/
         Go5Bmj+H6j0Gnml6h6TttWRId+7o9bPnnQTul5yNBmwDKVxY2Tu5sI3iFP+F6rXQqXuI
         y3Vjz6ozUASBDVNrCXCMtODVVvyRn1WCL69AnOEI4TCcrA2Ii4tYtG0jUFsLAOm8ty2V
         Uc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mgaqjk8sgzbSZfMvDCSzKXjRpwlwJK3+PAYiZNEuOBE=;
        b=5ifAsolK4MAAZS0L63ufLtHuvNXnHhNSiPFepaYlKQrcJh5+DjP+6AhnRNktAMkWis
         X917QgSMKh88fxO/p6I90gArx9rjBX7pcQanI9zjDz+j+HmbPO3/S2J+DQDnDEYJqHUn
         KyRUbog+TLgO0FF3Fc746x5VInkJb9Hjv9SmOFiD5WyHd0aXYSWxasqDTY8TauDjq/PZ
         LqPb9p+uJxB1sqYirrbQjrkhJ6nY6BOzZ/Yl2AuddCNiUnoO+vmE7AwA2gJbPqbQfnCl
         dAMJhxpXibucoHP/UO2nxciOfJAdbVS5i8MrJfLSXq7E0OHH2F5RBmES0wHRFniay4Kr
         VquQ==
X-Gm-Message-State: AOAM532X6wJKLOw+tb/XC8IWVlcRgamQO1er9paCOOp9RwQStbix7Lbh
	o8GKTz1YNlJ6yI0TTxeLaJFFThRRFbKZIvbfG1ShIw==
X-Google-Smtp-Source: ABdhPJxz70hgLYrABSLSFXH5Gg+bcgsU1RfiTzsk+WCrJ+nxltCEmGAkIEe4gDw2GOEMoqO92TBYbIsiqbdWyf4FlJ0=
X-Received: by 2002:a17:906:3b84:: with SMTP id u4mr10651360ejf.310.1637074060018;
 Tue, 16 Nov 2021 06:47:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211116143842.75896-1-andrzej.p@collabora.com>
In-Reply-To: <20211116143842.75896-1-andrzej.p@collabora.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 16 Nov 2021 11:47:28 -0300
Message-ID: <CAAEAJfANEficRLg2JCvOmv_pv9j9tEVPPsph4n4TYkeBjeUWiQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/12] VP9 codec V4L2 control interface
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media <linux-media@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Nov 2021 at 11:38, Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Dear all,
>
> This patch series adds VP9 codec V4L2 control interface and two drivers
> using the new controls. It is a follow-up of previous v7 series [1].
>
> In this iteration, we've implemented VP9 hardware decoding on two devices:
> Rockchip VDEC and Hantro G2, and tested on RK3399, i.MX8MQ and i.MX8MP.
> The i.MX8M driver needs proper power domains support, though, which is a
> subject of a different effort, but in all 3 cases we were able to run the
> drivers.
>
> GStreamer support is also available, the needed changes have been submitted
> by Daniel Almeida [2]. This MR is ready to be merged, and just needs the
> VP9 V4L2 controls to be merged and released.
>
> Both rkvdec and hantro drivers are passing a significant number of VP9 tests
> using Fluster[3]. There are still a few tests that are not passing, due to
> dynamic frame resize (not yet supported by V4L2) and small size videos
> (due to IP block limitations).
>
> The series adds the VP9 codec V4L2 control API as uAPI, so it aims at being
> merged without passing through staging, as agreed[4]. The ABI has been checked
> for padding and verified to contain no holes.
>
> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=6393
> [2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/2144

Due to GStreamer monorepo, the MR has been moved to

https://gitlab.freedesktop.org//gstreamer/gstreamer/-/merge_requests/1012

Thanks,
Ezequiel
