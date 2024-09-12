Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE7186E46
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726169348; cv=none; b=uxqEO9c3GbAJRD/P5A9bbKl+yRZJaoMRXl9EVhS87a1rd95RoVbsiKi/Nrfqb9/ONFXA1pNOAwMbANAq/u/NZnmHZT++e34V/y2ITRjg9MzT0eak+2epgIy6ZnnjACEqkjdu+TNKaWeHEHAzGsstoKBP9t9uBUQATsdu8Vyan78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726169348; c=relaxed/simple;
	bh=mY8kmFlJmauWSs4RBZciRQXsogkFRL/xcmlYJazACdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UURa++q0fFl7abDROkKzx91LuOJC5MnycQRLmdlGDjEb5QS7uTszcAaVxO/L2J8u1NzBRps2K4GzvVIjG/1pjoMiwCpGHsaUXSIKVfuqZljUq9WeJ6R3s/ZjuqhqrDzZsqkrwJliyctUJsHnDZYal5eE/qtMeoio2U8/XF8702g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAakLwDe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAakLwDe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so12033305e9.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 12:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726169345; x=1726774145; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLazog7s8K1rTrWlaTrxf9Z8RgSArRCMR7o9K2wdNHQ=;
        b=IAakLwDevpehbNTeMJFuTYUZK5QO8UJJsKGMUh9U3AOKIvg9uACiko+hZaNSgbEFvU
         2jnpgo9xlX6xnPwMDE9SD1EhQvXVs5AXyEonZBgpzkU4KHnvFdijPXdVQjMW5cTdOEQ0
         +ZbW99mWKg3TwaMtRVAieyYv/UiZiOgVTWGEvt9zfqBGFW1s1v6fVCbwFJMA2f6qklgW
         6OWZMoPoBd9Bt5GPd5qA9FvN/L8Xwu47FZIjVlpEKxaJCSVl287iOc+grbt0ePSfCC7g
         UKwpZW/Um4ZOsAwLrOy/OLCAHtyjUBQO1TTphDs6Mo1AdGZ1JJ9sPgBTySBidTCBaWmU
         GvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726169345; x=1726774145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLazog7s8K1rTrWlaTrxf9Z8RgSArRCMR7o9K2wdNHQ=;
        b=b3ekZgwbFOVnCMf9WjnQn89rGMqfJ8YAbbAZOQBUF+kcl9BM60es2b6IZJrlswM2G2
         dWF/6HHv+vHMbId0wNy3juvp+/hrsFQ5O6dhVrkbq6tmfn7nhi7D7sO+NjYPY3DIkODD
         yPuUTyz+oXCQYTOY1npC9+aa55qdMUIQPmEMS3ofPxoPcv3dRMV2yIzcru8/KH/Hk9eE
         9tflvhLdL6HrtPyjUaP4ohtZdMJpMrrDz427iTwdWqZwSb1ENWd4OulnBJWxaaoysvVw
         amZgETXTbS4V3WmBebtyYFBldWf5kGrsXli0t1DQvSpmrnHIY4xbYifU9+xmHXXk/Lb2
         7ZEg==
X-Gm-Message-State: AOJu0Yxq+2+Of2e8Tr93OhPoTztPTlBsCnyIcDTa24O/TtP/6xdTEWjT
	0bKnacYJZWMm2cY9R92gfcTNztkFIWs2xH5lj55PHEXPYsFM7HSc
X-Google-Smtp-Source: AGHT+IHGmmw9ddltXtCOaDOAvfUtOh/3b7g5A5OOuBz883Lm7wj/eh6DdPBaE0Yqlwi6rckUTlFllQ==
X-Received: by 2002:a05:6000:c86:b0:374:b3a3:3f83 with SMTP id ffacd0b85a97d-378c2d617cemr2256594f8f.53.1726169344445;
        Thu, 12 Sep 2024 12:29:04 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8557:476b:8cfa:99ee:514e? (p200300c78f2a8557476b8cfa99ee514e.dip0.t-ipconnect.de. [2003:c7:8f2a:8557:476b:8cfa:99ee:514e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424dasm6917806a12.9.2024.09.12.12.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 12:29:04 -0700 (PDT)
Message-ID: <f4e58090-0229-4a72-9bb6-d57757eb708c@gmail.com>
Date: Thu, 12 Sep 2024 21:29:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vt6655: mac.h: Fix possible precedence issue in
 macros
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240911180149.14474-1-dominik.karol.piatkowski@protonmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240911180149.14474-1-dominik.karol.piatkowski@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/24 20:02, Dominik Karol Piątkowski wrote:
> It is safer to put macro arguments in parentheses. This way, accidental
> operator precedence issues can be avoided.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@protonmail.com>
> ---
>   drivers/staging/vt6655/mac.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
> index acf931c3f5fd..a33af2852227 100644
> --- a/drivers/staging/vt6655/mac.h
> +++ b/drivers/staging/vt6655/mac.h
> @@ -537,9 +537,9 @@
>   
>   /*---------------------  Export Macros ------------------------------*/
>   
> -#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, iobase + MAC_REG_PAGE1SEL)
> +#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, (iobase) + MAC_REG_PAGE1SEL)
>   
> -#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, iobase + MAC_REG_PAGE1SEL)
> +#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, (iobase) + MAC_REG_PAGE1SEL)
>   
>   #define MAKEWORD(lb, hb) \
>   	((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned char)(hb))) << 8)))


Hi Dominik,

git shows your name with the following characters:

Author: Dominik Karol Pi^Etkowski <dominik.karol.piatkowski@protonmail.com>

I think it is better to change your name to only english letters.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
