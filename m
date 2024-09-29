Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1B517580
	for <linux-staging@lists.linux.dev>; Sun, 29 Sep 2024 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727597347; cv=none; b=X7XEM5WwXOlVMc4cdhfZmaLaH2CCyaYQQDBqoNq1EmBvMDuRo8yuqLjZeZYd5+MWmY8USSOH6Evq6Tko9hCnZppvIJ/zEaMp5GwBdZxQE5NBv8V1WRC2d880dPip8fY+PTyjFKw3hGwiBwKhWPE8OeektrCwu37XQTBotlZBzGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727597347; c=relaxed/simple;
	bh=jzHY69lIb+9jsGbG8mxU7XqMRo9mUFjmUabiFwQ8Ka0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=XH5PxgFjOzH4eDDnDTg8Xa1HHszq9YsMiTtc10Kra+alDRafscaY3VILxeWN8BnpMpOLgHdtpmxsbCx6XB/yXzd756qKlD2eRjiPEZqpam5Fx9sCy/IzquKtO5HrEj72DWB09dIjSHgNk+hY1nX+q7jOqdPqKyJZ6iUueE71KgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGSiAjL1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGSiAjL1"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c88d7c8dbaso638897a12.2
        for <linux-staging@lists.linux.dev>; Sun, 29 Sep 2024 01:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727597344; x=1728202144; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncTEfn/J3adg7zNOcwO7BXMI957A7O4ashcbmw3A9C8=;
        b=RGSiAjL1CJ9AA6PigH0IZkHNUoSq6n2XMtzXz3AB0v4a5wJKg1+yK3GKRVUUhwkDTO
         JwzR/zyP2hQtdWFVgVLcKSs/OoiZ0rKgKKF/K3YgMd2WS0TVTLfDMihKjSwbBB7BefdO
         s869AWrDgfi2/lQMb6Tqi+ZDyyPs9XPn3kKX7QLPQiNU8cRxivv1d1Y8MaT8w2t2WblW
         nT6IezB5EnGRG1xlGvow9KyJ2RTsLZpoqBf5Ehxf+o6WzXskC9GzDQL2/nmSZQKOQQ1x
         uZdmrRN70BRt+cnmC4SZ6mQhpRjNr0N4IFoTA4NY5GhHQkVXp7rkZJR6zC30zquGaxo+
         DMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727597344; x=1728202144;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ncTEfn/J3adg7zNOcwO7BXMI957A7O4ashcbmw3A9C8=;
        b=YRA/zKxoMJlPEJ6tGzea1679y2tiXui8IJx5mVbuKdajoTvMXOPAm5LOIpuluTlkyk
         JmLAT0HGPzjf2KrhNfkB4pypZbKmvda16ZegMbzdCPkFHMqpcx8JkRGnXckFroROWcL3
         BAfHTexN87xsUcE/YiyOf8v91jl8Ga7hxyTXo5AxniZiI0dKsj8TZVrWMs+4jaMEORAz
         SZxbbYREOC+DJwm7+AKyo3w4905YZH3PQY76nnqnNCc+Qm/bxgC3E+OPJZ6aKBksr0nn
         aLl2Cg3sfjde2Ii9xlq7GJmQO+zDpAc290qGpg0UQdva9sRefnPq65PK90ntKb91xkYp
         C1+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIHg4jFlqKtrhpC94cN/T6Vr2R8543SUu5Mu8dlkzUZCSuhhpxHKgHk7jeD/AB9soT/1XaAuvRIgb0LEkX@lists.linux.dev
X-Gm-Message-State: AOJu0YwljGWJvE7vLjx63GtACwPb1SAhs7rHoZhn70amIAqba5UfQRxI
	Mt3othy32tvrV75/XYjaA2kq9L6aHs3CBRyHFBzTDN/U6HG2WAkH
X-Google-Smtp-Source: AGHT+IGA0Gk199O0Gp225ZmQIkJW6v8jjQwEmZbn/hsxycrGBq2sbN5GsdO8D1nuoUcuwNb24qe6IA==
X-Received: by 2002:a05:6402:3813:b0:5c8:839c:734f with SMTP id 4fb4d7f45d1cf-5c8839c73c5mr9964380a12.18.1727597343558;
        Sun, 29 Sep 2024 01:09:03 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c882493b74sm2922927a12.79.2024.09.29.01.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2024 01:09:03 -0700 (PDT)
Message-ID: <718c0476-c4bc-4a72-a1e4-483697c7eff2@gmail.com>
Date: Sun, 29 Sep 2024 10:09:02 +0200
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
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
 Richard Meek <osl2008@googlemail.com>,
 Larry Finger <Larry.Finger@lwfinger.net>, Xingquan Liu <b1n@b1n.io>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Pavan Bobba <opensource206@gmail.com>, Malcolm Priestley
 <tvboxspy@gmail.com>, Joe Perches <joe@perches.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [RFC] staging: vt6655: Proposal to delete driver vt6655_stage
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Sirs,

Forest Bond contributed this driver in 2009.

The following points let me propose to delete the driver:
- This driver generates maintenance workload
- This driver has a maximum 54MBit/s as it supports only 802.11 b/g. 
Peak throughput is 3MBytes/s but this lasts only for a second. Typically 
throughput is 1.7MBytes/s.
- Depending on the number of devices on the channel the device looses 
connection and cannot reconnect for 5-60 seconds. Watching a youtube 
video is OK because of the buffer. But surfing can then be really a pain.
- Its form factor is mini PCI (not miniPCIe) that is really old and large.
- Hardly not to buy. 
(https://www.ebay.com/sch/i.html?_from=R40&_trksid=p4432023.m570.l1313&_nkw=vnt6655&_sacat=0) 
only 70$ ;-) including shipment.

Former Maintainer Forest Bond <forest@alittletooquiet.net> is unreachable.

The staging subsystem needs to focus on drivers that support usable 
hardware that is available. Newbies can then get the hardware for some 
dollars and play around which is fun.

Please consider that support will remain for years in the longterm kernels.

Thanks for any response about your thoughts.

Bye Philipp
