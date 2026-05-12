Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E40A3A8740
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 20:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616460; cv=none; b=JELPQa+TtoDRA9h1DHw4hI9wM9GtVQBT+zC2VDEUMCdTKr7JkN5jR8MzuXBB2yfi+m5gITLUeNE6LwOwp5Pm+uvB6gZiI3n60OJi+nG5kGW9isyGNh4EV+hgZiOmYaWUldaZ7uGIdTT5Vr9TUveyeLZqeXq/IJEIxUuuBiyX0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616460; c=relaxed/simple;
	bh=K8No+YeWuFkZxveWkNDGdwNXEdXZViioPZHmyw0x7uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0+AQzYeYjeqBlMFAHnwDivAJa0wDrtqsH+OcwP0K2aEpbkSLzZMstMult54iqXz7KnOiiyCYU8M/+BghnJBshB0oZg67ckb0YkKi0kqmvKVaTVwU1tV1fir7AsufT8mCG2nZh6XLiIjlUFKY26FdhOA9EpdP5UULyNmkQ2FZQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=g/kr33Db; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="g/kr33Db"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50d75bfb259so40243461cf.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 13:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1778616457; x=1779221257; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ixm4A9b1aqS3/lbS+x6VLWagRbgpxDZK7p6coKIV70=;
        b=g/kr33DbCYUV49dzy5R9JoLrK1BIpAAJwS9RclXeMojprCjtDP92YB1myxJEQwKpdo
         6lGzJyMQBubgl1fQ7jPYEo9D+Iw1FwT1sSrVNT4xkqPK9N6wht1j9q1P1bL70OtLjUbk
         UzJgBHz3BVwfddLgIxvfVwALb3HHVxJoqhmfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778616457; x=1779221257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ixm4A9b1aqS3/lbS+x6VLWagRbgpxDZK7p6coKIV70=;
        b=JScXxRL3iebHznjXlALiM0nQf2farXU3Tfrjjgdw7MxoHgjY+fb3TzYhepDrgKO/te
         YzI2IyCdCpnOpctIyKue8Qc9JPUiKtltaPhi2pyz1Mfje9WxYn57l5xgwbxhUNKinKSx
         h959IfuF2Cf+tdXIbpDh3+Y9+P51lcc48GeYayOlC/oS2GR9E3KxRMiejlMCiTjzRXRV
         Zlj3FXQ+UHbspC30UDKxN+o4NjOxw8RHfVRNGjTr5zYySgO+qPawhyh0Nh2SxJ3LjX4P
         1l0UWoNkTAhnTqS0Ns8BiF69aeznvtVCQJjLBLDKd4l4F9T7MCMEgJQkbnWkiZVed46O
         AwZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cUJom6frMMoZUwM79DHABRBvJqPCMibh/w+8DfOhg2+jOVqQZerUvVVZG/hbnuXa3BQOKEJcaZ8N8/E72@lists.linux.dev
X-Gm-Message-State: AOJu0YxfiK3m/QHkGTgfGPt7y/+sMg9Hy0mNqfwpErfTGpPH/LZbkfVm
	Zyaan9GjvcSPElMp7FDmrJ1nQCRgPapQbIENknwMeZmcMhs1CR5xNzap0/65mYFvKQ==
X-Gm-Gg: Acq92OFW42M2PDkokxJpYildHrLAPnFZHk/MqvJE8rbLf4K5Yx0G28FaUpQwiK0jtYy
	ylwXuLwnTrnmNcwMWG1daBb3STg7fmV5c/YNm1jzC+LzSkgR8+z+ds6IYCuIyi8Za1LLE8t4Ouw
	ll4wuSxXpy2yZ4wBZDhasfObFuJCkGvVbf2ht18cg1rwd0aVoq09AZv+bTuHXTuCaThxy/pBlnl
	wFzjYqH3xrzKE9M1ljtkDL51ySV8YXvd8GFCMPSu2DwPXzkc2TycNnEscPwDPc5l8YC3db7N3LZ
	SRKmTsxVpD7OfafTLNu5p0E87iN3kuspCQG5Azrf4lUyvLkJDyErij35YzRl9iNF9hh5EFD0u7w
	FMHAIxFP34KzlErEXkljFkY1lqPLYzrS0bZwDQS/9//XvfKAxTD3pLFzQHdkUH+Pi5AwwWFe+SK
	vCukOneTvb38vCZLJ0aR6TcXdpc4+agNktTObjhhxI+lksAeJ3HpcBxZ/wTg==
X-Received: by 2002:a05:622a:114:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-5162f62ff6amr1586561cf.51.1778616456762;
        Tue, 12 May 2026 13:07:36 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-5148e82579fsm125729151cf.24.2026.05.12.13.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 13:07:36 -0700 (PDT)
Message-ID: <77358a41-b4cf-4c11-b751-86f024fd4b72@ieee.org>
Date: Tue, 12 May 2026 15:07:34 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: greybus: audio: correct sscanf() return value
 check
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, Vaibhav Agarwal
 <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pankaj Bharadiya <pankaj.bharadiya@gmail.com>
References: <c758029d-186f-4a9f-b953-90121f43d8d8@al2klimov.de>
 <agGdJFofiZYKqqhr@stanley.mountain>
 <c17dd24c-2bf1-4ef8-a8d3-79014a75242f@al2klimov.de>
 <2026051243-factual-lyricism-6c54@gregkh>
 <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <381ed71b-1db1-45d3-a9be-bf2f8018a611@al2klimov.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/12/26 2:15 PM, Alexander A. Klimov wrote:
> manager_sysfs_add_store() passes 6 pointers to sscanf(),
> but required latter to return 7 which always failed the operation.
> I corrected it to 6.
> 
> Fixes: 49b9137a6002 ("staging: greybus: audio: remove redundant slot 
> field")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   v2: added "Fixes:" to commit message
>   v3: added all these v2/v3 lines here as requested by Greg KH
>   v3: while on it, replaced title "Greybus audio protocols drivers:" ...
>   v3: ... with "staging: greybus: audio:"
> 
>   drivers/staging/greybus/audio_manager_sysfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/ 
> staging/greybus/audio_manager_sysfs.c
> index fcd518f954..ff323ca815 100644
> --- a/drivers/staging/greybus/audio_manager_sysfs.c
> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> @@ -23,7 +23,7 @@ static ssize_t manager_sysfs_add_store(struct kobject 
> *kobj,
>               desc.name, &desc.vid, &desc.pid, &desc.intf_id,
>               &desc.ip_devices, &desc.op_devices);
> 
> -    if (num != 7)
> +    if (num != 6)
>           return -EINVAL;
> 
>       num = gb_audio_manager_add(&desc);

