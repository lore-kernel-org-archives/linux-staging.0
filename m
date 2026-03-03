Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6100372661
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 22:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772576333; cv=none; b=FhWf+0Q0aNQIHYW8FbaPvMY3Q4trkxfjTgEe6qlBf4uEmCzoyv5BdW9LqRcVl5JzHc6DRKTpqlO8B/KdygXR+kCjju1h+Jr3YRIdLeBhBVxXnbff/3taUlpHLb3yTIs3Sh18jP5bcVlLKrr38Sm+Iw4yVXhrQoarU13nWcKy4XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772576333; c=relaxed/simple;
	bh=he2xTIQrT3bPgtIfKuwnLpoaZJoUXnl1mVr8y7jrHjQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=NDCWby8Aq0axTW9sP5biLJe/xNGVfJC7Twmmp5c2ko+aZnEQJY4lMsEwbKrR1+TUlfX8ksWFvFJTOMT7UAxNf1oijaionPzFrv1YFb4W96uvn4I1sxdY6gjegmPppQIbuZ/deB3agnFz3bBi6Ow5sS+hX2Q8s2yi01M8QbV00GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWzhuJNH; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWzhuJNH"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-798578e2918so57405707b3.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 14:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772576332; x=1773181132; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJZnO7nkzAHdb3bPGCGFA2bFbi/3DlNCQcs4cpPuUdk=;
        b=nWzhuJNH2GxdCZ90NPXA21tPt50aYRw5k4XXAYPSAduIiGdTAbzx6mHHFl/POs8mB/
         iO9pl4vyUIin1hcXqEG2zfifsoD+wjs+d7y0jY9CIaGDxvaIgLpWqu6uiDXnXnwgowUS
         HQI2LXAS4hx6B8Uhrb65ZyWH7IJ+7hTl2buHofmvL8PkFEzqHOiIiaKRzbkHIVRubfPd
         SLk7POvR15wnWO1HtW3H4c3WUwQitp/s+8D+B5Lu3hBsu1fDV5RNQEiErxzWdpELF5b0
         n3UKVMbV4T3rjnJvQBBsX4F8bYM63t1YnxmmgZx5zlQjNXgC73KJ9oERzvxnwmquaO1i
         0xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772576332; x=1773181132;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJZnO7nkzAHdb3bPGCGFA2bFbi/3DlNCQcs4cpPuUdk=;
        b=oalkVp2CgRfCDR0vSfnr5fAvwfscC8r01wCR6f6jbAUZ8AmX5oVvEzPHbsHF1EnzTP
         P/1fyjE0gZdumWh6/OnC+PB6h/FadkjM+ql1/qTbbhPNw0eCHUbl9TNQxxx6Gi26LLQS
         /ZEgo6mQWwHCywc0m4ABHv1/7lRs5/NLK/kpjkNp2A138LvXEZcULvmZIpqrBWpZmrr3
         ShcUd1oWVaPU2uQPKVxRubtKFm3isvPKVLrNDRyKdX+mWLs3dHbvEQAJBuWn8uIfSVPw
         1MeSLEmQByYQtUUr0VKqDeh0vDB0AiQDV5N/fj0Q5q4D+ddnCCZFjK8i61EZFuFN//10
         t04A==
X-Forwarded-Encrypted: i=1; AJvYcCUqfjLoqdmGdCh0WJP/4E8wPE8eAuV7GzNSAesqGscfzAAxRngZQqErXfTpqzqXGF0Lj+TmfYb36CNI29C1@lists.linux.dev
X-Gm-Message-State: AOJu0YxNE4JqttAnZCtrnH1jKnkTyyE3dWi4Isj7GIowdHj93HJE23ZJ
	GIQDiuVTi4pVm7LOkkzFgsn4ZFQmarcEgTU9vMaI9zqdWWMjQoYvF33r
X-Gm-Gg: ATEYQzxvrZcV/G9jh5+amNofhkq+2j/NqPkNUfpg/tkKdJ5KQ195iqF2y9KG3NZYZfX
	RWpw2IJApZqAwmRJDrr+UXOHn19LVDAaoLVxNwPocaRput8QvhGVxEt3yJD7f85eZ4w48bERHwf
	3jSeNAQVi/+kE44HUlXeStMfkN6T12swLthOjne/mru2og7+7FgHRJWHp5TZWNVOs1dpPtualQe
	zQdCxaGeF3hefNreH4zSMDkL9E7BcS6LuqwPBAkOCq8/cHB8EFYTZ6QQiaQLxkmElFk5/mQjW9Y
	KN5sDrfrXaOmFoZ6TBG0pfcd0mPdzcDmcLW7maoCbrluJXHtWqB9BTe3r9yWvTZW0sqGgIGgzsy
	W+2Lo6w5fUZaVF3tfam18vbcolrKj2Ny6uiQkyG4DF/F9ElKTrLirAEsqBArgo5idQ2T/Sf6H4u
	VSrkLogiqEChwx/fXBFh7G49KbSRWAqK6YTG2D2CW9y3ZsyYgwcsB3aGvWWo5dKPp7B+hFIgVnk
	U86m+qeglXf5HFwtl5Yu3YtAHLqjK/QIEPin3L3fU4=
X-Received: by 2002:a05:690e:1513:b0:649:d33d:91d2 with SMTP id 956f58d0204a3-64cf9be8a41mr39230d50.77.1772576331607;
        Tue, 03 Mar 2026 14:18:51 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7641c33sm7209500d50.20.2026.03.03.14.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 14:18:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 16:18:30 -0600
Message-Id: <DGTHUZ568F1W.1OBYQ16QVDYLL@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 <linux-staging@lists.linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Khushal Chitturi"
 <khushalchitturi@gmail.com>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@kernel.org>,
 =?utf-8?q?Rog=C3=A9rio_Fernandes_Pereira?= <rfp2005@gmail.com>, "Abraham
 Samuel Adekunle" <abrahamadekunle50@gmail.com>, "Artur Stupa"
 <arthur.stupa@gmail.com>, "Zhuoheng Li" <lizhuoheng@kylinos.cn>, "Ethan
 Tidmore" <ethantidmore06@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] staging: rtl8723bs: remove redundant blank lines
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260303173844.47975-1-azpijr@gmail.com>
 <20260303173844.47975-2-azpijr@gmail.com>
In-Reply-To: <20260303173844.47975-2-azpijr@gmail.com>

On Tue Mar 3, 2026 at 11:38 AM CST, Jose A. Perez de Azpillaga wrote:
> Remove multiple blank lines and unnecessary blank lines before closing
> braces.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 14 --------------
>  1 file changed, 14 deletions(-)
>

...

>  		pwrpriv->rf_pwrstate =3D rf_off;
>  	}
>  	pwrpriv->bips_processing =3D false;
> -
>  }

Ideally since your deleting that blank line this would be something like
this:
		pwr...
	}

	pwrpriv->bips_processing =3D false;
}

Thanks,

ET
