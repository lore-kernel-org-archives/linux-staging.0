Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056B673F16
	for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708626430; cv=none; b=Qnyb//UroDJnmlkQVykE3L7jMjGWPrGCm9pxCuxNxQbjQFj9fMld9BDIzFDMvZ/WxpRP5rVrvRmbmvmIJX50wd1m+RTdJp97OuxUwitSm8/LxHYbCqheFZs8DfMyu+XvYv+LgmVnkr28bv86300Kl1s7pvCQdaS6shqcgSi1UXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708626430; c=relaxed/simple;
	bh=LV8HtBqn41W71/wptU13iMdkCr07Gl0rd2NcdD58NUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hq9WxYA1k4b3i3TYw8LCa393b8NnvcI17qDt/Sas87BWfcSYnk1ZRlz7hi1KzWvQZnYwNyN06zAly+rpYq78WnH8DnYUYVHbM5y969Dj3vND6Pr2OsJfuI3zsM2SPl02k7HlTyy8Sxm/kMK9tVuvp2haCtKIcDa039+eG1EjY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEKWDP4R; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEKWDP4R"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55369c59708so3002151a12.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 10:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708626427; x=1709231227; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eyx7F65SZjO1tm+DpSvBE8Mi6jfraaN35m+DJYJ1cBI=;
        b=jEKWDP4RMObjpYLa0q2x8ic15wwPPrr8YvkCKmmGhmmEX2d36RuJqK4YJ9LYi6502c
         iqDirD2E/hAQWepBpTNMsgLxDoEeAqCrgpGMDsb/raM7DNxbmxixb2xmwJa1p+YWTyQz
         qCTAjEP+FK95jD4fU7LXS6VYbj1vz85XVfMnSW5p18NCzAMU0/Zsw+8DVIkcCbS+hom4
         nPAZx24AsEiy60TnTXvfEG8iFTd4VU6JXv9MTmWKkqaGbuDq1uribqGTblMoED9eBLb2
         PyuDK6+BjKhZlP82TEwG4ZlAoS/etn7dotZQtfux69Lehb7N3S19tbOB/AdXQGzy/OFt
         D00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708626427; x=1709231227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyx7F65SZjO1tm+DpSvBE8Mi6jfraaN35m+DJYJ1cBI=;
        b=jG1ncYO9uPeGdk0THDJVMNhuFOt3ND/aINM7QvpAE1Em9NA8idNqEaVZp8v77RugRc
         D7BBfNllgrftoBSnpMSzEU0oJ76/lrGt1qpRyaFs3uHf/Qhq5NpKTWtXeo547BjCN2JS
         gjb8ifEEGENci4LL6ePamDtDYkml+6qsnJErDNShUIeQVDez0m+P1kgdIyITpHlT5XZo
         NXHqS9+so+C/OcwIzxg6hAoPjw5zE6Q0slG5MrjyXYPgebwE0GBqlYXwCDieib+W7pO1
         7NsZAi46uPXtqO5IvwH9yrjHEO6A0ty9utjL+hh54Njr9zZ4Pg1Y5aqpkmiJ0pz8nhAi
         uefQ==
X-Gm-Message-State: AOJu0YydWGgblfLesDK0vIJeCmWK+GuGkIGly4n31NUm7QtozvGIbs2s
	uZHj5TTOAFN4QDrpXajy7j9b/vXjv+wAZaBYcRRCKPyfVAi8xC7L
X-Google-Smtp-Source: AGHT+IGHHFpoDc4CySdIhMn/8uybwBQBnI2V5nsV/IbUg/ZZTb2r31N7tftTS97jKI0BFqK8KTyEAg==
X-Received: by 2002:a50:d7c3:0:b0:563:fc40:6268 with SMTP id m3-20020a50d7c3000000b00563fc406268mr1928928edj.1.1708626427262;
        Thu, 22 Feb 2024 10:27:07 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id cf28-20020a0564020b9c00b00564761ca19fsm4048192edb.29.2024.02.22.10.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 10:27:07 -0800 (PST)
Message-ID: <a1924b54-d878-485b-a842-68c6837bfc20@gmail.com>
Date: Thu, 22 Feb 2024 19:27:06 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] staging: rtl8192e: coding style cleanups
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240222112723.18428-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240222112723.18428-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/22/24 12:27, Michael Straube wrote:
> Another small series with coding style cleanups.
> Compile-tested only.
> 
> Michael Straube (3):
>    staging: rtl8192e: rename rateIndex to rate_index
>    staging: rtl8192e: remove empty cases from switch statements
>    staging: rtl8192e: rename enum members to upper case
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 64 +++++++++----------
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 29 ++++-----
>   drivers/staging/rtl8192e/rtllib.h             |  6 +-
>   3 files changed, 48 insertions(+), 51 deletions(-)
> 


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
