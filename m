Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC82FFF8D
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770284879; cv=none; b=QmXsGU/XRnn0NPfKZSkcYiCTi2RXnLpNArIo2SPwo6kypEdv7iVsoiGtBMc6pHaaJaez50iBnQCkHTvV5igbzo3AUk7oXfT9KOtfESa7BRTHC56GY7Zy0gkrZQTGAeveh7PzriKfN4Hwa8Ss5ZrlEP6dKkrSmouJg3HIcK+RWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770284879; c=relaxed/simple;
	bh=iTPRLWCrtwEnPiBKOwDCIY1yQgs7QyjSJqN+DML3kvA=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:
	 References:In-Reply-To; b=c5UfyEwiQs0xFg8VI+1xKVIhY9+k5JyzBx+schFZEgKe0bmYPun6QthMgtw/FFEy+zMtNyqNOvnuE62paPYibjlyduTHCIQRe6y9/cQrzAj3PHAzKoGSk9WbRHAQG46Rf+RAU32SLkF3WIfa1lRWvaPGn+nMslhnnHkp+D7tbZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dcuiIXRI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dcuiIXRI"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so90934166b.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 01:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770284877; x=1770889677; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8L/5GVKN6SgP0V716Hd0o1e71oyUMMXvmVf3IuUxkA=;
        b=dcuiIXRIwtnd/RKCpPLTmB9E7FHeBx3TKcy7fq+y2vVlve3t1rWdLvyNzM8exVsI50
         GinZKOP4+B3RldMZ30bBmDiOhsfr6aEJQGRZuAFlLVA49/rBKPRVd77d9pzho4gtd9Qz
         2wXFnHH8kiZ19bZQ2LWrtb809uKSp7o9gpvdWtYrqXWadfBUcbQgizIIhXniNwgIHAeS
         CxS6UqPwf5h85G5q6LDDl16niX1gQMfubWgzIfAa4RZaQUCesJLn1NN/+EtdO/AwktkQ
         VvsP9HxuheFaZ3FUgC9co2KLHI1bNYGwUvOY8JZfphYGJP6OiPsjJIuCuqcgA839S0ki
         xJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770284877; x=1770889677;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8L/5GVKN6SgP0V716Hd0o1e71oyUMMXvmVf3IuUxkA=;
        b=Zl6I1WU44SY0UWD7Gpi5iD+tNAZGAs3/SWjgslKbPfcRI/oIsjXz9sHGnLsQZQwURp
         mTSMqrifsx6qqxqFz8stc9zL4MpR5m4sW/OFeNmyNXnpwaP8uUYPaOCDG2rhA+oQJcXG
         VW7g5pozhDvI4jaTi6lOixw8ixDGe5s7Su9UBsnZXtOfwCrJWs0hRnA3PjmuFcBLwVEH
         NdTAF1vb2xs+7ptsR92I0eHbA2c+30B/wB3eIyfBynXX8kUnC8be7Ckua8EaG5ivimza
         FQxWeLkVJFp0DsIjf1l6C33zWOe9ENwzAfO1AH4lwlHy3KXafbrmWOqcXGm+gNMXY811
         S4+g==
X-Forwarded-Encrypted: i=1; AJvYcCVbgl8IJv5gihI5syjSuiYwpyF9H49Zuq9dAybG4WFBnmH/+jSCTbISlKdnV9yT7PP1AZ0wAlFUv3Q+W2Hn@lists.linux.dev
X-Gm-Message-State: AOJu0YzqZpiZxAv7fDx6cY/xvIcWfnc6kp9rzBHPOtOWJ+662wBwUz9k
	xgaH6C5KdVfVYd98r82pqUzg+PzW1/qea7M+FRLmoW83fEuc3h+E71dCWY4TWjL1Gek=
X-Gm-Gg: AZuq6aI9e0iN+pX6jObMfadco+EXC6zuxS5u1sznd2n6Ps7cW19HAKwb7/koSstuTx7
	nUhox3tmSw0odpIKhYBs2Ad8uTA8Gw8KlQaKCeq8+6gvLYqUc0Z0MdvHRYPYiYf8tqVAcNT5t3W
	wgohcpuWKLtE9YfyIY69EAhDYMXU2YUoudgSeO3ZQ3rRkx/wcLHS/NY9Gi+/LEkfwTcOMd3wo+J
	MNP+MIOkINQEimTizY3iGBPSGCTPGEHeamQbhUGPWGQep/1fOukTLu9l6DnLrUueBEmiKUGbJts
	3ks6A+DvAb6TT5AgauFmnhM6cYd0ayXSjlZ3nKtKfHjGKEl/0J7T1z3/VgGORnII6rjVjv8igwS
	v7vwGdOZWE3chdJKihFzjqinLot1PdoHKRSwlaICfXNVyCeubsvJgD+bz5JH6LUKRZhGEExah82
	orp3uT/GeWbbgivgvPsJAUQbzgMPkBlJoa1Ax94zE=
X-Received: by 2002:a17:907:3ea8:b0:b83:1327:920d with SMTP id a640c23a62f3a-b8e9ec9179dmr398904666b.0.1770284876852;
        Thu, 05 Feb 2026 01:47:56 -0800 (PST)
Received: from localhost (a109-49-32-132.cpe.netcabo.pt. [109.49.32.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea00435fdsm202409366b.57.2026.02.05.01.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:47:56 -0800 (PST)
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
Date: Thu, 05 Feb 2026 09:47:55 +0000
Message-Id: <DG6XM4KTQQBU.3257ITEZ9ZF19@linaro.com>
To: "Rachit Dhar" <rchtdhr@gmail.com>, "Rui Miguel Silva" <rmfrfs@gmail.com>
Cc: "Johan Hovold" <johan@kernel.org>, "Alex Elder" <elder@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] staging: greybus: resolved checkpatch checks for
 light.c
References: <20260204183142.182785-1-rchtdhr@gmail.com>
In-Reply-To: <20260204183142.182785-1-rchtdhr@gmail.com>

Hey Rachit,
Thanks for the patch. And the sending corrections along the path.

On Wed Feb 4, 2026 at 6:31 PM WET, Rachit Dhar wrote:

> Added comment to mutex declarations, to resolve checkpatch.pl checks.
>
> Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
> ---
>  drivers/staging/greybus/light.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/li=
ght.c
> index e509fdc715db..1f2faa6d545d 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -37,7 +37,7 @@ struct gb_channel {
>  	bool				releasing;
>  	bool				strobe_state;
>  	bool				active;
> -	struct mutex			lock;
> +	struct mutex			lock; /* protects gb_channel->active */
>  };
> =20
>  struct gb_light {
> @@ -59,7 +59,7 @@ struct gb_lights {
>  	struct gb_connection	*connection;
>  	u8			lights_count;
>  	struct gb_light		*lights;
> -	struct mutex		lights_lock;
> +	struct mutex		lights_lock; /* protects gb_lights->lights */
>  };
> =20


This LGTM.

Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

>  static void gb_lights_channel_free(struct gb_channel *channel);
> --=20
> 2.43.0



