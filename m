Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A28C0B
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 19:32:50 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id bo30so5063066wrb.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 11:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1BKzb50vau0QIAXVcTGeHLKNWSnhlGapYli6cdXKzI=;
        b=VQjwqdLmqVCn6kaX2voaXpTvFU81kOgGm15ZqXT792b1eaYJMq0twiAJWUS6oW0cBp
         YrYwSGCjB8a4Pe0m5cXLvsl1WnefnzR2dnUQTg2UhL92ELk4rhWo87Sr0fJIquTrkpcP
         T3ZCTmD2A5hEL1h7/r1yg6aPaZ4D9M0FpyLoEvRbxDcPoMZqrZXn5MNDHElDNgpTLaMH
         lus4Un6rqzqA4naeAHeXdcUolbrqYAtaoGAhPLr03xH5QjnlmeNXSyYBezeeuWXvCsr8
         QsomYq+PX3UznzPmv/BOnxbQw9oHXGTQNiNLUdC11gouh+zuHeK94PtpUEIXCWSgf8IS
         NoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1BKzb50vau0QIAXVcTGeHLKNWSnhlGapYli6cdXKzI=;
        b=QLYsGfxu8B7Yio1TamRgYmL1vCIf4kVAZcr9FoOkqcXzUK8DayQk1fAynEEaENULvW
         Bv6owsASyO5n7vdW8Os1SiUcxIMWBCev4J8HrukFivbue9ZyCaAGtxiJB6GCrvwNGDMm
         O+FGAVnCM/E14P0qAa5V4fy6IQRzQsyJGJr9iEg7qXzxY+K43/M6R02J9+VULhJDwDaI
         REg2YZfqxhC/8vwArT/Qt+vmjSTGPxunaGvq/mivQC6A9dtX/aQdwmc2RDUaWoU/AkhI
         wbw0FfWerb3yLEd4CdIgiDuZJjffZYqK8NZjEPKR55ZMhdOO/0c0ZyfnLZcSOzt+Iqb5
         T8vA==
X-Gm-Message-State: AO0yUKWI02YEOgDubCbqMcJEs8C3bvJ/aK+XPpRK45NTRrKjl/TF51OK
	uxuRLupJMPogpux+wtfVzFI=
X-Google-Smtp-Source: AK7set81qqkpf6ljR3tBGipC+kP/rYvPLJGM4XwsvqdTfos+aVHiNmd2lGCE1Z2uiPE+maz3/n5NEw==
X-Received: by 2002:a5d:4a86:0:b0:2c5:6cfe:aab4 with SMTP id o6-20020a5d4a86000000b002c56cfeaab4mr4773550wrq.12.1677007968809;
        Tue, 21 Feb 2023 11:32:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600001cd00b002c6d0462163sm4106685wrx.100.2023.02.21.11.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:32:48 -0800 (PST)
Date: Tue, 21 Feb 2023 22:32:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 04/10] ASoC: tegra: Support RT5631 by machine driver
Message-ID: <Y/UcXNueAmrrhWG0@kadam>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-5-clamor95@gmail.com>

On Tue, Feb 21, 2023 at 08:32:05PM +0200, Svyatoslav Ryhel wrote:
> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> index 78faa8bcae27..607800ec07a6 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -51,6 +51,17 @@ static struct snd_soc_jack_gpio tegra_machine_headset_jack_gpio = {
>  };
>  
>  /* Mic Jack */

This comment doesn't make sense now.  It was never super useful, though.
Just delete it.

> +static int headset_check(void *data)
> +{
> +	struct tegra_machine *machine = (struct tegra_machine *)data;
> +
> +	/* Detect mic insertion only if 3.5 jack is in */
> +	if (gpiod_get_value_cansleep(machine->gpiod_hp_det) &&
> +	    gpiod_get_value_cansleep(machine->gpiod_mic_det))
> +		return SND_JACK_MICROPHONE;
> +
> +	return 0;
> +}
>  
>  static struct snd_soc_jack tegra_machine_mic_jack;
>  
> @@ -183,8 +194,15 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)

regards,
dan carpenter
