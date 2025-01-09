Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A2B677
	for <linux-staging@lists.linux.dev>; Thu,  9 Jan 2025 20:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736454710; cv=none; b=hiWIE5cjxfG5lx/8myLKY2X0LZbuW7AgXo7SajrGJx/iaJ4zEtcrZHWTZ6UH0jPkC7xZDNHtSn1eWmjNcjgyHiF92ZwhpWj1MhUfXoEixBlxNQp473+dFIOBNbST3Pu2/IOMefLT0PeCoaI2SBKdH0MmN2d2mQIFMAiyo8hKqWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736454710; c=relaxed/simple;
	bh=etUBxo5+i7Ntru7W7mp5L0sNrWKdmq276r1x0ydDQZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/ptwXRBMVeVRHUP1e1h9SaAdtPEVCQqavv/pfA6pqukIdqo29QFAPWGEBYxk5hR/kf+pqVPtdnxVz79wEI+PcNSU5Tn4/k2Xrlpirxbbn3p08pIpEmq11G8BOMTCsyO4we2ltA5oFWS1NBN0p0I+4895RBMi4HnrYVYkPKrTNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVpl3+L6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVpl3+L6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so4665440a12.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Jan 2025 12:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736454707; x=1737059507; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sMLmBFdKXr6O2VJSKZgjLv+7WE4xdpEWDGJg85jA9sw=;
        b=EVpl3+L68diu2qgJRHIYHEujREjb/zw77YOre9I/b9XQdF5rzwoo0FlpxMpDQt2zdR
         S++kPyjQuhThSMHfcR7SZo579mc0gBDYz90xYQgabqPQM4yy/r39NbWIKsJwwTo2mO0u
         /Hmwd4DsAF+Jf7NoW+gvzqHr6CplZyU0VpwY1ZN0ZXCen2Hoe/YL/zQdWEcsS9pQbZqA
         nU7pi7E6FSbtAk3XXopjlNzcr3DBicvvHdqD1Er2JQXuD10bWs3p8Kj9/4ViPutPTnhG
         Zijs0OJGJ7mAUrJlbdVvpyJRSWFbyFy3BwJ9iIjBA7sCY5RckOlbsC3KN8PUEYibvv/w
         0+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736454707; x=1737059507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMLmBFdKXr6O2VJSKZgjLv+7WE4xdpEWDGJg85jA9sw=;
        b=H//VJZ5j0cis+GkzwnXIK24mK4APbziQnZoKIUrkqSQf1KRuWnRwaNyv++y3rhQ4Uk
         YgteIYbkHZOGPbF+W6lTVLiRhMtC8Db7zxwzQMwBX3sqS3lsGhuF1lvSXvYRfAj5ogrx
         1Uud/A1EfexR1XBMSsa3xIPD0NX4A9GKWzQOx4ag9vZB4OSdgWalRuHY2fnHz//S2aY1
         7tztMB0+5FSxUH6nRhgsrcP4rWk4iq+Y4fq1vIRnB9mA/VYKqo7VITh6uRztgSaZgL1F
         tmWR6d7v6Vekb+4MWdijgpE3oMnlFSrq1Cm3CtE0vy4Z3hzMq2dN6CGftbgVA0aZroDP
         ZM1w==
X-Forwarded-Encrypted: i=1; AJvYcCVCCfz4fNy6MtAvJ4048MGq7obkbJihCLsoo+ltmd/0tFYArgaIkS48exZEusdX/7Bwbl9ttpvJJA1c9Wuq@lists.linux.dev
X-Gm-Message-State: AOJu0Yx73kFk3bYTF/yTrtEWMh0EjLAOol6p0j79S1RIaXJAl9D7IMQN
	sC1LoeXC48/rfpIm+iV3VEB3J1lgJqRI+t5G+n9uPGQ0MIQwOVuW
X-Gm-Gg: ASbGncuYl3u4rHNsr+cTyVa9lgU9f9v+GT/VUDhLc3sleKtPKRjSv5RNzkDtYS3kZlK
	8kOrGGw5yCbZwrx4tKHfAR21S/aM6XjMV2+LwLT+BRhoIrbJ8OP2igoU9QY7fJZ1pQXq47gpU8j
	GUNzFTTWpBLCOaRZMTaLimUh76iBvMTVIqAxD8eza9J2BMEG7CFraYnuSCFSNqBzv+yIBGALJtB
	jRrOb3jKn2tJV2H3naUG8bLKbXXuOpShuXAJ35xyErn6cIWhUtBghcYI1FRsTNv9D5TUhvxTX9Q
	TN7riwASbRUvkvPC0+X6zATJuhQ=
X-Google-Smtp-Source: AGHT+IHwrvuL2t3A/OxtGS74BFib921IN14mkcDrPBqmiRtu7wicK1Ita9wCmPD+9M0ILx50ouviYw==
X-Received: by 2002:a17:907:72d5:b0:aab:ef03:6d46 with SMTP id a640c23a62f3a-ab2c3c63f95mr419873166b.4.1736454707282;
        Thu, 09 Jan 2025 12:31:47 -0800 (PST)
Received: from [192.168.2.105] (p57935577.dip0.t-ipconnect.de. [87.147.85.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm104814766b.10.2025.01.09.12.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 12:31:46 -0800 (PST)
Message-ID: <095113fe-e636-4eaf-845e-b48a57eae7a8@gmail.com>
Date: Thu, 9 Jan 2025 21:31:46 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: Remove ioctl interface
To: Yeking@Red54.com, linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Justin Stitt <justinstitt@google.com>,
 Johannes Berg <johannes.berg@intel.com>, linux-kernel@vger.kernel.org
References: <tencent_E4A835D41FF1F35C7BDFCF4EA0136D548F06@qq.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <tencent_E4A835D41FF1F35C7BDFCF4EA0136D548F06@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.01.25 14:20, Yeking@Red54.com wrote:
> From: 谢致邦 (XIE Zhibang)<Yeking@Red54.com>
> 
> Wireless drivers should not use the ioctl interface, so remove this
> interface for the rtl8723bs driver. (found by code inspection)
> 
> Fixes: 8bfb36766064 ("wireless: wext: remove ndo_do_ioctl fallback")
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: 谢致邦 (XIE Zhibang)<Yeking@Red54.com>
> ---

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
