Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBEF30506E
	for <linux-staging@lists.linux.dev>; Wed, 10 Sep 2025 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501334; cv=none; b=Q+VcxUzvDqHoaB8sCkwDUuFc9hSQxDeFhYFQJ7qB38jB7TkwQkAymV70hGWAtjAYmhLRFyaRPV8n97nqWkk6DkYRv3Qf8L0jOhM93mRCgX7jQIGxmj1eFNIwtkVdVaViMKyFm87cOUL1QtOJaI/i68xFJOnqOayrGZmopsZSucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501334; c=relaxed/simple;
	bh=oZuskF8rQFH7X1X26xw4eX994bR051hWbKT9n03w/6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTZtKydDKKD3Mz2yJ/rt4bD8USHOy6HEsym3eUMOc3+chVINabwBHUVgOpqYP0pDodVtVAPjoNs94t/elrYaz3JmSQnqHmMr5sBijmI7b+yyB0ynasm8tdddt6G19+V/c9T0/LMMPcsMRRPb64AWUJHmH893zwnFTk6i9BPRslo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhVkDl7O; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhVkDl7O"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3d118d8fa91so174820f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 10 Sep 2025 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501330; x=1758106130; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+N7hk82kSw/hD5RnH/Wdj/jHeKN7m/X8ltb3+xi6FX4=;
        b=RhVkDl7OmGT2GPs9zli47p0F7xr53zTqtg5YA0fV48u0akddi+E92cm62PIUFaudj8
         6QDzEJOlMQ4/kqYVVSVht/HWp6dkJjW7g/Y9p7UYEHdqMora8KkU+VcX8Y5jdnGvZIut
         6el9sxB8BVslaGpeySuJd2mTH4ciOUe0H8LYmzC9aX3slunGCD94VmkFYR8pQszrAwgF
         wvo5yj8sMgEH7OAF6/Oc3sjaVzieBUQCP8qn9XgSqVbdC+PgCOdBAP7CDN0e4CnRhqsc
         sh54ZCtiZm7jlPk49dkzp9OEw+VCPfoW0XLKDZ+vWjgYIxRLTBZEHxNXzbesynmlxzzg
         Q20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501330; x=1758106130;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+N7hk82kSw/hD5RnH/Wdj/jHeKN7m/X8ltb3+xi6FX4=;
        b=TicFLhXsHBnA47zLn94cgCgGONbNMGbGH9XnZUAieHtoGnSMSc0vGpK4KcR08gqZCJ
         41VWLFf3OlgTKyu6cY7YgykeyACJTYotX/8kwBsmw3NPpWWZ0tuOAekASMmh6XW0iR3z
         AEtRMvqhFB3g2o98fPqj9PPZWSM3VkpkIG5uLDWsV2IAC/rSlGUW3lbyHmT/gtPXEizQ
         8AAM54itjLEMU0/E55XCviTOSr6f8usnHmAK7nNmakBW7s9rhoiPpA90TijgOFF7SyBp
         m5wyFkSc0wkcK5z30W9Ot2/Q7j3WseWfekzkSQiDxQ5v3h24KZk80Hcez4c5s9Km/P6H
         nfbA==
X-Forwarded-Encrypted: i=1; AJvYcCWeArAbtyZ4fQi+PpOOVUjfV9WXVaaprZNc2TfmTuYG9cCvSAq6zs4lrWl95++FE52yW+x3WbH3yb089w07@lists.linux.dev
X-Gm-Message-State: AOJu0YwMcm1V7td9qGEsR+t0dS66EAXFqzjcpNnFhEGjmsaUvfYJWMgQ
	ys+fVeRbt3ZvEDDWLOHyIJTGgzXUSG3ng3Iy/8vE2SC/bWLNE9EhW/3B
X-Gm-Gg: ASbGncvqgtcbVvGKosSo9C0yfOdAh+7NBYVB70sIAK9YCrJoWopaIEKTabOdsAdr929
	C8xr5PUnxa2Xc8ezuq4KV4Zbhr5UPjz4EF0RPMQ6WXe88oX7f1zB7Bcfv1eCtKUTVVdJIN6KxdR
	Smec4cOIJx8YqG6vJzrNKaVKu99DNVz0ovBqBcFUpg3HZRGWQoza1P7plbmICJ/QTVRjM35+8cJ
	qROeCIXb2jg05kqBZOEEHfmfMd1jip/L3e3123evIf1erJrhE+L1Am/IYoirfYgbFLGFKofAP3y
	rplzaBPBfzNdRmqLWkzIfNvwVZUJMKJihmyJM9XbiE/DZDm6RVN/CTCwurWko+1GkRLx3/k35fS
	fjvVRbrrk+iMJTGs0f5Ca6bR2hcs7rznGllJpUTDdpPisQ37YIePBtPcMP3F4JmU=
X-Google-Smtp-Source: AGHT+IG5tS3kYUiCCRtnanVvpm0dBMkyeaNotcMroSTBo+RZ/HHESf9S7ra3pDeqhyi3AeZM8IcVgA==
X-Received: by 2002:a5d:5e92:0:b0:3e7:428f:d33 with SMTP id ffacd0b85a97d-3e7428f0fe6mr15632685f8f.16.1757501330343;
        Wed, 10 Sep 2025 03:48:50 -0700 (PDT)
Received: from [192.168.0.100] ([188.24.124.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca0e9sm6821205f8f.25.2025.09.10.03.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 03:48:49 -0700 (PDT)
Message-ID: <1b79e467-1d39-457f-a488-0f3eb9e14efc@gmail.com>
Date: Wed, 10 Sep 2025 13:48:29 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
 <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
 <aMEgNtjcy1-NuBds@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <aMEgNtjcy1-NuBds@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/10/25 9:52 AM, Sakari Ailus wrote:
> Hi Cosmin,
> 
> On Thu, Sep 04, 2025 at 10:52:09AM +0300, Cosmin Tanislav wrote:
>> Hi Sakari.
>>
>> I recently left Analog Devices but I will continue to try upstreaming
>> this driver. After the upstreaming is done we can switch the
>> maintainer status to someone else.
> 
> Ack, thank you.
> 
>>
>> Here's the output for the commands you asked, provided by my
>> ex-coworker. It's for MAX96716 + 2xMAX96717 + 2x IMX219.
>>
>> Do we need to fix anything based on the compliance tests?
> 
> Looking at the errors, it looks like some fixing is needed, possibly also
> on v4l2-compliance side.
> 

I'll take a closer look at the failures whenever I get the time.

> Regarding GMSL, are the image width, height or mbus code used for anything
> by the serialiser or deserialiser drivers?
> 

No, not really. All the information needed by the GMSL drivers is
provided through get_frame_desc() ops, and there's no fallback for the
data type, so the stream format is not involved at all, but as far as I
remember it's necessary to be set properly for the media pipeline to
pass validation.

