Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31960A95E
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136903; cv=none; b=uT3Bd5sc2AbSHhW362xqkQt9cmT62Yi1CXXrosfwJSda79fCjD1gmsXxanwBhd0Hc1QnXvGN887Iyv1T/sieRT94J4YRSUPzIwPXWFLKdFhpIQtoxatVBLGwdw31kg5dNDUAIUOdqhOAodlbOq7fd++IJro40DPXiagQT4ppqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136903; c=relaxed/simple;
	bh=1oytb3PZ6ZJyi9mfecf5h0lnku7JniHRbI0vshZ8XWI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=EOyYRRpQh/UFWzHMPEkv6aGRlfLJXeHJ+A8xSxph+UuwOgwCvOmXT0t5wvCFQpEXO5jNFiPNg81RVsZ24PxVVI7cz4TBnJj+kdv3hXMQyU7sBcOTH+cQvXSzW3LUcQo2bLm0swYSMccGl0ylIPFDWiAhLB2+88Vw071eEKI+jiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNYD17xD; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNYD17xD"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-794baacdefcso30868347b3.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 08:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770136901; x=1770741701; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oytb3PZ6ZJyi9mfecf5h0lnku7JniHRbI0vshZ8XWI=;
        b=NNYD17xDg27Z3bclBKkRVE2PBGj6yCZca8pDcgQQid01+tYJCs4Kmwxofqlj/OqlxX
         THOCjs2MFb/918LOF20PYB0cURHzcm4anSYZu6P/hji+BfX2byOhuqjRZftr1OYDuxSO
         2eKg/l3qmZ9U2MEtP0jrLL2O5hdaSYGDFOm5T7X0/WVe7XznzOQjQ/Rzwu598mUNxrh4
         Praz4MynZhrXRrqUZHRO62PMyvhiz9ZFLoRmnSpz1WZTFPg0Zbdf/kJ5Utq8K9YBEeD1
         tPPZkdEZYi2CvlXc6a3vtIMxbrlGmqfsmIsZ7wMd8a7utyyW65Na6PynSfeOS/NtK5j2
         fmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770136901; x=1770741701;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1oytb3PZ6ZJyi9mfecf5h0lnku7JniHRbI0vshZ8XWI=;
        b=uzEj0UPu40wQFn0qdpXTtzTM73soC6tg9SYcXaNHec9d9AZOC6DI7bS68/V+yULPM5
         K1FB8B01Dlq5GZCVvdK66P+xXUmdiqeg//2zgN3FXxzyxf/0AgP8BYMwnQoqVFHNS375
         6Y/QKlW67sliBCr7JIEBm6sQWvQFz5JOQ64x4Rhuvq913IP8f+GRUHWZHdSLiD9B6d5f
         A5sLSVlETNpzMg1FHjkjHEXelqnQHvjSmRfcutVDDOF2D3S5V72DIdYh5xLVJfR3a4Ba
         cHwtJxpj9RF4gLuDmujlj/+nkB16vmco48pPQrajGvghwgwZ/xTNYG6aY66A+qHgWXI7
         o97A==
X-Forwarded-Encrypted: i=1; AJvYcCWjrXH7gL05u0KMsdoEFP4AaP+mjM2cuw/pyahTjuUxJVtym/x1D7MmZJDwsfi/egaMndQSuIgLXHuVpR9i@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ0MBLU5Np8stGwpOX7ODByqqk+xfXHA+4BuOoPqjwRA+PYys7
	6ykvrpFFlcmXhM5718HrdCXk7kNFlvtY6jnMm2UIDt46pYOYSENXK5Rp
X-Gm-Gg: AZuq6aJk3g6U6pi9GdYEi7lSN358LGAGMAJsFtvPUgYMcTtBRoZTwOuzHjMvhae5Nno
	ilpXKcqHorykhmK0YtVGe+WToYzwTBWuWFtl5kdbZQdrUf79kKlu8UPH5EHZSiRELayn0//UI1z
	DxV5q8RtbGBeHqf7FbJjJuFTz2YMVaqAQWNWKpfoblVAZ9iejNlzjjbmbfp4LoGadI+5S9+NBsh
	TbFdewhS6qiXfOox+TerXMt6yuWziE27lmpzir1ljsJC+zx+02gKt4vul0X7X8wDGz4X2ohi81d
	qf4E+DU65IqOvUPr1wc+76IBOrGF0nDpJRPZNxCmNGfMPnVrt/TrNwy7QwtnnCB4D+XA4j3B/da
	ZjGuc6FVctvkrwyzig+MkkIvm7mXrsvweYDJ5bIYK82JiadkqHyqHV+BBww+HZ3ww6G8V10cLqE
	x+6M23GCbKBe1YNbcg+x7h3l6UJWE0l5A=
X-Received: by 2002:a05:690c:6c8c:b0:794:a52a:ad12 with SMTP id 00721157ae682-794fe7adfc6mr2443197b3.59.1770136901139;
        Tue, 03 Feb 2026 08:41:41 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794b1b8ef9bsm76625297b3.40.2026.02.03.08.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 08:41:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 10:41:27 -0600
Message-Id: <DG5H5NTJ6XUG.3HP45FGHNNNLJ@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Giorgi Tchankvetadze" <giorgitchankvetadze1997@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Remove Yoda conditions in
 rtw_get_cipher_info()
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203073516.20175-3-giorgitchankvetadze1997@gmail.com>
In-Reply-To: <20260203073516.20175-3-giorgitchankvetadze1997@gmail.com>

On Tue Feb 3, 2026 at 1:35 AM CST, Giorgi Tchankvetadze wrote:
> Convert comparisons from CONSTANT =3D=3D variable to variable =3D=3D CONS=
TANT
> to follow modern kernel coding style and improve readability.
>
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>

The yoda style if statement in rtw_get_cipher_info() has already been
fixed in staging-next. Next time use staging-next when creating patches
for staging. Thanks.

ET
