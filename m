Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2093093C1
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 02:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769827096; cv=none; b=nLffO3xvxa5QzYXIwaOeRmcSxoZd5/qZcZtAFb04Eg9XAK8uHRomsRhAApThOct4SGh5YFy2XJ8FLc1XRnrB7zueui7p0wwE+WOeFKd6zadvJvQ/rnyL84EQkN61Bwzu03KftuIn6nmmPiX2gT0HshNyAzp8NZXxqkmM1Ve72CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769827096; c=relaxed/simple;
	bh=VkmQCtJzCXXjBpOwY5DvXDbXzQN5QVFOehVQT69eugM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gv2z0NjkWh0NLBik2EINBfHcCmM1y0s5yrdU2j9v/52EJ+oJhqg+Evdx+o+U5+Vtfrx1Raz/LgdrUu1E2+42TFuqe75nHAvxT1/SENPdgfMxC5AllhZKReIepnRq3+D9l+8LdUccJwHCRa1O3t36QpxS7g9wcY85XOpeGg+bgeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIdpHcqg; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIdpHcqg"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-794acb33578so13040697b3.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769827094; x=1770431894; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkmQCtJzCXXjBpOwY5DvXDbXzQN5QVFOehVQT69eugM=;
        b=jIdpHcqgHt6Wvz1iHJBRp5KSx+POZn2o7rYDLZETy/rpnespD5k9UQxJ3fbZNBccdP
         0l5dMRfDCZMRhgCPsdffiqLR8NVUARplc+nrksrgakbmk2G/wyX+TEmvC6mod0ZdR2vM
         90+D7r3hU/ek6aCnkUUqOKEyFyNedLTGl4aRj0pGpaOJs+zCPg4A88czdl+tMIP37Bjm
         1r9aY9NqgMbFH83bGc/pmBxoGNIQVNBIMnuosRrAslLjxcLMF8TLqaIgXOp4mK6JYwWy
         GdOJ6Ytu0I7uqRLnTRSTR5mPJYb0aDAzBhY8qnZWVASIGaefliMrQm1fvuUkEabkp+D4
         xYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769827094; x=1770431894;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkmQCtJzCXXjBpOwY5DvXDbXzQN5QVFOehVQT69eugM=;
        b=VK57f7wyD7xMGZOAygACKD7kDiG74y1ChU7GPRyWCCM2eOk0nqJxemlSA+79s5zgHC
         OLIuesCvE2E9GUGAbf2jFn2rq3fEi/cc3tUGN8AtuQkL2A4j2m7n/I/1ofoC9wlN37+4
         pgp/P30PPGxVaUPvhavrkaUD0ZAVVj81ShAmokV/MRKI+vt8K1277uIBVnCyXbZgXn/y
         PSEF1ZJ0eYqWJY7ccqXGv3Lrid/GOrWrfZrNO2XXs+7Km9O63SixAh8Q8p5koev/VvJk
         lNYA543wN6Z0YjazmjscQ9GJrdHLVJp5Q3XqXSuKV8BCRccEbk47uYX9Eo6MYg/tTxxQ
         c/8w==
X-Gm-Message-State: AOJu0YwSAGMPxrdjwmn2emQHHQCEja4eBF+5mc5OBDFCmXUXOELuEzjp
	Y0VSQ+2vq9N128cyEPt7KVuEFkuZZpLlA9ouTagSqfzqYxQ3nfxGorII
X-Gm-Gg: AZuq6aKKcun6CTbJE3ECW24y53bUpnHR9Gy7wJsf3972QVdVqAZn+Kz9imKOuqzrhao
	o3AqQ2Rowd0PaERm+L97qJdKNARWUF6naxlEHzPxRZaRBKnZkfhGE+82RXyG3ka64+aUtmAQRCA
	deF6rDUZ6QaffhqP2jCluNVaUT/zjsSz9cftF6SV1dFcr4JtQ/mEtTk1N/Ekg8KEuPTGQcH9b9T
	1IO9v2tJHBqqLtnRgOh1GCxwEhhWAVUAj7NHq4kh5DhKebIuLDmzqAY/ydSg577gfKzuq/AWJOV
	u+YlqPTf24iqkOmja7w2wJujVcfdVQc00kpXoV1g67UrwJskDGJ2iB7XGtOlkuFhbCn9MPrEXX1
	tZilXxKvUIa+ZIhTWzA064rE8NlqKuLSP2WLCR4aXxdLWz92AdIELsyHNW/z9Uj6K7uLB3o8KZf
	aH1almLPQMA1BtVGvtnr5Ix/8n8dRb6mo=
X-Received: by 2002:a05:690c:f96:b0:793:ad45:8e8b with SMTP id 00721157ae682-7949fc28199mr41826377b3.19.1769827094218;
        Fri, 30 Jan 2026 18:38:14 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794828f74fasm42413457b3.52.2026.01.30.18.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 18:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 20:37:59 -0600
Message-Id: <DG2FC84E7CA1.2L8B6329T2UFL@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Fu
 Zang" <t1468150755@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
 for small delays
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Fu Zang" <t1468150755@163.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260130130803.42858-1-t1468150755@163.com>
In-Reply-To: <20260130130803.42858-1-t1468150755@163.com>

On Fri Jan 30, 2026 at 7:08 AM CST, Fu Zang wrote:
> From: Fu Zang <t1468150755@gmail.com>
>
> The msleep() function is not recommended for delays shorter than 20ms
> as it may sleep considerably longer than requested.
>
> This patch replaces msleep(10) with usleep_range(10000, 11000) to
> provide more precise delay control while allowing the timer subsystem
> to coalesce wakeups.
>
> Found by checkpatch.pl.
>
> Signed-off-by: Fu Zang <t1468150755@gmail.com>

Apologies, I used the wrong tag in my previous response. I intended to prov=
ide a Reviewed-by tag for this patch.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
