Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A106C7262B
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 21:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773611850; cv=none; b=lGltbGdpFqDV7+4WFOTWbY5F1Ne4z9CpsBZHvSkwAUFtKXl/YisliLpQNS2n2N0w/KkscqZvd77Rs3o9WKau/ElmVzaQbSuVLnCD9lS5IjGchKmjvZ4b3xigkaJEo309mI2zxPWkl+BBHocvnAsJQkDzSJwTMT+gUUJzHB8BOUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773611850; c=relaxed/simple;
	bh=N9lIXjcVaP1a7DZp0VUKMZhGhKDNJboczl7TH7EUG4o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ccvtUELVZ/xwyyERhfaLsJsPnJAijYxEB1xDkMcWyUY6S3n3e61e0iTgBYeNvakdVkcpARQw1FuU4o1J7iW1hPiqJZTnVOzHz/MY8Rw5zhIIJRQtTeG9cmvVAjLFCiOibpfbEJ5y5yR5xx57CxNY/IPBCSzKNyDzuPdQ5Ibr2Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+l/cThW; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+l/cThW"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so3720072d50.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 14:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773611849; x=1774216649; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydX+ebu6C6lf/Guvs5rCcbIpkM0eU2bnOt9HsnYfLkY=;
        b=X+l/cThWiBeGA9P8yCIAnzuOqFlILVaw4BU/LTELc3114x/L+zDxOxST7eKMD3hLiO
         DrhXiK7/2qT/VsZhUYhVTZvJDAPPErCmHYemWxDSFNQ/zIErs69tugbJixmcE3c/FUsK
         pIVkUVvOTS2/KHmEP2Cgno3ub1NIzL4vPAOQIDq0+lDzm6z7oeyobG5SK0DQgud8dhXz
         TZngdWRJCIdE9ZgNlEOz9geq+A7/c52Rrfc/GGOFXP5PJqtKpTsSdaV4bVK+M6+ptLb/
         68/tPKMb91RUUzZ9pfdxB1HYoTNbAK0Vf2lOkvm2eoKkLgpw12XmGcP82clNu4Z5bSm3
         pYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773611849; x=1774216649;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydX+ebu6C6lf/Guvs5rCcbIpkM0eU2bnOt9HsnYfLkY=;
        b=ToWHLzE6iftNXh9oZvQA1ElqGYdqRRv6chNpgRl1CCcDNTOjRc6fVm4bGoXWLw36S0
         VGo2RvCH71alKwMQWLQleHC/oRaLfjWE3YtL5TmIOY6o0kYP02HXHkWTYw/Wc1NdJb3k
         ohw2XIeIaO34vxZrIUU/DO0D5wm6bKi1wXJxonPHoVgfLsB2cgipg6GlbMd88JEyiE2w
         0cuPofaIzOZnt6A8xoasw/cU7IZHQTWGc4QCMuScOZcxZrQ7YTig90vKqufM48GOwGAE
         GTf7H+v5Zm6OZGEwaXPvGmrlxrK5e89uHC3khBepX0kXu05+TOCphnWfKJsXYHCZ3re2
         bnhQ==
X-Gm-Message-State: AOJu0YwzPB4wA9Fs8lFjU5LRkP3CL8LncHDjoVrHl4iw9IH3tcxqUWvI
	vVfKyhQ3fU208OIliaJYFPwwhAJtIcM03Qk5iRCzxYgRp4WO/tp8NthqX/uhZLM2
X-Gm-Gg: ATEYQzzrF33h+GdZ0G7ltL0ZJsMZDCEybBcDAH3YEDfhEUDhw6aR7C97HQFRRvBHb/1
	sVImACS1k435wX/PrEKEWjPhyvK2m/3A741GLMH2LmtSySWgd64lsr4wu2n0L29GGr+CUUnsSIN
	uM68pSyQAXOrGymSwuJcghCHlHl1+7LHk/83ouvebPhVtAXuTsP1VrISBqwk6vwpxRXdPwevcPY
	xEqyvCrlGeSQnIjKMLvxVG0p2PhqhbxHe6GR6exDOl1Ncb7fWOls2mK6AVbnGZfi4PHQXjQ2cHz
	s6CwuoBTrr5QvSRoYjAs1Skg28KRMoQgly8RKCIEq8mxy1HJVXv5q0wk0G1Njgj96swkrQPJBjq
	vlylbDpOVdzPbbQf1WHuUTZuZSyJ6tJ+Vg/UUIMdPOideLv/qGYOd2GBxFB7UOc1ESyBfU2bZEg
	sHOVr18kS8s9mgOo4qspFm1nJfiRTMX1uSTtFF2QHCqCy5DA1XE41wJpqF+lAZsDnskVmF7tpDQ
	+HjqH6/dL3SQsMF0zCyJqTdLicgUWF7
X-Received: by 2002:a05:690e:b86:b0:64e:79a5:4033 with SMTP id 956f58d0204a3-64e79a5494cmr2865857d50.71.1773611848594;
        Sun, 15 Mar 2026 14:57:28 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a3bedcsm4657365d50.1.2026.03.15.14.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 14:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 16:57:03 -0500
Message-Id: <DH3OX3CFT586.2HUDPSK7M65AS@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Joshua Gu" <joshuagu789@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary spaces in
 rtw_security.c
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <abcVPgxQfTykOvlQ@ubuntuarm64>
In-Reply-To: <abcVPgxQfTykOvlQ@ubuntuarm64>

On Sun Mar 15, 2026 at 3:23 PM CDT, Joshua Gu wrote:
> Fix checkpatch.pl warnings about spaces after casts
>
> Signed-off-by: Joshua Gu <joshuagu789@gmail.com>
> ---

...

> -	ctr_preload[14] =3D  (unsigned char) (c / 256); /* Ctr */
> -	ctr_preload[15] =3D  (unsigned char) (c % 256);
> +	ctr_preload[14] =3D  (unsigned char)(c / 256); /* Ctr */
> +	ctr_preload[15] =3D  (unsigned char)(c % 256);

Since you're editing the line go ahead and remove that unneeded
whitespace:

	ctr_preload[14] =3D (unsigned char)(c / 256); /* Ctr */
	ctr_preload[15] =3D (unsigned char)(c % 256);

Thanks,

ET
