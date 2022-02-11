Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AE7E
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 18:32:43 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id d10so24653336eje.10
        for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 10:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9xAIDus574te+VbjZxp7AqnLEsNautdb3qfKteY8Atk=;
        b=hfJvdBnL4DZMrSn5s+r0BqXbnEKePYO9ys9WaIm9t7TtL4cKhL5V5M4a0WQArtqUGo
         kAhZikf/aQK7Ihwi6mDkorNySMpAF9z/sBOZrJpSGxghAvqxCswC/HhlfBmUaNJyb/oU
         Tjw8eSZpq/kuVlcm5pp5B1nLJXdTidehOb8FXZ1hkn/Dlhs443lYZ+NpiHIBgS1da+ba
         U/5ICOQrvKA8Ivrc2+wlRa1ueJXYXX7MhRkD/Lyf9WguWxA1N09CvnOA6XQkj9unWVCA
         eaKgaiACUXlOp5zdFWQHD0/YY/yB8U4LCr8gdhv+PCQ7O9XETHDPCNJZKQ2qeExUDIDG
         E4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9xAIDus574te+VbjZxp7AqnLEsNautdb3qfKteY8Atk=;
        b=NwtW1mIql8Oma77T3xb/EcpV6MJNGOx/XgF0cz5JpY4BBbK+MfB+FbzEliUUrqDMv8
         eODzMLyL88eePlGbpXZij3ogGMQdoerWC5BpW2Zb9Rlm5g2l8fv7vSjXauDZviXRvLam
         8/OLMj98hi+IYEAPK3Ny58KCfseGP/lcFjOw1IdkWsMhKhcrGLEajoYhy9Xj74h18epE
         hcHKH9CKeVpYP/+deRZAhmgy5t4wMo80jBS+ShcWGtxkfRtX0/ARhL3H9+oxtGtdHmC2
         gTLKGIrgGWffbyVZOmrYKd7z69Rb7wslyx8CmCmEHuKqwygPDpEwbIa087CWgmRZaqoG
         pp9g==
X-Gm-Message-State: AOAM530pQOBzyiNTwRa+Gj6Shw0CoaNMqvtrMkR9zLskYz/CdcmqLMu1
	ATCRfjZ9OyBIoA8RIm1eiMD9C4Qnm2L+3e9PrmU=
X-Google-Smtp-Source: ABdhPJy0bBkhLGrz7kx4dmxaFc57bwGXig/+otnnfWPtLStC+HmVkdQn//jYlk+R+SZKLVIWVKDA6D4sHl2STZ9VNi8=
X-Received: by 2002:a17:907:c26:: with SMTP id ga38mr2459656ejc.626.1644604361803;
 Fri, 11 Feb 2022 10:32:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220211180216.290133-1-jacopo@jmondi.org> <20220211180216.290133-2-jacopo@jmondi.org>
In-Reply-To: <20220211180216.290133-2-jacopo@jmondi.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 11 Feb 2022 15:32:31 -0300
Message-ID: <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: imx: De-stage imx7-mipi-csis
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	xavier.roumegue@oss.nxp.com, Sascha Hauer <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-media <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

On Fri, Feb 11, 2022 at 3:01 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> The imx7-mipi-csis driver is in a good state and can be staged.

I think you meant de-staged :-)

> Move the imx7-mipi-csis.c driver to the newly created
> drivers/media/platform/imx directory and plumb the related
> options in Kconfig and in Makefile.

What about the comments in drivers/staging/media/imx/TODO?
