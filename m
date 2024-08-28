Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5A15B137
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 21:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724880722; cv=none; b=sUA6tsHQetTm8yryZTRpIhGU89BbLjb9+LseTzgM8hp21r+pr31+Bl8SNWS2rmAWp2yWFUv+cIkR9PHVFUSF5b1rtzQa/60vMH6iCjKfPIFbZ5Pt0E4fnWLgi0s3DIn5Ldw2GqvF1txSd7ByicJ5wBQ3oIk/tV2SBYUIBJgkH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724880722; c=relaxed/simple;
	bh=H4R9g6Iobfj4JMDyL6DwUQKuQNgFMCfVlAO9tUYyKNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lDfVlSxk3v+/nwWheBBgoq2HuxgsO9XHuDfIdZLktaLIW1T5LNFR+XL2sHQU23VQnoJ+6p8Tmd5ebi493BWXV7dZZ/9i0p768lAMjMsffRR+AFSEsRThaVVBRd04AlRocdyDi1VpDH2fJOdJ8vYHTdmuv3s7OZbptvlsgp7F0vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKTTwREG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKTTwREG"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d3da6d3f22so5565656a91.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 14:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724880720; x=1725485520; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nx9DjwCsGCZUKpWJ/hQpc5jk2i3rFky4eqc82yPK8nw=;
        b=mKTTwREGSjgsk0FacnhQYV5dW9XXzDjxf1pXlp7YFEMnb/H3hkbq8chUSXJ/Muj4q/
         vTNUcgY7TKiY6vTYOHhrsK2lcgTz0QzQ2NGCHELbuZFyuytsEXuUBjhHQTMKTMU6v650
         J1Un3ivBAPF9dbCg1PEmcY9LHNha9hTpmj4aYFJ9mib9ViL1OFVyQ14vJ9PB0Y839tW8
         9pmHxjfoYIVvuKE4pyv1y5hnkBSrp0ihwXXKxzoazfOCUtHOc1KkSlzCQ6VQVdve5ok/
         q9jKZekH+SwAE3jigXXp0uD1k3sndrLzejJfmW9pZHhBKSD2PlyE6MMeQ2UfWAoE/OzT
         ZfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724880720; x=1725485520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nx9DjwCsGCZUKpWJ/hQpc5jk2i3rFky4eqc82yPK8nw=;
        b=enfr/4fw8SdmDU7pu5iLF21P0+j7IT9YVfU/hrzy/uUVZWo2z/PAQW5Ej02GSWwiXT
         9Ha83qoEsyIhgPG0gXwD4cOSKqu+AKvvpuRGibJsDSK3cIsCrwys4SmxVx2XHfXI2CEN
         1tJ95N4tAPmhUB4nB4rmknxcdFQarL5t4l4qRu5tjWwYAWY1uUmUIn+3ubLyhfJNG/ht
         hyMv3MQcI/5lQ0oZwkGwQ2jfjxHoN0ZD4pMjWAVsA654G7WCSIYk0F1PzvVEJQYZa1qz
         MH240DCqMK3puyTgS27BeTP55zKAz4JIi2laaKS8KLM4unGPyMRqEU+KiF2+WL64RDVH
         qBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyIdeyvPrphjVJIviyLoCBjOxJmKkcg50MkiURKRYgC/4BmG/LC4ITCj/V9SIZ3t8WvkZYi7szyfWKuQy+@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6In4Dzv6tn2NDoRh/dCD6aghk52+xO89mMrwHWLWe7nXctNwG
	b9z93U0/CV1c3AwNwqBTvwuUPZT+q1Tkpm3fbowd1jqh813+M55F
X-Google-Smtp-Source: AGHT+IEUTuWqeUtytVipyREn1IN3doQxNyucABAMY7DF81UlttGz+n/UxEI4ZZ5V6EYemIb/0ryCLw==
X-Received: by 2002:a17:90b:4b01:b0:2d3:ce8d:f7f1 with SMTP id 98e67ed59e1d1-2d8561c7556mr732745a91.25.1724880720492;
        Wed, 28 Aug 2024 14:32:00 -0700 (PDT)
Received: from [192.168.79.27] ([49.207.54.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d84465527bsm2423042a91.48.2024.08.28.14.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 14:32:00 -0700 (PDT)
Message-ID: <15c72a61-9592-4427-8e71-e662e4a1d205@gmail.com>
Date: Thu, 29 Aug 2024 03:01:57 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] staging: rtl8712: Calculate size from pointer
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240828204552.26790-2-masingh.linux@gmail.com>
 <20240828204552.26790-4-masingh.linux@gmail.com>
 <bbd42daa-319e-4390-99ac-7bf874fd0007@gmail.com>
Content-Language: en-US
From: Manisha Singh <masingh.linux@gmail.com>
In-Reply-To: <bbd42daa-319e-4390-99ac-7bf874fd0007@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/29/24 02:45, Philipp Hortmann wrote:
> On 8/28/24 22:45, Manisha Singh wrote:
>> Calculate the size from the pointer instead of struct
>>
> Hi Manisha,
>
> the first line of the description is good. Please just add the why (to 
> adhere to kernel coding style?) and the "." to make it a full sentence.
>
> Omit the next two lines.
>> CHECK: Prefer kmalloc(sizeof(*pintf_hdl->pintfpriv)...) over
>> kmalloc(sizeof(struct intf_priv)...)
>>
>
> Thanks for your support.
>
> Bye Philipp
>
Sure, will do that.

Thanks for reviewing.

Manisha

