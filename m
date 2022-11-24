Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F682575;
	Thu, 24 Nov 2022 12:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99110C43470;
	Thu, 24 Nov 2022 12:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669292862;
	bh=I79sOw6b9zoYokqFfS40Dewn8bGWeiw1FKtO/k/fKj0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IMCiU9YUFM/Jg9eOIjBBjHAR/+6YxZ4mqCQP6EP+JonOYeqMfqFt8+KeC0QL2FNMB
	 uxH1UtX/26pkNNg+1fM9jRiLZ+mEgmdrQ2BTv//mJhjTv41AmSCc2Km0tFQ9dXE/PT
	 BuuFuXQzk7TinQyGjMj3mHg9eSBg872+IXzX+VcDDPxHCNCYuYvrsvTrFJXEW/nPTN
	 hPRa3F6yFrLghv7kJvbyD48UoidMdMvyohP0cJyOo/MNFuBVIR2etMzr1VFJQiFP/2
	 iN4v9ScfR85GgAh1ZyhDZACdCh1112vx4elZ29H/6t3cWh/Z/rlTE5mXEH9iBfOlrj
	 H/OppHJfpsyTw==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Uwe Kleine-König <uwe@kleine-koenig.org>, Grant Likely <grant.likely@linaro.org>,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Purism Kernel Team <kernel@puri.sm>,
 linux-rtc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, platform-driver-x86@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, patches@opensource.cirrus.com, openipmi-developer@lists.sourceforge.net,
 chrome-platform@lists.linux.dev, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-actions@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-input@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-Id: <166929285427.186061.11411375716036863910.b4-ty@kernel.org>
Date: Thu, 24 Nov 2022 12:27:34 +0000
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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[564/606] spi: sc18is602: Convert to i2c's .probe_new()
          commit: c7f635bc16cefcd7c7ab6e508b2ae73d66af9ffa
[565/606] spi: xcomm: Convert to i2c's .probe_new()
          commit: 1a165a067ffdba66af3a696f49dfab24a0e0449e

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
