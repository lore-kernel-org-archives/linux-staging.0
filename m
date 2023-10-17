Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64761179A1;
	Tue, 17 Oct 2023 07:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P2uO+BeT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04648C433C8;
	Tue, 17 Oct 2023 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697529078;
	bh=LQXEF5e62dr/R/72d1cA39kSwjDHnzyBdz56YeqjIIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2uO+BeTR1vz4vtCd906zybVFo4Cpdvk0eRP9uAUlRgTYfwv3RnsNQS3DJEQggmyo
	 u0W4eIOMDesc1NpZERkXHP3H81fbKN9sNlWuhnnnYtiw8qQ+OPbh3EXbTDIBISH/Vj
	 dRCeA0i4iKMRZxQYe/AzW47LmdPQEY0KTl1aN+RU=
Date: Tue, 17 Oct 2023 09:51:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dorcas AnonoLitunya <anonolitunya@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] Staging: sm750fb: Rename programModeRegisters
Message-ID: <2023101705-baffling-able-d86a@gregkh>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
 <20231016201434.7880-5-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016201434.7880-5-anonolitunya@gmail.com>

On Mon, Oct 16, 2023 at 11:14:11PM +0300, Dorcas AnonoLitunya wrote:
> Rename function programModeRegisters to program_mode_registers. This
> follows snakecase naming convention and ensures a consistent naming style
> throughout the file. Issue found by checkpatch.
> 
> Mutes the following checkpatch error:
> CHECK: Avoid CamelCase: <programModeRegisters>
> 
> Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_mode.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
> index fc3db09de9ae..e901855fa9b6 100644
> --- a/drivers/staging/sm750fb/ddk750_mode.c
> +++ b/drivers/staging/sm750fb/ddk750_mode.c
> @@ -75,8 +75,8 @@ display_control_adjust_SM750LE(struct mode_parameter *mode_param,
>  }
>  
>  /* only timing related registers will be  programed */
> -static int programModeRegisters(struct mode_parameter *mode_param,
> -				struct pll_value *pll)
> +static int program_mode_registers(struct mode_parameter *mode_param,
> +				  struct pll_value *pll)
>  {
>  	int ret = 0;
>  	int cnt = 0;
> @@ -220,6 +220,6 @@ int ddk750_setModeTiming(struct mode_parameter *parm, enum clock_type clock)
>  		outb_p(0x88, 0x3d4);
>  		outb_p(0x06, 0x3d5);
>  	}
> -	programModeRegisters(parm, &pll);
> +	program_mode_registers(parm, &pll);

Again, the return value is ignored?

