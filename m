Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504EB426EBF
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 17:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473750; cv=none; b=umt5c/RU/IN0mD4sn18jIhAfipvsf4FTQrueOUiqEWckAj7RbEbHown14lWj3HP1Ib03y2uLriI7a4M9qF/VF1Y289YwAW+IiXno5pStCT3KqJdgM6bljC+Q2Vczbzu3ZtW9GMJkEhQ+Rg7MhBMRcDgZOIjeFYjUB6lN++lLmy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473750; c=relaxed/simple;
	bh=ig75feTQ0nCCr+tNh/NGErz8Mv+iXIfTBGXhGTv7kS8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=GJmCTKpyFUn/ONxV3iJjVjtggbEx4MVbo78x/LAudJwZAIpapnbCe6E7k+ZxFl+c0svGWZyq1U8thNTFPw0G5/ru5+r9QnCViFkGuPXl25e+ZB1SRj1BJUBvS4zMy3djny3zIBHTIPXY0olUxD+QBQFQYjlAjOmJXY+lXYjcaxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF1mb4dT; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF1mb4dT"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79853c0f5b9so39984147b3.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 09:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772473748; x=1773078548; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig75feTQ0nCCr+tNh/NGErz8Mv+iXIfTBGXhGTv7kS8=;
        b=cF1mb4dTh/NrRvsb6NOO2GwKCMYKr7U0mLUKr5xXvsgD5cqEhpUfCKzsEelHkJP/pO
         MdZL3gl6fHyySR41g1GmCWEW4yJw3mnEU5s7RbX0A/ePoMSTJQG4Y+txTqexExIdpG++
         1qHz7mkwS8d5qXKfqJUPM774AfxqLFNBc7Zz3VOZpghMVC5Ad2dg8WgtCNL9SRsWjmlv
         wWRJD4ReP+p8h9FcL80M/UVOUBRbAp4g0PoPYDFQQFQZqUE3NgCI7bj50jXrdYYVBYOf
         LFAf9rNQmgdfYWQ5qhZqGUQ+j7JhYfpMzm060dgPoSAMwTIE3dAr3z59h82fqNYIunC2
         QWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772473748; x=1773078548;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ig75feTQ0nCCr+tNh/NGErz8Mv+iXIfTBGXhGTv7kS8=;
        b=JdtjE8mrPwgh4xiTYhJ8/EGME2bbXPOP0z//MzKZcPeghqgM9uzST5A0EudT7FBQDP
         bjFmPpID/2gskI9I1eDPc5jLFxKj8US2FKJb4VH3lChUotzKJHx4g/179DcHmQCFOc6B
         0SShYRwK/76Q/P7/V0RTCgP1QhQc4KE0OI66F1WyVvkUHjNGWAgUqQpwRLHxVUZ/5r5V
         7n/er7VK7EFuY1tSBVh867Wsb2CO8bSAcbZ91NdnhCNy1NaI5hgUdV9VxW/zukbfok5F
         cvYV4SKdzd60axKKYzFbew6jkYhl0PB64MOddgQwMo+W+mbQgpLjKeH8E+NvaHw3qMKI
         H7Cw==
X-Gm-Message-State: AOJu0Yyea0nR1d5eWIXgz1+jmXEqphs8exPEJFVcbjNhNu9N/DljU4Z0
	hVq4zl888wpAt+zKWau60DP+WuxoHBMk8DuO4kjA+BrdhAhduPaGcGaP
X-Gm-Gg: ATEYQzxw4Dk0wCkWa2Obzjy0jMp47fhK0kCpCUMIhNlNKy+GVD479KGBdvlhJOLoID5
	Ora5UeWznqfv2BeLpiGr7cpvNG9TpNcfx7BB63SPweOD4foGWUqdppJW9i8NcIxNdC5a6S81xjN
	Hglyq90ds0YrgDMD4O7jyHTHROA0NbwvhblHfK/cL1UeekR09yQEN42/F5T6QjveRcouAblzA1N
	PUE43vTAha7HHMH82mtXyFz6Ui+4fki324gXQxXjG2f7MEwIx758e9Ya/li3rwpl5yoRfP76YA6
	z8IctuY2jjbKID5BAk88751EI7OUu2mxM95lzKkKq2ufABoDFJxDNXSHJhtp68V7L1GsvmQqG3B
	Fh2jLRNU87nWG78UlyDdU4K+VSgVlBDTrzzIoi6dFLqkW68PW2UbPF4t+r4G/VuaBS0DoZM5Ttq
	dmw1NBDyFgSEx/uIlCJAfnfYPuVY3zcyuaxfDTjqd3Y3J5T6eQobRZWZoq9C8rvUvskMN8LSFI1
	WPIYGreqDapMXy1N35nwMu9oL8JeILM
X-Received: by 2002:a05:690c:4:b0:795:294c:fd31 with SMTP id 00721157ae682-798855d34f2mr128581267b3.38.1772473748135;
        Mon, 02 Mar 2026 09:49:08 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876bf938bsm54412707b3.31.2026.03.02.09.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 11:48:49 -0600
Message-Id: <DGSHHYAABRGW.3O7ONHDRYUAJB@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in
 rtw_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301230308.5551-1-rayfraytech@gmail.com>
In-Reply-To: <20260301230308.5551-1-rayfraytech@gmail.com>

On Sun Mar 1, 2026 at 5:03 PM CST, Oskar Ray-Frayssinet wrote:
> Replace msleep(10) with usleep_range(10000, 11000) as msleep < 20ms
> can sleep for up to 20ms and usleep_range is preferred for short
> sleep durations.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

This has already came up before and Greg decided to drop it. [1]

Thanks,

ET

[1] https://lore.kernel.org/linux-staging/20260214173139.49094-1-ofekalm100=
@gmail.com/
