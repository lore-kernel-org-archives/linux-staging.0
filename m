Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4673A525C
	for <linux-staging@lists.linux.dev>; Mon,  6 Mar 2023 13:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FF6C433D2;
	Mon,  6 Mar 2023 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678109515;
	bh=xk2sxBEfsiN8aKVYWYbUYCkQgq5QDPcbaOkOnFjwYec=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sddlj8enGoNsBB53XnM6yLjlWH6qW0MM4/OXj2+Rd0hDjZKdOA8lStIgrDIroyhqS
	 z3y7rgMjk3K0fqY2Wvs1ndD1L26gzBtFoNFxT6Sl+vOD+o+tVGnW0lHEWqTRn6YOwM
	 ptESxC8P7B5UMiwsRl1dHQEEgUl4gW4Gl1yv2I+8eQnA9Khh6P/Atisof+/iZLsjCw
	 YbZzdtgqrkrjTIULwrFsypWiN3RmoBcRrKua8GqJJYMWtehYD6ls1ftWD9T1mKO70W
	 mmXI8ERzpLqaQ3fedpWkCKXxWlKZm7H2U8NCLy8reO8GCxL3qDrQ4wiuO9D2S42qGk
	 8a8K8eDvN6yvA==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v1 00/10] Fix sound on ASUS Transformers
Message-Id: <167810951258.75807.6694477245258374695.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 13:31:52 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf

On Tue, 21 Feb 2023 20:32:01 +0200, Svyatoslav Ryhel wrote:
> - add quirk for headset detection used by some T30 devices
>   (ASUS Transformers, LG Optimus 4X HD and Vu);
> - add RT5631 and MAX9808x machine drivers
> - add Fortemedia FM34NE DSP driver used by ASUS Transformers
>   and mandatory for correct sound work
> - bind everything into working configuration
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[02/10] sound: soc: jack: allow multiple interrupt per gpio
        commit: a2d4051b0bd6dffcd736888ae89a550d6f60b060

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

