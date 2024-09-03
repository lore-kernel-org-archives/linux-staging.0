Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CA519CC18
	for <linux-staging@lists.linux.dev>; Tue,  3 Sep 2024 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361939; cv=none; b=O6dVxHm6e9PAz5GhdRlI5okRVjxCfyofltvZZmoahg5dXMicPT5RVLlRyhkB03/fzS6Ua8VRJs3jrlz6kIeER5DKQNcASObaAmup/ltGYNoOt3BXMZzx4k5mGOLmBTfKN5I/SnoSp3CIw1e0ZcNFgQ/AOOSuB78PuzIgRv0JvC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361939; c=relaxed/simple;
	bh=aDkHQTiJHsUOr/r43kZ/bHVNW8bGCrSVVztLhlOY6Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCOtzZLKePPybp0jZ2CZ2/1eDoJCoBP3NOgzpDUTgXp4GHQEagvNi7baeeNh13k1XF5tyL+eSIRTgVyC4A0U5/43SZeONFFi60GgFoXWRu5Cxt7/1m3cbkinFEjzqaUGbCi95J9+jrhX3xXrcPsbEaU5bxATKIhkMrQdMCaWLV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhuX4kJ4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhuX4kJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725361937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hcgpHeqU4fyIC2RN61Bm9ZusM/pGlZZW2D5uDcUK9tM=;
	b=dhuX4kJ4/wbCJ+gCklZQeaB0PVtW4RYEFFMtNBuMX9uGoqQnZ6jBTOT0am/PpEhwiU5fAi
	Zroc2O7wSvUFnlkxFDw4zAxytUtcYPyzrW1yEEg4ndG0xFXwEYQYedEuf0LOuuR1oie8kI
	Fff+FlLKtvGntCIuJcZsgfatAfAb5ts=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-0pLbrrv-M8SNaOsCliMVng-1; Tue, 03 Sep 2024 07:12:16 -0400
X-MC-Unique: 0pLbrrv-M8SNaOsCliMVng-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c260907ecbso759555a12.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Sep 2024 04:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361935; x=1725966735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcgpHeqU4fyIC2RN61Bm9ZusM/pGlZZW2D5uDcUK9tM=;
        b=ef2ko9jVw7YkJlB0F0/scAAD7jkflNra/P5xnNW18/a4wLhXJ1n/D14USsLWc4PI1C
         baX+s4mxinAx/k5hpMvjX2VD82UIPo8JkSMaYB1oi0tXG6mk9C9oZSf2YVYgs92GuSzj
         t/aQzcaYIskw1WNmYkP6kWa0Sm4mWYQORS+lRPm6uoGFuVJbPgpL17gLOx3oRH3YIxUX
         agIyT263bhuncgf3QwG8V59Krj/dJUCuQDsLMa9OSUUWgOIfwdNgzxccwceI872UCrtP
         Q3s3YyLTg4gPshicd21CL+epDhBM5Vot4Sk7MuOXNVn4bMKifyY1SHxyVkfQUjE17WPy
         +6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW+IZ/c3o7TllBMI4cUl6oMD5HaTCiwneXtqje37s3GDNnJ/wo1RHC8/sf5Y9U77vwHdnlXD1S6a370Be0@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3gsnDO54VR2M9ZL6NdzMEcqj+L/AHvtzy/QHe1KaLPT2SzEfd
	Ae6dz2t5SXjAM7hgzKlwSaIs5vQP0nTYchUbv/aNUKi8ptWbOBY3gFQ2N8DkHHQ/kuZLjudw93I
	ROSu8nHWUt3Q1YnQwlV8Q5LC/FKViTWBzx+x21p0eCa48bMNcuMthIEJgz0Ru0o8=
X-Received: by 2002:a05:6402:3594:b0:5c2:4d90:988 with SMTP id 4fb4d7f45d1cf-5c24d900c96mr6961309a12.32.1725361934836;
        Tue, 03 Sep 2024 04:12:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC8ca8n48qlFPZ2nXFuyCPnsw0jl8kVkKeLy5v50dAxq6/0LMgqwYtjTwSaNJRKTNv+3+3Gg==
X-Received: by 2002:a05:6402:3594:b0:5c2:4d90:988 with SMTP id 4fb4d7f45d1cf-5c24d900c96mr6961279a12.32.1725361934217;
        Tue, 03 Sep 2024 04:12:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ce9fdd8sm3727189a12.92.2024.09.03.04.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 04:12:13 -0700 (PDT)
Message-ID: <18ff79c7-a2b0-43f7-be6c-396ed1df29be@redhat.com>
Date: Tue, 3 Sep 2024 13:12:12 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: atomisp: Improve binary finding debug logging
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240902095229.59059-1-hdegoede@redhat.com>
 <20240902095229.59059-3-hdegoede@redhat.com>
 <ZtWpi7_S5d7NZx61@smile.fi.intel.com>
 <a3363c07-6595-450d-abe0-c1ff4a3e9955@redhat.com>
 <CAHp75VfZEjq+ep_5yjTr+-mPi5F3XurWDrt2tNUX+PW5k-HkJg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfZEjq+ep_5yjTr+-mPi5F3XurWDrt2tNUX+PW5k-HkJg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/3/24 12:30 PM, Andy Shevchenko wrote:
> On Tue, Sep 3, 2024 at 12:27 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 9/2/24 2:03 PM, Andy Shevchenko wrote:
>>> On Mon, Sep 02, 2024 at 11:52:29AM +0200, Hans de Goede wrote:
> 
> ...
> 
>>>> -static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
>>>> -                            struct ia_css_binary *binary) {
>>>> +int ia_css_binary_find(struct ia_css_binary_descr *descr,
>>>> +                   struct ia_css_binary *binary)
>>>
>>> ...for example, in this case you touched both lines, so making them a single
>>> line just reduces the future churn.
>>
>> Ack, fixed in my media-atomisp branch.
> 
> (Actually there are more opportunities like this that I haven't
> commented on in the previous reply. I hope you have already found them
> and fixed accordingly)

Yes I've gone over the entire patch and made lines longer to avoid
needing multiple lines where possible.

Regards,

Hans

