Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D6035A394
	for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772277748; cv=none; b=RW1SnqWZeCcWF7bGBdhBe7dkrcqiRW8XSpKAIjJG/z0Qi71uvlcjHRfmrCeD0hbyVqzVggx3vspIXagNXPz4Ovke2HokEM9ZUJltU3Qhww8N6lg4mlyZGDSFEYOjoV/nv5NkJ9ZTF/ZOu/a57RUUyzYmKXoBQb3iMCvi3nG9WZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772277748; c=relaxed/simple;
	bh=C+sfOTthVWYAsmxzvHSDXHnyBjqjv5fm9/IRCp46bzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBu1dGor6lp7wkB8g8kCLuNhi1Xfk/gsB3MoWcyWa2d6Sztd6bM8PTkOlfnXSmjD6oOfmS6TGfHa6OBjD3DIzWNGB3nFiqJCc8Qp2mpbWnwGb6Xq5eioXNVJbciTtjOrydwQpPUhQGcQNS6DxYv7GlFRMm7XhlhSGhMoKzNTsK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ReR7j8V0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ReR7j8V0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439a90f194bso193446f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 03:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772277746; x=1772882546; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=isAbEiLpfLN3mIWVHPphfERAokwE3nCBTgU9KXPJdSk=;
        b=ReR7j8V0c/ZzS7CgQajvZTnCiyxHbdNdYlrm7sR1rmE2pmLhkAc/zGh7fOPgQiiy3P
         budeTHPcj3iGVaruRFhYiUafk8dZ9ghUqxG6soCX7cIRZ3ywZbn6NWmEfsy87bpfYyC/
         9R+pMYMJez9Mp15A2mqkRLjjTbo4EpbHZKRyRCs9uOrubOdWXtI+JRsvP5FMsyrE848A
         +YbmccjGu7Xi0CthHlDNzt/IPkAsWN4I6DRIPoHneE/WZMGJc8+SS6HetK9pJ600iTVK
         8cdohyHoYTpGIHc+Zh/14SW7oCrZZLhyUTile5PVkn1CuAjBe6x8Vy9YyylxK4ACgySS
         T5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772277746; x=1772882546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isAbEiLpfLN3mIWVHPphfERAokwE3nCBTgU9KXPJdSk=;
        b=aH14qoQilcXb+/x5OQ+A9HYIoqonGpV+s8Ec5Qe+6fiYRgR7FtUFXw+VG4yWJJd92y
         nCI2y61dxaTZkYA7idxL5sMRQTkUNs1r9Vk49KVfWGCoxfyeVIuvcnURLWA9bryjcX4f
         alZQHPa7K1vdvIleHfqRi3nz/q/JbXCqKi3KzgGsQ3FcBm3tr1GxX0uCL0Oa3UO4JkNW
         02YDxlye8BfxhJEFPjelfxH4iLqD+OEFCLq9LpGRp3FGiIP4aXOAnaaWP8p1jDr9CzST
         Bv8ouqVUw5pKBuH8oBaY+nzT3fmov3loVwmYqEKg5kQD39catmbx6MOcSetFr4Sl4beN
         +8ng==
X-Forwarded-Encrypted: i=1; AJvYcCU0Ru6tY5N6Vou+euvKdGrzF+BFnt5Bz3wMkdTP2RUn83m2SHqZJmEl8cxHJIiiXUaDvukUccSlAzUQbtjB@lists.linux.dev
X-Gm-Message-State: AOJu0YyVb7abfnGS1yOU2DtYrF+GqCS+Y23ALpK9whJITWsN8vsK7j03
	CFyOUHy7c3b6/SNKwXSn8K9G/X/wp9ivPBtzUhpbHooJECyhvMAhG8vNUsbV0KJySlg=
X-Gm-Gg: ATEYQzxKAFX3bYVk9W0Y23/WpX6SlWt1tIvhPDkKbafrkEO75iKhJ9PP9LobXZYm+aB
	IO6/kgEzQjKrFMu1MD3OpIE/woK3+xZD26XbBP3lNNxkzzGmOrT8/uknXLjBgaODEFMckzwe7pi
	tY31n5MOpXdqrL5AnLc2memNl8eCIJVIQOGGquObaXd7OlleAyYvs0fOJ4Y0XeOlgVYN5jvaJg2
	Qfm/hOsy0GgYGl5DRs3R5eSdFyUCryGJv8Q7FRl00bfJYOdN/gN+O31iYuvzwSYwnn0bPlElK/O
	CLe28cLpt0qt6fqTe/YuvF2EXcgmiF2Uj5ZeHbLagAGbn+st8rULAZwfX8pdMy962kO7J3q9hh2
	RiwHVKBcvEbmeRd1GgMdf0XDWrShh3b0ZKOQTNo+DhomT3UAP1gVC2O/sNKFXe16phclyUrDr6J
	erbuGYO2ge7mr20Wm0Wt59cZTTmayJ
X-Received: by 2002:a05:600c:1c28:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-483c9bc5643mr105380795e9.3.1772277745834;
        Sat, 28 Feb 2026 03:22:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfccd7b6sm82361655e9.24.2026.02.28.03.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 03:22:25 -0800 (PST)
Date: Sat, 28 Feb 2026 14:22:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ovidiu.panait.oss@gmail.com,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/3] staging: axis-fifo: fix alignment and handle
 boolean properties
Message-ID: <aaLP7tXHSNyf5ZoU@stanley.mountain>
References: <20260227-unboxed-customary-7ce6eda1858c@spud>
 <20260227181051.36207-1-lucas.fariamo08@gmail.com>
 <20260227181051.36207-4-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227181051.36207-4-lucas.fariamo08@gmail.com>

On Fri, Feb 27, 2026 at 03:10:45PM -0300, Lucas Faria Mendes wrote:
> Signed-off-by: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 55 +++++++--------------------
>  1 file changed, 13 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index c64a7249feca..4b2cab2f8357 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -387,66 +387,37 @@ static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
>  
>  static int axis_fifo_parse_dt(struct axis_fifo *fifo)
>  {
> -	int ret;
> -	unsigned int value;
>  	struct device_node *node = fifo->dt_device->of_node;
> -
> -	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
> -				   &value);
> +	int ret;
> +	
> +	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width", &ret);
        ^^^                                                              ^^^^


>  	if (ret) {
>  		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
> -		goto end;
> -	} else if (value != 32) {
> -		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
> -		ret = -EIO;
> -		goto end;
> +		return -EINVAL;
>  	}

What?  I'm so puzzled by this patch.  It's totally wrong.

regards,
dan carpenter

