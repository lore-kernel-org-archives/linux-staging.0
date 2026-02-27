Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A323313E
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 02:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772158855; cv=none; b=m+wm9odCNlkKTWL34wBN/T9S2xqR2kdvuyzVmNn6toAkORLjRIrd/cmgde8TikvkYXUCtlD4xCBp5EEd7Nw9adzx/UxOI5Xa54YK26Q0IdUJROe5J4J0IwEHP5quagrEZ8qO8sorGqt2GGoziH6MI95a18Xe3yiMZQcPnxNx4HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772158855; c=relaxed/simple;
	bh=LXeFjjOp2fg7har3PKEIv8Ryv/Jylbc7FMNWRz+lsjg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=peb+yCY/Pug12TRUcRCrvDMTDYvAY7QxVTLaxVIU9U+rWOYSZefi6Eh/8vr71Okclo2L2yVBxGlyst1vYfKOKzBxI7ETij6yRWLpaByQn5XL993seeQQqFHxbRbF5AVOpNgbyd58/Y4Nqd4zmY2xb1QsBaGj5HU8KkbkpHQXt6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBMppLpI; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBMppLpI"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-797ab169454so14893407b3.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 18:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772158853; x=1772763653; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXeFjjOp2fg7har3PKEIv8Ryv/Jylbc7FMNWRz+lsjg=;
        b=KBMppLpI/RY1YP9wxIIHleUeLcNVRxu7qTvO4l8dX+RkPjJMalzHVQ6QRhz0ePBJIF
         UaeIDKcFMxCudZ6/KcbVJbuUZihyZSK4Q/PlbC7gYk/vTwQvdCnCrzr8Ed6Xf8yUJqNL
         0pNv5k0Yw8x8SpMZwQO9nsZbU8ATf2/LPabYwhb4fLEOU11PniP2d5MhYzrwJ3qh/FMI
         pwNnxCcor69EgzpF5YuPZUsVVLir+jrjO5PMeAWoad6TQ8P4VQo+8Jzy6gdwX5wiVmPF
         Xkj7k6oOhyUAy1Y23p3fyl75CJ/S3bfgCwionYU2IvBSw68Gc7UNXg69sNrGWnCFkyeO
         y+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772158853; x=1772763653;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXeFjjOp2fg7har3PKEIv8Ryv/Jylbc7FMNWRz+lsjg=;
        b=KUd3inPSHCHC0br2SJSHuGM40/MsYt/CNdDYeOAdQlseucWQm/WFd7AIFNk2d2XBQC
         ulP3vri18y/xeOpcoOnYcHmKLWhCPSNbcm0iwA2YapBwp6ssuRuQrStrqjxK6xaNAt73
         OK4xtqEVNAHCXea3BcBsPcwiewlYVSHcq1mHR4V7JwsHchUbj4Msm6eYtjMp/MJH60A/
         PkGZg8VTyxCu6bkcFD5TqObRiwODuDeAm4tr4ZhWFC3o/Se/UifwxCb/4VEKrMTCxrLA
         dbAMcRLbgyl3KkXSLMlB4wfMnmFSDusF4g8ETBirxSb6hhw238NrN4x3eMRMnIjhC9Qt
         gpRw==
X-Gm-Message-State: AOJu0YzWfsZxKOe9XXAtgmVfesUsPI6jHLIsZunKnpwH1hZ5CqGvIXY0
	RP/SyNb/X7qDOrU06310LiB5CBnwp9FtwbcPNX8uutk7Qxwm7d5almBY
X-Gm-Gg: ATEYQzxFptiEsYDgnBSNR2IM4e65qCAXxCeNvFXpR1Fh6SFAc5a3NmcttR99ss/o8wA
	xPl/MSOkxGH5L7cdiZfYMs8aoJsyFMPCd67I5C2TAHqC03BnxeuNSsyZBMAJsZDKE6OdVKq21ZO
	zgiaNRsOs6+S2haFgoKzkK2rySg1Eoz2/Q8DsphCBM7JHX87kmiCOn56lKTHu+q3YX6nW3lGv27
	nnZ2gk31XPYImuUSmqHURQMgJBp3Ipn+AjkJx2VqqTUgc0Q5aT9xX2j1D6/oOpIAvMyY3ex4FHr
	yVQpW1UzusHZ8ExgSH3Kd2nRgHUWYy3McNmGO3oXCvwgMi6fou7nzsMMQddBT6vWc8NF84TNwqT
	lr/IQNAgt5EkHxMko+dWxJh92Nb14PpcJjEJ0seVeSCXWfFdmmrF4TVzXujQEgqo6rYi1ZqxcuH
	rEmRr7yNzwX3+LjrOv2GVb+tRnizWCbyUxsjjMFdTb7RVjjnuvoo4Kt2LcW8x3CJfbTTqObi6IB
	jj2uIK7Y+IOpIYBibl0UvA0CeVtVGtPwh9IjH8Vyp8=
X-Received: by 2002:a05:690c:3685:b0:794:fb7:d572 with SMTP id 00721157ae682-79885655b4bmr12296057b3.66.1772158852958;
        Thu, 26 Feb 2026 18:20:52 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a9004dsm16262967b3.6.2026.02.26.18.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 18:20:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 20:20:34 -0600
Message-Id: <DGPDVLJ85X5E.25MUYJLB98CG7@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove multiple blank lines
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Gabriel Windlin" <gawindlin@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260224161319.89187-1-gawindlin@gmail.com>
In-Reply-To: <20260224161319.89187-1-gawindlin@gmail.com>

On Tue Feb 24, 2026 at 10:13 AM CST, Gabriel Windlin wrote:
> Remove multiple consecutive blank lines to adhere to the Linux kernel
> coding style. Issues reported by checkpatch.pl.
>
> Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
