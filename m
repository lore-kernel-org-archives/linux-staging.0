Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8522C26CE3E
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781670; cv=none; b=O2fBW33zKpr4+28NrK7HdxSOiQ+s+IidYO+UgiA9NJbdoGRMYi6M/yeZfv2cX68kiKb8VV9D9kvHLsyUeTbcQ+fcUQYrzVwEjEGh/pB6UtQhC1raRiL51kn4ZUOfi0vRrAr0/1Xym6quGQAhC3+iWASU1sGEn2CDPBfsI0KgY1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781670; c=relaxed/simple;
	bh=hMxQT9ivNs17wMcJ69YhVe7QBLHdoqcHGTcyWV1LUM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q7HMFFr5p8XnrfXq8a1M/WQKV8m4ApC/cSoTY8zXy3HowhMSe1XQvMIL5mNs4rxvU15ccBhrJLEvdvbl7KJx8m6MVxlVgLxWGHfpyYYjofpC8XCOJkyKfp26wD3KcNljggU3noQWtA/oPapDj4ggKunDgcA0aI3/fEH3CrqStgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buKGQndG; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buKGQndG"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad891bb0957so110204466b.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781667; x=1751386467; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2hJc4hUnpKA+D5XoufJNAk6lZn4GYmwTvIaYpB/Ywo=;
        b=buKGQndGQs/eFGYc5cNhs3HbTn0gH+KIa6Eay5QLHtfN0j7FhsloqwpZgAbGDipfYV
         C/5M0q9YTAE1jD3bIQ/RXo0gW04Lu3hUsBDUxA1LDA4lGTuucY9yskAsy8RjZia6u9i0
         7bwbjWcTkQLV7B5Gp1fgSMVFmtIju3hf8ltOY1j/MiYQERGOJTc6fWnPsG9O26lkEOYO
         DU1zroRYDwZlH2zJdqv8PUBwF6zkY8fYFwaoMNjQzx1EWYVUDXRs4kj5qapTc+UZ4PnU
         ia6wpK5XsAhxkFMytNkTrMzx6OK+tbBTJbVAoW9I2xTa19JGlJPa8Tg8rlWk12kgK1sS
         22PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781667; x=1751386467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hJc4hUnpKA+D5XoufJNAk6lZn4GYmwTvIaYpB/Ywo=;
        b=s8e9fslEQKtRWyHtWFSaUYLKUr1vNIu8OguG4lg+NKht5jCTRJGJMJzw2RZzkBM/QL
         0jR8l8om+XEDMtnrz6bcQZ031KuzzAhbQWQFDXpQEz97xxGFcbBEVcEP/vYcCwLCiwl1
         6p5iwCYpAHyzO1dDEZ1g5l6B6yNrJV5ZcoQJjA3owgRkLp5VIgDE+Vpa67vpqt4Uw1bF
         ErmuoJGLe1TPmi+ofQVbd6rTpo5unmocUCIjw1Ba3XwWSJlr0/ygdBLwQKbnVM+Y5SaP
         Q+ySNXUt6dx3eoOHA6tHRiZgSdGScwgZni9CF99tefLDGmwR7n06TPg5HLmyEZoWn+vE
         2TAg==
X-Forwarded-Encrypted: i=1; AJvYcCWveKMWZY26g0FzAfb5rnYGF5DDXrUrsaGZLOAc9d/Y6CXvXH22fGkl6wOf+TYpgvOjZq0YVLbwjjrIcQRm@lists.linux.dev
X-Gm-Message-State: AOJu0YznCVdaq5nsQBBPOUaK0NHu1f0KxES/b/rqyYpBeqq4iL/xwJxw
	ctlKrU4myUtjnhgGISi9hfuNOJy6Qtx/WR6TxmCBQIHwHX8MMrM4Z7Bd
X-Gm-Gg: ASbGncsbyj4XE05CB/qehj9iTer6F2XJo9lzhJQGpOjoH81lOC932j/XTa9c1972myp
	ELnLzI+Fgj40H68PI4rI4Ce1ZTfweOA6ZYkgHn6Vv9mAX5u32UEYKr1PIOOJqR6XfOyT7h57ZYv
	UIP7PFI5mwaVDpudpQzMjNX45aChgmZ3iDtxyR20oDT3qPB7Kctr96KV+j1xAO2YQe3GFesP5pU
	+bKIvRG3YTVEBEdNBCMrmwqJuqntyidMkrgexKvUA6tySacILGK2r7JltMVeE1yuNMQGJuVTTsO
	fxrVc8x9dbZyKo51TTfJhHC7erjeOPSW5hKmRq2EMz6N6FCNEAT9hGCeu5sezOgTSINJgZit9ng
	ycQ7mSe1IwtAidVqsO0D9LxseRJOc/1Danp8=
X-Google-Smtp-Source: AGHT+IETVYqdcYw9iMsIySmRYZrHTjx3OIsh3aRt5hqLHb7AOMHCIRNujIA0merX9VFaG5IGMjGEsw==
X-Received: by 2002:a17:907:d70b:b0:ae0:b06d:1fb1 with SMTP id a640c23a62f3a-ae0b06d2370mr278552966b.37.1750781666584;
        Tue, 24 Jun 2025 09:14:26 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:9227:164e:14d5:9967? ([2a02:8109:8617:d700:9227:164e:14d5:9967])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7c6fdsm888167166b.3.2025.06.24.09.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:14:26 -0700 (PDT)
Message-ID: <49977010-65a5-4ad7-b86d-5e779d0de3de@gmail.com>
Date: Tue, 24 Jun 2025 18:14:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/19] dt-bindings: media: i2c: max96717: add support
 for MAX96793
To: Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open "list:GPIO"
 "SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)"
 <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-7-demonsingur@gmail.com>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <20250618095858.2145209-7-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Cosmin,

I'm preparing a test with Alvium + max96717 + max96716. I can't see away 
to overwrite cfg settings to force pixel mode or tunnel mode. Any plans 
to add this? Sometimes it is required to force the other mode than set 
by pin-strapping.

BR Martin

On 6/18/25 11:58, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
> 
> Document this compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index ab46a5f0bd7e..23f611177a87 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -30,6 +30,8 @@ description:
>   
>     MAX9295A only supports pixel mode.
>   
> +  MAX96793 also supports GMSL3 mode.
> +
>   properties:
>     compatible:
>       oneOf:
> @@ -39,6 +41,7 @@ properties:
>         - items:
>             - enum:
>                 - maxim,max96717
> +              - maxim,max96793
>             - const: maxim,max96717f
>   
>     '#gpio-cells':

