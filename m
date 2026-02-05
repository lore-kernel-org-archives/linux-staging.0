Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0505820DD75;
	Thu,  5 Feb 2026 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289909; cv=none; b=F1d6hVKkGATdiwpHjM5c0KPpQkNYGiUlfny58/lMg+O2E7MXekgpFbFvkbKeE1ioNMrdtT8Zda5jXfpPHtBTdvS2kzj6YRzbp8pYHO3BQNbys16zPpwXTCSZ+7aGPMYWZRwqygGQZqxVU5yPtxuiLmkc+XGedXw/xlp/2VxP7Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289909; c=relaxed/simple;
	bh=EJCsiFwgWMJviYraunEjLMAhm9sAIW6X0TmnHjTtepQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUN/GaCLgexDeFs1ULpUia3YkQ84XXqjle1s3TgflnqpGhSuDJIzEBOduGqJZqAjsY6XPtUt+CqOqZQot8P9rwAJ27uT75n9+8ixUrTXIMb5YmUQ2OmjBQZtBBLL8TtATKp7hMJiWYNi4fz2vEAczzB+SvJsVAHam7lvXbDoGsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsBeJy8i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsBeJy8i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF55C16AAE;
	Thu,  5 Feb 2026 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770289908;
	bh=EJCsiFwgWMJviYraunEjLMAhm9sAIW6X0TmnHjTtepQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsBeJy8iYiIwgUISl6TgM5dbZSZ7RqSnXqYgkRmCJMjwnlFafAYpWVj6AtfKnzRNz
	 71nKclqZYySBhLuOnDoNMxKfSn2nuHm497tpSRmpPhtBmdnymJA11xD704gFYrP3Ts
	 Gm3dEn5foa1hz9DyOHsQBuAiQMy/jYdc01A279SIpQpHzRZ1mn2N41XsHmvUR15nNi
	 rGofU0f2/LIvaqStsKWd+t/o+x9PIP1lWvkwGwSZxU7Ue87BVpLGgoblKcMIZQn0kA
	 F8PnJaSiZa4aVIOgBEZqQcjRzbfKALfRbRS2JEcvaNakjNTIpIPRtlcUV4mNeqqh7o
	 2kYCT4caLfiow==
Date: Thu, 5 Feb 2026 12:11:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: harshdaniel66356@gmail.com
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: dt-bindings: media: microchip,dim2: Add
 MediaLB DIM2 binding
Message-ID: <20260205-bouncy-poodle-of-refinement-699cab@quoll>
References: <20260203041325.12419-1-harshdaniel66356@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260203041325.12419-1-harshdaniel66356@gmail.com>

On Tue, Feb 03, 2026 at 09:43:25AM +0530, harshdaniel66356@gmail.com wrote:
> From: Harsh Daniel <harshdaniel66356@gmail.com>
> 
> Add device tree binding documentation for the MediaLB DIM2 module found in
> Microchip (formerly SMSC/K2L) IP, used in Freescale i.MX6Q, Renesas
> R-Car Gen2/Gen3 SoCs, and Xilinx FPGAs.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

One media is enough. No need to call it media: media: media: media:
right? :)

Also:
A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof

