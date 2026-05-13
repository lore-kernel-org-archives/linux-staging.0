Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2DA3A5E81;
	Wed, 13 May 2026 18:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695381; cv=none; b=uMeIxyW3f/8VBWD9eiEd3UaSJV4VyZUBgSbstH0tHWQoBGIlLRv0ZNSQAbjd62zramxxooOPNPypOymYNSAxIaH2eXp1O5CzEpvMdRzxFCFbt4sPGLsgfaNrD2MgLne+Zm9hmuFyhv+IqEvT/amTg7B8Kvs8Ot3s/biAKLmiyjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695381; c=relaxed/simple;
	bh=J3/DeLg5yTop5i593NLz2wTc3lXqfnyjLigYKgxELko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvPr3VbhKKFmGZ+8jzK1CEAJFkpiQbHAnhm359tqtsw3SdW1j0kQHyCkkHh14fFxUqBDYP+mJPicYjI4kJwr4DS63zCAqFjXp3e+26GJbf2MWf0Fbg/pjl6BZPcZOhY6kb3BopKzKpjXp6eqYm77Hh41trnqArjOb8jvvIUcPbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsC7ML7+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsC7ML7+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357E2C2BCB7;
	Wed, 13 May 2026 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695381;
	bh=J3/DeLg5yTop5i593NLz2wTc3lXqfnyjLigYKgxELko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsC7ML7+E1vmFSyI7MITRqGJgYaIFjQgpwnG47Vhqq+gGxLSfIg1mWCCanEc37RT/
	 +YHw4SnHWaSblYW5f16wZrchFqjcLMm2aa+U0SgpsFsOjrh5p+KLQgR3bCFUsd+Gh9
	 wqlhJcUMQFIgdMz5UVY4Vc2u6p+y82raKfniGwEGxv8MyzgAK7y4O/1YSFZAsQxp2P
	 rFvrLsW/FTWUY9frpXeE2p5TF9BpQvkF4YLutrOpcgj2XGxwsk97g0pY7OPtvoFoFS
	 jOM110JeqqE3S6J3fTBmTTmnsuDWEKNFqfDiZzal3ZUHEwG4CTjyaScqQzPhVonfJR
	 p+KJvDrRpyjZA==
Date: Wed, 13 May 2026 13:02:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-media@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM
 count for H6
Message-ID: <177869537686.1492647.6830300416623513833.robh@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-3-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505134812.408316-3-wens@kernel.org>


On Tue, 05 May 2026 21:48:06 +0800, Chen-Yu Tsai wrote:
> On the H6, the SRAM C region includes an alias of part of the VE SRAM
> used by the video engine. This region should also be claimed so that no
> access happens through the alias window.
> 
> Add a second SRAM region phandle to the video engine for the H6.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

