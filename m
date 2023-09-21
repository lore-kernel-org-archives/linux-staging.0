Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567B199B5;
	Thu, 21 Sep 2023 15:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38C5C4E770;
	Thu, 21 Sep 2023 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695311117;
	bh=E1dhxis8ZumBm0hKaOMOgVxtcqW/DF2vSRD3c8E34to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hnb53gE9VP9wyiDUEYS9uM+cYkAMgpeaQr7Zkpf0rCGGzVG+CalXEkvwN+Nvrlgwn
	 SShkMPiln06WcGb3i3GYwdQqgmB2SkXTR+yQd2iHhdeBhlJkwWBWw9tE5WFfRbjNV+
	 PywkpmRf30b8hWmQupUhSJghVx8L2s7Qnkv2eTdEQB2MzfqZgXK1HOGUCm5HDSSm0s
	 X4NhbhVqZsl1pL04z4TTwAyUI946pLdhf9ycusxuBkbXLz3BK0F9iD9tupyAdb4kgN
	 DfUx88OB9vJBn9cWIN9QjnMbPme61mEW7+BOHGCmSyw9SRc7OhW1JafPQoDNsUsWV5
	 Uh/US7cqytnug==
Received: (nullmailer pid 396045 invoked by uid 1000);
	Thu, 21 Sep 2023 15:45:14 -0000
Date: Thu, 21 Sep 2023 10:45:14 -0500
From: Rob Herring <robh@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Philip Molloy <pmolloy@baylibre.com>
Subject: Re: [PATCH 4/4] iio: resolver: add new driver for AD2S1210
Message-ID: <20230921154514.GA383967-robh@kernel.org>
References: <20230920170253.203395-1-dlechner@baylibre.com>
 <20230920170253.203395-5-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920170253.203395-5-dlechner@baylibre.com>

On Wed, Sep 20, 2023 at 12:02:53PM -0500, David Lechner wrote:
> This adds a new driver for Analog Devices, Inc. AD2S1210 resolver to
> digital converter. The driver is based on the staging driver with the
> following improvements:
> 
> Fixes:
> - Fix use before initialization bug in probe.
> - Fix not checking error returns in probe.
> - Remove spi_setup() and spi_set_drvdata() from probe.
> - Fix ordering of devm_iio_device_register()
> - Remove incorrect hysteresis logic
> 
> Changes:
> - Use BIT/GENMASK macros.
> - Use devicetree to get CLKIN frequency (was sysfs attribute).
> - No longer bit-shift the raw value for IIO_CHAN_INFO_RAW.
> - Use regmap for register access.
> - Remove config sysfs attribute.
> - Use gpio array for mode and resolution gpios.
> - Invert sample gpio logic and use GPIO_ACTIVE_LOW in devicetree.
> - Change hysteresis to use IIO_CHAN_INFO_HYSTERESIS instead of custom
>   device attribute.
> - Rename fexcit attribute to excitation_frequency.
> - Use devicetree to specify resolution instead of sysfs attribute.

Why? sysfs allows a user to change at run-time. DT is a firmware 
change. What/who determines the resolution? Unless it's the hardware 
design/designer, it probably doesn't belong in DT.

Rob
