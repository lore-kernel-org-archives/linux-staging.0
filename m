Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F8239EF0A
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784480749; cv=pass; b=Rq+OaGi0m+IN94HcZuoAPBRFTu4BgnT3HwAUnoF4JL0H/ZgWzuUTUgXJieMCuebsLxpwHe65hFT2WX5ujNiXsDZ1VyjZRznE+Ge2ANF9P5iM7ud95imInhBQ9uR7jshAIdgFaqvBD2hhRmiP2paI2MgQjwEmnk149YI3nbFEXko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784480749; c=relaxed/simple;
	bh=10XbjdWfDZcOKyfvXTIyZNgeCqR11dL2oGIt1ghNOxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXvwa2NymiwvMCe6ebLRdOn8QjNRAQBLkZQWRRxqPfqPARvkawrlBycArVRLZAPMVWgq6AAkm6MqoF3m4XAHeExYO/Xdv7avPeA7gFlbmzAXZaQp/e0u92+pjJiYc8vETvmBum4QSzD1YiE5o0m3M+MvQ5rJn5cbkijPXUDeg10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmB14qkd; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmB14qkd"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c165a41a52bso773712466b.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 10:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784480746; cv=none;
        d=google.com; s=arc-20260327;
        b=TxtOjNW6W1i0EQMlyHiwEadsPuI3PsMyhVjzhbW1Qpg/YCUR6FylDbXZGOMzSvOBAh
         zv7Yd011mrS1GpK9y1I9Nqx0OOh3faSA79ZerQIzsbLB53vVW/DieUtOOu4jzSMbVwrj
         Ghak4JCKlVSBW5vUMpOF+m4U0IKrzErGyyP6Nw+F9KqEmFz67xBg8RLuv1tpjG5hjRKM
         Mt9crAdCmBg8M2wqk1yAFBzfyHZoQ01QcMjTZKYHkg1ZgZ9MbtS8GUcdHq8RcuyvzPuR
         n820GCfpFq+KhBjHxngsVKRBHhpFpO3/5KUc4yCs3wejznHGenszqYoZsoxIvBmr5OUu
         cRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=10XbjdWfDZcOKyfvXTIyZNgeCqR11dL2oGIt1ghNOxU=;
        fh=QFVFTSKUAJ+SXQoLTMLD3ZAR/LXWmjoYFyINbyAL1Y0=;
        b=KfSlq4KGyun1fsJIE+nyj2Z9M2+9DkvRQxh56plqtoV+TWAZ/KrAqQJXCaAxsJxWsB
         rgpE88Nm6ZM84GbHtUbrZaPGATUEOgF54tgZutfxvKUekGYK0VyXbt7bcl/fu/mPsyfU
         tSQotQrwJgIujqjgdrDX8oB+autikKNwHrOcBvImUcRBBNYv4Pyr7UkaAGooArfMW632
         YwU9K2BFLwq7ItFMeELzNvpwVCToZ77NCKoSBhW6FEDzYhecCwdboq8vivhsd/3HS2ne
         TLckbEI0t3Wgl7LqJTIAKF6pxBRQrmExOyeDJ8Qi3uuzLS1mO6bqAEcxvlAjvGxLc4L2
         lsFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784480746; x=1785085546; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=10XbjdWfDZcOKyfvXTIyZNgeCqR11dL2oGIt1ghNOxU=;
        b=RmB14qkdgpi0ZTsdFuG5eRkG05A+3EcumxiC2YhBvtJgU0JzfyCgr7dKaU2aBKMYQv
         DpaUs1AfBw6qdLNx2fB/RiJw/HXWULAMYoQHt5GY88AvRg+wWNiZKIfXCQYV4N+0xQ5t
         utp6QCUpWnA511fWIjEx4A4Fo8gP1W/22TrLRaCTkYlDztq+H0qC14rm5zuq79JaWrl0
         2guATaYsShNHc2h7ji+APhj0JvSwwVnaWsMJFK7z8+qbyz6OwNgzTSoExiQAeEoM/Tix
         +gNqxzGszNaalvOd11HJe1yRQdZwRDOW37gTT1z2vGU47jy8BA4/Y4rzKo5K75skOwLc
         Ictw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784480746; x=1785085546;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10XbjdWfDZcOKyfvXTIyZNgeCqR11dL2oGIt1ghNOxU=;
        b=ZNF28Cjs+nxZO0AtcpG+1nhm2ZT1fXhoYKXqy1uwzAQcQbO8Zrnu+kXPvU9ti7kzM9
         izMRq1kNnA02tevvzOXSkbXqzhkVf1VhuBxawmF7hfgYm6RNIwAkxahlGYfch9jXLVYl
         BekyVFeGvJCXOKXx/g+fGXB3Er1GXdUYJ/Sc+v5dGZaj3uoHdXBfV8mZhrvyDTXuVXqr
         KCEdZGexSuajlMbZke1lwkUm/GYSxf+Erwfb4S8TbwhDoqk06WgItfv1vPSHhTDzHhXE
         BkGmmf18KneBPgEomaHy8pARZiKgoEoapGOS7MfYxvPR1Ngeqx5Y6YCUToaUSFbOITOd
         6c4w==
X-Forwarded-Encrypted: i=1; AHgh+Rp0buQzVu4rExrvl69ZBeL5JCvqR1RcCnCFdCyl1742Lxc4ypf1hxHxp871/35QeXVMIbrgy6/V+Lh3R5vb@lists.linux.dev
X-Gm-Message-State: AOJu0YyHC9kCyLxbv3DEIzaUtV1/3NfxxjaSVU7ntOFxZWFFA9WVMnKT
	aLiW4xAstOSZWYZUFyDJn1tYig+a2DOLVR/bvgHsAcrM3bxUqJTRc38HiT1/HgZ6TtRCqM2M46O
	WEkA7uQjzM7JFrCc0HGwqkH2oV6TYZqM=
X-Gm-Gg: AfdE7cm+7PcS8oYAXJV91yWKxHoNtpNjClTZ+Tsp+ZdsYUaRIozGyXLlVSw2ouMng7Z
	ZH4dvE0s1y2Ue0KtL1oSdvYLv6/xKREA+4voxoL2q7euIfgu7kr2nbfQeEBt2xVg9JlRMDV0AN1
	jLctN4iwWyb1ljhNHns/hBKSdvx+anMigfmSMWODvdejiCML3fCGt60cIEJlXdXyJTH8HtBn4On
	aMC6T1MM9daXtzN+V4FD0856GvSnWfPWUAWgZ8TdJJkIY9vJqlBI18eF1exB4uQr5n34keh3Wij
	6v2dzU4p3PDd/2h+oX0nWmlHP6xtzLrTUvlNh62XgkxWJ+LIM5Q39cF7dif7+8dyfvopsjNtUOZ
	AMmwVZm5BnVLD5OzvraniUpflsG8++rYeMYbWYCfn08Hu+I0=
X-Received: by 2002:a17:907:7243:b0:c19:6659:fdb2 with SMTP id
 a640c23a62f3a-c196659ff83mr139234766b.36.1784480745603; Sun, 19 Jul 2026
 10:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com> <20260719140350.8266-2-prajvalchaudhari733@gmail.com>
In-Reply-To: <20260719140350.8266-2-prajvalchaudhari733@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jul 2026 20:05:07 +0300
X-Gm-Features: AUfX_myfCDdH32sKULvBh5dqFWF3CZXZytomCB3ZW5Ks8nranh2hvxutWLy6QoM
Message-ID: <CAHp75Ve87ZgaYLaSAX-ev=BSwLwVE9TFfDhXtObOqyMWRivexg@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: Remove unused and unwanted
 debug module parameters
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 5:09=E2=80=AFPM Prajval Chaudhary
<prajvalchaudhari733@gmail.com> wrote:
>
> Remove the unused module parameters 'dbg_level' and 'dbg_func'.
> Additionally, remove the 'pad_w' and 'pad_h' module parameters
> to prevent userspace from overriding internal ISP hardware padding
> boundaries, leaving them as internal driver constants.
>
> This addresses the 'Remove unnecessary/unwanted module parameters'
> task in the driver's TODO file.

So, this patch does the blind removal of the debug parameters. This
driver is in the staging and it is for a reason. Taking this into
account the debug facilities are very useful to have. If you really
would like to help in this area, research how to convert the current
debug facilities to use so-called "trace events" and "trace points".
This is how it should have been done in the Linux kernel.

--=20
With Best Regards,
Andy Shevchenko
