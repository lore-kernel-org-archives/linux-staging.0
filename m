Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B24E2C94
	for <linux-staging@lists.linux.dev>; Tue, 23 Nov 2021 11:19:18 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 207so10374675ljf.10
        for <linux-staging@lists.linux.dev>; Tue, 23 Nov 2021 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w+ogjWxG1DbsOOSKAdBRBvdcSf1vlOMjAXY68aT/3+U=;
        b=g2Y3CYQC1NcCLavzUvr4ErWMQvZ4fzsgBv6CCbmTOoZcOun8WjSds54sZrtzeYEA0U
         N5KF7mJ3kl8nFIULnhlxeAUeFZAuCfq+uX5Urd7Y31Xp8cHxNzCxkkp6HS46EZb3D6jZ
         c7TwybE0YdC9woGghm+c/KCOlK35CIfDZrYTO7zFljpZaTHjklc27An1TOol1n/1idvS
         kCKfDejnDdUw+aN2JJNNmUQf32+SP4pOXJVkzxhNH+rbEkLFMLkjE8yfz5ElxThNneaF
         SJXtBIs1DuxaYn0676eJKdryXGQlku5s0UQEwOdM0oGilYhXoK+2140z6YDVV15iHy6a
         9PQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w+ogjWxG1DbsOOSKAdBRBvdcSf1vlOMjAXY68aT/3+U=;
        b=cYgnwWx4LY+dnSNMpEugzlQklMDrjgwl4rnPhW8R424to4H+ajor/BkPLIp64ZAHNX
         JM8pTWcVhoRx9LrMZKJ4mXLxYzu8sTIn71Do8a9lHcq3ZU4OLHGyjgWJy/CTvwsjpmsP
         aOdNzydt/wzLGOJnohWskYZQVpqAjVhy57qRDDJ/vk8/WTt9AShII2SBSBR9reXIWwHV
         WzpYh/efTOT3BeFKh9Cp1+D90oirRM4fQi8mEi5h77US3K1+vUI5mvZ3DJ+2O5wQ97Fs
         nrfckwE2Jhraf1cjwTA8RvSqfyMTx656UZmdclHeuy0MSvH8ymT3tzvEDmz57NtzYbwC
         5k7A==
X-Gm-Message-State: AOAM532Hx03K6zkotKztIFRDM0bdep4V0vc9QdwRL6QLvd1VfVdmYK7s
	waaTUKJGGGFlZENc1mUImmgK4kVHUOysci1Fnwavmw==
X-Google-Smtp-Source: ABdhPJxH+dIDF8nBsp8fxznpkoFe9y9Zmc/xUzjvp4Mfv2L5TNuCMH6djlHGcQ7ManpwMDd1PzQBcWJG8pF2EVa/HSY=
X-Received: by 2002:a05:651c:1507:: with SMTP id e7mr4381662ljf.300.1637666356182;
 Tue, 23 Nov 2021 03:19:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122222203.4103644-1-arnd@kernel.org> <20211122222203.4103644-5-arnd@kernel.org>
In-Reply-To: <20211122222203.4103644-5-arnd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Nov 2021 12:18:40 +0100
Message-ID: <CAPDyKFrCOoFWuM_6Renu+M5SHotyuzXeyH99WZb69G1PFQ1z5A@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] mmc: bcm2835: stop setting chan_config->slave_id
To: Arnd Bergmann <arnd@kernel.org>
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
	Thierry Reding <thierry.reding@gmail.com>, alsa-devel@alsa-project.org, 
	bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Nov 2021 at 23:23, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The field is not interpreted by the DMA engine driver, as all the data
> is passed from devicetree instead. Remove the assignment so the field
> can eventually be deleted.
>
> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I think I acked the previous version, but nevermind:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/bcm2835.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index 8c2361e66277..463b707d9e99 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -1293,14 +1293,12 @@ static int bcm2835_add_host(struct bcm2835_host *host)
>
>                 host->dma_cfg_tx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>                 host->dma_cfg_tx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> -               host->dma_cfg_tx.slave_id = 13;         /* DREQ channel */
>                 host->dma_cfg_tx.direction = DMA_MEM_TO_DEV;
>                 host->dma_cfg_tx.src_addr = 0;
>                 host->dma_cfg_tx.dst_addr = host->phys_addr + SDDATA;
>
>                 host->dma_cfg_rx.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>                 host->dma_cfg_rx.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> -               host->dma_cfg_rx.slave_id = 13;         /* DREQ channel */
>                 host->dma_cfg_rx.direction = DMA_DEV_TO_MEM;
>                 host->dma_cfg_rx.src_addr = host->phys_addr + SDDATA;
>                 host->dma_cfg_rx.dst_addr = 0;
> --
> 2.29.2
>
