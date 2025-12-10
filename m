Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C205239E9D
	for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365469; cv=none; b=lHrVcf7G/gTPvU94Lo5h2XYTSXQ8q19WqUSQZeS8Fl+BjTmLgyJTVoHnNp4lDcDj/ra3u3wzHkgb3eUDiqY0MplsC5QXP+A3+4ui0vsptzF8wUybxHzkl4d2db8ig88Q8BItavdMrY1M4NNq5VeyiUPYjQpA56NgyuE+wIPdtv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365469; c=relaxed/simple;
	bh=VhhskE+UrPrQZfzGKLnNT8yvDHfR+4/N3Neta1ivHII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzgPkMgE/MNg8VNiNX/a1KOEkofcBh7ZDOu7uZRSHJLIf9CvEmwLc8TktDvg4Z+Hi0fQ7wvqsUqdGRWMpxe46IgXTgFiEEQ6NdQiDWIaVRN+jHQayamZlva/FoFTgs5cu+fyNrtUB4pfpzJ67vykEnkcr9l2ByB0FDhTRbwFg6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RORu5OO8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RORu5OO8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779d47be12so60330095e9.2
        for <linux-staging@lists.linux.dev>; Wed, 10 Dec 2025 03:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765365466; x=1765970266; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWMTnjoX007imdOqG+awD8ZozCQofkYnKJOG9L7fHGw=;
        b=RORu5OO8tzYB3pqhKa14FKRyeoQcdPFMZcqaIeRDnQXm9fCDA3vFPgInZr9TkWM2Bp
         mlYMuSEdk0DLCFB92Ci9TAhqJgcPSefxKO2z4yka1e1b6ZsSTwEbLFmiEHUgT7hrQ6Ve
         qlwLxF2eQWS+tGnnqiUTgQxgdb4wm0IAUF1Up/WXhNIyno3i/4aJiJCtdUiwJzDPIh8S
         bHaUtUx+PTkjXcn/4V75dzeNn2Zsjkd9gK/DqNqh5d1KNDihFrFzM/oBbiBGXhloH4HP
         V3dz1MAzr6RtxL1Hb/XPcOHYlNMb1ROYg0r0dGSfYdrFrkzBtrm1v2+Y2zVAgVuLL+p9
         t6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765365466; x=1765970266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWMTnjoX007imdOqG+awD8ZozCQofkYnKJOG9L7fHGw=;
        b=oC6yI9Fu8ykdxCvymgvNcqSmOlTJySkxu+aXttT0nMoPvDPzbeXtxi4fRRo4BPyU2W
         y1JiQeSLl6cj/rJZvjkGJmThb6D4tlcZXQ1Szh+1fx18uN66mgC44KR1EOFCNVS90KEb
         J6Ucl8YkRLd+v7o3PDkqEWkb5j4zgG47evNBnwK2XRmgN4dkEc27PCbwJZMDAN1dpmQK
         tvgpaLZeV5FyHDdBrGMipkh0IzoNEKR8o3wWWdtYibsV3LE7HfzLIUiMCBagV85bpvlc
         AIpvx1N1BRU6COE+BfKBim0iJeRXvR08FxOazpqiY5l8jhHRywVwDg+4CfMIeDPlYCxY
         CbaA==
X-Forwarded-Encrypted: i=1; AJvYcCXDmBXwkBebAzPJ0X7DVkbcvJkUis4jBp71GMiLmR1GFAlOKiv6Lar/md05a3Ao4m+AULjp5vZMzEQqp+GA@lists.linux.dev
X-Gm-Message-State: AOJu0YwlEu8fMKfxQcO3PJNyCAsQK7uNVff0yLKwRYcr94Pn8rIJDadE
	a7xkZH5ipl1rq0tZThYM3XVfBxeP/EgpYPizBJgCjgkjtCm28CZDqq4uKVMTzUn5ufk=
X-Gm-Gg: AY/fxX508lfp7yZGGUih84rtqS2KiMiRaCI5eTN5PR3mq3t879V2SpcaAJT8qfB09ir
	Ma1p8eEStstImEv67sXWw7U9tzNoMCz8dX5/9eMDS4yuYr3F+5NORUdUow1269ltjzzNu/bYxRf
	o2PUlGTJU7jy53WdeLwYYzzoJmbQQTHVbU6L3kjy8Xyqia/VmVHiFYbXGXPCsQ0pJa7rvDlxL21
	ggIOrkl32l1Tsz+/dRo1ZciHUP9y8tk/mowxfreXeItiYqS63BzcdaQq9pFm4CMXvGqJON30MjS
	DLYz0+jPLJ+OD/WdpW5HTIFBz8mvAIFrrPhQLkFdJdaGATN7lj6J44FMpKUARqx2KExR/QfIUl1
	2ZL/lGUr6zRa5wVWB1YZGfUzpI6+GzVXa3DsvMF4JAFT6nME02Tm5ayD5fr9FkQU8FE2xg3jOSA
	Gvm0PrpALTA+VUxKEVVEs4OEYD8AA=
X-Google-Smtp-Source: AGHT+IEkRitI5I6hXt/urNtM+ZX+S1SPKkUgxhsTnx2X1xj7hPM0gkF/kDMzUw20uPJaNdugGPHSXQ==
X-Received: by 2002:a05:6000:2002:b0:42b:a40d:713d with SMTP id ffacd0b85a97d-42fa39d1d4bmr1813897f8f.21.1765365465633;
        Wed, 10 Dec 2025 03:17:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222478sm36672778f8f.20.2025.12.10.03.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:17:45 -0800 (PST)
Date: Wed, 10 Dec 2025 14:17:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
Subject: Re: [PATCH v3] staging: vme_user: simplify bus number allocation
 using ffz()
Message-ID: <aTlW1VkhmvJAn8Hh@stanley.mountain>
References: <20251210100023.33753-2-dharanitharan725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210100023.33753-2-dharanitharan725@gmail.com>

On Wed, Dec 10, 2025 at 10:00:24AM +0000, Dharanitharan R wrote:
> David Laight pointed out that the loop in vme_register_bridge()
> is effectively searching for the first zero bit in vme_bus_numbers.
> Add a check for vme_bus_numbers == ~0UL before calling ffz().
> 
> Replace the manual loop with ffz() and use BIT(n) for consistency.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
> ---

You need to write a change log here after the --- cut off line.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

This still doesn't apply.

regards,
dan carpenter

