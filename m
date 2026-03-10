Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BBC2DF126
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 01:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773104873; cv=none; b=ZJ2h1UOwS7kkffXCzkQixO2tm5J/YxYPOvfE5RDepzt+ZODHlkpJCFilS3ozBcWv1Cxvckm2KOFM7BPMc6C5D2oL3n5FORFH/e9PFf6gP6tlkbuRxq2QuIXqQtpFJD0P9N8CLxI2cf3NVxG2nKw0aMTTPrYsGJpvxPT0tAsUDUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773104873; c=relaxed/simple;
	bh=0Gr0naLYBtkt/sgA2H97Rm8uQaYbxnbYD6FX0i+Qr5g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=JIFvvY4qJ/oXCvuc928sk7HOHJowNtiZ8jgqO6mr0p8efg0fmWUBHJ2eM1a8lwSKOnUAEoGYv91SrtK4FFNsulMSunylxMm2Wykv6uB5JlG00LQ79JuYmYXdMs/bsO/sZGi2STOi/2fgp9mJIL7f3QLpBEGrNBQmpgRRQ2wNoXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uoresryv; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uoresryv"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso15278746d50.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 18:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773104872; x=1773709672; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Gr0naLYBtkt/sgA2H97Rm8uQaYbxnbYD6FX0i+Qr5g=;
        b=Uoresryv+SUauC0XcxhTxyhm36P7qcUWfRZOmPdgVABaB9NZEJcCyozZq7YjcEN8gb
         37AL/NzUBJL9Cvph2ZXahQxZuHs4Ukn1dkTcMNnt/Ai6/VlBmPWrI/FG0cRugdTr8/Mc
         0J1s/TZ5NeZXZMpD9HxtS2xUmOBlwu5HkyTlvsOcrYkkqARfMHDxACmcqllKc0tttU56
         lv0YavWxU5Bim8mGQJ1VVwjOINdxKNdHIMjAjoJCR000iiavIsBfHihLoTiyGVFjG3kF
         Q88yDFYxHTtbRRxsBRdwCasekMzKbtqPgsOBgtuDwunwvxcIbnEivSBRVoWew+48PRMh
         pjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773104872; x=1773709672;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Gr0naLYBtkt/sgA2H97Rm8uQaYbxnbYD6FX0i+Qr5g=;
        b=prWO1kHKrom0cUdripmkMPBL/mtGiaSLbeTjjiMPNpC41ws6rmd677LHSo0vPCFgS8
         csuuRr3XTjQhvkpHLIkKaMOTqQXrapGwMME/uyrAU1veNbBOJU4pqb0mIvh0609GkaDF
         ggMYbVimZ4OAoXK4oAz9mKLffEd9cB5qSOAiak+zDbdcbbEzkAvRB/R3qyX1lQI4SsJs
         +9b8pyqQnSi1jITq94SLx/mMFdBB7uCKhKlDWeik1RNM3SVcnL8fsmeq3LlvJyopsaWk
         VsmwSlurCYHYTaCoaAJRAbW07NCh5R7ubu795Z0fnnpK4S0N5gGTRJIQ/liHdbdDHl52
         I+PA==
X-Forwarded-Encrypted: i=1; AJvYcCUcS1UajHEAKUkYZL5/5HCuYwikVzuhZWGkwrYZw48avo6ItQbCUsu0zriUBL0cHz+I7naaS9orjrZHsyZR@lists.linux.dev
X-Gm-Message-State: AOJu0YyMO85013c9lZ+SbShoESw6GzjqFWCDLW2ivN2ZdRedZdt6DdMR
	HCn5d6U5d/MIen/2aQyAodI5qBnISRH/obn6OLE3bjtTa5eKkMCI2CAM
X-Gm-Gg: ATEYQzxXhOyg/XafnhFYfLL7mR8+xK4lPnLL3ST3enz1n8wuDI0BlaHslFfiSwBVNxW
	Q+8ce5nKi8h7r1k+ubophOF3OzKWChSbgpDVRrkycFWhOG+DP0toWPyRIBV21h7bSGdYHNgaPoG
	/8Km42VdSK544e42lXaVhZ8gTU+IZjJjo3uJ6k4XLhDuvTMiRUo5nweA20nQmLXyW6IxhEzFEKv
	RmyWOA68UtG0uiE96Rn6rKlchVst66BsvgKvYkLmDX3UCWTJuep9Em3UCu2ytPlQnsxWgDbYsPQ
	HwhAsL/nptngBhIj9J6OXmJzTzqWLPqYZeauGTCPjieXOdlCMsrB5wEAOpftOFZhrvmRk1qblRA
	BNqKLbkjYoE+Mk2Qy8tkkrYChwrv+TomHJFTLgSia6pl8QX8Fw/BlDaA6YDPTy7QoDb91zeotUH
	KttnNRXl4o/I5ckDtmGJ0ng0DZwEucU8yzYEIJ7ufcrDXzHe1hJAh8t9+3fdeDb86i6oLwrg965
	fEQq9EgBT92HWEqNkvjleq14LMOuOIIpy2eGA1maSw=
X-Received: by 2002:a05:690e:14e:b0:64c:9f60:19d4 with SMTP id 956f58d0204a3-64d5a0f2a6amr1170772d50.8.1773104869488;
        Mon, 09 Mar 2026 18:07:49 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175d2f31sm5533509d50.5.2026.03.09.18.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 18:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 20:07:29 -0500
Message-Id: <DGYP7MWC6A1J.3UR4WGPFB7QOK@gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: fix line length in rtw_pwrctrl.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ayan Mahmood" <ayanmahmood249@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <ethantidmore06@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309233135.10964-1-ayanmahmood249@gmail.com>
In-Reply-To: <20260309233135.10964-1-ayanmahmood249@gmail.com>

On Mon Mar 9, 2026 at 6:31 PM CDT, Ayan Mahmood wrote:
> Refactor lines exceeding 100 characters in rtw_pwrctrl.c to
> comply with kernel coding style as noted in the driver TODO.
>
> Signed-off-by: Ayan Mahmood <ayanmahmood249@gmail.com>
> ---

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
