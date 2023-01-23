Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E06A1391;
	Mon, 23 Jan 2023 12:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9951C433EF;
	Mon, 23 Jan 2023 12:33:29 +0000 (UTC)
Message-ID: <0c411b60-1d12-1c34-0f35-5e38d38e2786@xs4all.nl>
Date: Mon, 23 Jan 2023 13:33:27 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/4] Allwinner D1 video engine support
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
References: <20221231164628.19688-1-samuel@sholland.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221231164628.19688-1-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Samuel,

What is the status of this series? It seems to be mostly OK, but I did see
a few comments suggesting improvements.

Does this series depend on your PPU work? That was not clear.

I do think there were enough small comments to warrant a v2, unless you disagree?

Regards,

	Hans

On 31/12/2022 17:46, Samuel Holland wrote:
> This series finishes adding Cedrus support for Allwinner D1. I had
> tested the hardware and documented the compatible string a while back,
> but at the time I had a dummy SRAM section in the devicetree. Further
> testing shows that there is no switchable SRAM section -- there is no
> need for it, I was unable to guess the address, and the usual bits in
> the SRAM controller register have no effect on the video engine. So that
> needs to be made optional in the binding and driver.
> 
> With that done, the node can be added to the devicetree.
> 
> 
> Samuel Holland (4):
>   media: dt-bindings: cedrus: Allow power domain references
>   media: dt-bindings: cedrus: Make allwinner,sram optional
>   media: cedrus: Make SRAM section claiming optional
>   riscv: dts: allwinner: d1: Add video engine node
> 
>  .../media/allwinner,sun4i-a10-video-engine.yaml       |  4 +++-
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi     | 11 +++++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c        |  2 +-
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 

