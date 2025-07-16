Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9D31BC9E2
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677853; cv=none; b=Op+57uS/2RsSB9RgMU5DlGqJzBJ26Am/XMA8yf4Pfhiym6UzkpnDP6FdbEU7q7T3x6iEibR/dETjoI0pE4uJUJPLYuj3vDsha3ygpuAHkEAuBy5pnthhprFic0h32u5ZuKYCmA1y7dSg0ELnW18b21fx9Ehfad1Pu2399yvntg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677853; c=relaxed/simple;
	bh=yX61iu/JTpBMNAmF89HaJrlr5AbYSvRrlHtBwQqnCB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMFIhMxwA0TDVf767pqY1sjlLcW7BwLnA71UdGEAN3Eu55jOrsoRf9Q0QCm4WvOIZDrseuEnG1GAAIrppVNC2goxN3U+q/8kp2oK5iZULBeF0bnh3p9LnU63GbPkhblhXb2IWXik+JVLKMeaL2L+SK12wEFJzccj05Z3Wghf/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eora75EV; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eora75EV"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40a4de175a3so13210b6e.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752677851; x=1753282651; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0fIYKXxdNlL0Loh/Hk/oMDRUcTIJHiUYhypnrLxw5qY=;
        b=eora75EVpRbtLeb38y/On0KRU94c9dhgFJ5n7jyxULLpHBzwHmXLt2LsVQzTXPonDh
         jeIql3WBK7oPRkTQrnP/l0i0lALuTjlpLfbCa4ghkFFMwqAuYazgEIe6d0BnLEgmFsQY
         RgpeKHpSqmvqcyXT+WeMGh1Yt3mCj4VkDiL68pcXP61nHbxej9EexgMFGW868Jhmmcg1
         QfPp5ixXs0WsLyYaLxy6D7AmbvQ45IVtAw5CXo0OOiYRuNRmpRtu5xGdnjhtnnEOMhKM
         oFq6RLGBN+E0PLdLDGXeb6ANRiw2BIsWsl1EoqESCYnSsisYpqB7Fy1h1na9wnOSDJxs
         k3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677851; x=1753282651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fIYKXxdNlL0Loh/Hk/oMDRUcTIJHiUYhypnrLxw5qY=;
        b=kXFrouFRK9z8IMlJ0vNLrct99Lz2p+GzsZMIroLimxETg+h+qoX8WAkjiUx/oCteRQ
         lGM4xN8/hwKnP49Zw6UMgdYDYRw7pcfpkyZVC6+Jiv5vkm6CGdsOkRYpZZuEpnJMEQNk
         Vz8upTlCQECZ0/0bhWIwa8NjeNTLuiyq9q9v2VSgN28cYhXqa00WIZz4CAy/Uet5dlIQ
         1DKu/qvHvmOdQR2PPO7gZesYhD2rSpoY7G6d5mQlTUBl6C2GmH1cQbQ7i+7Yu41WrEey
         3tRGzHt1iQ1bEc5DG4bVYFhjn/Dax7KTuukDHbvyulhOKhgYd65Cn4IID0Bk6XxW/hKn
         8s4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcYyNvhR1ncZp/pUvGmz1qsjDTXZRvOdDlsr4gf+vHOj/VJ9Rx/MTQgi4StjQ0eEqJNHoeHD26ZqXFSiWR@lists.linux.dev
X-Gm-Message-State: AOJu0YwLmJK4F2sjtTN4tmpUK4TsGZONKiBbHfqulbqFgmSyndMiy9bk
	0mXX1ua7a8fBtAG34utSzP8iOLRQTHINm2CqvoXa1nfSgYNa+54OBJU15fqWuqSlH4A=
X-Gm-Gg: ASbGncvN3FgqYAfjCBctwIzk1CpZaubckE7Ec0yTwtO9RGMzVpsB5iISPjfp9u3ypGz
	Ue5X6yAAXLZs25wUqiG1ZyGagf3btoqLHxgkyFHgLe4F5+u96xen5Bcva/lSDFDIL0jdppJ3MwZ
	/Ad+oJo2UdRYyjkmEbsVw0rzj+PFTs/46Bw+OLU00S4mvaOkOSS9XkzyThgW3/48c6/Ff4j6Kzg
	ao4rrCt7vOPmnIN/gDG+eE3yiuXy9fGuiQHeL1CDNS1+WNCztL2Gr7KtJFyQjEjQEo25gXDdBmQ
	I/pHq/V8M9wiLuRU/vD5vDcDBUsuSgyRpPhtFRnXuBzHh3NKGFPtEeb4ruKjfynW82kVb8Y9+Hn
	qrUKZ6zUDatyrfMBJ/nqygnOeyi/2
X-Google-Smtp-Source: AGHT+IHWjYbkc4jkr0fUQqSgs4+cS3vheaLhFzQoFzml5IC/9Gi/CE5z2ISM97jPhKtAzwGsiEN4lg==
X-Received: by 2002:a05:6808:3c44:b0:406:6e4b:bd91 with SMTP id 5614622812f47-41d032fced9mr2080869b6e.7.1752677850582;
        Wed, 16 Jul 2025 07:57:30 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2564:68a3:7d6:cb7d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-613d9d6cdbdsm2176467eaf.7.2025.07.16.07.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:57:30 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:57:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: rtl8723bs: fix yoda condition in
 rtl8723b_cmd
Message-ID: <f29d3e68-d528-4fae-8298-d818e32316fe@suswa.mountain>
References: <20250716113808.73115-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716113808.73115-1-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 07:38:05AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Fix checkpatch warning about comparisons that should place the
> constant on the right side of the test.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> index 56526056d..abc123def 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
> @@ -24,7 +24,7 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
>  
>  	do {
>  		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
> -		if (0 == valid) {
> +		if (valid == 0) {

Is "valid" a number?  Like, are counting the number of valid things?
"== 0," means it's a number or an ammount.  Also it's idiomatic for
strcmp() so we would say "if (strcmp(str, "foo") == 0)" to mean the
strings are equal.  For boolean, we would say "if (!valid)" except
valid really means invalid in this context...

This whole function is garbage.  Re-write it.

regards,
dan carpenter

