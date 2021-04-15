Received: from lb3-smtp-cloud8.xs4all.net (lb3-smtp-cloud8.xs4all.net [194.109.24.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAA86D28
	for <linux-staging@lists.linux.dev>; Thu, 15 Apr 2021 14:11:22 +0000 (UTC)
Received: from [192.168.2.10] ([84.202.3.209])
	by smtp.xs4all.nl with ESMTPA
	id X2iDl3ogpsMyaX2iGlUQji; Thu, 15 Apr 2021 16:11:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
	t=1618495881; bh=2DW85aWGVpvApmaMvwStRRQ7A2RZRB6U7dGqbMFixgI=;
	h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
	 Subject;
	b=F7VbhHcEXqVlSqY9V5cWM11aNNUsbiVn5RKZ82GjlCfEC3fVNh7rrNu1NOyApS9ed
	 H74idu5SCF50woNs6+nZI2sC+2jZR/CV+lMG2JHTTQqaFjiHTl40n6iWEf3pdEMBTS
	 65ETtsHq/FxlUQqOtvEUUdkLaUGQSMXDpZ0ZmV8Ra6xC3Qw4XxsBCG8EYmu+ScpLda
	 O1FS+ZtaCc2o+Bc9QCRra69LvorYoqbhS9lVHEJdUjM5E5n2tsQwAuV8oTWNTqLZlz
	 H3vl8ayVkADs5D9pRvrOPFUC5qjZ6aNk/a3cxseZZ04z6HPWVOUzIlFv1NNnKzKAya
	 049w7xB/8IJ4Q==
Subject: Re: [PATCH] staging: media: atomisp: pci: Change line break to avoid
 an open parenthesis at the end of the line
To: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
References: <20210414205610.GA9017@focaruja>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <963781e9-118c-8b36-d395-e6fe67a4c5f7@xs4all.nl>
Date: Thu, 15 Apr 2021 16:11:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210414205610.GA9017@focaruja>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfARA5CDS6hAFgvyRHve1Qyx0RD09qWRFv03Ssdzr3jQ+N1Nwzv4ZdPigVGYi+DLww9jHszQCLVWD1TLPLJBqq9jBxvlZIoPVPwOSfXXw2qQxnkuXca28
 8cRBsAjDY0/jNHEGeUAKxN8yhQEHtUGV3yypia4uUx+/gmXdg7RPgbxL1OOyA1Tk3j21B1YfTaxvQA7gBWAv/MElQOn1m8jZj87C/+EcFJ/CZs/L+XpcNPKa
 Ru5/MHUpy0ZTZEPVgTY+1lJUb0rPE56GjEu8RZQwYfV6gmdfHcRdlz7wBXPJ+oyckTtpgqbPNSOAse/zlKebAaMtQgsw2vOwnaPUTGD+/paWWlK+FFx6VAz7
 qYju/mB7SLZdllmLdq/0TDkoP13o4Ggl25EMBQxrQJP7ViEuvAeCKxDokaK/zdormosG/ZabEFrJHRB+U27FFGrZeUQGn9LZ1j1qOoYvSiK7SdDK8yZuAuDI
 XjNFFZo4qICXFSFp

On 14/04/2021 22:56, Aline Santana Cordeiro wrote:
> Change line break to avoid an open parenthesis at the end of the line.
> It consequently removed spaces at the start of the subsequent line.
> Both issues detected by checkpatch.pl.
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> index 1c0d464..8c4fc2b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> @@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
>  void atomisp_setup_flash(struct atomisp_sub_device *asd);
>  irqreturn_t atomisp_isr(int irq, void *dev);
>  irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
> -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> -    u32 mbus_code);
> +const struct atomisp_format_bridge
> +*get_atomisp_format_bridge_from_mbus(u32 mbus_code);

You keep the * on the previous line since it is part of the return type.

Regards,

	Hans

>  bool atomisp_is_mbuscode_raw(uint32_t code);
>  int atomisp_get_frame_pgnr(struct atomisp_device *isp,
>  			   const struct ia_css_frame *frame, u32 *p_pgnr);
> @@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
>  
>  bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
>  
> -void atomisp_apply_css_parameters(
> -    struct atomisp_sub_device *asd,
> -    struct atomisp_css_params *css_param);
> +void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
> +				  struct atomisp_css_params *css_param);
> +
>  void atomisp_free_css_parameters(struct atomisp_css_params *css_param);
>  
>  void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe);
> 

