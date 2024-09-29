Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA02213A268
	for <linux-staging@lists.linux.dev>; Sun, 29 Sep 2024 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727613441; cv=none; b=IZL/mQ7qsl3nsJcPSf+qhHaJEbQHXEHCXLouQoxWxvZ/KDKzb9D0oxTPXODbbiablj2BZ7hhprqigSjrO6WdHQraS0hq+pC15QkocOmqUiLAHNOvePZ+VT2+Quaz2MqlgL9tMfazJXRPQ5OzN3483b6pbjGapqmqWaFUdpU5ug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727613441; c=relaxed/simple;
	bh=ITQmOq7pkgWvkALy74DqmWYWUa2uLdab72AZBmYWiSU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=VhKL2JBGawbcLHzs1ET/+MEyk2nwI+3bkH2bEai4NdRrtfefhXCcruGaZgfe9xl+VK+3CdKoJBMPbNxFYENXN5ADTNIPXkQfk+XrI+jM47pDIPOrNWoU8aNOJ9xENGJLQPAwNFthYO8Lz7h6cbfOEXSihiDA8I7Yz2HraJIb0YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEaNf4+q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEaNf4+q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so43361225e9.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Sep 2024 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727613438; x=1728218238; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJn80TxfYTlmmnqMwhBhjRaqFPnqFxat8PYaGTsCMD0=;
        b=AEaNf4+qqPYiXEjXV07sHLEt6ctzRdjs6Gq81anJlThBO/vwVy3bCLqivAkMCkgVAN
         jVA6ZojxyT0GE89e6/x8mLR8J8nXTAWdaGjVgmH8lhYK3jLmRP6YBRBE+NFYitdfya+j
         vOe8L2VnB4sVbXV3KsejmUzPkpj6hrFK8TUyBob2QH8x9ioNlrBD5zlJ1HBspRqkeY20
         Ji51sMczZEpFzVWG4bgDis7SnWD6gfKQ5DWjECBATdiXDA3ltXui+ftCsZ1FeZBjYPS6
         IPZk2Y9yyX8Bsl6Y9TZhR4gWbf69SzM5Du/iavS4nsow0F+pFnPCNw8Uo1tUvyt60vAU
         vvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727613438; x=1728218238;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NJn80TxfYTlmmnqMwhBhjRaqFPnqFxat8PYaGTsCMD0=;
        b=rYjqP2OHk7oj2hvqtDQpJRvisut+5P04udOvc+BmNITNOlbi1TZmKcgNPkm7iiIUSQ
         4346e9xiI6pQ17AiN76us9MOC+gHJGWSR5KR9wgOklk1A+x+6Q0ff5oyJ6+n7GkW0C1l
         nzDOlpBEMNGo6aJmX4DNMm+Bh9WcjE2uZHQYoGCVXON2u0SydrsCWEpkdR4k2/9YcCCk
         Ll6kzef/3zOop3KMURbWdzXVU0umgHEAIJWHy6JUTWVQZq4uksHlLCD4RhbEdLCp9gcR
         YU2wYpmn2Ay4MQKVwDcCIJ9p3QE9CClbczml+0IiBx2zPfdYsFewOmpejLlFXhjwkclX
         gTRw==
X-Forwarded-Encrypted: i=1; AJvYcCU/cPfNnFYDAwy/LyHUnTPeLaJeLWYx5sqxXR5xPfxxpIsdbZbCwVR07FFejZ3yoAcdq2j1dUWMu1rmhgwe@lists.linux.dev
X-Gm-Message-State: AOJu0YwIEsnIt1PbDOd0fQmAZyuwjCWhHC+nMorIrHDHOG+hpTEwXqki
	ih1Zuf6GNlfOmDPyi5OKTpON2UvItfB3R8rm0wh2OWouDd2bzCtJ
X-Google-Smtp-Source: AGHT+IGA6vxOQMNnYoiuQMJIUo7Foxlfojd8CKK7eJWbt6HadvBz5WZPws0VDXL5y0PmtMaWD3509Q==
X-Received: by 2002:a05:600c:4f14:b0:42c:b555:43dd with SMTP id 5b1f17b1804b1-42f5840e242mr88082765e9.3.1727613437966;
        Sun, 29 Sep 2024 05:37:17 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a54fdesm124666515e9.41.2024.09.29.05.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2024 05:37:17 -0700 (PDT)
Message-ID: <b7b646d2-6987-4557-94c1-5fcd8d3d5ebc@gmail.com>
Date: Sun, 29 Sep 2024 14:37:16 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Micky Ching <micky_ching@realsil.com.cn>, wwang
 <wei_wang@realsil.com.cn>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Justin Stitt <justinstitt@google.com>, Julia Lawall <julia.lawall@inria.fr>,
 Soumya Negi <soumya.negi97@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [RFC] staging: rts5208: Proposal to delete driver rts5208
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Sirs,

Wei Wang from Realsil contributed this driver in 2011.

The following points let me propose to delete the driver:
- This driver generates maintenance workload
- Did not find minimal documentation on the web.
- No blog entries about anyone using the rts5208 and rts5288 during the 
last years.
- Did not find any device that may has it in and is still available on 
the market: Dell Latitude 2120, Lenovo ThinkPad Edge 130, Lenovo x121e

The staging subsystem needs to focus on drivers that support usable 
hardware that is available. Newbies can then get the hardware for some 
dollars and play around which is fun.

Please consider that support will remain for years in the longterm kernels.

Thanks for any response about your thoughts.

Bye Philipp
