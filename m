Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328C13DBA8
	for <linux-staging@lists.linux.dev>; Fri, 23 Feb 2024 18:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708712101; cv=none; b=UKobe+3eNrhQER7sIwQPYUkKU6Knl2qBjEawbHSMFa4t0M9sfamzVhz9ZfLWHj9UjkYtsAN08v9XhDavS46WWFCIwv4kDtOtxjDZFBA/crvJaHy5NMHlxtCiJrg4YcCSC/FiDQG2GpHh/vbh/KVVZvdHJUkhjjhDwdBem7Fj6qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708712101; c=relaxed/simple;
	bh=Bej+JJ3v6fc7i4XxpJGQQXY0IntuLNtJu33fXgwRuYM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YyXUQjIRuHAu+vaPrTJRAtaBoyUj0VMea+CTt8EUgbhONi1hX/1IB/vm4PVVNyBiJqWkprjYFZ+ga8VtU0UF3m1jIqCj1nE1KeEiIZUkArgftNeMWWzzE2yd6ToL9eB51IHqcIgd9vMDq5FcRHFM0UdDtjSQ9cojWDjYY4UZ9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7Zz6wdn; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7Zz6wdn"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60853ad17f9so13176857b3.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Feb 2024 10:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708712099; x=1709316899; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bej+JJ3v6fc7i4XxpJGQQXY0IntuLNtJu33fXgwRuYM=;
        b=E7Zz6wdnnY5YZsjV1A2AgBHlD1wo2PLgLuyG8EVyXWNR6NUlJwpM8tQrXpxpAoUWcM
         mLtzUVyOqozwQfUqxNJS06ms5btGc3Jz3KU9T874Kx3kA6n4pSukWaMcJptPoUsxAfU3
         VASHRfeBJXzVDO29C6aPBDYlG18jjBk8ENG05qHntsqNvHNED6XcL148COGtA7lcdqGy
         pe2Y81HGtOau/fwE2nvwJdd9dYQtG/Z1A4p+CGP09/LbXV2OlNfZW19JPWcibGdrETCJ
         9PAYnvcrsVAC80qx/gVcL92T4vrkhSWS2DW0vpNx5/8Qii9rJOqxAph4mSciuv1f3KY7
         gpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708712099; x=1709316899;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bej+JJ3v6fc7i4XxpJGQQXY0IntuLNtJu33fXgwRuYM=;
        b=PvNOYnPzY9nzbgYOjCDJrGzQAChHn2TdkjrCpDZxAPUjq2gEAa1gYfwTYMt0Uhct00
         VXQ9Hd2gWK/cP3mHcsSbJ2XoLUiysmaiZsxO3/VXy6Ewb4wtpQCjE7oWshBaEDk3MrA0
         7Loh7gXXn7DtncZdlYfmVkJiUAxiFtIAb4+FN05Os6FKhV74AWwChI0Lr7aXR7tjuEgs
         xQ++QOy4d3x970WLZFyI6cPFVPkgx0APNBbbwjAd6srodBsZKVD0FFmhuCnaaGENkPSs
         LdMteqlS5lHvVaJs6XKl5oFTADuHhp8Oyo41xEPHzs5JXkqfe4nHzdWNDNEl1S2gqFF2
         3Vlw==
X-Forwarded-Encrypted: i=1; AJvYcCUa5LkI+ZkbhDmj+J/pqwDjrgVFdF8lAQMx0AjczuAtHRsQoe2nNCMgzE1EBAGvJmnkSRwV2YXNvcOq7BQEuB2nbhXMKV3nI4AfMS5SBg==
X-Gm-Message-State: AOJu0YzhDs2s8SKOPcjLZEpo75JWZxgCPXVXnUW1KUnWIDmiu4Wt/7tB
	5rWuM9ZQ/NnL98KYK2teMWPPJ1uRyYEqogBZTV1d/PexgKOgylcRdGYoTwniPIOolTM57AS/gQT
	CppHj+Cl/Y2lq5RB8bo86FO0Q/d8=
X-Google-Smtp-Source: AGHT+IFAqX1Alshv376ZhMNlyoqmfCK3CTIFfHANxWb6f1IQokRly5XNKajGW9/04laimT/onO6eb8D0SMawuA9Diqc=
X-Received: by 2002:a05:690c:3508:b0:608:aaa4:8639 with SMTP id
 fq8-20020a05690c350800b00608aaa48639mr660410ywb.3.1708712099277; Fri, 23 Feb
 2024 10:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Fri, 23 Feb 2024 23:44:48 +0530
Message-ID: <CAHxc4buV_UieeVVBhua3vmT2+2e6qf2B9uoxpSPAg6faGBa=Ww@mail.gmail.com>
Subject: tree for the greybus subsystem
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am fixing a coding style problem in the loopback bridge driver for
the Greybus loopback module. The source code file (please see [0]) is
located in the staging tree for the linux-next.

In order to create the patch, I need to find the right development
tree. I checked the MAINTAINERS file for the Greybus subsystem
development tree but could not find one. I also searched [1] for
"greybus", but without success.

What is the development tree for the greybus subsystem?

Regards,
Dileep

[0]: drivers/staging/greybus/loopback.c
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/
