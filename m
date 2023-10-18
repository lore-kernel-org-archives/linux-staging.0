Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8FC18038
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rSLzAnQ6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32d9b507b00so4448190f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697621679; x=1698226479; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sv0FCDZpFwcd+OomNX8xlBQ0tLiUtxgv2CzVm71AOM=;
        b=rSLzAnQ6bMtrFMWZMmeTaJrpaMnBQEXKn48JGg1YkEZMTN5S44BNiL1iv4vikmjnmg
         A/sCqifxEaJf3+saKkcnmZD779HbK/KxoQnD3yJskpfdPe918py59F12rfePwf7x62Xw
         V+o4gbeF2e7sPOF3yljExraCD75YVejeyqEt+PVWDGmd9sYyolqSpnkRdwX8g1yOiC8h
         25qfn6FOnjUsINk5F3Jd76+36mWtIrn4ZATtxzBn+1gLQeL52bfad8D4x4o9roTIcJLn
         IdMEu0E1Il8vc7slXeniZcTUeYfvdb4I2rtb7U8LKVLyrfM8CI142oW3PY8hevuDp8CL
         hfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697621679; x=1698226479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sv0FCDZpFwcd+OomNX8xlBQ0tLiUtxgv2CzVm71AOM=;
        b=C5g8KEI1k54KWSvjHRuqPk6MlWMWdnT9Ug/SH3/MyXsqpXW6egh5ZiCbvSPDnXKrxP
         toyJJDoRAMA7nbYe5tPO4Pc6MrAUeM8DurdASlvt4xY3fiFAWHBqijKmaXEB9ri15MSH
         TTTajP89nuIcCxKJlBEVXbsluS+UNdvzGrQyyFbCXDkgZdUjWdK+4azrJEkpgLYHGc9r
         LcO57fxsItMwfhO9qvyodF5UYh+EiRI6p9ohyGTaqsB851MCm+H/g4dw7dlfsb227X+Z
         EB2qXRVIr/YZezaNeCAvGF9wa2lY4vbrx5Dbin6qYcLMjRFuCkrt49jjeoIJLz6RE1tt
         07Bg==
X-Gm-Message-State: AOJu0YxkpWvDrq/usuTleGsArX/K+dGPQ6Q1l8HDDP5pPhqJsaWihW09
	dTr9Z0AaHKUibX7AonBXuKn5Dg==
X-Google-Smtp-Source: AGHT+IGIAS/j+uj93RmHmX/KEbmsiZXmJCczP64fq3Xd7hK0t1HHw4THzR0C0AbDNLPG9A9j4rAoxw==
X-Received: by 2002:a5d:4f02:0:b0:32d:a28b:da08 with SMTP id c2-20020a5d4f02000000b0032da28bda08mr3721637wru.62.1697621679570;
        Wed, 18 Oct 2023 02:34:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h13-20020a056000000d00b0031fd849e797sm1681945wrx.105.2023.10.18.02.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 02:34:39 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:34:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dorcas AnonoLitunya <anonolitunya@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	andi.shyti@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: sm750fb: Remove unused return value in
 program_mode_registers()
Message-ID: <41a6ac1b-d21e-41ab-b193-623d2f5f2d2c@kadam.mountain>
References: <cover.1697619623.git.anonolitunya@gmail.com>
 <492e63bbc58147fb534930ef9e1fb5d844ae8769.1697619623.git.anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <492e63bbc58147fb534930ef9e1fb5d844ae8769.1697619623.git.anonolitunya@gmail.com>

On Wed, Oct 18, 2023 at 12:07:38PM +0300, Dorcas AnonoLitunya wrote:
> -static int program_mode_registers(struct mode_parameter *mode_param,
> -				  struct pll_value *pll)
> +static void program_mode_registers(struct mode_parameter *mode_param,
> +				   struct pll_value *pll)
>  {
>  	int ret = 0;
>  	int cnt = 0;
> @@ -202,7 +202,6 @@ static int program_mode_registers(struct mode_parameter *mode_param,
>  	} else {
>  		ret = -1;

No need to set ret here.

>  	}
> -	return ret;
>  }

regards,
dan carpenter

