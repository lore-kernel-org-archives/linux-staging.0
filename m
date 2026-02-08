Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04D934A3C5
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770586101; cv=none; b=oqH7Xpb9SySb7SE8lWCSRoVodSjQHjQbCABrrAeWbxC5CmUo1sSYGPoBKBOuwyvxuVp2nYh+Iy6peQeFvtrudlDz665STodqP2HLwPXzDC8Yi6LkY99aVvI9PWfleiSsfwbnxEDWScdB6DL0l1M2w4/WIwfGVsFbHlQHjCf3nSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770586101; c=relaxed/simple;
	bh=EPTcHJKMKKJBr4HjC9udGTBnC1YDXE8dodu9sLwwb24=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YxLRmiUh1rtXIDOZvV+O353TqtdE04X8i8GPUm3q2qeYAxDyXDLSNUZVMOairvmFCP6sb+J//P6Efk3HS3OGUqDni2QdXCEP0QHo8YYI4i8noclC+QRXx+vZEELFWtMzCZ5bHfG2LttQB9e4/mznYHBsVX4FrX5tDrj9bg1AX8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXelBysn; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXelBysn"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d196a2334fso3276481a34.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 13:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770586100; x=1771190900; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPTcHJKMKKJBr4HjC9udGTBnC1YDXE8dodu9sLwwb24=;
        b=VXelBysnyl7EuWjyrIZ5y10wQNKwm4t3KD9ECHBzYyFNGPAUrfDLMBVdywxgr1Tgp5
         Vvxrly15qjQ7uqS+s8oXyqN625CE2AHaURbgejKP94f/rQVsd+dIUgLec+wm97yweKbL
         U1kPHnVzgSKgvWApV+I8PKswe73XI3eubxVPi7Jj/oeRaLUi6WuWXj40ER9MZ5pZ6iqw
         CDMuPFovSBr636oui91jBFBR9HYk0jD6nxAkKMCkkvhtQybtARd05xlscqygoAqDIpum
         kG8Zl+QQIq2E771aGxukJTi7WtT+fckfA54by2qWP27Qs+sC/eAAEUDAYtjjUUwhy/bb
         Rmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770586100; x=1771190900;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPTcHJKMKKJBr4HjC9udGTBnC1YDXE8dodu9sLwwb24=;
        b=NztpBntIxmev6KEaMeeGlsX/+JPLUsu8uIMer5ILGb4TF0Cpe4uwaofui58jt35b9c
         0JY5R4onwqNd/80gJpbavjZ7etVRYwnwSLeJoFpXO7S/lUL8vWd5AwFOrTm6ZKyUzmes
         J9ADYz6QuEKS6R6xRUwZBfGRHVwqejG3psUAuTNuvJFagm26Y/GWH0UFwuc4zDzdxVpc
         7LYNR2DhjKgGR/Q/uuUTRH8J6w+5RnH1JE5z8GI8BbdDPVzKpTiXtlx9XFbxLEF5z1Wl
         p/HyfKDihernKjsc74HqBatx1K+L6Lls3ZZIw+G0IPPE/MHDNPVK5uuWTbdBLuWG5SsY
         V2SA==
X-Forwarded-Encrypted: i=1; AJvYcCUxpQ+jKOA25JyHKZ5HOJyHWYFrTEosS8WePwx062GdtK20adEib3ypgpV53Yfdt31xQSP6lr5oVln+Azbz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2LLV41cZLdXOO+jw9HXGF2LYV9w0zxLUh8pUKBaaPL3lmkYIO
	Uhh/SNaKaa9LdwxTxCIo19MbbVMq3eVe+gh49XhjAzoqstjVhLZ2aSAF
X-Gm-Gg: AZuq6aLxsJZoU0IQhWfvJY6M+1Kk4l9TgoZV/+J3e5UYaxYv/x5gLFzRMh0PiQPCS/h
	Oj/axxChTFh7XMA13nEN2VTCrmiixcJD+g+8agnsbUgiU4RaDcnmUlkpaMdKoJ0FHwgmtR4rivY
	MkwG+q9iXe6jz1NaZQQZiliYPyNBJ4b171/giyVCaGN65sIqxAQ344lg/HTEZyehORrHjEzlJO1
	/DBCk1F4z9b0eLTpi3N7PmByIsRyNtXpOmtlkIiEcwJbQTjdEvjSUKsx6FBWxXEufjbu8m3v5jQ
	Lj861279i4MUX8sSJbQ+EyH6rtSlAYf3BvyKvqJ4SJbuCmciUzJmICskvLupgEbu3deqGDFy/bn
	n6TNXY8HjdhGhilCF4RV3HXuMp7gSpxGwvI87Vm1ItZV8Dvqi7PULJL55A2yEuWVTJBZNjpHkGi
	2E2aHTHJqK11XfRUz55XT/QupE28ZmID1tj4yXMOGnlc0CNTIQMgS0IERGxNV7cgn5TwsUCglr4
	Wc81jszqBcRGze/yMnPxiZ0BTd6FAk3XiMuM856ey9JUDYAQWUdDP+vSQ==
X-Received: by 2002:a05:6830:3155:b0:7d1:9574:db9a with SMTP id 46e09a7af769-7d4633df826mr6103964a34.12.1770586099714;
        Sun, 08 Feb 2026 13:28:19 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:7439:3a18:1e56:a313])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d464796ffasm5993680a34.20.2026.02.08.13.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 13:28:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Feb 2026 15:28:18 -0600
Message-Id: <DG9WE0KQAJ60.1EIL0N1H5BOP6@gmail.com>
Cc: <dan.carpenter@linaro.org>, <straube.linux@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix spacing around operators
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tabrez Ahmed" <tabreztalks@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260208051341.38631-1-tabreztalks@gmail.com>
In-Reply-To: <20260208051341.38631-1-tabreztalks@gmail.com>

On Sat Feb 7, 2026 at 11:13 PM CST, Tabrez Ahmed wrote:
> Fix checkpatch check:
> CHECK: spaces preferred around that '+' (ctx:VxV)
> CHECK: spaces preferred around that '-' (ctx:VxV)
>
> The kernel coding style prefers spaces around binary operators for
> better readability.
>
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
