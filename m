Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A4633CD2
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 21:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706822776; cv=none; b=U5c0sR2aWKTohRUgwOr4OC59MUqlLoj6JHPnhbblolf/g4LewRQpeOHcgjJMqZfzAl/zNR78SpUsDRQHu6YJ+6UjqxEy1O2/ou3cnX/vhK7ezt2Npg+67ggIddSaA6XFxipIYOeFQqC4FND7Z9dlNqDNqxron1B5xaK+3HxwKJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706822776; c=relaxed/simple;
	bh=kyLxo6TGPZDJDcAI2B9MWkRbt2XMPH+DJdnd0HGE1MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlEAKH5++VjzKJMlkZyj/Ljp9Yb205RvEhRklArqpy4D/tF0yBbLAB1pUm24AXdr5vfoe7TpzbEjoD28ON+rbLspnBbeBOV7JD/9p+GKuEQXvxez9KCf9XObi3xRo2NOpN1/djUkYpDx3N1vqYA9RiZ4noUYY6qJtYw1emjz8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xu2IfnN6; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xu2IfnN6"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2e633c5365so44256366b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 13:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706822772; x=1707427572; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7f9qLraBLFZhOBsDxwtZQBfVd7xbQqebYyH4fsFrFIk=;
        b=Xu2IfnN6PmPJGB9lMpBZ5PaQQVcS+ZWhIzhSsxKfW3ZOIN7fe4+ohgvj84QXuUpi2w
         7LU1G4PD+ECcYHHnqwKKuilJ1FAzI1fhwRVnFSJ/+Nro8VWxGWu2YtkyKrn3O+Ab8Un2
         5/B8w2v8e/Mq/tC/t7d6qrQYhhT0hR2Rw6BXOX0Z3x0JZkrMDrZmgSPpZuxyYafjQfoM
         liNHO3GO67H+FECeaNq1c/rEl4qd3H31uFrVG9mCgBSGxC3aSE8qjiJAg0obJ93dABhq
         0lI1mIPTv6gBsspjry+VskC7tSYL3GrTZTuQZGVN5m9xYjFPA00R/K+iSMvbDV7BUCuj
         aGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706822772; x=1707427572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7f9qLraBLFZhOBsDxwtZQBfVd7xbQqebYyH4fsFrFIk=;
        b=C0LHAwH+H0QkkHzqvl952bcV8S4mA/C2bhfH4mk7WLsegBRge4AUlQwduxnlaLGcDC
         nUkQJK0fuC6DqZMKMhm9YOWzExit2B2OjGpD91d9xLeL2kHoXPnWjzWtUbMtgDqbG9FV
         f2geQC3kZ4sNsNOkBadEuAnPgqXVR2YV04SePdTdiVy4832w5/N7SosFIzeKTfp0DUNi
         3IGmk2Qu1G3Q2ZUTdLb33kggU6VYANjehEFx8jqIiL1g/Bj0wSS55yuzkvYd1L7IhHAB
         Jb7BEvL/Y6jRKDTJ6gUHb1/SYC23S7e//Z61Ul67ZqXEzv6ogeuv5aDFS4s+0w4HJFHM
         eyBg==
X-Gm-Message-State: AOJu0Yx0dbqsaoqQgt8Du2M4R/4PqA50+mIbgj6V1cGhC5RSSqfwgPHb
	6oZnU2QMscXaTcLZcQpPlbjDEIL0bCFnCNml220DN2ml0RdZvVOW
X-Google-Smtp-Source: AGHT+IGtErNt1JMCYExZLK7GGdgcG2hTg5npEPEOsDXL+5cpaH/r6q/LlfrK2jRWtHOKJeHqRCJcUg==
X-Received: by 2002:a17:907:72c5:b0:a36:f2f1:c706 with SMTP id du5-20020a17090772c500b00a36f2f1c706mr531698ejc.3.1706822772225;
        Thu, 01 Feb 2024 13:26:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWMPFkP/8uOJR+zA/8LqmCAwIuPdSimr/F4Juh9GHyC8cvedUUFxO+uK9YPDRY/UEnkjy9lguzijLu5gZTEO0ustz/SS1BxAbycbwOTOp1JkQREBm7BYbAVXhpZyH8nT6izmbXi3dfzoTb4ecYsKPTsotQriZRvw5jqDVCe+xaqkYqyz9iISaFyGVeNT0+hhOp3DEr2hTGCQn5WHUWz6PmDMMP8mVDqBU00L7921GY=
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id jy13-20020a170907762d00b00a2b1a20e662sm182218ejc.34.2024.02.01.13.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 13:26:11 -0800 (PST)
Message-ID: <ed534ce9-2102-415c-a5c4-e2d7d09b5e81@gmail.com>
Date: Thu, 1 Feb 2024 22:26:11 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Staging: rtl8723bs: checkpatch fixes for
 rtw_mlme.c
Content-Language: en-US
To: Meir Elisha <meir6264@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240201140459.438479-1-meir6264@Gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240201140459.438479-1-meir6264@Gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/1/24 15:04, Meir Elisha wrote:
> Checkpatch fix series for rtw_mlme.c
> 
> ---
> Changes in v2:
>   - Remove dead code
>   - Fix comment in _rtw_join_timeout_handler()
> 
> Meir Elisha (4):
>    Staging: rtl8723bs: Remove unnecessary braces
>    Staging: rtl8723bs: Remove extra spaces
>    Staging: rtl8723bs: Fix block comments warning
>    Staging: rtl8723bs: fix else after break warning
> 
>   drivers/staging/rtl8723bs/core/rtw_mlme.c | 227 ++++++++--------------
>   1 file changed, 81 insertions(+), 146 deletions(-)
> 

Hi Meir,

please keep the emailaddess send from and the Signed-off-by emailaddress 
exactly the same. The difference is the
"G" of gmail. One time it is upper case and one time lower case.

The changelog for the coverletter is good but the changelog for each 
patch is missing. There the "---" are missing with chagelog.

Please use more unique descriptions for your patches. "Remove extra 
spaces" can be an issue for hundred of times in a driver.
Look into accepted patches of the git for better examples.

I think the maintainer will not like your patch description. He will 
typically respond with:

- You did not specify a description of why the patch is needed, or
   possibly, any description at all, in the email body.  Please read the
   section entitled "The canonical patch format" in the kernel file,
   Documentation/process/submitting-patches.rst for what is needed in
   order to properly describe the change.

Very important here is the why and not to describe what you did.
Look into accepted patches of the git for better examples.

Thanks for your support.

Bye Philipp
