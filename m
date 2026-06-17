Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0483BB670
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 07:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680984; cv=none; b=N9Hn9kQZz0NIcNkaj/nlesPufqCqvgUPVo+GEJI4pfF3PR1GchXnepfttoosE/V9dtK2A0T5R9SVB5qQjqFw0F0WCoeZWMWS/XWnXaivr1mKZs46P1hAiJ0zC5B1oXNeiEgCMlSbXUFzz/Hal1+8CXQlzf4bKHasAF+UGKfNZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680984; c=relaxed/simple;
	bh=r8xBKlipwM2cVdr5+5sYdSIIXr1ecXhF0buFVvm84nk=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=fWbFWjENk2esaJb2dk1mWP9BioZAFvgDu5vJsaW7qZUhjeEB3l9h+6xxU5jwctk5s9Aro+XtEPj3aFY4Ow5aZbxzRDm5GapY23ihrND5f+LRH3Ii2B1osWdk3EIsj9iY4mOGLU30KFW0uqCBnM7j7v5sY3tYIELjEnM3AgYDgBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KhXCzTtU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KhXCzTtU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso68190695e9.2
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781680981; x=1782285781; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghmwQhSHkDAwTSRuYuaKDBBMN6CrvQZmZ4OsEVLYBP4=;
        b=KhXCzTtUIxCJe5YKOy9ynt9by+W9Sxb4igBZhHYph/s/nNwRF00G0sNkhSggUcsqgf
         Nuqfj8JfgQJ3BZnMqf98mezCKq1o6B5ipBLk+PTwmJonX/OG3VgiNQWzakbINE8Op3iS
         R101NZDa3qDrC2j1Vc0ltilIBOtjsdW2Rdz03VPDetecV9ypE4wPAt2FQ+yzPNgQo3NI
         xvRCA4aVuAkxHQH+BJ/mk+lD+C+kiFP1yvU5AL8D3jzm2rOYtzsh0V/RWSQVImXFV2V0
         3aeSwmhqW6fh6h6e8Pd4+4ZB60UVAZnxmI3QnGGhWFb8WlHqjajAFkDbaX6HXyOK5IZr
         I5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680981; x=1782285781;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghmwQhSHkDAwTSRuYuaKDBBMN6CrvQZmZ4OsEVLYBP4=;
        b=QHt98PbceHDPsk4hll0T3Jvhg6znRnr5C0WJBwq5CG1WN/vLg6Bf7JnoGeLf22Jzsq
         mc91ZlnMtGiIbfaLo83MvUYJSatcDdjl9VVLzaTr1RicSHG5cNjXOSmkKTAaRpv8sD12
         6EN1EDoNt7JPODnJZO8X1Cc9X4fQ4AQpYhWVXnvUFHfFiWMdQU5ehlD+LhGHZzZeoO+n
         1agbSca0yMOLXaXbc6IndjXIivO5kUJNlJIUFWcOUhWaJ4Q0oI9OsNorBeD/A0m0aEto
         ZTRG+gSc/PT5rs9bvPybXw/UkGdxfWiLdf0bXKUOnSPQ6ShywVexwTd5mQjYQxD/UBEU
         W6xA==
X-Forwarded-Encrypted: i=1; AFNElJ8wDlqtiZtu1PA0cs0xL9zT4IBRdbNUKk2tqaGOeyRmbVKx9m6a4xXO5sLbzm+p7KTdV95kWN30Q3EtQjUz@lists.linux.dev
X-Gm-Message-State: AOJu0YxjH80fRT4s9rICzX9K/M5qfsoy8yc9MKZYje3p84E1H285iAJD
	naW6vmyL7VlYIr/J6eHrem3Tg4I0IGE+2AOfmRF9390ucKyPvSiKIQjsJXE639zEx4o=
X-Gm-Gg: Acq92OFkib7sYomfx6Gj9we+dAUMu7XAr7bP9LtyJ1no3PFoQxvhtQUv3iIurVh8igk
	yMBLhN4PK8xmB8ErAn6Kyomt7bPupcGRZTmNeFfszsJOKdCPYDq4K7d6wL1f+r8kINeQzMs9RHB
	3jZjdErGv5z0bxzVeNyQyGQrulCZ6VfIsTIPACKYecovUI0omKzSBHTHifPDsTtH09uOw3tcel0
	QB5E1t1hD8gmosI1ozxIlaWmAJO8yTJysATpnyHUupOiGTVEy0qU4uAjiG+nbuzX0hKI7ZJtJWb
	YSBM2ceh+s3ieDBqIGxoICSuTNndW4Gw9pOaQkx/hy+jRz0aZE0zq/a9jKBZuom4S9L1TbniObx
	s5ulHqFKmkMzxo6qt9tl7pusFdVhDuyCqq6f1J5repVq0n3AVXhtPWrLrWD7k12gdVF8CJffcpq
	P5nN3qoCaTerG9
X-Received: by 2002:a05:600c:c08b:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-492333aa58cmr32166525e9.11.1781680981087;
        Wed, 17 Jun 2026 00:23:01 -0700 (PDT)
Received: from localhost ([2a01:11:8f11:bb70:dddc:c199:bb35:7cb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a0e9e4sm122794975e9.0.2026.06.17.00.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:23:00 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 08:22:59 +0100
Message-Id: <DJB572MYSBEV.137UP2YPA88PI@linaro.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>, "Johan Hovold" <johan@kernel.org>, "Alex Elder"
 <elder@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: power_supply: remove unnecessary
 parentheses in return
References: <20260615-greybus-power-supply-return-parens-v1-1-dcad9dabfe79.ref@yahoo.pl> <20260615-greybus-power-supply-return-parens-v1-1-dcad9dabfe79@yahoo.pl>
In-Reply-To: <20260615-greybus-power-supply-return-parens-v1-1-dcad9dabfe79@yahoo.pl>

Hi Tomasz,
Thanks for the patch.

On Mon Jun 15, 2026 at 1:13 PM WEST, Tomasz Unger wrote:

> return is not a function, so the parentheses around the returned
> expressions are not needed. Remove them to follow kernel coding
> style and silence checkpatch.pl RETURN_PARENTHESES warnings.
>
> Verified with checkpatch.pl - no errors or warnings.
> Compiled the power_supply object successfully.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>

LGTM,
Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

> ---
>  drivers/staging/greybus/power_supply.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/gre=
ybus/power_supply.c
> index 33b7a63979d6..44bd8a72fa50 100644
> --- a/drivers/staging/greybus/power_supply.c
> +++ b/drivers/staging/greybus/power_supply.c
> @@ -336,7 +336,7 @@ static int is_psy_prop_writeable(struct gb_power_supp=
ly *gbpsy,
> =20
>  static int is_prop_valint(enum power_supply_property psp)
>  {
> -	return ((psp < POWER_SUPPLY_PROP_MODEL_NAME) ? 1 : 0);
> +	return (psp < POWER_SUPPLY_PROP_MODEL_NAME) ? 1 : 0;
>  }
> =20
>  static void next_interval(struct gb_power_supply *gbpsy)
> @@ -423,7 +423,7 @@ static void check_changed(struct gb_power_supply *gbp=
sy,
>  static int total_props(struct gb_power_supply *gbpsy)
>  {
>  	/* this return the intval plus the strval properties */
> -	return (gbpsy->properties_count + gbpsy->properties_count_str);
> +	return gbpsy->properties_count + gbpsy->properties_count_str;
>  }
> =20
>  static void prop_append(struct gb_power_supply *gbpsy,
>
> ---
> base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
> change-id: 20260615-greybus-power-supply-return-parens-b3dd9f4a87c7
>
> Best regards,
> -- =20
> Tomasz Unger <tomasz.unger@yahoo.pl>



