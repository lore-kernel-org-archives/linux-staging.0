Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FA2C94;
	Tue, 23 Nov 2021 11:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrzej.p)
	with ESMTPSA id 6067A1F4197A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
	t=1637666539; bh=PBtrVueCq3tmvWtlDU2yVa4NxTm9tEbs7ezcIMVF6mU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=ant/0iSEfOetB3rzdly/nH/Bl9Qamh7a33r5df/m71IQS825rZ+bGTsuaGPgBuSdt
	 b6nOBza61O2QqJSuhXL2hLlKMPfkXB9jNBAt0CDZKBcLKrVPWRbVS5ENPI9JOlB/ZL
	 j7VYxNJ1OoVSEm+S072GDpINrEVMCaLaoQ/TdKUA/lrQEEQu9XawdIe1dZi46bNRYK
	 0AwFMKvb3tAAW32AOveePty95p8xrSh+9VPktX20R+lKCo6/1MV9odRUPBrQkjrfgR
	 qisGchn8vytOlbsuymVe6SeJK4IReC1lZvsBqeWY+vgIC/Akx7UB0F2iOjLOCPc1JJ
	 hJUYGCQE3MHRw==
Subject: Re: [PATCH 2/7] media: hantro: vp9: use double buffering if needed
To: Jernej Skrabec <jernej.skrabec@gmail.com>, linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
 mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
 p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
 <20211122184702.768341-3-jernej.skrabec@gmail.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <55bb35b0-b98b-9961-aa95-554f8af141f5@collabora.com>
Date: Tue, 23 Nov 2021 12:22:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211122184702.768341-3-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

W dniu 22.11.2021 o 19:46, Jernej Skrabec pisze:
> Some G2 variants need double buffering to be enabled in order to work
> correctly, like that found in Allwinner H6 SoC.
> 
> Add platform quirk for that.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/staging/media/hantro/hantro.h            | 2 ++
>   drivers/staging/media/hantro/hantro_g2_regs.h    | 1 +
>   drivers/staging/media/hantro/hantro_g2_vp9_dec.c | 2 ++
>   3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 33eb3e092cc1..d03824fa3222 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -73,6 +73,7 @@ struct hantro_irq {
>    * @num_clocks:			number of clocks in the array
>    * @reg_names:			array of register range names
>    * @num_regs:			number of register range names in the array
> + * @double_buffer:		core needs double buffering
>    */
>   struct hantro_variant {
>   	unsigned int enc_offset;
> @@ -94,6 +95,7 @@ struct hantro_variant {
>   	int num_clocks;
>   	const char * const *reg_names;
>   	int num_regs;
> +	unsigned int double_buffer : 1;
>   };
>   
>   /**
> diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
> index 9c857dd1ad9b..15a391a4650e 100644
> --- a/drivers/staging/media/hantro/hantro_g2_regs.h
> +++ b/drivers/staging/media/hantro/hantro_g2_regs.h
> @@ -270,6 +270,7 @@
>   #define g2_apf_threshold	G2_DEC_REG(55, 0, 0xffff)
>   
>   #define g2_clk_gate_e		G2_DEC_REG(58, 16, 0x1)
> +#define g2_double_buffer_e	G2_DEC_REG(58, 15, 0x1)
>   #define g2_buswidth		G2_DEC_REG(58, 8,  0x7)
>   #define g2_max_burst		G2_DEC_REG(58, 0,  0xff)
>   
> diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> index e04242d10fa2..d4fc649a4da1 100644
> --- a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
> @@ -847,6 +847,8 @@ config_registers(struct hantro_ctx *ctx, const struct v4l2_ctrl_vp9_frame *dec_p
>   	hantro_reg_write(ctx->dev, &g2_clk_gate_e, 1);
>   	hantro_reg_write(ctx->dev, &g2_max_cb_size, 6);
>   	hantro_reg_write(ctx->dev, &g2_min_cb_size, 3);
> +	if (ctx->dev->variant->double_buffer)
> +		hantro_reg_write(ctx->dev, &g2_double_buffer_e, 1);
>   
>   	config_output(ctx, dst, dec_params);
>   
> 

