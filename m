Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B9A399346;
	Wed, 13 May 2026 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695506; cv=none; b=qIVNaG5KTBbS3vlBAAbQaxWAW1iOxWHAOb2bscMEURRxvtV/U6UvpUb9j1pmF0FK3rXCIORBiKSJc3gtA9E6ibeB/wpdd/iQ6V02AotKYer+WoRBbYx817c3ZqWyfi14s/JSb/yqWeirX6PyIOiAVjBFzcMo9o8Mol4SlvrJXiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695506; c=relaxed/simple;
	bh=RSUDBpyZ6Frx8kWi7gZ9z6X/1ezYQUz9Ikag1Hqh2dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZE2gj5EXuR7FO0fUVyFcS8pa9yD9zgGjUsY4wIy9L4xf91vah+j93ljeFwlMqd09t6svhHFummAFmU8sB6i0ybqGgiv8+hNLhIH0Gb73NWe1xtv2otBMNNhsvV0u8J4jr91gRlKnOiayhNATzPq6+gmfHz4g1vIBz2O/BPBnkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuBrwmKx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuBrwmKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8589C19425;
	Wed, 13 May 2026 18:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695506;
	bh=RSUDBpyZ6Frx8kWi7gZ9z6X/1ezYQUz9Ikag1Hqh2dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuBrwmKxwsPyQZleUGbiXx0JetulP4a9+Y3xldOmeLhsrq5U70SaDHU+AOK4xPM8I
	 6nJGo6L7of5+d7QMRLGjlOZUKPoS5KoDU+IHWH8ByTOcH7F6tZS53bynp3+vOPh6Fz
	 e78SwWB2BeG1se8rD2kgtnF0tuJbTC0hS50CbKfbf9LtNWwNVjAZwxjCBESDF7d4O4
	 bB6DQG81PjvCIQrY+kJKum3rUrVQAneGQ2f7ZwZYI6Ajumq7hL3lSto4dSLY1nFJVT
	 rIoLd3Pdtp9y1bXAS0uO7Ri9kAcBAvs03LLEoLLsNcpuC+r4KEpM5rQ289kmuUTvI4
	 AExsav7UOgWzw==
Date: Wed, 13 May 2026 13:05:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
	Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: media: sun4i-a10-video-engine: Add H616
 compatible
Message-ID: <177869550281.1497011.1142937282232673663.robh@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505134812.408316-4-wens@kernel.org>


On Tue, 05 May 2026 21:48:07 +0800, Chen-Yu Tsai wrote:
> The H616 contains a video engine similar to past SoCs.
> 
> Add a new compatible for it.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

