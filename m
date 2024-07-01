Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B615DBD6
	for <linux-staging@lists.linux.dev>; Mon,  1 Jul 2024 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719862009; cv=none; b=G1ITZ8iIrC38oIhjiJWWYTX1DaqJ5HVWcf5IZdPm+WFgq2mNLPwEtiHhA50WofkcLQGYOShYt8AuvqA9X7h0eWZv3dLV8kCUt0FMpJQTj5RaLbz9veetiJt1NfNNIoqlk4WLk2zJl8PRe/RDhNhMab45WhaqJ6bEvBFINJEu9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719862009; c=relaxed/simple;
	bh=LHk7eROmcWbnYfS7vGmlALNYA1Wkpd69NP4AeKt/6wQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNo7Y8UmgCNqqkYEDyaGZA7LxuF6Yt8sGATOy4jcAwjbtB38XfNRjw8nwIymu+Uoo4IyaHwPAfDiwrAMN9W/VlTSYStrwe+gaeX+8GZXpx+fBcsV9u3QZvg3VgHK4f8KzWoKOyYSvbhAT8LWvp+j5qRM8Lk58eQPgf6GI4AZqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBECWOBl; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBECWOBl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57d3125e0baso100956a12.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Jul 2024 12:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719862007; x=1720466807; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfdinNK4I+EoPid1lO74/d3sekkGPezRAAen9ZXKCjo=;
        b=IBECWOBl+dNu+yP2+OFFzprTKJRoEkQw1BsWiY/OzB049Ri68I1uUVPobb4mohhNSz
         g6j4UUYpVsP1yp+8+/iyjVqpEt96te/xu9D6eH1z75j/tHbiGlchHPnh1ZMT7bxHuVlq
         xwEvtKF5LeWgF8P+4DG9o+kGWiBGMshP9DwCxLviTOXRCXi8U7DlWoDv9OIHQn4pTKd+
         OFykLASoz/js36ssY//d19M1YkdGNKepo7yVu+ZFDQx+4n+amzv57+K2nrXlOS06tzYd
         i9CyONMZqsq88/tP1TYpRfbE7GCLLJCgfnsmYlvMSs6Rrosk6IwoSwYtUcO3u1aF6Y45
         WXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719862007; x=1720466807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfdinNK4I+EoPid1lO74/d3sekkGPezRAAen9ZXKCjo=;
        b=hS92nFy/z3PSKOhf5D+AEVWKKaXTASl4Mm7T7FS+eRzJx0Dww1WgNk7k4I3YRyqaOG
         ehAp1CtTXQs8KRsU75g5RipzmRFVVFFyGNe6GIcsmTLPRSN0qe449U8UtQjDC6PJCZrn
         t2v7sJh+SXUPCVpdY25tYfLpDgt+OOXrbD/xEPirwYKFCoRCzDf58brfeVIV+9QiuaQm
         VOm5s1xLHosQmtAa/vkxF0IQz6csIXI3yJNxjcTL3wor9bCq8lkeYbVvOk/45Dck+38Q
         TxnAKpEgITCSYaWmbhdfWcWVXrEZqA5v/RGVZjnQ8znCFSlhVtcJFA2nYdBLNqRfuqav
         WqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWteFbuclgAztvFoyCvZ8xKFhp/b3JU0V9AbWjloTSFPGKZbsmPBzhZCGmWr2Z/DdQeoIwcjt1pRaMQptIbCW46wiaXJSCE7WSZk4hmwA==
X-Gm-Message-State: AOJu0Yx7tDG/wvT4vXN7GMArR+jCQTp4DYvH71/5JJaVjm0SWJ12yJI4
	QyJ9OBIB8+7ECs6IFti6MkZ8BFMhNYVvaujwZnvdO1mX2H95DJWV
X-Google-Smtp-Source: AGHT+IFIldSyzbbCJ+hsZsoZunyrocfc9ycgS0pL5fYmvUqQyAR2jtyv2kjmcAuWJPQInx+F8WFnGA==
X-Received: by 2002:a05:6402:14d0:b0:58b:e3b:c5db with SMTP id 4fb4d7f45d1cf-58b0e3bcb29mr393220a12.4.1719862006584;
        Mon, 01 Jul 2024 12:26:46 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d50da0sm4761129a12.59.2024.07.01.12.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 12:26:46 -0700 (PDT)
Message-ID: <e4006c92-b5ff-4f28-9cf7-3f5c2a808234@gmail.com>
Date: Mon, 1 Jul 2024 21:26:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] staging: nvec: cannot configure to compile driver for
 testing
To: =?UTF-8?Q?=C3=81gatha_Isabelle_Chris_Moreira_Guedes?= <code@agatha.dev>
Cc: linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Tom Mounet <tommounet@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>, Marc Dietrich <marvin24@gmx.de>,
 Greg KH <gregkh@linuxfoundation.org>
References: <13cd3ec0-0f4f-4119-b2a5-f74e33e3c862@gmail.com>
 <yhpx2piocn5bkzaqec7mdyosb7x5zpws5l52lmx4xnejmr5xeh@6s3oe4cagcen>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <yhpx2piocn5bkzaqec7mdyosb7x5zpws5l52lmx4xnejmr5xeh@6s3oe4cagcen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/1/24 04:13, Ágatha Isabelle Chris Moreira Guedes wrote:
> Hi!
> 
> On Sun, Jun 30, 2024 at 12:37:53PM GMT, Philipp Hortmann wrote:
>> When start make menuconfig
>>
>> and search with / for NVEC I can see:
>>
>> Symbol: MFD_NVEC [=n]
>> Type  : tristate
>>
>>                                         Defined at
>> drivers/staging/nvec/Kconfig:2
>> Prompt: NV Tegra Embedded Controller SMBus Interface
>> Depends on: STAGING [=y] && I2C [=y] && GPIOLIB [=y] && ARCH_TEGRA
>> Location:
>>
>>   -> Device Drivers                                                      (2)
>> -> Staging drivers (STAGING [=y])
>> 	 -> NV Tegra Embedded Controller SMBus Interface (MFD_NVEC [=n])
>> Selects: MFD_CORE [=y]
>>
>>
>> But I cannot jump or go into "NV Tegra Embedded Controller SMBus Interface"
> 
> Have you checked whether you have its dependencies enabled?
> 
> It seems like you have STAGING, I2C and GPIOLIB, but not ARCH_TEGRA.
> 
> Is your kernel configured for the right architecture? Are you using
> ARCH=arm environment variable? You can do this by running the command:
> 
> $ ARCH=arm make menuconfig
> 
>> In my .config file there is no string "NVEC" at all.
> 
> If it's generated by `make menuconfig` and you don't have the
> dependencies, as far as I can recall it's not supposed to have this
> string at all.
> 
>> How to config this driver to be compiled?
> 
> I haven't worked much with kernel for ARM-based SoCs, but I think as
> soon as you have your kernel properly configured for the correct
> architecture and having all dependencies met  you'll see it there. I
> just tested and it shows up for me
> 


Hi,

thanks for the hints. Here the steps I took on my x86_64:

saved my .config file.
sudo apt install gcc-aarch64-linux-gnu
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
make defconfig
make menuconfig
	used / NVEC to find driver(s) and set them all to modules
make scripts prepare modules_prepare
make -j6
make -C . M=drivers/staging/nvec

Thanks for your support.

Bye Philipp











