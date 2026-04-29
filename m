Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884232E75A
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459592; cv=none; b=O+xiNH9KTr9S7jRwkZg/You2VUGPyEW5rac6T396ieJI83PtSvtpK2ljiHSqOQGS7bDKfOihm1zKSQhrdE33y+Qnga8UmUtd2fGr1jrltT2s7XOHAvDN7u7wb4n2SAyPYGLKk0i7Z5gwITyzHxBPJuq1l5AmeCZqklfeU362hbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459592; c=relaxed/simple;
	bh=0+k8yH1R4pnAHV4bk54a+O9aJ7Y4OdbXGKGPcZ70PQY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=L392LTg1S8LeMt7J+eygb14hQKStoy609bbgDVt4912Dcx/d8tHYC2IXCOf1/HjnBQOmPIgi9nRs+DfBf6RX3AqbiEToD9dMXMenhiyImhEm0jibGBim+qu/T8BOBxblKM3/kz4kNfNgVG/rLuCy9nfD3dCAG83eKb4rV4aBWeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4OKoS+m; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4OKoS+m"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891f625344so8022765e9.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777459590; x=1778064390; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs38EYS1oHbhgLGSw3mf84e3kmfuXdfD2i4s9PpucP4=;
        b=e4OKoS+m/Jxr6hR6pBEx3w1P5EUzVYyk9rRHDPHtwao5jQaS128anDdNDCc8KiCkbc
         LAVO2aXTJ7kNUPJORnDHi48Dc1ytiJ8z0FU0+8uciiIW9D2Q2VjpjPclC6NeqRvdLfar
         BUP6s3BKVqE0vYTcvnmA2NCAC3B/6lNDW5ySRzoEGNqpVGVxK/XBOVgiz5j3c+30LNQQ
         3/I+hOxf0UAj4VRYp85zBsupv4kkedAkG2lmNLwZQEpbgMziimPe1KEC421P3xwDvStZ
         UlekSUW2BnkAlOwDZQ/rknCYQAZ9SOTB9Xvka02TqlgDqLPWGMHSKLkMbunWcEtCGJxI
         02kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777459590; x=1778064390;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rs38EYS1oHbhgLGSw3mf84e3kmfuXdfD2i4s9PpucP4=;
        b=dmQvMrlHf/An+tj5MgM+9V05oK7Rx+y3X6oRX/4PrX4wIuzFr6kqaxivinlqAhSFkI
         /xBU8O/XELkZbVB0IdNeC6NSZ8iCYdkl8Gw3X74IjSuzYQby8DrAz9s8cgN39nWdPh8d
         bVkZQX2Rc7nF2tWeoZV19sFYgCPmNGv1Hc0MZABRm60aMHJ+d74irX90wRUQCOZdD33f
         cXzwvZvExy6Pm+hytz07GJ+FwdBGATVdZ5Ky+Au4xjKm5MWk5MmbXVc/x9TCrU2TMK5p
         lnJ8uthIPjGNDQjq3vPEFUqXwobp2R3isCT8pBzhqO9y/7RKrVJ3HrY4DDFF44hDgHy5
         8SkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UuYnZM65w4YjUtBSoveKwfbtd67Ut3A1odSrV31J57p6GC/oxAyvROauZE9gJc5h6NY+41uKTWtd1fHj3@lists.linux.dev
X-Gm-Message-State: AOJu0YyWTFO1GSXbBThDPUFL3TON0X4bOdTev+e3YFixfIZLasqXC2Xv
	msBGpskXCQA5tR45LobGNohbnB7MGEMtFMhPoDOBW7qn+8ZZcDRb8d5qF6nWkA9nyv8olw==
X-Gm-Gg: AeBDieu4clQwv9dUIy2BL7xC2rQMb95o6PnambSDbnT9kr/I+puQk0fa+tlhJtRB6JD
	5SfOyQIAadOFhksNru61jPdE+tX914/2e6OUjfGs1gqpbWmemNMwMcCZP4QV+xDT7d4lANskxOv
	9QcGMxxpowusJV3Uv0w+0uEO+RGtyiB/0zGC/cqOPVrDkxLFj0q3YXaKy0uCt5SNTwO4icwCrWB
	5DPXAgMAo4kKT2LrH126r77JufZr2KYGgnbSm0Xn0/4ibKFlbuLUt1JwEgtn2UV9bfp5+vsy+vx
	E8GhuPiVPP+YK9YmXmUtojSbZU7kc2dlFYiiaHiN2uTjJagaQ8Mtk+gomguSWUJC9mbWbdxws7m
	mU+Cg0PpIi4M0qDwC0LTNcrGfsmdGHkJzm0V4q+XQPhrE+wrrzxEMuS9blRoe7GgzqLdgW4him6
	fYiX7iFBPiMU2gbA4Z8zhMWGSd+4WMpzDAWvmcnNUJwsn68G8Dnpf7ccfg08hdF9F/FRa0PeMN
X-Received: by 2002:a05:600c:4f83:b0:489:1baf:8c03 with SMTP id 5b1f17b1804b1-48a7bfb5b1bmr39954335e9.11.1777459589837;
        Wed, 29 Apr 2026 03:46:29 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc11fcbsm52963265e9.3.2026.04.29.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 03:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/8] staging: rtl8723bs: remove warnings in
 rtw_btcoex.h
From: Linus Probert <linus.probert@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linus.probert@gmail.com, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
In-Reply-To: <2097F9CE-F003-4BE1-AEF5-0B30294973FB@linux.dev>
References: <12186A7D-522A-4900-9E4A-E2B575930A72@linux.dev>
 <2097F9CE-F003-4BE1-AEF5-0B30294973FB@linux.dev>
Date: Wed, 29 Apr 2026 12:46:27 +0200
Message-Id: <177745958799.1254637.4289009650997698120.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=734;
 i=linus.probert@gmail.com; h=from:subject:message-id;
 bh=0+k8yH1R4pnAHV4bk54a+O9aJ7Y4OdbXGKGPcZ70PQY=;
 b=owGbwMvMwCV2OqdW0O/i2pmMp9WSGDI/Pmx575XhI7P9Y8nqi8JbdpYk/gop5D8bEHDlyGPR9
 2+FssJ0O0pZGMS4GGTFFFn2d0ZyNc5f2Vt7AWEOKxPIEAYuTgGYiEwlwz872Qe3JmhVa/1vNJ23
 StDtTLNxuY7sYdvAqRP2Wzg+nPyRkWGJkt8Fg0Oqq9apzUj3FTz+d+J/Lj1v0wWu0zyeKhzytuM
 EAA==
X-Developer-Key: i=linus.probert@gmail.com; a=openpgp;
 fpr=CFFA060FD5CF9FCB9E3637DC640993AF63BF6854

On 2026-04-29 12:24:53+02:00, Luka Gejak wrote:
> On April 29, 2026 12:18:12 PM GMT+02:00, Luka Gejak <luka.gejak@linux.dev> wrote:
> 
> >> This series eliminates all remaining checkpatch warnings in
> >
> >LGTM, so for the patch series:
> >
> >Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> >
> >Best regards,
> >Luka Gejak
> 
> One note:
> For the future cleanup series, feel free to squash identical logical 
> changes into a single patch to keep the commit history concise. It's 
> up to Greg if he wants v2 but logic is sound as is.
> Best regards,
> Luka Gejak

I will make a note of that. In this case what do you consider an
identical logical change? What would you suggest that I squash?

Br,
Linus

