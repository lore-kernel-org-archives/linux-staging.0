Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DDB15357C
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711576518; cv=none; b=owyzJoMvhPW7Qe/kH5kanxRviXzkd7fgkpaoOUxnJFqfQ+p7jUbsS1LkPcf2vpTJjsOvx6g/DuRjBFlT8uOVy2vyn8wkXBgVVs0xeBIFbfx0ySzrrJ+A3WIm0hoVt7LZViDlalN7fcshkN8zix5lgIO38nMOlgQ3npPDoIgrbmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711576518; c=relaxed/simple;
	bh=PQVZZIRaKQhkJhUnG72lePTcQWJXDx/rUBRzSVF2ep0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=X+GdIvUbv+4nmIvBUnLgJaSd4phcuKlYTQCdf+6UoKQjPBl+KRK1KpCwyFX/dGoV7QrRkUwq0GvL5HXdHsAoqbMN4whfmDjAF5fYNmJPw8UzGJQuMgwWCtT9hV/ikL8O6XgQqMsefQe/r4md2Pb8hIObxgvR9k1PbOCPDmx86PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U74QAo5b; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U74QAo5b"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33ecdffd9e7so56941f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711576515; x=1712181315; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwdGycr3xucKOW798pZ9AEyP81jNbTl3Rfs7NX+nxEI=;
        b=U74QAo5bG2wJt8iWMCKB49mPwB4VRNQb7J1xEvXNXv2y8AcQ0QCBZOgpRpcgqFg2ke
         NyDOhghFsrKSLIxzBd3lkG7rZqN7NwaIfSFOdlKFTqFY739PQcB7Qv2/t0rTuzhKCdNG
         WiSd6WX9RJBIy1na02ynwBkIxKl4u3uyH5reLibu+E1a80sIE831zCT8iXmlmEHIZEzN
         7gpaYRtNPibxqBeCBSjyUQVO75XP8HxsTgXVHlS5p01qMFuQSr4ltindoGmuIL3OzTrC
         gyjBXduYDNQ1inA9h0pK6OGp6wsDaks/QBP2YVZmwu377ZgfXDu8kYz6FrgKYYO6cLA7
         LcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711576515; x=1712181315;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dwdGycr3xucKOW798pZ9AEyP81jNbTl3Rfs7NX+nxEI=;
        b=l5aHXkXpCGsYn7+Pv6kdyN8ozBcFrH5fCJrckcWljXouSQRnqz7tfbxs+ue2jf3wAc
         +yfEAj2BEa6XDTx/a1yVJfCvUQ6wkDoGHvomNWnOYDE6AXqjHF3UzeBWgVDJ/w85eJRO
         r6dH/qq9gEIBwKVa3YSm7nkC/Hfczq5uaopJo5Sr0ZxpxPhNTf8b8SaG4Fl5OcTmcn2g
         fxWYqDCGtm4UqNhS+XgyKZcr/rvYd536/db6KtLNp+4/KEW+vFpDQQjn3kmIUftD9g0z
         voVTvcdsk8tVO7Hw6WXdOxQan4Yscyalk0o+/Ol6RyjqWBqNkgDD5d5e12hEdHabfd5w
         SFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUunVhVuQ2dUc7OL14Wzyz5QdM57d//zIc06rbopAP5a1+sgiP1a9Cco+Dm1BB9C+JB5wYQ853MFsE6oKyrX2DaKzSJ8koxbSwYVaTr0g==
X-Gm-Message-State: AOJu0Yy1jt9n9PgKen942+pwZ+OTc2fXXe4h2oYQsLQRyMRWA+XUP1gi
	bS2tVGxeZM+X8MO98BowB5TR+weJkmZ0kwvASU/jOEgTGpD0b9mH
X-Google-Smtp-Source: AGHT+IGccx9eaqBykQEYnZT3gkwcYJOSo1MsJiwoqilAQjnT5wLYFwDyTWEjzvUpPLXhEszbj19qmQ==
X-Received: by 2002:a05:600c:1c21:b0:414:8554:73e with SMTP id j33-20020a05600c1c2100b004148554073emr992027wms.1.1711576514811;
        Wed, 27 Mar 2024 14:55:14 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b004147b824b08sm192228wmo.7.2024.03.27.14.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 14:55:14 -0700 (PDT)
Message-ID: <c4c5ab38-8c67-4c21-86bc-f4f3c06be358@gmail.com>
Date: Wed, 27 Mar 2024 22:55:13 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marcus Wolf <linux@wolf-entwicklungen.de>,
 Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [RFC] staging: pi433: Proposal to remove unused driver
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marcus,

according to this homepage:
https://www.kickstarter.com/projects/1292669042/pi433-a-radio-module-funkmodul-for-raspberry-pi
you had a group of people to test and use the Pi433. But last 
update/comments on this website are from November 21, 2017. What 
happened afterwards? Did you organize the community differently?

On this homepage:
https://www.pi433.de/en.html
you wrote:
"Purchase Pi433
Due to the rules for recycling (WEEE guideline of EU) Smarthome-Wolf 
decided to stop the direct distribution of Pi433.

Business partner (e. g. online stores for selling Raspberry-Pi 
accessories), interested in distribution of Pi433 are very welcome!"

It seems that this was also in 2017

Did you manage to find a business partner?
How many devices have been sold after 2017? Are there people who got 
more than 1 device?

Please respond to avoid that unused code stays in the mainline kernel 
forever.

Thanks for your support.

Bye Philipp
