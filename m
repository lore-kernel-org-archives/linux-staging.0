Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79032E128
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548595; cv=none; b=OJAeFJWrPZ4WIhXhdVuGYAxmW46mtPTfv6sz9dyDb5n74F37X0QSQu6eNvSwpl2murUdQA6Zy8SkBeIBTNUuCBj3rHjqAopkOoPyb5m+wrdLxS85ceo/knjslSJJc4ATKcb2rhL0j82ywDLjaZSVjpl/19usBfEWHotgcTcTfgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548595; c=relaxed/simple;
	bh=KyxxPTeljQL4s/4n5F5qCkKxPIqZn+/VANAG7vn3xpE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=otbDO0zF8TkmxUVRP+EoMaD93/WBcwgazgLEaR/LLG9n0zAxUJCWCi4hk3EEt7YMCxAztPz169w4C/FL0R79LE2XiUAigJTJftBSZ7OBxA+kre9Zyj/oAYF+iTFoZH4J3Nc4vrLfwLvbC5UmiFXhI67irEkcGH4lWmEOWLgNIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjji01hO; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjji01hO"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79800183233so16559117b3.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774548592; x=1775153392; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O37BhboRnNuwha5lWKiZcjwoyDlHeTZOtbecgNN6F5k=;
        b=kjji01hOdnIYVnjroLCHxOD1ENFGQiAS1TacWy5DY8b1SfzNs8nbC1xJaf96ASNZSN
         q5TucU2BdqPIesdKclLACdBX0RKcOrVaSblfAgt5sA41avn5zb910Wl0KaAqmq6pslkP
         Yp8PelJN9Ylt4O9nXoUBtanjVmn2k3u+gWpt4uvq8sUklSHTOw+/5+2/G0goYJJVU6wG
         BiCnnTqCUxHqNPV8j5AMTh5g6diaGkYb2/JStZ7rcbP0hyit8WwyDxx06/iCkXqIzb9U
         xklDlJU4tXk2HvPHPXYUkPA7ivK3SppcfwjYXh8kTbbQgqpnciA0o/Zks6V6gPojcbFO
         A+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548592; x=1775153392;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O37BhboRnNuwha5lWKiZcjwoyDlHeTZOtbecgNN6F5k=;
        b=lgBpH3Cei+xJc7Tv4cfp2M+O3AWQNsrz1yWdI2aZwaFs12VsXmGtMjeKx0tadO8/iR
         AKZLfhFDbacj4nAbQM/EjPt62hxyXkH/YGQNcbldl8/teSDSarbly3nOiUtAx+/CN/Uw
         Z7S0Pb21FBDAb+/HIIg7WX7eY/87rCOsIPPtJyBWnRpQrVObT2VuenqPGLv8tnBZXDh2
         qgjhykP7sTGKPggKXcbJO6l0ECyfx7pIlbFbpeiI+EDeVHrl9Oxsb45avIEXr+u4o3UT
         E/l73pScUS3aC8eddqAOHM5+GQqW2bujfI1sEvG+prGePiJCClxBCq9Mo3FuvOW/2gfn
         UMHw==
X-Gm-Message-State: AOJu0YxM0Uod+vGyd0PuyyJGmeg5JxEhXnQjqU/JAtqgZ4E4n+7uJZ64
	mHGvXt59ycRzjVuL4UmjjrGAFnJkxu1eCAVkJWr3AZceIH0FyE3n37Z6
X-Gm-Gg: ATEYQzyK4lhUGgIg0GyXGzb/fis1y96UWLEMpkCy8WE6Qi7W6LiE9pAzOWdoIAvBE1T
	tJoVpWlq/StF5ykUicSW89QrNb2AxXEBLa/Kb5xeWWec+jkvLuJCka6nvBQqgXMJkOUSBGaAbba
	+cSU6tO6G5Lj8sZ0LVw5FYWY5OMZrd/xCAFinQxNLNRKMMi6wCQgEwby5oWL0q4zxh2YSv22tbq
	rOV07sjiROh4rUx72YYWl8epX1z9En9A7u/ImHwCpKSAq237k+i8yTzroznlbwSE6WZ3/9ukhHt
	/ccAZQVYV6L7J8xc3UVxrCG2QHyhYYFNktwiwsDuq5tqYWIs8gw8WJzy6FT8Kabt2uUGsn69f9G
	7DR2na08xwcM236GW9bQcfj53Sd+sZwJgmX1gUgw9B5gxnsUF9pvb6JzxkGqS7akAKJjUPpMbE3
	spqrA3QkWmV3jHFZ7+iVA84IIdhe2fvzt8+s8pjQHKSheQZHUkjCyZh1/J8E6uCdlk4Efq3pAWA
	nSZ09HLcgw28Vwv4cWj2j1HBvyK4QJW
X-Received: by 2002:a05:690c:3387:b0:798:5213:d90e with SMTP id 00721157ae682-79bd025214emr21822857b3.25.1774548592034;
        Thu, 26 Mar 2026 11:09:52 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79b17e4a0absm16324437b3.22.2026.03.26.11.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 13:09:49 -0500
Message-Id: <DHCWZ3XPKB4X.1QPLA1CDTWXOQ@gmail.com>
To: "MrXploisLite" <arokigaming@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix checkpatch style issues
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260325234511.24762-1-arokigaming@gmail.com>
In-Reply-To: <20260325234511.24762-1-arokigaming@gmail.com>

On Wed Mar 25, 2026 at 6:45 PM CDT, MrXploisLite wrote:
> Fix minor style issues in hal_com.c reported by checkpatch:
> - Remove multiple blank lines
> - Remove blank line after open brace
> - Fix comparison style (constant on right side)
>
> No functional changes, only coding style fixes.
>
> Signed-off-by: MrXploisLite <arokigaming@gmail.com>
> ---

You need to use your real name when submitting patches. Also, don't use
the name of the tool in your subject, it should be something like
"Remove unneeded blank lines".

...

> -	if (0xFF =3D=3D hw_channel_plan)
> +	if (hw_channel_plan =3D=3D 0xFF)
>  		AutoLoadFail =3D true;

Please keep one logical change per patch. The removal of blank lines and
correcting comparison orientation are two different changes.

Use "$ ./scripts/checkpatch.pl --strict <patch>" too before sending
patches off, it helps catch a lot of easy mistakes.

Thanks,

ET
