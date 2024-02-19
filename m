Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322BC20DC4
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708349127; cv=none; b=eywvmTl873NrpCEC1ZDCjmCrkzmQMpMyhCbr0ukWE2EoRShND3oLMH4edd45b0dkWz7klNc2XJQphdZAAI7fCG+mkT8l6xMjLTYJEo7cyak5fpiU3GRwmUx6EwXWNfaxOrVWQAyP7G/YZh3C+Vv3uc1We/LWxP7XqroQcE5/gGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708349127; c=relaxed/simple;
	bh=wQQHRJeKpVKzs+apITwcq3Prwh1LftubXvBNxsGEQGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g89ALq9B10ABsnobfjVYqq1cJTuuSnByYQQLBTsI4SkRfYJsJxAD6HqZsc1tnhWHwWBMPGLackh1TuKAK8MityLOQRhm/ypu9uEqysYJnLg6LwndGxcge4BTAWAswwdq81MgCYpJvlyGe8ckIJR55BrN433UsFXbd+mSvghb93A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TvImEqgC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TvImEqgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708349125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hu3xg1wT7TlGBQtTXkDZYbSMcdag5IKlNBNDFMaZQ7g=;
	b=TvImEqgC+FEoglPxBK8UidL+03E6fqPZvtpYSVV6crXLfmZmRC05zk9GbTkKh9siO4iL0K
	78CEKffw/HJzVNs6KCVqWYUFgA9zMij4V2tkiIwW/WenNm9auR87Lo+Gnfv30bs3bP3Dni
	GlCqMrfuvo28epNWasZpJDklri/9Ulc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-glyyB6X-PJ-lVonVATf-4w-1; Mon, 19 Feb 2024 08:25:23 -0500
X-MC-Unique: glyyB6X-PJ-lVonVATf-4w-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a3ec1d8b1e2so38655466b.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 05:25:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708349122; x=1708953922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hu3xg1wT7TlGBQtTXkDZYbSMcdag5IKlNBNDFMaZQ7g=;
        b=Yh8YToHpWmnDDcBNn2ocsVcA51fA4E/vCHj1Zm3bcKjw857ENEutTG7ihkVlYKyagQ
         qCHMDZTT2ZT8WJC5tdA3c8NXBoyZe9Ckdgp2kayOZR9z4EUah9Qjzgc9ceSCKhwfzP6O
         SI0DYBUmOIzd481hY2v0AvSApUHH93ZbGr6oL7yYYRRwJtm+2TuUzq7QDXpnewULriWW
         P6nU/t05fDFjGMa39J09DK48jCapzTwmemRIoaiTTNO3ozlE2mQJbU+HItyVEviBXjEz
         zQBYQN/HPLlEWm1seh8j/JLR0q7czaJQjrFc20DHFqIbEIPLQBcUElzD/1duRJ9bJhMq
         6nIw==
X-Forwarded-Encrypted: i=1; AJvYcCUDTGYnO6BoZeJZjPRoZJHcKc6uNHIrVEgwIrrazDFBhp5TENdyJ64t0mwwTlPwSCkrqQLV+c+BUKsYVVQtLeP+YwDBg5p5WPQk1IjFdw==
X-Gm-Message-State: AOJu0YzZRJR0SkhFEhQcihfAwF5e7lvWsE0py4KmqAp4rxvMDFxlJjIV
	RF2jJcdHpen7aiaFBF43pFtKhBA6LCaS/u8cAdGbn2qomgJe7sdFyTdt/2PY68DW4m5k/X83uaH
	Ttb9Go7KKtrF2pFXYs+lU0VTiFlWZeiX9ONF+x+uiI47DT+9TDlR6TFHw4dfBtRk=
X-Received: by 2002:a17:906:694a:b0:a3e:d1f7:1ef1 with SMTP id c10-20020a170906694a00b00a3ed1f71ef1mr717710ejs.15.1708349122741;
        Mon, 19 Feb 2024 05:25:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXZocZ+dsIAfBExkVnOHypvoBtji04mLw4dWIvc+dqYN6YalklxGYYTkxB78uMhPvsRRq5wA==
X-Received: by 2002:a17:906:694a:b0:a3e:d1f7:1ef1 with SMTP id c10-20020a170906694a00b00a3ed1f71ef1mr717681ejs.15.1708349122436;
        Mon, 19 Feb 2024 05:25:22 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id lu16-20020a170906fad000b00a3d5efc65e0sm1625445ejb.91.2024.02.19.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 05:25:22 -0800 (PST)
Message-ID: <627cbec9-0c0c-4eaa-8765-ee45c045a6fc@redhat.com>
Date: Mon, 19 Feb 2024 14:25:20 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] media: atomisp: Drop is_valid_device() function
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20231231103057.35837-1-hdegoede@redhat.com>
 <20231231103057.35837-6-hdegoede@redhat.com>
 <CAHp75VdRny9rUSb9Y9rgeiAFkhHR=9LO45BsQbZk0X4U7CEhfA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdRny9rUSb9Y9rgeiAFkhHR=9LO45BsQbZk0X4U7CEhfA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/2/24 01:19, Andy Shevchenko wrote:
> On Sun, Dec 31, 2023 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Now that a single build supports both the ISP 2400 and the ISP 2401
>> this function is no longer necessary. The main probe() already
>> contains a similar switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK)
>> checking for a known device_id.
>>
>> Move the revision check into the main probe() and drop
>> the is_valid_device() function.
> 
> ...
> 
>> +       if (pdev->revision <= ATOMISP_PCI_REV_BYT_A0_MAX) {
>> +               dev_err(&pdev->dev, "revision %d is not unsupported\n", pdev->revision);
> 
> While at it, can you fix the logic error in the message ("is not un"
> -- double negation)?

Good point, I've added a patch for this to my upcoming
atomisp pull-req for 6.9

Regards,

Hans

