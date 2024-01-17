Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AF210F4
	for <linux-staging@lists.linux.dev>; Wed, 17 Jan 2024 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503834; cv=none; b=BtU1nMSVlkv+A5tVmt8SjWXk1xXQKDMyJSfIgMsV38gHZvP2EqjLm2vcYasF7CJP24HYr0sEBhj54MEsiSFebIqen8HWKtg5l//+jdMX5bn2gslhz4gr2s/pMSPn06PFK3vBi5aTxuhvUVEFadT5axtdpK+0BEOK2Y7gmtNSs5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503834; c=relaxed/simple;
	bh=xYuQz0Pd75gqrVgkrtQSxGDqG38YM/aMVSfx6tJB02c=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-Originator:Content-Language:
	 Content-Type:Content-Transfer-Encoding; b=qxhSCw2XWExSIEt448Vx2+8u86bdw86FSH1L26bJyfWbxlTogTcEMfQsoQrueUs/yIf1acWY2q36IrCk47jiC5mbUyilf3i2DJS3QnNiWDIqdNhROgz2xmatcEgK2Pp9btHcnI0AH3uwotE95JywJLxriPUemIl5s+sRf+hFd5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h286AxSd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h286AxSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705503831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xEOKQ2cADtebY6MDgz1EBt9G7IYPwEzgXwK3qQErjk=;
	b=h286AxSdgkBWXE0rgVwny8Gaxq5SOMS4Zp+yNMLaEcHD5jXHi8DHI6sr8zEEzEuPT2Oht6
	spko01OxJyQ1eB2OXVQI5Tt736Gl6n2q2CG5rT8VQG0BK2OC4U8vYandyOzkgMCY250iKI
	41NKCMznsEZ7JSWliuo4ONVBlXAsK9w=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-TstnMbCJOIGl_a65TNa0xQ-1; Wed, 17 Jan 2024 10:03:50 -0500
X-MC-Unique: TstnMbCJOIGl_a65TNa0xQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-50e69fc4574so8790785e87.3
        for <linux-staging@lists.linux.dev>; Wed, 17 Jan 2024 07:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705503828; x=1706108628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xEOKQ2cADtebY6MDgz1EBt9G7IYPwEzgXwK3qQErjk=;
        b=KQ6ln8MZ4lwAfTISAPTw4NgoivMOPNWtIdVc6QC6voAcRD9DiQ8Wphnrl6SqGfwHoi
         ZNIZFPFHSzDfS3Ko+D9W4AnteXgut5lJgCYnhK9n2pwNaL5hI/wAYwuqKgejZ9Ppz96F
         XNy/+CJPX5PPM0/HNcdSMpDQZJv0iA6AvsfxNJ+J2S1C3SZrqrMW2/weOLTu6iFvsuSg
         U/1OSvS2WefBeBE11nV1geP8g7My9PwlTwev1PoX3q7QTS28tsIKUC2uFNeIDRG+I+qb
         9Ip40LVGl4BhhyzgQODP/CGnKYtt3WlrKZ2pr18PfKJBN2Lx9FBr/d9TEeucSmv667rs
         G9iA==
X-Gm-Message-State: AOJu0Ywp4q9OBChHAPqGV1aQFiRS85bjxttgnjVIpdYFGUOa4uIYxZuE
	Yhom0iMIIZlnOQfogfGXv5G6ljsQivsiYqTBeVLJaHsOs9RXvplPlQQGI+a+lChNcjoKIGrrFJz
	ZU0/Q3jhR7B40Qrx0W1epGos1Orvlm+s2OA==
X-Received: by 2002:a05:6512:239c:b0:50b:e724:62a8 with SMTP id c28-20020a056512239c00b0050be72462a8mr5411236lfv.92.1705503828531;
        Wed, 17 Jan 2024 07:03:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZe3cAXqADxFpnYxMsfoWaEEgiQVKNAOZKNYD7H3jvGnNcrldnqDngzcm61ii4P0iTG9fdpA==
X-Received: by 2002:a05:6512:239c:b0:50b:e724:62a8 with SMTP id c28-20020a056512239c00b0050be72462a8mr5411222lfv.92.1705503828186;
        Wed, 17 Jan 2024 07:03:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l21-20020a056402029500b00559d4c6e81dsm989565edv.22.2024.01.17.07.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 07:03:47 -0800 (PST)
Message-ID: <b635160f-c5de-44c1-8adb-b2bfcc08446b@redhat.com>
Date: Wed, 17 Jan 2024 16:03:46 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] media: atomisp: Replace atomisp_drvfs attr with
 using driver.dev_groups attr
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20231231103057.35837-1-hdegoede@redhat.com>
 <20231231103057.35837-12-hdegoede@redhat.com>
 <CAHp75VfHN1gbWRX20PpWVevmA+P9E4GCdkG0vRYQQ_QZvWKUsQ@mail.gmail.com>
 <960cc0a6-6ef8-4a66-8f83-89e854b7b578@redhat.com>
 <CAHp75VeREE+DEuCiAyPQkMRe2ni7K+di1tSFG=vjW4EWeS6gPw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeREE+DEuCiAyPQkMRe2ni7K+di1tSFG=vjW4EWeS6gPw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 1/2/24 22:23, Andy Shevchenko wrote:
> On Tue, Jan 2, 2024 at 1:30 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/2/24 01:33, Andy Shevchenko wrote:
>>> On Sun, Dec 31, 2023 at 12:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +static const struct attribute_group dbg_attr_group = {
>>>> +       .attrs = dbg_attrs,
>>>> +};
>>>>
>>>> +const struct attribute_group *dbg_attr_groups[] = {
>>>> +       &dbg_attr_group,
>>>> +       NULL
>>>> +};
>>>
>>> ATTRIBUTE_GROUPS()
>>
>> I deliberately wrote this out (had to write this out)
>> instead of using ATTRIBUTE_GROUPS() because ATTRIBUTE_GROUPS()
>> makes the groups variable static and here it gets used
>> in another file then where it is declared.
> 
> I see, but can it be refactored / does it make sense to refactor that
> it becomes visible only in one module?

The problem is that all the sysfs attr handling code lives
in its own .c file, where as the driver struct is in another
.c file, so we really need to access the list of
attribute-groups from another file then where the list is
declared, which makes the ATTRIBUTE_GROUPS() macro
unsuitable.

Regards,

Hans



