Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ACF2C83
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 15:15:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F44063250
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636989318;
	bh=caNhQR6MItqyqj8aVGADFWmRHHEWyDNeG1UmwE7ptic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V/bQc6DKqJJ9P37PTBVcjhzef7pDvNHRvr3F3EgUQSqR6cy9gSS6hyzZDciApni0a
	 3QMWN6MNNmORUy4BghYhYSm0TENrtMowNG+BxfSpe4F6N3jXjJPkkbXvN49Ox0bMTt
	 fWhgBksXDZXchbDYG70HcbRVWZGHGtswftEIz2iyfbKUP7KKPZVOsGmmLlIrKIXyeJ
	 gzuikhV7beCSHi+4AycaC9/XDi8NPveqOXyRlBsMjwDJnNyhOY3SSISSPPYeOikYGF
	 0Xs8EXetoSOIeENEILqVUTpQifde5TJSWu7mnaCK9kgeWQDH6Cm3MkdBV5hVy9UqQz
	 656gt9SaY+hCg==
Received: by mail-wm1-f47.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso16097978wml.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 07:15:18 -0800 (PST)
X-Gm-Message-State: AOAM532ezsrqHcFHZuBTpZUwqo5351TQVhIdvdYw/for0L6KZc2WGtna
	xwnp4iAetWdks/84IRUWaIyX8LShD6EtlcI5HDc=
X-Google-Smtp-Source: ABdhPJy8n2MSwzh6suyWZ9JESZ+B+WCCwhvtwsBUIZeDj84QhV0+ZckRDxWsOxlhdmOo7jylNl8QiKm3gBRShRPmqHI=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr42651026wmj.35.1636989316377;
 Mon, 15 Nov 2021 07:15:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org> <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de> <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
 <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de> <5737810c-420a-2f8d-99bf-24a2558d5855@gmail.com>
In-Reply-To: <5737810c-420a-2f8d-99bf-24a2558d5855@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 16:15:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1dGSF-S4msKKWvPYORwYCFvtkNSJwkhtxvETgiQjC7_Q@mail.gmail.com>
Message-ID: <CAK8P3a1dGSF-S4msKKWvPYORwYCFvtkNSJwkhtxvETgiQjC7_Q@mail.gmail.com>
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Gross <agross@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Baolin Wang <baolin.wang7@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>, Jon Hunter <jonathanh@nvidia.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, dmaengine@vger.kernel.org, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, 
	linux-staging@lists.linux.dev, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 3:46 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 15.11.2021 14:53, Lars-Peter Clausen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> That Tegra SPDIF driver was never used. Still there is a growing
> interest nowadays in making it alive by implementing HDMI audio support
> for Tegra20 SoC. It was on my todo list for a long time, I'll try to
> prioritize that work 5.17, it shouldn't take much effort.
>
> The slave_id should be removed anyways, it won't be needed.

Ok, thanks for the background, I'll mention that in the changelog text then=
.

     Arnd
