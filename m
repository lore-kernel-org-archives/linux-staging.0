Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285E21375
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXxkD1cS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32fadd4ad09so3889653f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Nov 2023 23:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700551920; x=1701156720; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFtch3Nap710cpf4er7eW9cGVSpjM0L/7+OjaAxxZa8=;
        b=GXxkD1cSHMoQ0UYbHsdzL6J+G4rAA+pmwHV0Hj/8wzstHBeHoNAiu59yKnbo9T6K4W
         Ez+w0wRf98KG9jdxJWxlQPg5IvQ78nEXwEXgjqYIjS15VbmR70P9/H9+GGthKZO0DXgd
         0bsbwzhTen2/8oHDStxiWRd62siDe5tl1ZdcqeQborxdEr1uVc2BQiEoGSSF7kfMWCaM
         vFbtx+jJnAsIPrG/u2fQk6xWfiqQAajvfHWM8CxeQbBO3oLz5iwUoEtIGdKFrvpFesXc
         JlX0gfRg8AixEHNblKCi+UGzj7oPUyBgpy8tw2k9NWwOqvR1ttnO8KxMxYuBy55PYjd5
         +qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700551920; x=1701156720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFtch3Nap710cpf4er7eW9cGVSpjM0L/7+OjaAxxZa8=;
        b=H2Z05pmzoq6+pRES0tP5A01o2keGBhy45Q6uzwUna11KrvN5LB7eZU4x2ZFiSzBY9r
         GJTYL6fz7+kjKAaSo2I7idW80rFiLuUfVSFsU/D+lAyNf5mXY99Mp1Dr82arrBhk0McH
         wZScVABtG0dUukwFxgmRKJPxJdxMip2LSZLBMZaiRHLtzx1NEl2AwGEBv+799o0Wc9Qo
         0f0ZYimcWs1yEca27Xtvjg5vHZFvKX93gMvJVm61RJacwR1z3ocZ+M5crCJWtPByBKzZ
         EGA7EWPJ/wr2QE8Bq9W31N+3pRcQ+s8mTHoi61Hyywki9twE+yKPg6NmnU2Cdekd2MVz
         CitQ==
X-Gm-Message-State: AOJu0YytQneg0D+1jGWArcNT6+EhjMIUHzA90Zuqo6my/tqIRt27hHfV
	YxNs/i9qSHrRo1ldNVdDeWhxCQ==
X-Google-Smtp-Source: AGHT+IEzsgomKk4nfW00c6Ga9yeFtrm6C6dS4SdxymDIFlffCn3x55AEMbIKPQCO4+8GI6yjSgHbhw==
X-Received: by 2002:a5d:64e1:0:b0:332:cf3d:a041 with SMTP id g1-20020a5d64e1000000b00332cf3da041mr177747wri.8.1700551919385;
        Mon, 20 Nov 2023 23:31:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id df10-20020a5d5b8a000000b00331a55d3875sm9435549wrb.38.2023.11.20.23.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 23:31:59 -0800 (PST)
Date: Tue, 21 Nov 2023 02:31:56 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/14] staging: rtl8192e: IS_DOT11D_ENABLE() returns
 always false
Message-ID: <d911d509-8677-444c-ad7f-92dd141e8e1e@suswa.mountain>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

Looks good.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

