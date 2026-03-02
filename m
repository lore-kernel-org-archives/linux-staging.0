Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759420E023
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443043; cv=none; b=IEK4v41rur2eOKqxZUk5Ffb0PvOGKBM3TpNDzvqSYS7eIXvTPeDRlLKB1PR+tzb/4QpVSVGZRtHCZBsPLBLw8uyzbAIRhnn0wpwS2OEI/OJM5914WQgqU0aDOozvzAkCpJyqIIQS+mpa+Ms2PHP2pM+rASksAc8RwQw8OuTkaRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443043; c=relaxed/simple;
	bh=LVsxGHeBLqDZ5yfFpjMyLx6NQez1ggO7qAfrAEFa3Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C97AW7HIFQBocTk3eN3ekbJFviDwsQKCKi7XIVWYIJjGIJXuCv2DK/OCWkfGmWXD7X0ptyCuBFAPEK5o+4vsLYBhve8KNXxicy5moRgnXredBszKc/o362dz1j7TXT8q04g45G8uF3roLQIdUrptJWKnfAeaN9AQbkmQg3kh6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G4LmI2qN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G4LmI2qN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48379a42f76so33893055e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 01:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772443040; x=1773047840; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7k1/JqAQLfuKcHJQtEmCDAzH8XPsDa64NhYKDA0/NyE=;
        b=G4LmI2qN9mnBWC8q13HEdKBwZoJdoVj2PGE0iFNDobMofru1eelO5sgGCw1l8enL+M
         MlvKV1nLs5Od5i/976aFVfArG9LlTiy4Y8AthuuiEnScLyzSpWHmfBdQL/uzwqpnxQ1k
         Uqf9n9tXAmaNhJwQoEgSX9ff7CnQuuMxa9YuDn4iEDH3grDOnm9TgLgoMbkOeBhQkbVE
         T4QO2jyM9WoCpvGzX9Yeq4cIm8fgTRA6jcYxdzib9SH47q98fWPGl4ASi5l+P60W4N7Z
         EQt+XGsivHFizDLUqWOK+z+HeqWFDSCPYSBfKJGRbowtBtUyyg4RFT3b9Fjrwdkex1IU
         oZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443040; x=1773047840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7k1/JqAQLfuKcHJQtEmCDAzH8XPsDa64NhYKDA0/NyE=;
        b=iav8wVaCMjWTXmiDfyjFl6kmtiriAUzL4Ll9Ax+ANhj3vy4IqPgQVjZoox7i5A/H1Z
         zo2p++QCe8bxd66odBoqBzm99glRMPCtBmMLCVYWu3qmDCd8kZJu2An5J0udTFeo+lM9
         RJz6dXnG/IE+Vqg/dVQ0J3G2zKs0rqhbYxzHfISswnwu5uIktOf3LX34anw6AD0DQOpS
         fyQST7f3k0qxvOEntb7BB8fCXYHalY3D1YA3Gb3xnMRZCwKTeZJmb4WfpDLuG81bOkvb
         rbgqHN1U9+ck9Dh/mcnPT7RkRFDG1n8chiK0l0QBDdp37sj38pc8POJNJRWKolFnLl5s
         EAug==
X-Forwarded-Encrypted: i=1; AJvYcCXhgm1pdi6dEc/ltO+4NjUp75B7tLocVhckk0dyDPU1HJzrj22U6DGqIY7bzWtBxRAKye6ghNmmEeJ7oKap@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9RZSU73YHKKpk2ACblPQ9RAClyGEEMFm0bO8h0VI19GZm19pq
	Yj9p8ApPRshq0LBxXN7zOdXHCZreta6PFHEXBDB1dkfxu98zCklHFtblLSJUhl4XVYk=
X-Gm-Gg: ATEYQzxWAK9+wJkkFyshHciXpYKq8UWwAnfkI0WOtkA/IvvojG7adRbgeDMAUzqegw+
	HCDBPaxUG2clvhJHDHdbWhfvV4OCLYa3hcPp02CE6Tn9u+/ctbv79D9Siymx9oUBllX9CoOK9u0
	DkKHWBTGJrg58eIYW0Vzk2dqRFafZwYvGf4We4vYFVyTn0/MyD44rb18edUPw9LJyogOjansJeG
	n/YDZgzR8L07dIDIJbyAqp8jtJiVwUTRYvbVaLsMx72osOv9Y8crIA1Hjks2ZZKpA7YWR7F7tdq
	nLxvxiYHf/w8YJfyZ2XvPptnLGKS4j/Faudgz/IdqfGFH55dLmJxVJs4oDiwR3igtRHmKjWgu/7
	PEEFjA11TGPVN4D6ZyFaeYEBYmN2WAj3vPrrUa5PREATdJ3ZmESGaLsEuT5iBI8/tRogrOxqL87
	MJf9O69uYtObxlX+h+kqChFVbAVWmU
X-Received: by 2002:a05:600c:3e86:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-483c9c1bc0bmr190909605e9.30.1772443040055;
        Mon, 02 Mar 2026 01:17:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770c2sm264346215e9.10.2026.03.02.01.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:17:17 -0800 (PST)
Date: Mon, 2 Mar 2026 12:17:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Message-ID: <aaVVmuFE_Hu28RZX@stanley.mountain>
References: <20260301005019.2510157-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301005019.2510157-1-objecting@objecting.org>

On Sun, Mar 01, 2026 at 12:50:19AM +0000, Josh Law wrote:
> Signed-off-by: Josh Law <objecting@objecting.org>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index aac2c58ef9b3..d83a0fd5b231 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -395,22 +395,22 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
>  				   &value);
>  	if (ret) {
>  		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
> -		goto end;
> +		return ret;
>  	} else if (value != 32) {
>  		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
>  		ret = -EIO;
> -		goto end;
> +		return ret;

Just return -EIO.

regards,
dan carpenter

