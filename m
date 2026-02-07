Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E741A3164
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 05:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770441567; cv=none; b=PEj/Qem0LMOihYTA1GZMpYWFwHyairv8Ovm2QiAsyV7+ijjry7Pkr5Lo6/Q7Y7B1ANzIifCl7qavx/ToF52r+07ExHlWjhEwzxnOf5APePWZraMLTq6Dx/6JkUut5bE55pkMKcQ1zkETFyUcqsklzMGrbMsLiza3KYSXxcNVeVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770441567; c=relaxed/simple;
	bh=ZgkyQvYd93SwY85KOcLijiV2acOqOC9qk5fwmHVHED4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=WY+6daWE5l6OcXpfddJs1xqenuZYjALAVtwhtMR8aSOljYjSVRZGag1d02MPDL8OjbA2Ko99YVBPGzVTVP2EOwOsME52bL9uEy6shsNZNZowoi0+uOu9sqaE+dVCLkCz2mq2T9UVhv39e9mSoQ4tm1XCYHAWjni1qm10RqC19eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=am+Ruv5/; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="am+Ruv5/"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64937edbc9eso1351010d50.2
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 21:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770441566; x=1771046366; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1l3VzAkSlMmBGiLIXmWR3BRdOjLsmM1tj2iz1ghEQY=;
        b=am+Ruv5/dz1E3GtiQhvE+A5+7U0xtIkFtPwRJMg1ME0tyQbCLTwEJHj0VzZiSxdyo9
         terGqZ7qU/3RUlGwlaBPTUXPQBjQb3l71PhqtwUARahuvRHf+XFbczPN9E7ZvJZW8K+s
         O3Lqw7dqjvnNxJ0OZRY3Hdim5JmOn6YvCkTT0DfCAT8+aN0TT4KJlBWuirI8I5oPE0zk
         Rls+YQa4B3i52d6Dp7G+S8EcKTzKLUq9fbuo4r+aKwSBojNz0McNr1GAREU1o5udpi9P
         X55AvQZwxFl0WnvOZ+VYU5jhNCxodAU3BAQwieHlruzyQVUBY6rTi6rKGNbWpwvw7Ffa
         vUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770441566; x=1771046366;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/1l3VzAkSlMmBGiLIXmWR3BRdOjLsmM1tj2iz1ghEQY=;
        b=tB759g5TbOspTtx55BG//R8MLbW/gYUxK2QUv9vKEJXtn8+QHOCVNUeWa5dpzYKsUl
         lKDIiLrFk/c1TnWTl/wHFaFiAjCVKzg5374YTfTszsEzeET9JpxoiG0d+v9P3nPrZsdf
         o7H55jHcBFg/0Udqs4wzuakEBzEHR4uCeXHcIxgAGIeNyyL7BxGhyJEzEV2XPNM8mMnr
         5tr2T4JAw3sXx/eanyIx5d7OrmCm5zpGBO5kHrDJCyZVuX1FxgL4Nwxd9UqQSBOL6V4W
         pfXqsJWwxDGsvpxquVVGpRUP+KyvbmXqrNuNQNVxHdGEPZknUUcOnt/UO+MaOudf16TT
         khzA==
X-Forwarded-Encrypted: i=1; AJvYcCV6wKE+6uLHcl7xfOO5/racpIYBMmjczG/my1cfCq/GVHhek1zmy+0tWaF8Qeint2pz1jD+4Xmg47wHLfOg@lists.linux.dev
X-Gm-Message-State: AOJu0YxMLl0LIvqGGFAToRHSKK77r0DwiatnNAHH7kWOlYqY1ACZ4QNc
	yl7c0hJNxNkOJYdS3U6zjdSa7E/DmdJ11bzzLFoH8YlXnmeVngI/J6Lt
X-Gm-Gg: AZuq6aIwTPk9fMoTom194pmP9M0TJJ4PRWAHUSD7lsF60IpWH1jNTKfC/FbnqsGlAf3
	pZXAhEzq4i+ziXkTtdiyGY/YFi2LMoYBWJc6c0Fzd6dm4ZsTZBt3gYWdsB919/HHwP2XNOGpTRZ
	tcpDW958U7uY4a9d9Ytn7Te0Lwu4k2IxDaprCwffMY90xmBF1pZHE1hE7rnoUazIY4XbQw/M8qx
	SDcWkrMXLr2F4zhLW9b33MLclQ2g2RlGbNwKLwmozHKMN46XtEO6gJfL8iXe9chip1ZSSbUwRjB
	ZEetjp8/+pkQwWgh5zt9uatwtovpgGoBvtqYQxH22xcAW6c+W1fdyHlX6HVwhKjtKUF88NbbEg6
	I0BYr6yDz1IBDqb+4DFYnHa6l+/+CwRjQzQThvVpQDErrTD1c9EnWM0XS5QcCUE0h9ETg9fACOE
	+KC5t1KoFWuL6uaEXawHVhonvpFMA08Hz+5N8ukB/X9/+X0Hmo3fC7xituLFzZQXXr4dBhqiwJI
	VgitmVQrYkC4jnA9CHBk7W3nDFU+xbmQrkKlbfp3mzpyvv0FbRt
X-Received: by 2002:a05:690c:c52e:b0:795:1e5b:f68 with SMTP id 00721157ae682-7952ab1a70bmr50283277b3.35.1770441566410;
        Fri, 06 Feb 2026 21:19:26 -0800 (PST)
Received: from localhost ([170.199.240.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a1d8c66sm39463197b3.30.2026.02.06.21.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 21:19:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 23:19:25 -0600
Message-Id: <DG8H5N4CKTEO.JV3DLG7GUDZQ@gmail.com>
To: "Zeeshan Ahmad" <zeeshanahmad022019@gmail.com>, "Parthiban Veerasooran"
 <parthiban.veerasooran@microchip.com>, "Christian Gromm"
 <christian.gromm@microchip.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: most: dim2: convert pr_info/err/warn to
 dev_info/err/warn
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260207023433.3935-1-zeeshanahmad022019@gmail.com>
In-Reply-To: <20260207023433.3935-1-zeeshanahmad022019@gmail.com>

On Fri Feb 6, 2026 at 8:34 PM CST, Zeeshan Ahmad wrote:
> The dim2 driver currently uses generic pr_* logging macros. Hardware
> drivers should use the device-specific dev_* logging macros to provide
> better context in the system logs, especially in systems with multiple
> controller instances.
>
> This patch converts all applicable logging calls in dim2.c to use the
> proper device-specific APIs.
>
> Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
> ---
> v3:
>  - Removed "staging-next" and redundant "[PATCH]" from the subject line.
>  - Shortened commit message lines to stay under 75 characters.
>  - Added this changelog below the "---" as suggested by Ethan Tidmore.
>  - Cleaned up temporary submission notes from the permanent commit body.
> v2:
>  - Rebased against the staging-next branch.
>  - Fixed CC list to include relevant maintainers.
>

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
