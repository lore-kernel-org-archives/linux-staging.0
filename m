Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA9833DC;
	Fri, 25 Nov 2022 14:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59CBC433D6;
	Fri, 25 Nov 2022 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669386434;
	bh=flrWhKxQcLgnkz5HWwKc3eGDBXHd2DZVGZMjdcPc5hY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CyHabUYcBi83iBg+IXQCXTmWKh/Vsse6jNqtBrOcjWNjpEEPUkYxmD/0nZ5c5ugKO
	 jo6Z8/gl+MgvM2sAwEq6RdlT5vgN1k6ZJ+hqcP93CQj09ymCKeE30N8oa3t0Dyb2ta
	 8+lhrsfn7LySe/twThGMfi4tdsvHPQplnQuaeGcZds17fbxEN/133XbiwZ446jPLS9
	 1J6PAAF8g/44RhMnx0oz0XFgtuVlOhD80/f7Dhydm3vHtZMKjn7bF0j0c8/R2UsycZ
	 cywT0qiXBo9L2PFUprEkr+T5u7/lhadYuK2q+CTR0j12IAxjD6y0soSJBSn9D8biJo
	 PV6iVB08gZr+A==
From: Mark Brown <broonie@kernel.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Purism Kernel Team <kernel@puri.sm>, kernel@pengutronix.de, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-rtc@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com,
 openipmi-developer@lists.sourceforge.net, linux-staging@lists.linux.dev, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org, linux-input@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-actions@lists.infradead.org
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166938642447.506633.10798171870515262916.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:27:04 +0000
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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[601/606] ASoC: codecs: es8326: Convert to i2c's .probe_new()
          commit: 784252bac835c831e10c48be633cd1ff0d697326
[602/606] ASoC: max98396: Convert to i2c's .probe_new()
          commit: 2ff85020ec5db4af3b55d35f5b8385e830c39fdd
[603/606] ASoC: codecs: src4xxx-i2c: Convert to i2c's .probe_new()
          commit: 830a35aa2121258d0c8283abe45ebb5c3d2fd791
[604/606] ASoC: codecs: tas2780: Convert to i2c's .probe_new()
          commit: 88ade2abba1e46fe581610911240054538f8db88

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
