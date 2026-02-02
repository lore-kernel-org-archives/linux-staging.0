Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F524CEEA
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021135; cv=none; b=r4/TJiuUM5251W4DCOGhoYvBzs6TOhpwv702z5KdJ2V3/7IQUReuE2u4P/BJmdR4Oh3XRNBm/Ebfx8OsgbCQ+9j2Mkl85C1U78Mp7ePuwebfggppCEUQeWPYZHef5dPL032F3FWEPu5prhyOlPzkk38XeVMqEwejcZj8MZz83vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021135; c=relaxed/simple;
	bh=Tyo8zNs3p7vI0rMC9xc0QfcF/mQHauzf0txKo94Sbcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsqPfIzD0iwE0SRDiT/2C1LBrrGlRYU91ohz9K8noPCXAOLYgah5ZcQ9htqkUVSZtZXwhbEQPVYC1D56YRKIa5zjCc8Jy63OuBGDqgDxLWSVRoNc05z78FpWwIMz+Xu4ZtR973o+qJ00ICxUvjUKb5hBjl1RPM/fd2UKabNDaFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oRWLEYWD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRWLEYWD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbc544b09so3856300f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 00:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770021133; x=1770625933; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bNdO11u8Moy78UisAklN4GF/yvopyhw93XwMUNoLOG8=;
        b=oRWLEYWDmncB7EUHWGekUtd88gvQSgLRk5vDS04IXG3+PKo11khOrF2KO0mmzvL9yn
         USXziEtkFdkFNVMRQmR5byr0/pmg58+DAkcWevzsVqYmrIWTJjerothOLKPr4Nym9CaO
         pZCPrf+nsiDDHoiNX1phaX/db0XvtlJAAe5CP9C/EaHSzI/URB1ItldAlneH+dtOs7RF
         EAWjtLPIrHnI0Bpdtg+F7XFss7zF9TriTQ1BakidYaF8eDrL1YMaeQiP3SCvxTTAZQpw
         xOJ6wmd2L9iHifcYXj4rCKFSLorU82jTQcxKbjYN+MvBMgbZ7tJDQscM/pgzNiOZbjP5
         k3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770021133; x=1770625933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNdO11u8Moy78UisAklN4GF/yvopyhw93XwMUNoLOG8=;
        b=CUfTKOM1GjCbzYp4p1OH2R8p1beMDsJmjiuQISF2Ih0QYnP4vPxxG9POiRuzA1qbWN
         +kOmypTOO+n0ZcBH0Ug1UT2QNWl4rPtZ/FoprOuzrLaMwPEaiywVFb+xtYvyGMRwVPYX
         fJt7Bjxcsgq0pyIqiANgS7CJbt3PgGQZVZ5ErTSv0MikOipiAiVBL7RcizCn2ZK3fE+c
         wgHY6D/QUWYtw0F6C5LAKPYiVI4TEL9EM7mLUEnuZcPm7SRdsH5CW1go72VvE4deRHXG
         0kllVMv+VaVtkq3Dz+W7Ji358Q6vV/x/C6QKkSmmidw066CPK8//uUwaG+p+Y8mYtU/W
         sl9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBA66ggmprPuBNTrVneejBZMoyGER3Kw8X7vrIHMUoSHbV0hy2VWx47L6R9bcT1nvNUmBYtq6ceNKKwMHr@lists.linux.dev
X-Gm-Message-State: AOJu0YwthqTzhPyPPwEvsL0B2pON0ads9AoLsqWOAjB84cm++YtKK8cf
	itNbAxiPZp9KPKGPKW4dH6iUkMDOC4AHShdNbA2p3vrZte9qUvq+CYwDm6qjr/WRccU=
X-Gm-Gg: AZuq6aI7876VGwFogqWJxv90Xy2gza+H39MjrdeFyEKLpP07qWHFy2rFJ0og5it3Zmp
	BbC7WgwPZ5S6+d+c2kUa1CLVWSdpuJTJlweKTHBRobBaYhmPzediD3GzL/xbnv/F14jkDVXLW71
	dTpIF027/idDjlgETOpd3ItP7NuPnWYJwx+/EaIpOF9qjDjl7Rt5mnGfMYU5/ESrBTGkMMKHEtH
	sVvAWk6L3Es/TYvvxtZMD8ZnuC5ApyJoVjFJX3i/Xuh7Cgj9/9o1pN5hw//+UAdtXlzoGdZ72AZ
	wTiqAfJaibGLCbuvFI6N+oGN6LgbsQ0GV+cDiE5LWsPfS++3nVwWttwrjW0jo7JIHuleDPB8k2C
	4qfGxhPTm8yG+JB97XYt9/RAV1ZAJduC8XIsJY98AdPzuoXhLLm8TcmlxtzzazFUrMVnULuY2iy
	fQHxFJOppeztwJHSvd
X-Received: by 2002:a5d:5885:0:b0:430:f7dc:7e96 with SMTP id ffacd0b85a97d-435f3aac755mr15572987f8f.48.1770021132699;
        Mon, 02 Feb 2026 00:32:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ed952sm43510312f8f.10.2026.02.02.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:32:12 -0800 (PST)
Date: Mon, 2 Feb 2026 11:32:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] staging: axis-fifo: refactor device tree parsing
Message-ID: <aYBhCBMkxb-TlVFH@stanley.mountain>
References: <20260131182732.62857-1-gustavopiazdasilva2102@gmail.com>
 <20260131182732.62857-3-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131182732.62857-3-gustavopiazdasilva2102@gmail.com>

On Sat, Jan 31, 2026 at 03:27:32PM -0300, Gustavo Piaz da Silva wrote:
> Refactor the device tree parsing logic in axis_fifo_probe() to reduce
> 
> code duplication and improve readability.
> 
> Create a helper function axis_fifo_get_u32() to handle property reading
> 
> and error checking, replacing repetitive of_property_read_u32() calls.
> 
> This eliminates the goto logic for error handling in the probe path and
> 
> consolidates error logging.
> 

Delete the extra blank lines.

> Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
> ---

No changelog explaining what changed vs v2.

>  drivers/staging/axis-fifo/axis-fifo.c | 76 +++++++++------------------
>  1 file changed, 25 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 7bc7bf191250..1e3059ec4fbd 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -482,68 +482,42 @@ static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
>  			    &axis_fifo_debugfs_regs_fops);
>  }
>  
> -static int axis_fifo_parse_dt(struct axis_fifo *fifo)
> +
> +static int axis_fifo_get_u32(struct axis_fifo *fifo, const char *prop, u32 *val)
>  {
> -	int ret;
> -	unsigned int value;
> -	struct device_node *node = fifo->dt_device->of_node;
> +	int ret = of_property_read_u32(fifo->dt_device->of_node, prop, val);
>  
> -	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
> -				   &value);
>  	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
> -		goto end;
> -	} else if (value != 32) {
> -		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
> -		ret = -EIO;
> -		goto end;
> +		dev_err(fifo->dt_device, "missing %s property\n", prop);
> +		return ret;
>  	}
> +	return 0;
> +}
>  
> -	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
> -				   &value);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,axi-str-txd-tdata-width property\n");
> -		goto end;
> -	} else if (value != 32) {
> -		dev_err(fifo->dt_device, "xlnx,axi-str-txd-tdata-width only supports 32 bits\n");
> -		ret = -EIO;
> -		goto end;
> -	}
> +static int axis_fifo_parse_dt(struct axis_fifo *fifo)
> +{
> +	u32 width;
>  
> -	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
> -				   &fifo->rx_fifo_depth);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
> -		ret = -EIO;
> -		goto end;
> +	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-rxd-tdata-width", &width) || width != 32) {
> +		dev_err(fifo->dt_device, "tdata-width only supports 32 bits\n");

Better to put "rx" in the error message

> +		return -EIO;
>  	}
> -
> -	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
> -				   &fifo->tx_fifo_depth);
> -	if (ret) {
> -		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
> -		ret = -EIO;
> -		goto end;
> +	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-txd-tdata-width", &width) || width != 32) {
> +		dev_err(fifo->dt_device, "tdata-width only supports 32 bits\n");

and "tx" here.

regards,
dan carpenter

> +		return -EIO;
>  	}

