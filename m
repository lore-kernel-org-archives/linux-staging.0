Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517902F80
	for <linux-staging@lists.linux.dev>; Tue,  6 Jul 2021 10:57:00 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id a8so13869758wrp.5
        for <linux-staging@lists.linux.dev>; Tue, 06 Jul 2021 03:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l+H215FJz8pJPI4hh9v/iWNuVbn0nifA4Jaafd28qC4=;
        b=UCSZee8bkwQhVbXkWa9n6dda1YB5cGQkIPiVKhb8KKz80S/zIXHEgxifSSr+8L29bp
         bwv7fkXzMNhKGGQN2c3BmsUcjrj/WCoXm6Ben2qP8+Bg0YH95vQBsFhGIbEyGr/lrU1Q
         Ln5txN4w7J+T5EMRaT/NpEGp+Hm9dI3o+V77bGk/sdRf0SYC4Lr7n5Wxc/3RjcZaFj49
         pMNis8YQVecjuUzjIFQPnwBJPdiGSBK5ZHDxUgMGNPSzs1az976bZyXyvd6ztydUQ9Xm
         nwGGg1WV1KPpW+turyU66Gq6SgHBmHxg/+HCmUj/1/PNr7tZsqoiZrxGaduOWyUClunz
         BuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l+H215FJz8pJPI4hh9v/iWNuVbn0nifA4Jaafd28qC4=;
        b=ak9rKnMf7jJ1zN1iyP+HD2nlWqR80Gw51owTsdlOpcChZNtK3KT0Em6+rKQO2MYRjI
         lGhsOa6j+AP7ayA+2S9I1wb7Pr3uC6w9HDrSCIp+9uqOkpW07QG7jD6Y/kOoizqy/HXe
         STRBz8iHkJxCfr+DG0aQCtJCnWApR5Gttdwvb2S9P3Nnb54eqF9PNfY9wl1UsYh/KGjd
         1mBu7Cx36kU+bfcOEmx0QmS9lHcrM1a0dz4Z4gROYYbT1gAWwznxgS8xIccd3D0XJyJH
         vHTCg/nY7SjsbgDc2Yp0K6kP74sCbRn9hXQU+8jzsv95/o8kBpiCRXFzUEJLBjJ66lJC
         k+xw==
X-Gm-Message-State: AOAM532ZuxXCp+tkq6jBqYXBJGfhQtFAGOuFxlkC9dbRyoXC09ASUSVf
	eZsvrIMQeW/xiRbC3xg/Kfgc2Q==
X-Google-Smtp-Source: ABdhPJwMhrNwpvhovE9XwK0jC9OIuq8TBsnt9DrnKno6fhX9rnIZO8Cd1er4LBIyS1GM0G/5i1HmFw==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr21172584wrq.355.1625569018612;
        Tue, 06 Jul 2021 03:56:58 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id o3sm16468134wrw.56.2021.07.06.03.56.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jul 2021 03:56:57 -0700 (PDT)
Subject: Re: [PATCH] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Geoff Levand <geoff@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <lenb@kernel.org>, William Breathitt Gray
 <vilhelm.gray@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Wu Hao <hao.wu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Samuel Iglesias Gonsalvez <siglesias@igalia.com>,
 Jens Taprogge <jens.taprogge@taprogge.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, Mark Gross <mgross@linux.intel.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bd408732-a23d-d3e6-3786-ea9fbf114d50@linaro.org>
Date: Tue, 6 Jul 2021 11:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 06/07/2021 10:50, Uwe Kleine-König wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> 
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> 
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
> 
> Signed-off-by: Uwe Kleine-König<u.kleine-koenig@pengutronix.de>
> ---
...

>   drivers/slimbus/core.c                    | 4 +---

for slimbus changes:

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

