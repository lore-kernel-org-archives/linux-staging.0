Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9666F268FE1
	for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883872; cv=none; b=dtGXzNWor1VC9EvhMVVYyLe8SDWabGG1SUKyA+Bi1NfdZ6CvrCwBu08D83p79pPP+kfaXYCumbmMxGcBdk4XYIEupNofLQYvYASsTAhJfReHw3n726glmU2HLj/ulrxS4YL4Wyz4Tqd/IJ9q5dMlFMWwe/1N4ztaUY+rkyLiSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883872; c=relaxed/simple;
	bh=MHVuSNBLM4BpztBJEU4/kxPfP1t2Bjaby1gsrR8kmdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwks9tgo11MwiTKfORyyAjV8kIFAd+5uHzL4urSFybPEVUNQyXv+fz9/du7SCKEWMEIo36WE/WzCB1fbyGqDEwLkuA03YwTx3ME7eElZEuVmIixBlaY6n8lJ1fUGItTdi4qIWY4rzA06R5lwwsFP6j8CVRYmSoighM6FXNPIpiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cj6DmgJY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cj6DmgJY"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5deb956aa5eso7617984a12.2
        for <linux-staging@lists.linux.dev>; Tue, 18 Feb 2025 05:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739883869; x=1740488669; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Md734qHcyvpdwz9o4Y4J6b9qvgT6ZStj8nzECjc5p0M=;
        b=Cj6DmgJYdf0EVUbj0G0LwGJ347gAV066CDdzcEzr+twuZAGfAJKhK4Y0PAss9v/dJ8
         NEbuua4rTB0Sg0ByXCnUTdY2QG3KRX0vuE29nnxJdbweIo40M4jgHdrYPzrwLs61BlkA
         k3rQKj0Ktu1EaAVpGPctU+9/EdB/6UlQa+32kvSTh/nYHAAsEl7slzX44IXzYjfPZkKU
         0kgyxOQOjXpEg6E8dCI0ANGI0VsLMOiMemFzbMLf7BqARXAaPke5a1cWLOknKxXiQWrT
         l2mV1Amfj7bJ3h7TSceg2yPJwkIcmtdnp3cDTzOf+dgRGKwEmOFdW8irvCDX8tECpuRE
         FImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883869; x=1740488669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Md734qHcyvpdwz9o4Y4J6b9qvgT6ZStj8nzECjc5p0M=;
        b=JGAccgbsLHISOfTpix8Bu+1DpCXCxQeSMxDoyVNhX01Ir2cS1pbpn7cbKSwKXcPorM
         ypDQkbWxKGgQlhWKdgRyS6grrMyz+cYTtCanMWWnZ/HJbrSPTDnGbsAsM+9pfJGV1cqz
         TOVMDQmmfiotTFoSBNGbhdZj+J28xN0yEXtDFfGkA+XoSRE7SCwdqoIIQNJ5k9tGQfT/
         ABm7weKz1cCYP8FPbh9+gGej+v/4DaB78/+OkqB1HdLBBwLCb91F8Tu32GenfuGbnUWg
         QKqHXjp0wKVYphpFl/MJBTeJqi0CXrAVLp0nfkkWh3hyFFWMu1lY15+sAFNjOXhAaO2W
         6Phg==
X-Forwarded-Encrypted: i=1; AJvYcCWCNKhNUs2aYlBjafyqtTSxTstwtqv0zMl8lJhBzBDJjAQnQ/TGbXposH51EkIa/aBBKDqLYB2HUyRA9DsZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyuxQTXLulRd1/SZE3YReEAwm9TmUhyaLeRwQLUmdTOf0Xhj6eK
	T+SKC7tWhZb+OMkXcGi5oiQnLgTWJcmBxg+LYv7EbHCI6KeYR84o1lwjoQTAoc0=
X-Gm-Gg: ASbGncvO8NT6z8dp+6xvPqjmOo3FYXpmo8qkyKBvdbRBTkGlIA/KFi03EvraIcVkujy
	sUFt9uSKdPV/pgmUGdl/y1AI+shgfoqZgqM+LI9nUt6MxCYGcTiqZj5mp7x4BTAx5WaS9aBrp3G
	PAHXZAi210k/xjQLHt153F7Bwb8TM/LuxswUZZG5acQ3sLW/S+1qvOrT7ql+K+6FvaUKI7HzDW1
	qEwZMB/RaNY5ToqtANKNPX9FiMSCxs0jJlyz7/JBA592o7EtUVFrQD55IJNehAlcozdGagKyQjX
	8HnqsSC7fk7ZfS1+9K8O
X-Google-Smtp-Source: AGHT+IHbWZcfDwWtXTuM1/x/IlqYTAmRUuYgosuY0tcKBoinJw+DAmVHLUpd5PTsSuNOZAZ5PWkB2w==
X-Received: by 2002:a05:6402:3710:b0:5e0:7cc4:ec57 with SMTP id 4fb4d7f45d1cf-5e07cc4ee69mr5027807a12.31.1739883868810;
        Tue, 18 Feb 2025 05:04:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e03aa0b1f7sm5314855a12.2.2025.02.18.05.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:04:28 -0800 (PST)
Date: Tue, 18 Feb 2025 16:04:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ravi Kumar kairi <kumarkairiravi@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, kuba@kernel.org,
	rmk+kernel@armlinux.org.uk, broonie@kernel.org, arnd@arndb.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] [PATCH 2/2] staging:glib:hp_82335: Refactor kzalloc
 size calculation to use pointer dereference
Message-ID: <43545be2-bde2-4d15-82fa-282698d599df@stanley.mountain>
References: <cover.1739794938.git.kumarkairiravi@gmail.com>
 <b3358e0d2c50a7d0777dd11d6e34ed9a52c00377.1739794938.git.kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3358e0d2c50a7d0777dd11d6e34ed9a52c00377.1739794938.git.kumarkairiravi@gmail.com>

On Mon, Feb 17, 2025 at 06:26:17PM +0530, Ravi Kumar kairi wrote:
> From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> 
> Replaced sizeof(struct hp82335_priv) with sizeof(*board->private_data)
> *as checkpatch* suggested.
> 
> Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
> ---
>  drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
> index f1c2045570..66557d6964 100644
> --- a/drivers/staging/gpib/hp_82335/hp82335.c
> +++ b/drivers/staging/gpib/hp_82335/hp82335.c
> @@ -205,7 +205,7 @@ static gpib_interface_t hp82335_interface = {
>  
>  static int hp82335_allocate_private(gpib_board_t *board)
>  {
> -	board->private_data = kzalloc(sizeof(struct hp82335_priv), GFP_KERNEL);
> +	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);

No, this doesn't work.  board->private_data is a void pointer.

I recently wrote a Smatch check for this kind of bug, but I was letting
someone send all the fixes before I publish it.

regards,
dan carpenter

