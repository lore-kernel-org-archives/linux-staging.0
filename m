Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14072
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 10:23:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68F9463220
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636971821;
	bh=/t8XfUWWM8z249haMNnkzo9rz3rqA5hhnI/QUDdDTws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BuOY5ELTwM8ARl8dht0vPj74GqpW7Omi9ye6DZXl4ISYUdhHvn/MD+ynDDUT+QFtA
	 v8L7yTHPnv3tNZT+6a7jmvQiyHLX42OhSBtuErgkkpXMWboLAxbpYYXhkMyhP3kE41
	 WUL+WGa8r2Ml5m1pmbyJCKNiWaAA/tcOe62yL/fiNo14Evo43QgmMCKuyU9uToylcA
	 J85yoCIJTYPD2hiiYP9cnEUTFS41uyXrFoia9J9lYRG9OY91kMrhg72OL5ozjj1uQi
	 01RuRIianAw8FITBywentT0od4DYro7YDzqlmkyd3IDz3Pd+duWc1lFOAhroRxLO8P
	 vWZ7OvjtlSIUw==
Received: by mail-wr1-f52.google.com with SMTP id w29so29541578wra.12
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 02:23:41 -0800 (PST)
X-Gm-Message-State: AOAM532UbhNE/SKJJBZAMqCad0q1pomwn0PPIm+s+80bhEv1z1Cs+Sa9
	nkLtoLojD/O0LVXxjo3dNksS1EMzCuN+P78m7b8=
X-Google-Smtp-Source: ABdhPJzrg17TRzVZ0g7WiohBQZUnVilsZRnhlMklfo7pQF89sOPyjg8lWeE+TbAhUi7fYkrm+wuR9SFoHCL7lz7Lazw=
X-Received: by 2002:adf:df89:: with SMTP id z9mr45210699wrl.336.1636971819867;
 Mon, 15 Nov 2021 02:23:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org> <20211115085403.360194-11-arnd@kernel.org>
 <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
In-Reply-To: <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:23:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hfcbTJ-yKik1hN35dTdqhjhCd=3X6G_hW4MXRHDVrfA@mail.gmail.com>
Message-ID: <CAK8P3a2hfcbTJ-yKik1hN35dTdqhjhCd=3X6G_hW4MXRHDVrfA@mail.gmail.com>
Subject: Re: [PATCH 10/11] staging: ralink-gdma: stop using slave_id config
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Baolin Wang <baolin.wang7@gmail.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hyun Kwon <hyun.kwon@xilinx.com>, 
	Jaroslav Kysela <perex@perex.cz>, Jon Hunter <jonathanh@nvidia.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, dmaengine@vger.kernel.org, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, 
	linux-staging@lists.linux.dev, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 15, 2021 at 10:55 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Mon, Nov 15, 2021 at 9:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > ---
> >  drivers/staging/ralink-gdma/ralink-gdma.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
>
> This driver has been already deleted from the staging tree. See [0].

Ok, thanks! I'll just leave out the patch from future submissions, and remove
it completely once your commit hits mainline.

       Arnd
