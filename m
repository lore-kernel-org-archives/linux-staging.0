Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0419E347DD
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 21:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768168543; cv=none; b=OM8pC+lFdUI5vGRnYDYCdligL4T524CvaDywHMnipZz0TBse8pexuhIZrN5OHeibOE/fvWgNgMtJqr/2YsJqtyU5bGyhG/Q9rQJbb1ykvl0jFa+I5YmJFZSXNTnzKP5sRqFI3CkMzF0p47Xw5gDakEAwd3CSHxuoZJCXO4nWGuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768168543; c=relaxed/simple;
	bh=U+gntgDjTydvmopQDE2RRkYaHxrvPCyvUwNyZCmmSto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5EmbOIDY5ba45l6n5MOMZmkpB+SoQglKX1wNO4XTYEnCzTwqkgDg6gwkhaoTRTFnJAXH3kBp0g/aoYkcaViY73K7NlZ/19ftW+G79m+1hvu3h9m0/bg+vjed0NTyEZvgMKBfNGPn5ybDX4RA1PVmh2o+0J9iFbTOG1XrV1t8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEjuO1CE; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEjuO1CE"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9412f43cb9eso3760479241.2
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 13:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768168541; x=1768773341; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+gntgDjTydvmopQDE2RRkYaHxrvPCyvUwNyZCmmSto=;
        b=eEjuO1CENoD5cjHapTjmZhLwTOM1nVxPOnwJWDSPdze0JKnTGv5mCnAoalVddUOQ8S
         ybZqMb4jThHqrOl1IduWvj7VceHDT+czVu1Ya3YX23dTFZKZATTu2iJq/ZbOqmSZFFZw
         E2hpxFrADZNuCNVBwMAvt1ZyiM88uFEPU49tnH2MxfHarUmnw1jWgueHK2wota/01R5O
         jyfZ3OwLeAg7x39yyiZ1AaJn8LtcyhUlOn8GM/IT8bZL520cD7yFywLrUzR/+nSbo6Ey
         5vlWJHlLXa+RJDjlS/iSw1VPltcEXHGq6nyH/XNwMOXafcZ978knlxafFd5ddLKCEaB/
         fCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768168541; x=1768773341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U+gntgDjTydvmopQDE2RRkYaHxrvPCyvUwNyZCmmSto=;
        b=s7Y2ObiZKwA3UMo34dZH42va+sIOEiU/tL3tIQqizDnP61eXrmBDNEbBO5qJaWqSyf
         v3Ua7xje0s4TeHfXjI7wbR4v+47Pvc4WvAZaM5rYXOAQhHNtpk7kIpfJkIIvGsy6xi3w
         Y4bG3sX+tFQ6wYlGmlE7tijTy+AyM/cxlKIjukbQRv7dY1kcH1nPzmfo+OlbGRHGmrYj
         XIemGJFmY7CrMH6aYcPMJ/RVvdfgsKFi9vMQT6TiaBcYpd8diR1en9tLFrK1Y9fy8B2S
         5dqMpbodijC9rY1FT46uM2FhkInDiOgg7WIwOcQKOh23bauM9jUL2qcgoGrwVo1sPJy5
         xXjA==
X-Gm-Message-State: AOJu0YzgdZYGZ9xKZlh7lOmwFfW4HPWxSdQnYchFbHdnUqhXocODao1U
	c+keGD3oXh9FwWy9uelM4TMBQaBURUv6e8928/Xfd96oDlkhA8nKEAuxVnLicYl/KurhiULUR1R
	tTbjbTODUVxLKmxNqvd2AKKC+Sh4ONxU=
X-Gm-Gg: AY/fxX6NUBCtydJn6Rr5KMWtgZ85NY+cYvCSLV7aS4zNyc3YFXbQZHIckAWS7WQg+dB
	flkeNPmg2fVG/10vUBbsegP/3GvdmLhiB1rH5W39k3AjvRI58/2fstjRcmxIhQsBoUNlJryLxfM
	khrR5kKe2BWnQTmDLFi8h+j12WfXMe0LDd9Zwfgd8y+fK3c53HZnpLV57UBjG1mUfKCCRUSLQ1H
	0/W4WWMqOcXcPtG3+4hnta7vVbFpXKDRi3KOZEDhc6TJZHZ5F2bhYDcSY5vi/f6gZGmtZZOqUZd
	G33H8+sAjiDISHdBQLkLE4cNmXynpMlPH/nlDkmkO+vUGlE0KKz8ujOQb/1jFA==
X-Google-Smtp-Source: AGHT+IGtRStQFZla1v9FFnDTlOm5bfqTFZ34EyTMAolVW1v8yjJTcYI/0CqYvQso00Oq5xZY7v/tUP26XP61P5DyHdg=
X-Received: by 2002:a05:6102:8006:b0:5db:28ef:3dfb with SMTP id
 ada2fe7eead31-5ecb6962414mr7383664137.34.1768168540836; Sun, 11 Jan 2026
 13:55:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108002629.25984-1-iwadjp@gmail.com> <2026011120-appraisal-coziness-23e2@gregkh>
In-Reply-To: <2026011120-appraisal-coziness-23e2@gregkh>
From: iwadjp <iwadjp@gmail.com>
Date: Mon, 12 Jan 2026 06:55:29 +0900
X-Gm-Features: AZwV_QgjIwlYYeC2wA4-rNur5KRaIYrIGimcgaS2bDUljdwMvnA5JvVoPq4SYHk
Message-ID: <CAJia8+w+wChNodbREcyBzW1=XLHyK8rKmfY_mx9MFL1yLqUT7A@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove trailing whitespace in rtw_mlme.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Someone already sent this change before you did, sorry.

Thanks for the heads-up.

I missed that this was already fixed. I=E2=80=99ll update my tree and look =
for
another issue to work on. Sorry for the noise.
