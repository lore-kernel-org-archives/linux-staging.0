Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423861FA3;
	Wed, 23 Nov 2022 12:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC45C433B5;
	Wed, 23 Nov 2022 12:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669205501;
	bh=LVCS/9pspNUOtJim3pqK4CvI0blKDQrkaBc4pcfzuoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rj3QTsNVa7ZgOuhLfBy9tx18KCIlTIJMB4cSkte+RplU+eSl/lFO/EDez7bdjVFd9
	 9fX+DaKr8ANAhizoOsbjkLgSttlC83xklILjmy49JcJ/UwvKoN7SQ7eR139VwePc6M
	 Gfek6syflcEVKoSML/mJta2HjhsXv47WgeUfGOK/KJQ1oGPhZEsEp+xISfzHjYqXec
	 stw+LHBzRC2ZFa54Xibl4uXodosL+xXoxv0Z1tmFct2dTM8wNNExw5hthuZ2IBYSZU
	 Y6pqeJovtUL6HrNGLMCQs4x2+LJFh8jEtzGnS7s5OAFYw+0Z3KNg7FLhXUarYVeKWK
	 Qwq1WYu1OFoqA==
From: Mark Brown <broonie@kernel.org>
To: Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>
Cc: netdev@vger.kernel.org, alsa-devel@alsa-project.org, linux-i2c@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-mtd@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-crypto@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-integrity@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-actions@lists.infradead.org, linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-renesas-soc@vger.kernel.org,
 kernel@pengutronix.de, patches@opensource.cirrus.com, linux-omap@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166920549294.105268.4063772555451021149.b4-ty@kernel.org>
Date: Wed, 23 Nov 2022 12:11:32 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921

On Fri, 18 Nov 2022 23:35:34 +0100, Uwe Kleine-König wrote:
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.
> 
> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch that
> you can pull into your tree to get it:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[538/606] regulator: act8865-regulator: Convert to i2c's .probe_new()
          (no commit info)
[539/606] regulator: ad5398: Convert to i2c's .probe_new()
          (no commit info)
[540/606] regulator: da9121-regulator: Convert to i2c's .probe_new()
          commit: 020cf73b47414a84b666d3e6736a6ae957e27840
[541/606] regulator: fan53555: Convert to i2c's .probe_new()
          (no commit info)
[542/606] regulator: isl6271a-regulator: Convert to i2c's .probe_new()
          (no commit info)
[543/606] regulator: lp3972: Convert to i2c's .probe_new()
          commit: 2532d5f8d5c20d5a0a8a0d57a311bc5df00dea04
[544/606] regulator: lp872x: Convert to i2c's .probe_new()
          (no commit info)
[545/606] regulator: lp8755: Convert to i2c's .probe_new()
          commit: cb28f74b4809a00b40fdf0c44ccf51ab950581d3
[546/606] regulator: ltc3589: Convert to i2c's .probe_new()
          (no commit info)
[547/606] regulator: max1586: Convert to i2c's .probe_new()
          commit: 3d54f7ba248b0ad1791bc356e9ad3d9020a1c472
[548/606] regulator: max8649: Convert to i2c's .probe_new()
          commit: 3cf4417385d0ac8f02f22888e12a6d21d97d89fc
[549/606] regulator: max8660: Convert to i2c's .probe_new()
          (no commit info)
[550/606] regulator: max8952: Convert to i2c's .probe_new()
          commit: c20c36735949b3b7984692fbab3d92b0e8a845ec
[551/606] regulator: max8973-regulator: Convert to i2c's .probe_new()
          (no commit info)
[552/606] regulator: pca9450-regulator: Convert to i2c's .probe_new()
          commit: ed56fa6e804cb13bbe29e9214792308817f6e553
[553/606] regulator: pfuze100-regulator: Convert to i2c's .probe_new()
          (no commit info)
[554/606] regulator: pv88080-regulator: Convert to i2c's .probe_new()
          (no commit info)
[555/606] regulator: rpi-panel-attiny-regulator: Convert to i2c's .probe_new()
          commit: d85d02d17a608b558d44510e9824668c5d4fe5d8
[556/606] regulator: tps51632-regulator: Convert to i2c's .probe_new()
          commit: d4885f306304ff29eec06b9ad5f526a1099e0418
[557/606] regulator: tps62360-regulator: Convert to i2c's .probe_new()
          (no commit info)
[558/606] regulator: tps6286x-regulator: Convert to i2c's .probe_new()
          commit: e34782316281c78c5911f86d4699d4f35a607c9d
[559/606] regulator: tps65023-regulator: Convert to i2c's .probe_new()
          (no commit info)

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
