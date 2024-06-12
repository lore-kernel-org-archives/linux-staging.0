Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5659E22092
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 05:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170872; cv=none; b=MZvuZ8D+KSfGykiQAEtok805yIih9zz0gqaO9i7sa1DqjeleUni4BCGcgJQcDfZj9fX6asmwlkFA4/Ge/mRnaUHesB1IHNeZVcBcakdi4SfbvlkWkNl5hAUCIjeGTJ/pUJO74K/ThCQ4YnwCFe+NKsRSNg2WgKuJJ3z4oZ1iGME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170872; c=relaxed/simple;
	bh=N2qeEuLIeQ/Sboky+rnEg8RxtodJVVIk8kOoJLibkBg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=LIXcqeEwsgsWgeCh9jL7PkgkwUYvQyMfDd2OxxRDCgSVdjXYSIdgYRF21X/TohNK+n1KQYMgl+6o3nmRdkDRMeJUF5BPadTtdb7zmm5PKTr7XMdI8TSMKCz384ufS/0IZFUx8o4sbntLkoa4dRPPqy4bxshR7/Om1YsmP0CsYks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/IN0RZa; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/IN0RZa"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f0d8f7794so37910466b.1
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 22:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718170868; x=1718775668; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKVvOJDRBmXEZZQWgGpt7X0kHZm5kqDS8w/6wm0mBr4=;
        b=m/IN0RZaX4zszhXxLQ8eQyNjOcsbalqIYpNi+e2DlMB4rEbXHS+iRwivOgvHrIvTpv
         XsSAnKkKnajtRotAfnDg9KBQQrBYYIAllvybH1GjuDfJD5BJvm0R45ak7VImL6kyWloN
         xaa6jAGTLTAKZCPDvMaLlKO89kjMO6cj7uqtWLB45d5O7z5a1owiqZgYQIWixzgN+vo6
         cHdU8E6987mwEiJhU1WkWh2EesLxpgtaB/21Hiien5ObcvyywOtNQJFoO2TAQ2OBkTU0
         M5RCKMC72PT5ApHUErVzNWI+Uxiitc+ubiDW6yvuSD4uSwlM50FNf+Q+p9k2d3PrgX0D
         DwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718170868; x=1718775668;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sKVvOJDRBmXEZZQWgGpt7X0kHZm5kqDS8w/6wm0mBr4=;
        b=O2jHLxsywlCwIwkB5ClFQuKmtITshEfdp405nEKetbod1qKsi1VufW7A9DHUslKXRQ
         TGCdarH7GHzoD1LdKSZRmIXUuVvFqEeeNEcMd2oXSpGixviIiNMPpBcuUv06icewod9b
         4tUypK+Yu/ksEeUA4U1enZD+iHpHd0v6QKl8FqVfscxRhAvXCjKUgdanBqAbS/AqFAbe
         EL47rl66whwBh7jOcU4rfv6J8Z42/mmRGUBHKG/MLpnB9oSiRdwRTiacGORUQft8uxX6
         hzifPJHMcZmeXFLiKol9xmCxhsXNLWGkOYn5/+Q5w3eF8Azru7cBHvztguzvbeR/0sZf
         Z29A==
X-Forwarded-Encrypted: i=1; AJvYcCXawP+Cg96tEEVpdSE2C1II0eBtcJN0fiUF2zhY2d9EV+p7g2FGR0x1r1MT+y4IAhVrYsO0UJp3ldF/Pfg4+Z44jMaCRaUInH4Zi1nmQA==
X-Gm-Message-State: AOJu0Yy7v0VhN3jIf4i01AJJWvwLwzfOXKdZA64EODbqQOv0SIbHDqnR
	t9Z+yAHhToo/qoHpPEzHNGmBD/93DVz6qAuDR/z/PLnZFUnX7Q1RqfIN6A==
X-Google-Smtp-Source: AGHT+IEMKTWRaBB1/ku+YH/D2e753+srFdxu59n9NNVoFvu7NyD67xXsC5R0sbrtRdeFTc4/osfwOg==
X-Received: by 2002:a17:906:4ad0:b0:a6f:4a8d:1db with SMTP id a640c23a62f3a-a6f4a8d0254mr17225266b.4.1718170868261;
        Tue, 11 Jun 2024 22:41:08 -0700 (PDT)
Received: from [192.168.0.101] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80728be9sm838049066b.199.2024.06.11.22.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 22:41:07 -0700 (PDT)
Message-ID: <fcf77c98-0ee5-45ce-a17f-d68dfba9f7ee@gmail.com>
Date: Wed, 12 Jun 2024 07:41:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Teddy Engel <engel.teddy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH] staging: vt6656: Fix checkpatch unnecessary parentheses
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Remove unnecessary parentheses - according to checkpatch.pl strict

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>


Hi Teddy,

your patch creates a checkpatch warning:
WARNING: A patch subject line should describe the change not the tool 
that found it

The next thing that worries me is that the fix does not increase the
readability of the code for me. I think overview is better with
brackets.

I also think that you are doing two things at a time. You are changing
the TODO file and the brackets.

I would change only the TODO file.

Thanks for your support.

Bye Philipp
