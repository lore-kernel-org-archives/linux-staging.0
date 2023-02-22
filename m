Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1435392
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 13:28:18 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id k14-20020a05600c1c8e00b003e22107b7ccso1160350wms.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 05:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WRqorO2vW/DufntBHkr33Jk+mJdL3BUMcZ2IPymDsYQ=;
        b=UZGYmUBk9dzhFyTJ1mKIzeCgtz3H8PPlnNWpL6GNgTh+WCEVQIs6MyBhpYapgTzHzb
         LmnkbOn6oPezl1KawOa5hQqnXZPTWd9lxLUIoEknDT8ydTZz3AyYJkgMiJBbMDPu2RZ2
         vziscPHbZEtDqKiksO4g1bjQmu9l8XMfeQ/sH5ZipD1bBiCtXVTLa+oZ+QYrq/qjNLo0
         GoqdbW+iAFseShtisMEEYCaPCBbJ/9R6ahQlFNMd33yvu2xqRA7sqtiaLIQobfy26yr6
         uxOFMQxxpi2HrxkuiwwQftRpannj5OABrzbwOjUHXHXOFFalmKb6XYjTTG7WYewLnR48
         FRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WRqorO2vW/DufntBHkr33Jk+mJdL3BUMcZ2IPymDsYQ=;
        b=23KKK+bSy+7k+wqXT0IkSn3sC60Gn6qZMaoBAczmUKVwvtcrW5EsvBuXcLI8JN8bHp
         HDJjST9m/mx1rP/DH+G+eIfK/QhVCuft3ceW7jUoOxk57v39d1R97gZRgEDBJjbz5Wu9
         +C3CLqCVBYtGBIe22Rr7JTk8+wtsiV25kPBsy8bj0u4TnqUb85V1WQAbdZalOsdvSYGd
         o7xQ8n/mQqI2X2DtcX82wuqpT5CROdQkIZa1NqjJCZxkHCoIRoJ+oRa9kuqaSgijuwj5
         THji9Pg+rKbSDNlWAh/BRS3TH7Vcx4ICMu12zOG+oW3E/bP76C8ThN6Ur8spiW5qJ8jO
         x7uQ==
X-Gm-Message-State: AO0yUKXRu/KIAXagyHi4aicMFlnirdAmyMXSCMMB12o9eg0+0YZs4jtF
	yCn04Hq7P0AKVgA4crIovm0=
X-Google-Smtp-Source: AK7set+1T7UXYTMG+b5hEaUsQLKpOa7X0ZCsLXXfMprUIO7Z2kOeVL2AXaWm/ZKLRpGhcUYrnXFSlA==
X-Received: by 2002:a05:600c:4493:b0:3e1:97d:612e with SMTP id e19-20020a05600c449300b003e1097d612emr318020wmo.29.1677072497017;
        Wed, 22 Feb 2023 05:28:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c4fd200b003e9ded91c27sm1370wmq.4.2023.02.22.05.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 05:28:16 -0800 (PST)
Date: Wed, 22 Feb 2023 16:28:09 +0300
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
Message-ID: <Y/YYaVhE7WwqLIey@kadam>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-5-clamor95@gmail.com>
 <Y/UcXNueAmrrhWG0@kadam>
 <CAPVz0n01YWQ6FY9RDsa1rw_36n=NKpRLokFiVTxLsMDpQEd4YA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n01YWQ6FY9RDsa1rw_36n=NKpRLokFiVTxLsMDpQEd4YA@mail.gmail.com>

On Wed, Feb 22, 2023 at 09:55:52AM +0200, Svyatoslav Ryhel wrote:
> вт, 21 лют. 2023 р. о 21:32 Dan Carpenter <error27@gmail.com> пише:
> >
> > On Tue, Feb 21, 2023 at 08:32:05PM +0200, Svyatoslav Ryhel wrote:
> > > diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> > > index 78faa8bcae27..607800ec07a6 100644
> > > --- a/sound/soc/tegra/tegra_asoc_machine.c
> > > +++ b/sound/soc/tegra/tegra_asoc_machine.c
> > > @@ -51,6 +51,17 @@ static struct snd_soc_jack_gpio tegra_machine_headset_jack_gpio = {
> > >  };
> > >
> > >  /* Mic Jack */
> >
> > This comment doesn't make sense now.  It was never super useful, though.
> > Just delete it.
> 
> It does. Headset is Mic Jack + Headphones combined. headset_check function
> performs check for a Mic Jack component in plugged Jack 3.5
> 

I feel if we need to discuess what a comment means or if it even means
anything then that's a useless comment by definition.

regards,
dan carpenter

