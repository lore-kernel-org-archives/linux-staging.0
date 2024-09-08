Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8839E175D4C
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725827701; cv=none; b=LAyGvzdUxn5ZLdJHk+1sISglqEzABPEr7IUdCshTL/+fg0c9ca9zRFd2wRcPV6CRA3heKXU1SJ4BXJyaKizp00gXzYzZoxMQKLyaCacdEET1rCjrr5IuHfutA7L80NHBy2XheonwO7I7DjccJ5q9+SUN5TSdCqXzh0GX8f8cK+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725827701; c=relaxed/simple;
	bh=+pMLN04S56lAq85RIxX9RiClF8fhTbYZoEsWW028IxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrcUWfpZenR8ISzotjOhgBeOuJanTMAlW8clfvknsdFbQ0aM9vZWNZTQH9AWqzZJnFIAoe+DtC91Euwtet3VquPQdkYxHdP4KJ8zaX2CpDAARfVkID/D4K6uYnsjf9pzylwsk+TLO8Tkt9sF4IfVi56R/BVEpbKo7cLZATySSaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7orP3uO; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7orP3uO"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f75428b9f8so16206171fa.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725827698; x=1726432498; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwAgKG3MjNdWJJ46a6f9nMyHqkocgTVWsSRI47bgPvI=;
        b=f7orP3uO4mxSmWN8Dph3uYYC/TBVUcdldIJqgskwy56Bm6EQOCBrfjBmcbYnGtCt6N
         gnRpxWSb69x6/1y+1ifKqozagKA2q6NRnopLfXfyLdhr8FsxpXkgRsBU5kDwHCZGHEBe
         lpsK2KmMS1NjSXEioDkuwhrRhENz3Zn7cK523fz6AfnaCGkX87a/uEQV2ZeRJhojH4Fe
         0CFNlnokV3372GiJ1TNh0vjxXDGi4azSUycqWgCY6SrYY5jyd/eDpn54sxJQfpO343Qg
         Bv+FyvaQpthIFEBVupcxYRRWTJ2tm74eDfzW0buTcx38q3aM8OiOVYg39/6NA02UT9pM
         hYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725827698; x=1726432498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwAgKG3MjNdWJJ46a6f9nMyHqkocgTVWsSRI47bgPvI=;
        b=Gk+uLLUoRe70HMiirdEArfjkYTfULB6bUisliOWuVDZk2l5IiasTnsOwRY//+JN3VQ
         ZFO+WDcAWt++pTe8VlEL0Y7eeV5QlM1iK3LeiPOvpZL2tphlASrkTpOMvMQeqxHJrMi/
         +aBShy5GE4JaoiLHygaoPtz/mQ7wJDucBL4UuGjB+hkuWFG9dZQ4r2FqTt/yMfHB3cwl
         5xiM6dfLyGU1BZCuiMtKRf4jPGUpMsULFUhBX7F7LeQfyckon/rXzOgW+iNZ1D1J3oen
         Wg+rNG6N3y5ktAgiQlbWSIc2S5tUtqT1DR97BVzdIcGAvOn9H47gyg3WQKJSC/jMhXYT
         pQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCUXzBzKf81+TQKfHZSetRmZOSW8bPZ0CqinrYwNmS3xLpQs4rP7uQPNg1U2875wtb6qP+Ydc4qqDiV+gUp8@lists.linux.dev
X-Gm-Message-State: AOJu0YwWFCq+TqYjRpgbdR9PiP35UOgv5d5hWPCNpRNFnhvAUGG2GNDd
	dXNxDtqyEQLJhF8afR4Q2cHJyPEUgicR3Nev4MRQzmRHkvI/fqWE
X-Google-Smtp-Source: AGHT+IHdu8DeRAFkv5dqkoi3zd2OuN0xB+xEPifmnIJZZ1OhX+mQue/HtypaNmzl1gSCxIYcLgOmOg==
X-Received: by 2002:a2e:750:0:b0:2f6:4a89:9afa with SMTP id 38308e7fff4ca-2f75a992205mr36381251fa.22.1725827697172;
        Sun, 08 Sep 2024 13:34:57 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8576:4416:5fef:fc17:c89e? (p200300c78f2a857644165feffc17c89e.dip0.t-ipconnect.de. [2003:c7:8f2a:8576:4416:5fef:fc17:c89e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d3eef7sm245296666b.192.2024.09.08.13.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Sep 2024 13:34:56 -0700 (PDT)
Message-ID: <ca1908f3-74aa-45e7-a389-3995aba2660c@gmail.com>
Date: Sun, 8 Sep 2024 22:34:56 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: Fix tabs for indent and + in comment
 blocks
To: Sayyad Abid <sayyad.abid16@gmail.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240908180902.3196764-1-sayyad.abid16@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240908180902.3196764-1-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/24 20:09, Sayyad Abid wrote:
> This patch fixes the use of space instead of tabs,
> removes trailing space and adds "+" each line in a comment block.
> 
> Signed-off-by: Sayyad Abid<sayyad.abid16@gmail.com>
> ---

Hi Sayyad,

please apply previous send emails to this patch as well.

Thanks for your support.

Bye Philipp
