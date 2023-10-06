Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC46D17F2
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F9pfnqL3"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-503056c8195so2342145e87.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 23:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696574565; x=1697179365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W48qcl+qVVYwRgZC9dzFeOYmfNEtgKzD22rI+wL+TnY=;
        b=F9pfnqL34WcvhYUN5jKnVgEQtamcu8O288CK7RaRjuoAXVYyFGTQVm7lW7mirwcw83
         dhPitnqWeXhpCThmpgnIN0tzXDgdR69hXStqkbbuACEZSTHhyOB6YW2hvmmZGSICtUKf
         WJvLXWBDSHIGdUj7r2LOr+MOL1wnCQcqc5ClzmMuxyquF4qNlDQma+kQRXSM4UU2CA2v
         tGKDbDvzJ9SC6tYFqui5ZDZfH3/YPsP7lrXjAPfglXUmsMmVDkvPVEXeVhuPJq3gNUcr
         +1s3ToCfX/TRMlhipULJnHYW60OQYHzfg3R3lSweazKKtbeYoMEHUMtYDzeIgm5ZJOUE
         Bp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696574565; x=1697179365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W48qcl+qVVYwRgZC9dzFeOYmfNEtgKzD22rI+wL+TnY=;
        b=HjjzWhDuNvyqjEZhGJwDODEBRJRyBwy7fLzGZahR4qJ9FbPuRWdbW6n4xFLjkjqpfa
         ZCTx0WxwWEaGVLzr0fragG7pHH9EnsMuoGsaPBbLJoQYQBXBCQWSfApMwcQNfMNPwcpP
         g7AwzRE3xzU2qGccFh/o63Hp4DS7jewDP8I/bxjen6g7zOzt7YfFg2hNRSmBAvkFyazB
         dpwwTq238qstZN2/mJwtIi0HUwj6ZyTmE4wMByuApUJhVIccIMhK+5+QBU2r3rl+YZ2I
         xfz9rTSZc7q08MniGZwVQruR0B4U2oOAxPoPbJpsU8xaKXQq9VXx3CyJxiItxLiN468p
         znEg==
X-Gm-Message-State: AOJu0Yz3NVgmZQ6XOuUaPnNhiXqy393PS/1HdZK4FWSvLHz2vDuOHMlr
	M3xEGBJLvlObliEQ39d2PtnDjQ==
X-Google-Smtp-Source: AGHT+IFIWdwm8yYcilcNJBfYGLjSxm5s+ZR2i1auLhHaCiDm+4VaFO3iNGZddB32L6PiCOJ5HAbcYw==
X-Received: by 2002:ac2:5f5b:0:b0:4fd:cae7:2393 with SMTP id 27-20020ac25f5b000000b004fdcae72393mr5162245lfz.2.1696574564680;
        Thu, 05 Oct 2023 23:42:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f17-20020a1c6a11000000b004063ea92492sm3019275wmc.22.2023.10.05.23.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 23:42:44 -0700 (PDT)
Date: Fri, 6 Oct 2023 09:42:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Lopes <ricardoapl.dev@gmail.com>
Cc: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com, coiby.xu@gmail.com,
	gregkh@linuxfoundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: Replace strncpy with strscpy
Message-ID: <0b78b29f-2a84-487c-a43b-f8d3fa20d935@kadam.mountain>
References: <20231005191459.10698-1-ricardoapl.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005191459.10698-1-ricardoapl.dev@gmail.com>

On Thu, Oct 05, 2023 at 08:14:55PM +0100, Ricardo Lopes wrote:
> Avoid read overflows and other misbehavior due to missing termination.
> 

There aren't any read overflows in the current code.

> Reported by checkpatch:
> 
> WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy

But making checkpatch happy is good and the patch is fine.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

