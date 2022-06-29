Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6429AB;
	Wed, 29 Jun 2022 14:25:59 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id lw20so32992948ejb.4;
        Wed, 29 Jun 2022 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nzVAkjUIXnSmifmZO/KNuTW33GCGTCzsi9aX026XXeg=;
        b=S2dVib/eYmAFl827WdIoCLllzfbxALRjIjzfRRwuBWpdbVEMsjXdf1fQZ0QK1n2n0J
         7Rc0uKmDUlj06sv7gme85B+3fLmze+mOouy0tIsuBDVpy1nD4eEh9k2i1LyAyfo/z7Zj
         KDlk5RBwfb1T/0o1rVzuZORFiKZsCvSsNfve9fNt60vuT8XdzQWLTwkS/9FAhK69nmEs
         mEzSIHBFyIvznhb3ZYEmWznM5HxrpFTwi8PXn2kSF7LDJWEQQU2316sTZ03OvudAaN+G
         thYeRK11RnXT7zItby/QP43/O2E1Z4EfVZv3Nyn7dRrR7zoEuvKZKKrx+f9P5pfvx3Rg
         uLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nzVAkjUIXnSmifmZO/KNuTW33GCGTCzsi9aX026XXeg=;
        b=p/BhqdYnVZtamKutlkQS37DDGE1uKR/2n1atgBWpwigIIDvUB+IQQNGx1hvfmF5OwJ
         oQWkwrzr8xq5Zs6TCjmyp+Hm3XB/zcKVmgV8B38RmKeRtRguBXrX3PSq/XfqMU0xe5XM
         2QHtn8ankFnFq6cscyLpR8pkNJ7Qwy8a0SIqPMddw/ssnxsP1orUFW3SVUyv7Ud+Lxum
         T9eC4qfKZEzomqOdYwxsJy6pzHd8EfUFeVSUdEARM4rx85dmrcBG9GGWiJtk5v7TzDdt
         U3586FDNuZGG+LSZ1HX78+maoEMbPRTToYXRyZ9WH5mIIoXpRGgFjNYcYq9HSvIFbAZO
         WVlQ==
X-Gm-Message-State: AJIora+YlhGsgpQgAATiNtHtWx640MrJfP7OG1pjUUtw9OfS0YqzG6Dm
	++sW0nyrHiL2D1F7Pl5DqP8=
X-Google-Smtp-Source: AGRyM1vLxTFMIxeh0MQDJmw094z51hmalDIKhKM+71jelG0gY6NpuuzQXDALY4ZT1iSuYjMs9++euw==
X-Received: by 2002:a17:906:58cf:b0:722:e4e1:c174 with SMTP id e15-20020a17090658cf00b00722e4e1c174mr3593366ejs.85.1656512758310;
        Wed, 29 Jun 2022 07:25:58 -0700 (PDT)
Received: from [10.29.0.16] ([37.120.217.82])
        by smtp.gmail.com with ESMTPSA id jy19-20020a170907763300b007263713cfe9sm7220580ejc.169.2022.06.29.07.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 07:25:57 -0700 (PDT)
Message-ID: <80117936-6869-19b2-45a6-96a4562c6cd2@gmail.com>
Date: Wed, 29 Jun 2022 16:25:54 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Luka Perkov <luka.perkov@sartura.hr>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Tu <shawnx.tu@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Andy Shevchenko
 <andy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Gross <markgross@kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Mark Brown <broonie@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chrome-platform@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mediatek@lists.infradead.org
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/28/22 16:03, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

[...]
>   drivers/platform/surface/surface3_power.c                 | 4 +---

[...]

> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> index 444ec81ba02d..3b20dddeb815 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -554,7 +554,7 @@ static int mshw0011_probe(struct i2c_client *client)
>   	return error;
>   }
>   
> -static int mshw0011_remove(struct i2c_client *client)
> +static void mshw0011_remove(struct i2c_client *client)
>   {
>   	struct mshw0011_data *cdata = i2c_get_clientdata(client);
>   
> @@ -564,8 +564,6 @@ static int mshw0011_remove(struct i2c_client *client)
>   		kthread_stop(cdata->poll_task);
>   
>   	i2c_unregister_device(cdata->bat0);
> -
> -	return 0;
>   }
>   
>   static const struct acpi_device_id mshw0011_acpi_match[] = {

For the quoted above:

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
