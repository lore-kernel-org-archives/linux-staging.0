Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA176279901
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718701; cv=none; b=HV124NtcqnsjMuPVhjfvUtnFfan+RaKECi4uv39Ab3Y1JT2eBQuvSNEFYZaD2bHf/yNRRc8pZHM8qqS7rIAEH9KArkXjWWHtXSWlHk+cKyQBfy4XNKPBhtDBzAoKCe7S0bxAf5eFESsD0TikoKS56QkYx2qO3CzYYjTEwr3Fcr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718701; c=relaxed/simple;
	bh=Kg7ZSS7djINgfvXim743KFOjolzOhMc+GyHr07cHwS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYTsDyGDTraQis7/6vI0s+QSl5zrwNCZIAHVN9F9glMcmOhB796PHObRrv0DwLaETKigWNq0QcIDa3Zs9BfBFgbJrv/y57l8js9BxUOXmaFHcrrinANJ6tZ1VCJ1uTvervugPYHE3PPeSH4gAwmFdC2U79S02Nd9iOgEwdblnxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJkRKjY1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJkRKjY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746718698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zah8ICy0Doer0Ijy3M3n6/uX4Bvln4wQcKl/L3riev8=;
	b=PJkRKjY1Zre4D0tLyxKA6UH8SnHXueGna6VW3cXXBs4AmXj1qdVYfMtXRIWxEZHzCNpjoC
	GgTL/WX/E8SmcFvjTiK8IKaPEqM60vQiNfEBetv9au7/AaVtXwM3gMMsqO2Y69H2WqGmS7
	WMqySHuXu6lc2513yQAbh1aXDoLTsPk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-q6VLlboNN5Wqgl8S4bm2Cw-1; Thu, 08 May 2025 11:38:17 -0400
X-MC-Unique: q6VLlboNN5Wqgl8S4bm2Cw-1
X-Mimecast-MFC-AGG-ID: q6VLlboNN5Wqgl8S4bm2Cw_1746718696
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb8f9f58ebso89562766b.2
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 08:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718696; x=1747323496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zah8ICy0Doer0Ijy3M3n6/uX4Bvln4wQcKl/L3riev8=;
        b=kna/bmWYG8XWXJtuoRo/52Gsksigq0AfdcJapDK0dv+W6MIpxa9C6G30CjPMzDVVGi
         NvrgFjxSmOSl4ushoRU47F+sPQvugikgdi6W6njGLxWZr/yCcyYCeMyDCmJm5UOvl5rd
         AXWas5yZLcb0kKkmd2P2Z09qb/w4lETbXOSPVoW+EBS8PMmB1GA77dmn6OXO8bLu+bm+
         +gbQSgOzN8+wmftMotoeQ6bG6CwP8DLzBcn7+oU4dmn2/XkzBazpb9SeB+9u9YIym+0k
         bZFgbE8GXspG5xJftPIoH/42h7/8LCgHnKx60mxPgP4ZoEIuIlZl6tiI+sEweN1adIm3
         Na9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2AdQSCAh9zK725xNkMYe7S4IGk5ZnQBGWLb9Gj8vn+Npi+2E5/7kQ7sYUx2fK5ULdKKTRXXZ5eFhm7tgg@lists.linux.dev
X-Gm-Message-State: AOJu0YweHYsVAb6wlb3id7lfoO9BdmOFNqlMDWN3L2DEK2MoQXTM4g5J
	UtN6fjo3zuiU15tD7q2waAILhZnLfIu6kOVsoPy9omFPvY6mTD6Xf01lUZGXbFiIOt3fxe7ES/v
	Kl9z+kPkL8vc4NOok4Fy0oeqNWX1t7qxbYwbdXxxtAoAotYQ5+0E3qB2VDfzrRpM=
X-Gm-Gg: ASbGncsykCA9W5B6nUXdkQ8Rw1XOYMIMIQfjtHxy8AmegbwS0PEtyaAtlfuHRVPDzg4
	RRjkIdm857I/R8T6f32rB2WchzjKSZ5FCsuYOM7vT8QggmA4PMps+DrDiEFD5p0UxnLFNbihT1f
	heMRDGHwmC2MP0bMPl44A5SykTQWEAUvLDL6qisLu/ijwvnQ9cXJBbFuAJQuQynDNI9TfmTqjW9
	tJ3yyiA+4ndXGvXltzDnEjPGwJX1URiWNvNIdMgCje67r2ElWxMnHO+0n3ph1YETZt8GXrWe9Ga
	vP2Yox7Gc4dBrR/eQDyzp+wFKTSqlCKVUlP7q7q2xbbspNxPRYC58YmUCYSFfcrilyGpxnFrHFz
	S69AZKi/aAwnHOA4os2t/vXBUTqrEjw0YFzGCzBpllgNyqR5LCTzgeCU4e2FNKA==
X-Received: by 2002:a17:907:c717:b0:aca:d6f2:c39e with SMTP id a640c23a62f3a-ad219050108mr11598066b.23.1746718696158;
        Thu, 08 May 2025 08:38:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR/9XOm0biwaQbqFwHU9vQrmx7eOt8QvIVprAI7w9rV+fjT6BvjgYJwKaYDN6TmE7S2cw2og==
X-Received: by 2002:a17:907:c717:b0:aca:d6f2:c39e with SMTP id a640c23a62f3a-ad219050108mr11595866b.23.1746718695757;
        Thu, 08 May 2025 08:38:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197be8ffsm1093166b.155.2025.05.08.08.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:38:15 -0700 (PDT)
Message-ID: <f1e91522-60b3-4bdd-9e00-c32c1c1d1f4f@redhat.com>
Date: Thu, 8 May 2025 17:38:14 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <CAHp75Vf3jUuALHGk3fXEDRnWKh-z0prSgQ6sYhK_dcrxAiyEYw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf3jUuALHGk3fXEDRnWKh-z0prSgQ6sYhK_dcrxAiyEYw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tlT78im6QneiJ88IP0EWxtC8QxXPizN_Fovq3P-SV_I_1746718696
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 4:55 PM, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 9:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> This patch series does some small refactoring of the int3472 code to allow
>> re-using the sensor GPIO mapping code in the atomisp driver and then the
>> final patch in the series moves the atomisp driver over.
> 
> I just realised that the AtomISP variant is very likely a predecessor
> of INT3472, and hence a lot of code has to be shared between two.

Yes at least the sensor-module identification _DSM and the GPIO-type/map
_DSM have the same GUID. So the INT3472 device is clearly derived from
the atomisp case,

The weird thing is that the atomisp got a bunch of things more correct
from an ACPI modelling pov. The _DSM and the GPIO resources are on
the sensor ACPI-dev rather then a separate dev and regulators on the PMIC
are simply handled through ACPI power-resources rather then having the OS
have to figure all the PMIC stuff out like on IPU3 and IPU6 models with
a separate camera PMIC.

Regards,

Hans


