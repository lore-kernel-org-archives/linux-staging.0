Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C0315749A
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876761; cv=none; b=jthBovMVGFnsJqwLRfsrdP0aMeoDpe0bswK0hg5MP3/937Yo5+93DT5O6dg4dQXRCcGOFWvCOzPm+wxv/xkEXJmTv+kVupvlBqYEpFuzl5Qy60/qXlWn5GJzgI8Zd2Fz9dcspiU4CtQ3Jwx6WlWYEi+cTfrnBsPArLKnC/7mp6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876761; c=relaxed/simple;
	bh=D/sIXVXJLrF23RcnRezBLL+pH08yqfp+rpSoFKjbYc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxfFycpVHuR3uxNS8YtXW4Dpp5mnYXFcFziEkyso5S94ibJ1bn9LxhAGaWi4rIMykqA68FRfM0wzjZHUfrMIp6L3HeN5VBlj4L6twIP2C6lKaZhuRTvzJ3D7bmxI7LrNZCVpv2upeA2RWn6owlbAD4ZJcfCEn0evvfAQd1ahR5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRP9t5Ch; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRP9t5Ch"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a868831216cso837211166b.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 13:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724876758; x=1725481558; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSQ66ksgYS2uRo5g5Q03xMDNlqv/GGqsh0pkWtnsyz8=;
        b=lRP9t5ChcjRdfykinkcqBG/CsTHfr45c/EVnGnpgiY0s0hG+xH1SAj2Q/qmbM35iQu
         KF4F71jQKsMmaPCa2gHDWwDY6P+3jOQ5cAgrDNW124z3YQ0+AswLk97LMSe2jgvXUQRi
         QLgE+AgCDNOTrstZbmILdkENiDK5/mEPv5+f2UbL1H3L3iKCexnvXO0mqRvXSz4LcylH
         trAF97d4bI1pnm5E83+P5gzcgsE/l24A+QulE0jXSrvMnHMbp/QVno1NseUCFBFvNSrZ
         BnUSb7FPaDqk5i67RF2a+xqzbhfIyz1JnfMu6digQCaoI9ek19hsSuZ3svm8H02lEs9K
         B/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876758; x=1725481558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSQ66ksgYS2uRo5g5Q03xMDNlqv/GGqsh0pkWtnsyz8=;
        b=DAYlsYGHjdYarW6aXas8gLtEKw3khySRD/mZH+vRA27LD8cSHiaaEBJLK9ROPpjnZJ
         IuGtX97QXKlHvT8c6d1HTFvaB39UsI8umH1x7rMdt15T64BVEgbKctF8rj4dfLbjeFMZ
         9LpUbBVLPWW+1Vy7fYIVl0DzhdZ2Z+VomlZvOeInGw4lRZYDAjd4wKK9rqkul9OQCwea
         3x+yxqmSaOpQwBuW0ICva7i+MDwCitrmuNYLAbG+3r0JvNyut+jp9k4I28uONW2eGWYs
         XKz3U6psFG8zKQfQskBWmmiDcSJdKPV/nnGckI6QfMvGbGAZLjmKw18xei6aBdlYfK9H
         St6A==
X-Forwarded-Encrypted: i=1; AJvYcCWBKA55/O9E1FUGDF5bBC4mG13/+B8rHSGt7H4i4kdYF/HVvbh1BKcVD5IC3DzP3FJlp2BbPAnkWefQJ8v0@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyz0pg0UCYxWYYFhsRiSGzwzQ5xIJUcdDD4e2mFDFycWowh0rE
	i6bFP0rXMymTduJNuC2bMFTdX2KIiRsKa7q4sE/POVCWsQynq9yA
X-Google-Smtp-Source: AGHT+IG82KUcnRAXxO3dzLxKZyRHIC0IlpxkcChajNb3SBoIywPe9/Y4h3xjTPCg159NIQbxpHHPVw==
X-Received: by 2002:a17:907:31c4:b0:a86:80ef:4fe5 with SMTP id a640c23a62f3a-a897fa7444amr43780666b.47.1724876758121;
        Wed, 28 Aug 2024 13:25:58 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3? (p200300c78f2a85534dd47649c4c2f4e3.dip0.t-ipconnect.de. [2003:c7:8f2a:8553:4dd4:7649:c4c2:f4e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878562sm282869966b.156.2024.08.28.13.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 13:25:57 -0700 (PDT)
Message-ID: <5cbf98cf-9b1a-455e-afcd-b0cdfcf1aaec@gmail.com>
Date: Wed, 28 Aug 2024 22:25:56 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Staging: rtl8723bs: Rename function SelectChannel()
To: vivek t s <vivek6429.ts@gmail.com>, gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <Zs8WLkzoZe3Z0DYF@victor-IdeaPad-Gaming-3-16IAH7>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Zs8WLkzoZe3Z0DYF@victor-IdeaPad-Gaming-3-16IAH7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/24 14:21, vivek t s wrote:
> Rename SelectChannel() to r8723bs_select_channel() to avoid CamelCase
> warning from checkpatch.
> 
> Signed-off-by: vivek t s<vivek6429.ts@gmail.com>

Hi Vivek,

the description can be improved. Please always consider that checkpatch 
can be wrong. So checkpatch is not a justification.

I propose (feel free to improve):
Rename function SelectChannel() to r8723bs_select_channel() to avoid
CamelCase and to improve cleanliness of the global namespace.

Thanks for your support.

Bye Philipp
