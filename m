Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A45168
	for <linux-staging@lists.linux.dev>; Mon, 12 Jul 2021 10:47:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B5C0610FA;
	Mon, 12 Jul 2021 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626086841;
	bh=RuKPHx+O+4BOwlwrD0zTvZ708pFfJgwaXqEb7eKGqpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jP6RSSuG/vZ7Kl2OdVKRlGJd4WgtkSUsefsR4D4IHXiYfel2iRansJgeEiIOi94xY
	 QAAxZjF1Z+DMGQr7w3cA9rU2EWvTZLYKhKXH8XBCRKSBfSnBS1tc4nbBvyCqCWESUZ
	 kZBNNW30MUCdJ/Y04iqh0m/kx7/q35tqjx0Yzb6n/eHF6+rsod93l7dEERVcZSkNgh
	 c1l3pWk3pVJDCyZ1XC0lzU+nnBpcGgAo9w0XowJErGObfJtO6bIhfA+27FDWwZzcZX
	 j0bj2aAdA0+YufNmNBGnD56GFlWTPr1GFEeiH+BjoumcKytyzOAYN9h8jgXeNe3Prc
	 hP7mV6HGYoQsw==
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	devicetree@vger.kernel.org,
	linuxarm@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	mauro.chehab@huawei.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Lee Jones <lee.jones@linaro.org>,
	Axel Lin <axel.lin@ingics.com>
Subject: Re: (subset) [PATCH v11 0/8] Move Hisilicon 6421v600 SPMI and USB drivers out of staging
Date: Mon, 12 Jul 2021 11:45:50 +0100
Message-Id: <162608654078.4419.5201416551567371403.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1625211021.git.mchehab+huawei@kernel.org>
References: <cover.1625211021.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 2 Jul 2021 09:37:15 +0200, Mauro Carvalho Chehab wrote:
> As promised, that's the version 11, meant to be applied after -rc1.
> 
> It depends on a regression fix patch merged via the regulator's tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/commit/?h=for-5.14&id=5db5dd5be70eaf808d9fd90174b957fc5c2912cb
> 
> (the dependence is just because of a trivial merge conflict)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/8] regulator: hi6421v600-regulator: add a missing dot at copyright
      commit: e8608f8956ff4015a206f75631a266d93e84bb2d

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
