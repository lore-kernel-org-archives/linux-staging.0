Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1D2C81
	for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 02:34:04 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id o17so17634542qtk.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 18:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H7zphfLIx/KIgfDYl4IOIHLAMRHep0aAJWdFC+/UaNA=;
        b=Rv9D8UmXSnZm8Bh1GoID8bVVWxDSBCNC4THC6v2fMK/Xjd292jrTfr7HPA60SNEtwN
         ZgsT0rxJwlV6MOX9Mg6pvUENSnqSy2PQ2g8jSGe+VqlgUmaWXSUfhPUZeSN4Fjajej12
         5XGHxJR8dHzi+y/D5OyS1PY3DAsZpFVkKp3/v6f/uQCqYI1Qr3yD9AkpuaeXc9VqfW+V
         M1x6wN6oOWmV11GcQr/YkSBk23I2+wU1hI/jCjuvcU38zE/cs/R7fEQsdfdOc5KnoW9r
         Rm7LflRIaRzZ6opJytsFOdWfMdhhaI2YGLSFevIBziJS5jOjAAh8T2jiE5v+PuwtXZTT
         AZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H7zphfLIx/KIgfDYl4IOIHLAMRHep0aAJWdFC+/UaNA=;
        b=InppDcRmDhbiX9r+rCcMGKogfmHLvZ+4taN/7GyQ2nFtfYnOzvgKSjs7fV4tRxV2LV
         z80dRSxfr7zND9tp8Um3el2kzfkga+hUUlbtf1if5GQRr0yAHrd92YhY984SELVKi4Rg
         7fLFR0Eo+ImV47+mGUKrIihqGhjphgEL6xe3OA73HaSWddV9MuxJs+3gsR3GaJRPZGDh
         uTNJ00s55Egbf/P/YWh29rsKASG92Gazi+GYQvSOaWY8v7qt+StNMCdBSo/CtJ6oeRy1
         eAjLZSMVI3cxBhtT9Ts4+Xego4iOt2uvaEjcsP+4tTDMjH4waSrpiZ0x9AS9pfAa9dNf
         9Oig==
X-Gm-Message-State: AOAM532TDZVgTWnxbNoyR2VcwxgNwphcA6qw33XwxOFRzespxjLLi591
	+yIIUD0/GRaRA2lbHyAeREUmj/FhfOeqUlZPAwQ=
X-Google-Smtp-Source: ABdhPJxy3/yvIoE1Sby1RB+LrFWAG186ca20J3KfKBtNLU6iYwGxwglI0cKh7RVW16SHtAlV0ZDpZK2743We/bDxwtI=
X-Received: by 2002:ac8:5991:: with SMTP id e17mr3975451qte.344.1637030043682;
 Mon, 15 Nov 2021 18:34:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org> <20211115085403.360194-7-arnd@kernel.org>
In-Reply-To: <20211115085403.360194-7-arnd@kernel.org>
From: Baolin Wang <baolin.wang7@gmail.com>
Date: Tue, 16 Nov 2021 10:34:39 +0800
Message-ID: <CADBw62oYab_d+uS_8kfC9JqhUxVhK79G4wbWyZy7+RL6P9tVvA@mail.gmail.com>
Subject: Re: [PATCH 06/11] dmaengine: sprd: stop referencing config->slave_id
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hyun Kwon <hyun.kwon@xilinx.com>, 
	Jaroslav Kysela <perex@perex.cz>, Jon Hunter <jonathanh@nvidia.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@gmail.com>, alsa-devel@alsa-project.org, 
	bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, linux-spi@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, Nov 15, 2021 at 4:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> It appears that the code that reads the slave_id from the channel config
> was copied incorrectly from other drivers. Nothing ever sets this field
> on platforms that use this driver, so remove the reference.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks. LGTM.
Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>

--
Baolin Wang
