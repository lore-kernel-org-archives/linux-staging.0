Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90B485CD5
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826195; cv=none; b=XEOHeGn1chTqc4lZC1Xx/wnpL7n0faxGamvvOkUGYlO0yoF67NiKdHOyAMJ8bK8+ig3tq0p0UXXL3YwKFCfLhuI06XxcPoL5V0fV2XvV+OIskhRCxslklPhwMjXR21KRS4ySC9Udp56u0e+IE0UKWPgIGLh5AG+m6/lms59ZNXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826195; c=relaxed/simple;
	bh=Bndn/OW545z9AKc9EjRSQh2GqKi/c+C8v13sE7F90w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ER4FA5N2TEXIV14J9MX7gfVlUBqAcTxlC5lFsdEM+T+FbzdiejAWKchKFWzRUVIMd0vcZnnwKEZCzvS0qusbF8A1EJOg99xDW1XxiVCjD7ukAdPynLBc8BmAIT0xUTKK4uApOsTFhpiaI7zWr1XwQnsiW9uYVoe1rv9OyhRmsb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ph01x3JT; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ph01x3JT"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b013084dc2so781486e87.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784826187; x=1785430987; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/e/PrLbEEPLFY/UT+9fxdcyn4cA5bayiSEEn6mmf78=;
        b=ph01x3JThUsmjCvzMloDY3kG1u7bfkwyPyPMcJrtkVwkVsaaDd6HzmSUGsEvn8tdBr
         paZYNs9Bnw64k43dbu2C1e1/5Atd9CHnWtM60weXRbs3poPAfd/u54OuXe5xn9fLoIMo
         LQSJADP7YkQ4gMhJ2Uh7hzxbwgU07SfzW8TJP3hrksToZpcDQq+dBKqCH63LUR3Ce3Y9
         /k5Og4CHXJggIaeyv8PI++Cjbhes+eRZ+qS7uMV788QOjSq+hBvC2V+KAJNVpmg5yTfK
         QfAuNPL/ZtlboAGW/Sqr4zcW8MpCrGnOaZOS8Q6N8U6LCQy7LwDPF1Ock/hVqIDLqJEF
         go+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826187; x=1785430987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l/e/PrLbEEPLFY/UT+9fxdcyn4cA5bayiSEEn6mmf78=;
        b=XPUFg/Smiv5P2Z0dXJr6Hy8h5xxgebR6Y4c1zvH/OcBTtrGp7E8mTD+km2c9U6aVkd
         DmJVCvFdTWUOpplvjXXgkLWxQxfLZyLgNe7We+u/eFmcb65tR6jbMUuN42QLzEeM3XLV
         5kOHU6x+u/mwhR1VaAyfLyFX3JYQH1AThSLNBcUYLWkaYVOANeVUzrnQr5UBvZj8hXzY
         2PqTYMnFf5qI0bVRkE7Cg8uMLyqAPfiibRLDVmsNTzby6ytkKlo7FbdbnRpbnZafGzDt
         iyQDAc4oOAWj0zePGO7dkXqTR/Y/czkGpsA3xpUyGpUuqTfxrn2lm5cjGxHmBymA+BxI
         NgTg==
X-Forwarded-Encrypted: i=1; AHgh+RoqXqF41IUx4Gt5furHBG+h5KY7K4frOU/rxEM707TILqPKu+EKcC57HX6KqG/RBYnXM0Zb9fEl3fPnBBsV@lists.linux.dev
X-Gm-Message-State: AOJu0YxNaHgQM2JMAY4U2TSyRi27iHRktVGPJoXACYQjftq9PeML787Q
	RqDX+QR2y1alhisgcjLuE3Y5HBwY7IelcSlEXV7bNvqNTLF5Z46Zuo17
X-Gm-Gg: AR+sD11UJjt8djFYF/0NU65YQkakz/vIFvV8H16NUZA/t4GkTNHK9qMdw8CtY00aPzo
	XzioL65SBDfqtwx5I3XFMARQa6yMtikQ+/oZ+Ej1YZJYQ0dQHrP8ris9y3xItdvcDz0qT20qBVN
	q1c4WBM0fFxA2Z6d6H6AlAczcExNCOzAr3TuFFGgMoJlB2TkOmhUqn6/sbBlaoRfoqZ9rWxQnc6
	Kurph/ME0cfSuCYtQ76NhahpAKsWkitc2xi2J46IkQfujq812Uh0Gw7yS8kmXBHwJSX2yE5/vGr
	ldf6RwCM6QU1tIJDE/Jj+gEvHztjkg3LzSSeqwwcYlTvtUd0VkyvUf8azVDNbgc86VH8ejcbyby
	XvZyXRvKjdo9z7SYu7vC+SjrYzArn2YwUdQuVr2uYFm5dy29PoDfij0JX/WYwl8+WZT8cKs6f5c
	A=
X-Received: by 2002:a05:6512:688d:10b0:5b0:f9d:f7ae with SMTP id 2adb3069b0e04-5b2b2e4b432mr585126e87.5.1784826186587;
        Thu, 23 Jul 2026 10:03:06 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d302e3sm1117257e87.51.2026.07.23.10.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:03:06 -0700 (PDT)
Date: Thu, 23 Jul 2026 20:03:03 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Santiago Ruano =?utf-8?Q?Rinc=C3=B3n?= <santiagorr@riseup.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Subject: Re: [PATCH] staging: rtl8723bs: fix several line spaces in wifi.h
Message-ID: <amJJR346qLOa_Kxc@archlinux>
References: <20260723153526.255965-1-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723153526.255965-1-santiagorr@riseup.net>

On Thu, Jul 23, 2026 at 12:35:21PM -0300, Santiago Ruano Rincón wrote:
> Address checkpatch.pl warnings fixing reports of type LINE_SPACING:
> 
> WARNING: Missing a blank line after declarations
> CHECK: Please don't use multiple blank lines
> CHECK: Please use a blank line after function/struct/union/enum
> declarations
> 
> Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>

Looks good to me.

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>


Thanks,
Nikolay
