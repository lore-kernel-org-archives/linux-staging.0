Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5364BABE
	for <linux-staging@lists.linux.dev>; Fri, 19 Jan 2024 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705670105; cv=none; b=FdvX7vMsN2/y1blKiUR+axCpirg68ypnL8x5ionwsPEQLLVt1XbeZPLREuvy+BY+znErrgYihq9keL8MjA11ice8w+qWE0nxWYZyHGFT8zT6OZkvTmER73zaTPoG6eBAEeErHgBqrv9ZRnaldWXbt2r66oQgQrOyVqCSi1zqvnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705670105; c=relaxed/simple;
	bh=K7kOg2NiZtuBd/Ch9PPGpxtgWQazDvlPeYhXWlOidms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKIFPYtfa98zu1hSRBJoDMlD1ncfkY3sYZddRkIcxTqr2Ckn4yKhU+zKIODTG1gjCWDtQN8sdivAyuMhEKTsFytjXpOw1aOS/rq5ac2Co4mhMa1GNvvKYEagyCTjT9gVBxZWbYj7dc/uHPW9lbmxwd43RXqi+TFJwLR2twwA+KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rlTcCaEa; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rlTcCaEa"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-337bcf021a4so513936f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Jan 2024 05:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670102; x=1706274902; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7fb00m/4fXSK2elurL8+vFDfKU246XZ6cwAMjhuLk5M=;
        b=rlTcCaEa5lcZ51g6KQk/RGtI4qLXd6TZJ/vXL70H6tnCwFX3+sNGzOX8Hq8vAowIpI
         1TQExlTiNCGjZ4mZwVC/Yez8n+EShysG774Ncmgs8NkxcL2Pal9jqZCUQ4FtO62ZT25/
         w9GfnJpeYpbM9lsibj/CehpqyBB+c4cNzFlOmI6WdlD98pAb65WuqsXUMnXH2eTLCm7B
         yaW87Kh9rPPjEq+8N+SKo7xrh++ERMe7PbOaJKdq0WIrDbzaQ5NRUBiN34YI6wBREoWK
         DiGO+JNyUgeNyGQKqwAunBnNV5+Txchyj7X5NAkcbYQR9Uc+uiDdU0p8BDGyaejiJ0jf
         3gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670102; x=1706274902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fb00m/4fXSK2elurL8+vFDfKU246XZ6cwAMjhuLk5M=;
        b=dMiJc9dJxinWy37EvqhR0Y41kx25WF2xmGh8XB0lKJ1WSayGeAWkvMOzZ/pSYVw2Jn
         RCJzBjWsKT5l0Omo4EVs0nGFtlBogy7sKrfpdR0R2/Ara1x3aYP1P9tbJs8o31zU0xR1
         fhmlaJavtgqQYJiJAfXJIaicAhXzVMVxKyyHzdZa+6HF1rrBC+SA886XtMnE0PR07LRo
         tqBXZAgTNR1vm04WwQxa+d7Y0LhEASFBtUHa2dpGDK4oMuPo3PsT3Jow5hisIrGtM2mq
         jA9qjP0xFLm0xALX2KgABgJN1qbCDKJYvj3m1wkYej3Qwdgl7FPCwcRqqKWNskt5mJuZ
         wlFA==
X-Gm-Message-State: AOJu0Ywt8xCTWBtHdx2c2Vntoiz4O1PaHdIfMwkRz1BB3TCFTE+6Wkak
	JfQWqhu/ZAFQmwu0BmkJYJrgn0pSMe02J+Stt9EZFkc6JiwhFfgKVVs/bEF/q8M=
X-Google-Smtp-Source: AGHT+IECgnAsAQ/TbdhOd9jFSp2Z26ajBoyr6I+xGjnS5yL1Dyktn+STaFRaWg9vaz2rlfPJxWB7eA==
X-Received: by 2002:adf:fa0e:0:b0:337:d932:4980 with SMTP id m14-20020adffa0e000000b00337d9324980mr936025wrr.143.1705670101770;
        Fri, 19 Jan 2024 05:15:01 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id n7-20020adff087000000b00337bb0f370dsm6512697wro.40.2024.01.19.05.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:15:01 -0800 (PST)
Date: Fri, 19 Jan 2024 16:14:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jacob Lott <jklott.git@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rts5208: Add more details to Kconfig help
Message-ID: <b02e7a82-0db3-42f0-b5d9-e6d33b159192@moroto.mountain>
References: <20240118191703.89535-1-jklott.git@gmail.com>
 <ce1d6680-a7f5-4939-a47c-3079e7136c28@moroto.mountain>
 <ab907c56-5d91-482c-8308-fe06c22c7f55@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab907c56-5d91-482c-8308-fe06c22c7f55@gmail.com>

On Fri, Jan 19, 2024 at 06:42:57AM -0500, Jacob Lott wrote:
> 
> For the future when talking about line wrapping I've been going based off
> VSCode's row/col count, is this not correct? For reference when writing the
> commit I would use a new line before hitting 72 "col" on each row. I ask for
> the future so I can make better commits.

I don't know anything about VSCode so I can't answer the question.
There aren't any tabs so really I can't imagine how VSCode could get the
col count wrong...  (0_0)

regards,
dan carpenter
