Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12BB3EBF09
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771685364; cv=none; b=IBZU4WXR55XEi6hthjTrceEDiemNK0W6L39dB31l348tTI5pEzqVzWK+bNIUGXOYZxcyNAI5wo6p0qAoomsy3EWibG0QZr2eY7T2ebJqCOb65C8CHcoH25XgV9nxc5edDWuvyLdk1FjHSQ9TCqFalgFwcRBnbzM3oURaDTBT0+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771685364; c=relaxed/simple;
	bh=pREf+qyX1vumGMBAXQaqWqr36BNEjBCG1MHmyetyuvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hferiZOJDgq/YRVCNfSwuBBiq1ZiRFiuTTmLOj7UIQATWVLp5Wfshd7Ni9aSleY8JGau27CmDDBJrl4WZMvbe1WvogR7ha7z6MZnvi9C4U2AhONQxMQzWU0L4js2S8pFQAgqqsuiFKhRf9AHmbAGrArfzxNU4g45VdzijnPpsvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgMznUZM; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgMznUZM"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43622089851so2997234f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 06:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771685361; x=1772290161; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2mH2Pv5q9LhQ4QDbZ1o5xmP0qlj2oKymwaA5Jra7J/M=;
        b=ZgMznUZMRCmTuAPOtQHIqfjC612yMNi0KKk3RYHnUlpce5Rr+BWt2pzTbXJUVchmkQ
         i6xYKW9DpBHCWton0RD1l2mLZELmQ1/rqFk5Al1o+MUhYHDabBUEu7WdW4N9AEvnQm+E
         d+iIz1asbi68tPRDecVHQfOOO44w/8zXRWGFD8ZAU70WLgThQQBUUIcvNgRBULDBaRYs
         AjGu4xEPlGuJgEL5Yrwl3BnN1zg5C6rnASzht+G6IUFUmE0ETT5jPv5eXou3+vmlPvE+
         v8Cp+g3IUGhDSBrtRrbvYX+3OYzmGVmKfuIR/8C53H7FiFmq55tIjxeHIfKBK2knnRtS
         oLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771685361; x=1772290161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mH2Pv5q9LhQ4QDbZ1o5xmP0qlj2oKymwaA5Jra7J/M=;
        b=euwdMaFctYMpjihph7y3lEK6fWDgdFKynL4I3+qY/tAuGJMCWG7u5Dr7T7Cw6LANYM
         f1UVdxL+yGBvIjKfEUIkVa6lydd6unQIk8ZXlXpi6CxaPLggNKx6wvWs05c2VZMdoEgg
         HRXm8pvVtsqYf0DnWQvYgXhJH9tNgzXaAEQe/PpelEZtZlS5zLQCBO7iFT18lxrDDdtD
         mOO1wpC5Mw9dqIIkJFLpD0ZVx1HOdjwEBv80u1oBLkwYhBiwUOj43pAklcGhlueEb4S6
         Mn7UhVbzGeMHFsrho/z9L4CU4DziwLTlS2f90tE/5jyJUFWQjTjtamQHakU6/+X2yBXG
         hEhg==
X-Forwarded-Encrypted: i=1; AJvYcCXFKFhM8hIjthbSg4D0z1q/bHLw+F5tlVh+wkg0aN0seBeGl44u4wWX8FV5bYuvNsP03Gs+cLtAvwCJXJG9@lists.linux.dev
X-Gm-Message-State: AOJu0YxvjnJnb962CSvrWaABJ5hOkkNKUHYCoiFOVID3HTa0Uo+UxR2j
	djWX+D2hmm+/XkDlgpqClfM14XJuDtCT+yLGNIY8tEpltLWAlvK1/DSn
X-Gm-Gg: AZuq6aId4V+Cp6BOBuXt85ONQrd8vzPvWC7sVdQHTroYt4dEj3e3738hwhHxonkrN/W
	hLkDLcnugBqAmLOwSvuo7aGUTzf+RJXHscUnEqErGVZSEcGcjG4YCGhX9O7KraHgVlGFkKYH4GA
	gmUpkDWqJuIunwsFh7J4+u6g0VJNpJouIjcEJXYY7rg4m54q3QvbjX5DIRAJLChfqZi6nY9ssTD
	khbpDPCzZIrJFUy8yeF6gfwtTTJhlJTGS9XnY6VbdmHEql/Lb7Xuq9JYhuZqDauQJSKC2442haJ
	8vCMq2XJHYPT9uuUbZbNZYDm5kzGqUBmhDBWG+oUWVEkMAJEt2eyMxbjt0gAQVih/qIgxwnfg9E
	28z0p3QP+sLsoBKMFpCazph6VXpHMXW1vNxTgzmYYgbUZK4qN+C4WPvGme0a7ZlYp3xawoVHxmZ
	x4vgGzoY+9VQ==
X-Received: by 2002:a05:6000:4013:b0:437:6bfd:c3ab with SMTP id ffacd0b85a97d-4396f189aadmr6008059f8f.51.1771685360932;
        Sat, 21 Feb 2026 06:49:20 -0800 (PST)
Received: from BERA ([31.223.72.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm5253276f8f.26.2026.02.21.06.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 06:49:20 -0800 (PST)
Date: Sat, 21 Feb 2026 17:49:22 +0300
From: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
To: Filippo =?iso-8859-1?Q?Muscher=E0?= <filippo.muschera@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, straube.linux@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: fix inconsistent indenting
 detected by smatch
Message-ID: <aZnF8mqKbiNIfH9Q@BERA.localdomain>
References: <20260208170247.7013-1-filippo.muschera@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260208170247.7013-1-filippo.muschera@gmail.com>

On Sun, Feb 08, 2026 at 06:02:47PM +0100, Filippo Muscherà wrote:
> Fix the following inconsistent indentation warnings reported by Smatch:
> 
> drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2319
>   EXhalbtc8723b1ant_ConnectNotify(): inconsistent indenting
> drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c:1410
>   phy_IQCalibrate_8723B(): inconsistent indenting
> 
> The affected code used a mix of tabs and spaces or excessive
> indentation, making it misleading to read. Align the lines with the
> surrounding code using tabs.
> 
> While at it, wrap long lines in HalPhyRf_8723B.c to silence checkpatch
> warnings.
> 
> Signed-off-by: Filippo Muscherà <filippo.muschera@gmail.com>
> ---

LGTM.

Reviewed-by: Bera Yüzlü <b9788213@gmail.com>
