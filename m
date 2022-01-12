Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD527173
	for <linux-staging@lists.linux.dev>; Wed, 12 Jan 2022 20:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC02C36AE9;
	Wed, 12 Jan 2022 20:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642019984;
	bh=RuPukA2opcOQomp4/3lvs6vqsijaOo3tpe4yE/jAqzE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Zxh7Oxiw++jAoqJzAhbpY0O/r361325RtVvs4h5nhCVl5qekdsK3aQXKR/l570Cfe
	 4JCdHZXDfGKJA/uNFWVUnkBbeXiSQVH8Pw35q9OioEsG28jjQL/qdN1IcFlUHBQuxE
	 Z14nhdgxszDJMxHAtuX9BwjZQKcvCd+A6LLnLx3y5p+BGAfqP1yZdrKkYJHJs7KtVZ
	 obemwBjSEOC2nMF68HeFoBOkqZBZLbvp+d/ACzA7Rp/LdSoB+NKYsja2+73X/sGKW5
	 etVN/aZVhQuiUL3Bly7TCys2mvH2zUa2CIXNU1NJXe8EFLpAGaogrJh85Rn5+iswf/
	 V63rLxC5CEt8Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3059a0f043c8f92e4ca35980c89d5864acc20513.1631623906.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com> <3059a0f043c8f92e4ca35980c89d5864acc20513.1631623906.git.shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v13 2/5] clk: clocking-wizard: Add the clockwizard to clk directory
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, shubhrajyoti.datta@gmail.com, git@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-clk@vger.kernel.org
Date: Wed, 12 Jan 2022 12:39:42 -0800
User-Agent: alot/0.9.1
Message-Id: <20220112203944.6EC02C36AE9@smtp.kernel.org>

Quoting Shubhrajyoti Datta (2021-09-14 05:57:42)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c5b3dc97396a..3e0bf794ee09 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -390,6 +390,15 @@ config COMMON_CLK_K210
>         help
>           Support for the Canaan Kendryte K210 RISC-V SoC clocks.
> =20
> +config COMMON_CLK_XLNX_CLKWZRD

Given it is xilinx, can it be moved to drivers/clk/xilinx/ and this
Kconfig be put there instead of clk/Kconfig?

> +       tristate "Xilinx Clocking Wizard"
> +       depends on COMMON_CLK && OF
> +       help
> +         Support for the Xilinx Clocking Wizard IP core clock generator.
> +         Adds support for clocking wizard and compatible.
> +         This driver supports the Xilinx clocking wizard programmable cl=
ock
> +         synthesizer. The number of output is configurable in the design.
> +
>  source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/baikal-t1/Kconfig"
