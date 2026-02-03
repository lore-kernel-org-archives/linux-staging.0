Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A01547EE
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 04:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770091909; cv=none; b=WQf7qTb4Ij3rIlNPG1V7cA1BY0LojLhPxkfjfbsGKH4LoyH2OYoY/vSR8gyU4nIr4gzNGxfDqYPKgQGC1TnfY2S/YpVMRN+7NKwJTFTrjYc5wZgMlCOed4oPZ/Ua3CTEGZ97gPqqBogHPEbANuzUjGbaUZp9SgJs7D9ZiH2xHNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770091909; c=relaxed/simple;
	bh=dbmr7QJu/g6BeUf8CN2Q1uOIKv4BhQNnz+YuZFj9ZQ4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=aAtVNv0VxfXjpxhiyZladG0o3Q9L+gzbwPYTqbLy88acX5m7NoYNk6s1d28d9+aZTWnUj816VPP5lUMsLxTCcCWYVDJQwGpLpQuAhCQyIb7dqZ1vhoBvL/asC8ms36X0w+y/7BuJ6VnkWIOM4qP1plDzj7zooVyb7NR76fr7Nto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5cT3Qni; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5cT3Qni"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64937edbc9eso4604154d50.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 20:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770091907; x=1770696707; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbmr7QJu/g6BeUf8CN2Q1uOIKv4BhQNnz+YuZFj9ZQ4=;
        b=X5cT3QniWAKPx5ZFOcSV6IaXeRJMtbs2oU4OX8D5lRzMiNUcoIFQEHl0k8oPcqlZqZ
         nn/sjlWT9RETQJGDw4ahYM41WejTQcnVC6Os26LdAFDAGBdjW0nNAbMRZwTSWjUn/R3L
         IKw9ksRqVgQh8dfRWT4o8sbWb7hOfQF4RPgI24tYc2XJ3c8Q3JkBbRpJdQwbqfFqxN6U
         yfMUiIa/zkNdsBg77QA9kd7O7erhigPlnr+KZBBU2xmTCG0ekHOMF/yY05132HXsCi8M
         PxkOGvFliwvNYjMjS2xtekv8V72Coh2sRNj3nCMTPNGQcDXkyg9h1OVDn95e09OXlN+p
         dwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770091907; x=1770696707;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbmr7QJu/g6BeUf8CN2Q1uOIKv4BhQNnz+YuZFj9ZQ4=;
        b=q3QUNr2JN0h7JIpLPhLy/kujiQ9e3da6jdfjClHaXc0JT71k3928XCGfmG1os/qoe9
         6kttxFPDFfjjMqTm6ODvtkVkfrDI7IC2ckYT9w0+y6pemCdCAZ/kdacPy/Qo/69H+DTs
         8pw7NnZlnY3Uce6LO6rM3ZDevxqu+BJDnzzdBC30BA+jkr9dBSMtj7zQVFTMvqgKLVEZ
         gFVAsMUUMIVzCLrl6wykfVwIwdVfcIr16T63QJ/b2Zs/WHils55uTMfRw0MKaKsx5y7l
         RnZnR4xXH2M2LjquHbbGmATnaFqibyG0pejshhIXijcATX/7vStIzbyNfZoqWaZVx2OD
         7fqw==
X-Forwarded-Encrypted: i=1; AJvYcCUJYWZofBwrBzh1tOlBezdzjY+Q1UDGU7T5KZGVFgGLgyh3eC1VZ/YWz62hepIsZBMnPJsr1+OpLcOjan0F@lists.linux.dev
X-Gm-Message-State: AOJu0YzZmFGmcab03dgFwHUP9F2ptMpuxKhcSai7TfDv9Ofv5G81m8PI
	U0IUDl0+mHmvLtt9iMFM7VL0cTfdiBA6WscYhCDDtdMrM8FFdLubw2Ya
X-Gm-Gg: AZuq6aKK20UB9Yi9S+DymsEcBn0uylIdKTpqocoJNKA/PqyRIyCkjZgjKGWVfivgyK9
	Bn+81DyarvqbCC0KvhiKX8Iasse2qoMWvQjJxm4QiXwkHNl2vb+ebcilgMJ4jwyCYSu9E/PyW8V
	rqHnTCAPQ97DJpdptInj0cppjccVzQfZ60qrPqWlf1wGch0K3TINpu8j/VSS8ziaQPKByw3GjJ/
	isPw9ESrcq2tRmCptyJ2ascu2rjHcJhA4DsZjLBt3Xt84SjSyXsGin1ybLqFW0a+i7FpDDfKt4g
	ELy3bvAV+JdViT0uDXCDuZ0ZEn4JEEIpIpXj5M1ue1eQg15m6TMm6IwI1b50ejvfE3fboUD0zfO
	Zt05IP7EEMddEROvil3Gzi60uEj/C519iTs1dvSb9FmTDl6XYVI/UHMElJfm2tXIbcVWeSPK120
	qLBoE/o47O3t4QQ1HdJ5L0xgo4xd5Dy1M=
X-Received: by 2002:a05:690e:d8e:b0:648:f591:f94b with SMTP id 956f58d0204a3-649a83f06dbmr10400878d50.30.1770091907391;
        Mon, 02 Feb 2026 20:11:47 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649ca8a2230sm3028211d50.14.2026.02.02.20.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 20:11:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 22:11:32 -0600
Message-Id: <DG517H9WXTS1.HBU0CK4M8KB@gmail.com>
To: "Dharanitharan R" <dharanitharan725@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <trohan2000@gmail.com>, <bqn9090@gmail.com>, <straube.linux@gmail.com>,
 <hansg@kernel.org>, <abrahamadekunle50@gmail.com>,
 <davidzalman.101@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Fix inconsistent indenting warning
 in rtw_ap.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260203014315.23897-2-dharanitharan725@gmail.com>
In-Reply-To: <20260203014315.23897-2-dharanitharan725@gmail.com>

On Mon Feb 2, 2026 at 7:43 PM CST, Dharanitharan R wrote:
> Fix smatch/checkpatch reported inconsistent indenting warning
> in rtw_ap.c.
> drivers/staging/rtl8723bs/core/rtw_ap.c: fix inconsistent
> indentation.
> No functional changes were introduced.
>
> Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
> ---

Your commit message says fix incosistnent identation, but the diff shows
changing a C89 for-loop into C99 style. This is not a whitespace fix.

ET
