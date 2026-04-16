Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348EB248F72
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776364046; cv=pass; b=uXH3K1g33im52PYUDRyMyIt6tG3fvxtiUiqAMF8IdkNtdvGriDFDngKsHRTwdU/H5GHRo6PRWeZfH1PG+pBAmvoFWW/U31drUHSExNaef/V8NFFrbm/hIXpzqjnO4lIAFVa/7NMTViR9AeYaSFheu/ERbZsn2ukx/8baqRXQHp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776364046; c=relaxed/simple;
	bh=BTUQfZQIhu89lYlxwzN1u9+gqvPnIoweub2rOOYT/YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ig0ERt6YxvUZ9CEBWrv6Xa4m199k/iGFHMQVzFjZ9knGaB8fuNYXmbtPGpkTmLDz7zQeL+9M+IlVxVlpjD6CEwuNziGeFCrU9gv6dorA32wNvfAQgzL+q6BMo4kKm5LEmCC7P71LWoifuTr4OgB/ErB1gsJKgjZrGnFm5YSjG7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvlEdtrQ; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvlEdtrQ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-672713f953bso2255909a12.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 11:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776364044; cv=none;
        d=google.com; s=arc-20240605;
        b=julCPfdpQtHk+uygj3rH1gOFUNp/G7LWQ8iNveBZNs5cE/Isk3sB5lffg/ZFg4+7HF
         4kBDskPfJulAdpTI2xVGP3BN8XelPhWtcdqtL3iUlwgyWErvKzkzALLtyniDrHoVFnWz
         h1uvcioyKjFikeyuqpZthYv179IwplRDPY9ZVTFcK+iq0+fdYx+daLWXJutMZaC0KVc4
         NOyR8QSkFTSM5eIq7pTrtCBWnsf6edm56k7Fv0omxUdVT1kz4TaO4lBAIYhTOfwfF44Z
         dGITWRGvsmZMxdfRzHZQ6xdl/xlPwKc1ryjNQxuBpuJ9mXln1/7cdUW/g4/OY4+pJ5I4
         ZfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BTUQfZQIhu89lYlxwzN1u9+gqvPnIoweub2rOOYT/YE=;
        fh=TJqWQcGlfdxWQOprSF9DaaeFpaVq/TW1TAnOr0oGprA=;
        b=TirW/ZGQHPVteOQRixgWGwNTUHOoSMlIEkJcvef1jCDX09V/z3WeCXQBm3nSOYdzHJ
         L9SmkxAoIe5v536g59/5kfa98qusKmKK/banIbE5Gpe4Wj5I1UuBQVL8z4sfFAnAMATh
         7JUIkX5kypquheFKB5PK/pbnwW7OgpcdoWi4DWi175XEGt/frQINCs/tm4dqT9/bkTgh
         Lo13nL1UXemGxq3iSSzM7ZOniINsspXIkHpuWNQNG8SEBkk0M5w5234QXaH65K0dczoR
         bN3EzjUE8ocffZVutiJVYuZDOSP7pW4s85yLJfdH1ZJ47wT3hErDgO7rrOzRAPmSHBma
         VbDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776364043; x=1776968843; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTUQfZQIhu89lYlxwzN1u9+gqvPnIoweub2rOOYT/YE=;
        b=XvlEdtrQGhn2IzMg8YoIroB1oYFLcag8SSmmp6FUBLzOKvCo0t5U/sIwCi+tcOe2JB
         c0tbhxSZajrLaXbqzhHDFDFdNkF/ItKH3zZy/3Cw4VaOUr1nEMdmMXDBEoahCH6NDPUO
         TYjg3FPvwSqJmonQxjkU/vAyficKioo90/HStgQEweq45zaEUL8U3dRVXViGM90Pfigy
         Yn+QIwmLdGE90ZS2et5v6HdIUOOIhFxeNGPMoa0EzW8Dh6mi/I41OJgoPYxXxjoUIWdc
         D0VRYDGV5JMAgD22vu6WRHjjbap1vB/YAYuVnOOc12atVvEid5p+pxuJSrLl/M1b4cfo
         vd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776364044; x=1776968844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BTUQfZQIhu89lYlxwzN1u9+gqvPnIoweub2rOOYT/YE=;
        b=mix6pZ/mu/llMtBwsTPYV8s6P2qIrsFmMoU0U7xT1vVEr1rrg4Zv6Gi2rxl22R3oxd
         VmeQm3XrCLKwdK4ifwUYM7mjHAS5mKawVW959wpNtfqtEiqy0ijTNGtz4P1b+K19XXDT
         l9Rk9gQY/LCnMkedo0e+dn1OzdIJvH9qVdGSYeJBC7EsOCRO48YVAiv1CvgO2Um9SndU
         ApPUn+Vacj7bveroPrvCQ2PTmr3ne4xjmntyh8Yq3hC4oVjjot4zu2lErPmhGoNsPARm
         iKVodtO3KClBtasdEtHp20U4BuF0qYjezNQhPU4122D4YaGD2YB5hwYi8u/kerjF/0VS
         u+Jg==
X-Forwarded-Encrypted: i=1; AFNElJ873QPsQ5rN4W5LAssc3iRPb6BpnG6X1CosW8lGtxUI+x7MVbfiCZ0ll3NPbR5XisPkQH2lqrd7ed0oEkGK@lists.linux.dev
X-Gm-Message-State: AOJu0YxO8g+DNP73iwrDWzTDYl4EAkAo0vT3ShWnVXPFI/RRWEdecG0w
	DpEGCDKPdoO5wnht3n+GbcSywXpAnzsSxdKs9PoQoi2usxh1GKxTxfGJuvSOExwxfVsW7o76uos
	eSpJVGczWbNA18d1ajWd4D14ApSZPP5g=
X-Gm-Gg: AeBDievCFatdieecJURJ2x+fZkgDTCXafYo+5ZYP0tdxeRNeqJGF2zUfasBHOwHl6CL
	Ct7fKEr9Jg0OcK2zedAE7jo4IxjytZdUy8uso+MldJY//rzS5NG+4njm2ougda3C/SqzsyIjOVD
	JJBAXS5teXhCXDeVnfGED/yT9HHdjbAJheeE9QAHgT3xT/EF+J17iZP7kBrB7yJ4lo+mgXhqD1T
	RCk9NPB2lfHyZRjmCAbqk2vJOVvDBxxuqPhPBYq/gsdcPQx976KDC77ouSABuedp9gz5FHmF+Rn
	xhO/kVEbDta2pTPZ1NJQdiVHcnZ0eIvMjQjfJTpeAG/9UesOyZ+p0GFu+42AfAHbdeKpcRP5Py7
	1ocH6WB56IcutMnOyWC6asYZkLWM7
X-Received: by 2002:a17:907:c989:b0:ba2:bd8e:57b9 with SMTP id
 a640c23a62f3a-ba3db293a22mr25264466b.6.1776364043532; Thu, 16 Apr 2026
 11:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416134214.130665-2-pontescpedro@gmail.com>
In-Reply-To: <20260416134214.130665-2-pontescpedro@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 16 Apr 2026 21:26:47 +0300
X-Gm-Features: AQROBzANh8oLFrnmWxG1V0wCfWO_Ma68oGU0AmR83s5_CNwYhIOcvH_YVlaO07U
Message-ID: <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
To: Pedro Pontes <pontescpedro@gmail.com>
Cc: hansg@kernel.org, gregkh@linuxfoundation.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, kees@kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 4:46=E2=80=AFPM Pedro Pontes <pontescpedro@gmail.co=
m> wrote:
>
> Convert manual kmalloc() multiplications to the modern kmalloc_objs()
> interface to improve type safety and prevent potential integer
> overflows.

There is already a patch doing it in a slightly better way. Have you
followed the mailing list?
Please, better to help with this driver is to subscribe to the mailing
list and review already
submitted ones.

--=20
With Best Regards,
Andy Shevchenko
