Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E05398;
	Thu, 14 Mar 2024 05:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710394444; cv=none; b=m8cELJG3c/i6GldFKaviL8BLUx89O9m/2AO3bjVru7zUD5BjccLEPqZPjivqQX5lqC3FThpx9wXJOhRvD/rxUNHnBDiSLClh2wDBLmMbJVwqWn1C/B9eRYytEBhlhGse2JDt4hsAHMzDA/4oGRSb1rPDao73irXKQzUwnx9BEd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710394444; c=relaxed/simple;
	bh=L4JpBTdYYeW7NYE+1+/CydRVUw4pob1fSs81LclvXIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AguoH4xP//XWp5zUzFFTic1gF4rTLkeTCx7M6gvqMScd2SAZZoeh02DK367l/WK+r6fsbronsuHliIoIMbrTDkHUDhpZVWPnZcSRtRuMfYokDUIpLEL/JeErQKgOhQDzkTrl+BZukgxNZuTIUtkT8nY6gScZc8b+iHquSPAcGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1VdHjDz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1VdHjDz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33e808c70a6so113337f8f.1;
        Wed, 13 Mar 2024 22:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710394440; x=1710999240; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YL/cKdR72MY/BQ3PoPy8xyiRhddO0mQ4ZQlSnX70/oQ=;
        b=S1VdHjDzJ9CrJnq30dyaexvmbuvUMD4NjlYA5yytYHDguR2Qnb0cjysvHwpcaGefJZ
         4LU7XoGdQVkqT3zyepnQIrfo7s0APnhsTOzzdHrmlPKY5xl2z9iqe/M9Cvg0zI5jCaXR
         izyQU7bKRvbmZe52tSz7snNn/RF5Ol7+4gWSBw7l2nGBBwEI9bGY71S/W9rfhZ3wjg4W
         dfSmdfPzZhJOsAsmjMjbyVlXoHSxsw2OGOm6JCjC1U7ST4nn3NTdxV6tXywiI4weus+Y
         hOTwjHU44pQSRRcvoeZ9PltCiD0Y77CKyIEaOnwi+cNNM4fQjrAYENAGAUiZG81bduv+
         Lpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710394440; x=1710999240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YL/cKdR72MY/BQ3PoPy8xyiRhddO0mQ4ZQlSnX70/oQ=;
        b=nDMRXQNjKLl2CrMrhtaz6YQHsqeBEI/MJN9HigDXDwg1G/9m1egsq4p35+g6G5ZkAg
         bdTu/JFvIbvjX/0yJa4kPsFuBgzE03XLBO/dSLYXJdthCFmy1D00uD9idST0V2qO19EL
         Sg9h8QXtDDDBThLF5kOC1iHy2U8cYfERvcQ8qQda9DQHefC4SLnO3dvLMwLKRrleLwMI
         qaefXY75uYq1h+b3xP49VDxxhm7SaNnHzXeAVjOd5XlK+pwS37m7N1XfQ9LZ6O99VtkC
         a3aQMMPeS2g5eNWVQv6dGwJfAYfEQFbPZPC2FfSHygHt/EnUQNMAsBZCfjWRWk8pAAfX
         x5/g==
X-Forwarded-Encrypted: i=1; AJvYcCUPVl41TP9aIgrvQWVa6M/Twhqg4DV0ruFKBcuX4MvqY6HAS1bUZj502lmRD0WMdAsrIHZH76x9A8ry60ajvYpjYQ/F/9nMXlNBcFUZPvD2Z+GdWU6KmlTcHb88jHI4+72cKvoG/b5s4A==
X-Gm-Message-State: AOJu0YzZsqy39XNCZRPu6QxdlxT2y6p7KdM9mieD7l3FhNOxjSbAcmGR
	LGCIGcO2Ux9jdXjzzL31wp2nZN3MaRCzNwVtlnp2gl5kK/f9s2ca
X-Google-Smtp-Source: AGHT+IFTZB5mZP2vNH5j72xlcAcg8eTl2EK5wl14FC72ROs1Hsyd15ykWW7etxDbNsNNWrm++B4q8w==
X-Received: by 2002:a05:600c:4fc8:b0:413:ee4c:6ae9 with SMTP id o8-20020a05600c4fc800b00413ee4c6ae9mr590358wmq.3.1710394439954;
        Wed, 13 Mar 2024 22:33:59 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b004132ae838absm1193999wmq.43.2024.03.13.22.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 22:33:59 -0700 (PDT)
Message-ID: <d0f975e8-3ce4-4a2b-b52e-51b748a8601d@gmail.com>
Date: Thu, 14 Mar 2024 06:33:58 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: vt6655: Remove unused function
 RFbAL7230SelectChannelPostProcess
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev
References: <20240311035649.25043-1-dorine.a.tipo@gmail.com>
 <20240311060747.32876-1-dorine.a.tipo@gmail.com>
 <36c92e00-213e-4f25-9720-66912b4da56f@moroto.mountain>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <36c92e00-213e-4f25-9720-66912b4da56f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/11/24 08:31, Dan Carpenter wrote:
> The main issue with this patch is that it doesn't apply, but I have a
> few other comments as well.
> 
> Why is Forest Bond not on the CC list?  Please use get_maintainer.pl.

Hi Dan,

reason why some omit Forest Bond is that the emailaddress seems to not 
exist anymore - find below. Can I issue a patch to change this?

Who is then entered to the M: in MAINTAINERS?
STAGING - VIA VT665X DRIVERS
M:	Forest Bond <forest@alittletooquiet.net>
S:	Odd Fixes
F:	drivers/staging/vt665?/


Error Delivery incomplete
There was a temporary problem while delivering your message to 
forest@alittletooquiet.net. Gmail will retry for 45 more hours. You'll 
be notified if the delivery fails permanently.
LEARN MORE
The response was:

The recipient server did not accept our requests to connect. For more 
information, go to https://support.google.com/mail/answer/7720 
[alittletooquiet.net 2606:4700:3033::ac43:b367: timed out] 
[alittletooquiet.net 2606:4700:3032::6815:506d: timed out] 
[alittletooquiet.net 104.21.80.109: timed out] [alittletooquiet.net 
172.67.179.103: timed out]

Reporting-MTA: dns; googlemail.com
Received-From-MTA: dns; philipp.g.hortmann@gmail.com
Arrival-Date: Mon, 11 Mar 2024 12:59:14 -0700 (PDT)
X-Original-Message-ID: <424ad0ff-8f66-4e33-829d-88035679e31b@gmail.com>

Final-Recipient: rfc822; forest@alittletooquiet.net
Action: delayed
Status: 4.4.1
Diagnostic-Code: smtp; The recipient server did not accept our requests 
to connect. For more information, go to 
https://support.google.com/mail/answer/7720
  [alittletooquiet.net 2606:4700:3033::ac43:b367: timed out]
  [alittletooquiet.net 2606:4700:3032::6815:506d: timed out]
  [alittletooquiet.net 104.21.80.109: timed out]
  [alittletooquiet.net 172.67.179.103: timed out]
Last-Attempt-Date: Tue, 12 Mar 2024 15:14:29 -0700 (PDT)
Will-Retry-Until: Thu, 14 Mar 2024 12:59:14 -0700 (PDT)

Thanks for your support.

Bye Philipp
