Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E93A1311B0
	for <linux-staging@lists.linux.dev>; Tue, 30 Apr 2024 11:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714477896; cv=none; b=SmZ7PIx7sE7DIuw0IehtgoiTgm9w3XSviQ6pOha3XwBcNTwa5RGAnY2wamWhUJRD58VOUbNAwlLJxOysxMt2Xi8JFI10L+tzhFRZDGyn8khTVTpFLL+zaQqIaDHZVRt2QMHNifrtjBDs1DhKByDTqqlVGPN3Jeu9LIdkZrsT+Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714477896; c=relaxed/simple;
	bh=TjL/wOQ68tW1Zas2AZHYmm43crtHIl7dNu5Msz4jQFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUwVsPHShzmTUdWwiJXAeTyO8CQvqa8IMowS6Vyp4Orr3T2+JLmn3yDWaVReYr+MjILvHnthTtzppPg9tE69OymLCF69z3LOtC01b3Lvpk7RKxoeeM5nFCEnOrJzvtlLuxtWmsqiYKDkAdT4qMUfQS633FX5NoiROsWL2Nzbb60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DFqGpcn3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFqGpcn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714477894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unDRZ/H095BgWrGSZDwHh57CtLQ3EbB9RhSsvsR0GQY=;
	b=DFqGpcn3uUQnPselsljucoYdbVCUKgbTdxIxt7MxwA/0BFNNCmMGz0RtuVAUUiDH2hnz5d
	/7YDKRJ86frAw0Z+oDziM0Oqj6GB5CUhvVWkgHzTotq8EzusU/v/7ZOJNtURzfCd1aW2Xd
	5nb5ovtlXiT+qDLChbTwI7XyJFUzq6Y=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-KutM4p-VMTWMiGH3TUYzQw-1; Tue, 30 Apr 2024 07:51:31 -0400
X-MC-Unique: KutM4p-VMTWMiGH3TUYzQw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2e0fc430e7cso5462821fa.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Apr 2024 04:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714477890; x=1715082690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=unDRZ/H095BgWrGSZDwHh57CtLQ3EbB9RhSsvsR0GQY=;
        b=bhz/n8FMjJjpviwJWDbyENOokVNMxDR2nwGBDm1Vh2zn1vZF+iJ0+eV3IQvWwImMDq
         zyiEPk/+rmNDbEoeptCMClyGknKF2Amj80O3SNOUSxkM2mCbcIMAm4lPN25WqOuxIzpJ
         Riy2ChtYL73yrRe+WqvU9gjxmznZjpTGk+3bxmTkV18Xiq40+t89m9MQssLrQy4hVGIZ
         Cep7aivqng5WuZguUwGjFBoEJPdjM81wDe+LKq88TjAVzG86nBlVD/TUk5sES6fQHBmD
         ldQeD7yAVqbL1IMXx6bun6h2fgAoUZHv2KKOkxqNC4VWuVniJvx4cVPnYJ8FKpmYuViX
         aczQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhuK6tJmQDnxy5Q9b+7PGq8eCGeoaMgJ8eOmIIasaFO/G1jeDNu2IGan/s/6lRujJE8W85OBYxpTSrERev1CYSMRDYKEFIXZRGLGg/SQ==
X-Gm-Message-State: AOJu0Yw30IfQHmS7UGrdsRl9hSGNwIn3cEklFydtxuhd92LdBly5ewDg
	p2nVD5Sr3JGkTK1lUA1dFlNDWbUgoUx1a1m+p6RihQTwktwkhSIT2hmUntbk4zEjISBQoTwa+TG
	sEzVGdQCu+VaBXBmvOrXn8St8yfaedBlNCeZnVf80eLUAHUleHE4gj5pINrLk/to=
X-Received: by 2002:a2e:9008:0:b0:2db:a9c9:4c5e with SMTP id h8-20020a2e9008000000b002dba9c94c5emr11399960ljg.21.1714477890062;
        Tue, 30 Apr 2024 04:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeyhj7KHvw3CC5G9UFMQJaaFfHWxZ+LlhMjB+MIcLsHysMu2B4a4Oz0DQJy5ZUcDIIreV1Ew==
X-Received: by 2002:a2e:9008:0:b0:2db:a9c9:4c5e with SMTP id h8-20020a2e9008000000b002dba9c94c5emr11399933ljg.21.1714477889682;
        Tue, 30 Apr 2024 04:51:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dk18-20020a170907941200b00a58ca98bbfbsm5181086ejc.30.2024.04.30.04.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 04:51:29 -0700 (PDT)
Message-ID: <0554aa94-1c72-42f3-bc4c-e4a9d25f4aad@redhat.com>
Date: Tue, 30 Apr 2024 13:51:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] media: atomisp: Add support for v4l2-async sensor
 registration
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, Dan Scally <djrscally@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230525190100.130010-1-hdegoede@redhat.com>
 <5dd589f7-d0a7-f453-6835-227013db09fd@redhat.com>
 <20240430113254.4539f575@sal.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240430113254.4539f575@sal.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/30/24 12:32 PM, Mauro Carvalho Chehab wrote:
> Em Sat, 27 May 2023 17:54:18 +0200
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>>> Patch 5 also depends on all the others, so it should also
>>> get merged through my media-atomisp branch. Sakari may I have
>>> your Ack for this ?  Alternatively we could delay the move to
>>> the next kernel cycle and then it could be merged directly
>>> into some other linux-media branch. Either way works for me.  
>>
>> How to merge patch 5/5 moving the gc0310 driver from staging
>> to drivers/media/i2c is still something which needs to be
>> decided...
> 
> Hi Hans,
> 
> Any decision about that? patch 5/5 is still on patchwork,
> marked as New:
> 
>  http://patchwork.linuxtv.org/patch/92153/

Sakari wanted the gc0310 driver to be polished a bit more
(adding link-freq, etc. controls) before moving it.

I have fixing this on my TODO list (but not very high)
and I've dropped the patch to move the driver from my
personal branch for now. So I suggest just dropped this
from the patchwork queue too.

Regards,

Hans


