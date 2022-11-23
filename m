Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6714699;
	Wed, 23 Nov 2022 17:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06998C433C1;
	Wed, 23 Nov 2022 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669224236;
	bh=NklP56tySe3Xv444ZHt52vRJGyzaYy1R0Ex9JoaAzOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cM7LkUwn/UGY9APeo61IFLdLFugI/mycScX1L27zLnBFWztWOvsY2/pXAQvU8BtqA
	 zN2grVWU907Puoa1962eNoEzm7M0GyfMXDTyo0m/fYESjcYYfLenMyR420GN0LPle7
	 fHre3CZnC438ac14FaQ0ftW3eoi7y+NqR03dNnG17mNGguUXELDqAXtYw+kabasJh/
	 GdE3AFFOilgHHG2SfRFJ7XFkovjxBFA4x69koAbNo4eANtlUFZ7DlagmzghcWyagzN
	 hB+OrPBoifu3z+M9f10yfPgcQGlZSqkBCHUx9fpHFf/LyumxpmD68OdmhxG3k3+QWy
	 NRxBKM7JX5qXQ==
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-crypto@vger.kernel.org, alsa-devel@alsa-project.org, chrome-platform@lists.linux.dev,
 linux-actions@lists.infradead.org, linux-pwm@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-leds@vger.kernel.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-integrity@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166922422872.540277.7243893319002961181.b4-ty@kernel.org>
Date: Wed, 23 Nov 2022 17:23:48 +0000
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

[539/606] regulator: ad5398: Convert to i2c's .probe_new()
          commit: 7f69edba960bbdcbc829d8d0995b1117ce29e8b1
[544/606] regulator: lp872x: Convert to i2c's .probe_new()
          commit: 87feccb347b25f5dc6ff451123b832c9ad5dddfe
[546/606] regulator: ltc3589: Convert to i2c's .probe_new()
          commit: 78c8f6cdb51d471928d481ed3b2c82dbc110a1ed
[549/606] regulator: max8660: Convert to i2c's .probe_new()
          commit: dbf31dac703009174226bb87b3914bd092040327
[551/606] regulator: max8973-regulator: Convert to i2c's .probe_new()
          commit: 4e85e5d64f66ac5e4b0286ee4b6f8e8ce1044d42
[557/606] regulator: tps62360-regulator: Convert to i2c's .probe_new()
          commit: 18804160277ec2ab992373385f86c6af2322b28b
[559/606] regulator: tps65023-regulator: Convert to i2c's .probe_new()
          commit: 3b5b07dde998f6ade7433a8db019cf816c7e35af

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
