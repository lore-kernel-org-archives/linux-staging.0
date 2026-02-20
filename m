Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B52237707
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 18:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771612973; cv=none; b=JnfhC5BH5qmSLfUNOlvgOiQr3GuidqXr0fpmwu0CnSRckG1bd3MWXI4SOBZfd4I/dQWRZbTIurGthThYA8oxtI1ghgQmN54YM5A7rVE6iPT9tg5hiQxwNO1Wifc3tdHYOhhuy10nDobyRz2HrMIIHt6nfNMMSZJTCqtUx9h3Vtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771612973; c=relaxed/simple;
	bh=p+qKH1NykxDLW0PkBAubVhHxolTEOPCZ43vHmcVWT2c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Zvdujj9hlXI8nubqhV4vLMD50Gm5JBsh/pUWU9ceMgbwJMXgnbwx2tMzTYtZFGPIErpEO2YE8QHBt/qp+EE4k9cHEj02idV7U5rGU4KiNgiH0pRAjC8g6CbPix/QG341wYXPe/HBUjHXLozC1NAyvusPGnMhrRZhOsvvNq4hh9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpLd7lX1; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpLd7lX1"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7947cf097c1so21784767b3.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 10:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771612972; x=1772217772; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKhOh4yZTo1x1PdW22yFgQft2Cb2WK0BWP2+QPowKC0=;
        b=XpLd7lX12tfP/J6VfiYwvYhC1+6QwHh6dybDmAbPsaf5OHXjjfpCaLXXYySrPiLz0m
         D6jWUSdlupKfVmaP8ZYUnW8thsKcfkv9ZgOuZatj8Htu+Pdb/JsT575UFYESrvL6MZXP
         ClEPU7OTNiXJnyh0F5CwvLKiBS/ZzKuT69IBOJvB7bSB4IsGZa3iDeGf7ZgTKe4USXKb
         LnbSC5jA7zeyE1AvmL6O0cNHqOR4Txwu+bHRoB6i6a70H5azhKYnfL8JGxDFAabQg6Ap
         NYopoPt9t07a7QtAgErkuTSwDqE5CDz52UitBdHvQ8xBAcFjCroXmND9xrD9sMxyWW/p
         cGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771612972; x=1772217772;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKhOh4yZTo1x1PdW22yFgQft2Cb2WK0BWP2+QPowKC0=;
        b=muvubCEjGPV+Hwlcl/qA8h4bJeCJqaMBF5Wr2C4pFWHUDooTheT/0bRsb9KqpV5iQ8
         RFwk+QTSc1gWpeSctgPopygn2F7H0w2DLEBHTejIs2LZTu+svzGvEPErutsGkG0uN1bd
         s8SF/0aeeVuR2Nmv3lJhfcWCx3CT0RG6WUqYjQwxP1pHvQJyIzVRVjvRCciAXEQDBvkR
         7ZksBqeDWiqzh1o0wkuau4j2QO6QeHX5p57NxYB5/PMMWy2Nny4ddZ5sZdbsLAzgrOvB
         pOV8YDoXKlFvOh2P1e32Vp3QqAzgTxBWM9K82YVQ+2ExXxVllyBNGAcWYzGMEycVBZwQ
         4Pkw==
X-Forwarded-Encrypted: i=1; AJvYcCX/9qY4xhQWzcsHd2JofQDKSMdsj3DESo+ab7wKbZLS02hlOfmSPc0uFt+D8jjClHlWzdOLPBbARzrVKwYk@lists.linux.dev
X-Gm-Message-State: AOJu0YwjQz4L6oaOI6uvWghAUiQSDLbAcUD+GcFNpAX63sBpdaGHQYXP
	qy2DYdnfZ5aGSOw2Qr4vHd9l0BHDkJbvi6Y+HJYcQXAOH14kAuKfgNtj
X-Gm-Gg: AZuq6aJVw5/xslr86E1QVD+wK0n+4YxSCoo7CbxTtaAUkRbMxN2cwvnVFXSE0lhliwU
	3ZcatE5sd1qJg8g+6lwpmk2Kf2h9PGX8VI9KvjAjIshmd6mX6L1PX6FthJp7BAV19lweU73uAos
	+iduTIImehcKpZMURIYnukdn5SouvMRifJjmZqmJp6UFxvJeNycYFek9EAX19qZUVDzBC3B46pd
	L7LjHTSCrNU6Wu+SX/ZX7BGCePkpVxCtdED0kR3hPWEi/VIkVfxkV9Im5MgVyKnvYYPd5JxwEqx
	rbAEQwY+rJAq+ewk0AQwSP1HgK6uluYSD2kvpfcJHNlOrCIOoM/YthzKFCaLQ1vYRmaUwSQ1nR0
	d/KA0U31HWCLV0GURAJOosHN8xQu7q8nRAnsZFLjozKI9Vjz9+cHKXBl0jeWZFd/hEAeDXEcSGe
	oHW618lseIOmeLtEaompxNFiILirrf5P5vreSlZ+Mm3xQXialDk3G1A1IxJMyXJjBypYcF7oEmr
	P4ItQIh0CowBBfONRzfhWqcfRqFxA9D+PlPmU6+bSbSvauBbOoGdEysLRb4rw==
X-Received: by 2002:a05:690c:19:b0:794:afa7:5c52 with SMTP id 00721157ae682-79829037826mr8653297b3.46.1771612971654;
        Fri, 20 Feb 2026 10:42:51 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982ddc5a60sm119917b3.35.2026.02.20.10.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 10:42:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 12:42:34 -0600
Message-Id: <DGK0DNPXDMOO.3PIX4JZNHHK15@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Minu Jin"
 <s9430939@naver.com>, "Archit Anant" <architanant5@gmail.com>, "Andy
 Shevchenko" <andriy.shevchenko@intel.com>, "Ignacio Pena"
 <ignacio.pena87@gmail.com>, "JJ Strnad" <strnad.jj@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/11] staging: rtl8723bs: Remove useless wrapper
 functions in rtw_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Priit Laes" <plaes@plaes.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260220161611.2398915-1-plaes@plaes.org>
 <20260220161611.2398915-11-plaes@plaes.org>
In-Reply-To: <20260220161611.2398915-11-plaes@plaes.org>

On Fri Feb 20, 2026 at 10:15 AM CST, Priit Laes wrote:
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      | 88 ++++++++-----------
>  drivers/staging/rtl8723bs/include/cmd_osdep.h |  7 +-
>  2 files changed, 39 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/r=
tl8723bs/core/rtw_cmd.c
> index d0694a659259..60e2de7991d4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c

You must have a description of your patch in your commit body for the
git log.

Thanks,

ET
