Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D43C1581F0
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719915973; cv=none; b=UllLabswm+QpXXDafqN43cCM4Huq+cVcxVnKDExdA9IIGNQnmQXAl9M6q/XrSdbTTv7Cs3TBKAAvOyrKAgAMuuU+9YaahtYwlfLfs7Hm8A6GBvSb32A91DIvhYC1C0tVd+0VvFgDFmge4jcgPcup76a2CuwB/+fpG84ZM3K0hSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719915973; c=relaxed/simple;
	bh=jhVT3y9GKmIBnK1dqRP3K4Wy5O9w+BRrhXm25CLuD+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cf1H9GbGnZusVHl2RitfSP9EUeOZ8FRihBzL1ZSyvsm2rHdAlKqk3YhfUn1OCVr3CAbwCymjaOpV8OYkkqvyKZVy5kCoXPZBNwxyWXeuRLgSFS7xMrfRAcZ5LyD/8KriJCM4jLf7hHMDgNaYM1EHMH3IBBn9jvdgdEBbLIUM3hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G0Nf/pOH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G0Nf/pOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719915970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Afxrw0OtXDgCAzsHOEseMCwOgRoPKBguITR/IGA/CcQ=;
	b=G0Nf/pOHMM5GF+iZPAU7H1Lnbh/KM3rkJ5aZM1nvUi35TuRrhArE4TnfdQTQVg1nl5Yn8G
	Ef3gBT+0FzwtIlVzY5SAZcjTERhqfzlMNAQmP1Y5C/x59rnWxvjfXEgGBgCmzdhRVeursn
	/qI9O1/pKrkZKdREvuTRLl2UjvzQNB0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-oYRLcIoaPCaswTbkwcYTzg-1; Tue, 02 Jul 2024 06:26:09 -0400
X-MC-Unique: oYRLcIoaPCaswTbkwcYTzg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-57d3f1d20adso1327760a12.0
        for <linux-staging@lists.linux.dev>; Tue, 02 Jul 2024 03:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719915968; x=1720520768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Afxrw0OtXDgCAzsHOEseMCwOgRoPKBguITR/IGA/CcQ=;
        b=lJAk8JC5C71WW9QNr+lzcIQY/zvFXMLBBEd+PvnRvoHrv9rGWe3gm0I2cORgSCrJTX
         TL1AZr18YxRvCZtN/5DRPUVSewalswu/1GPb1O8QxtwWyR1KVAhRXCApFL6VTtWU4z5L
         edIbEd2XzrXm8cepzpQlUVROYyQ3wPnBdWK2ZmoFynr2I9RqXzKg/Dm/6dtb2wb3btF5
         pUsjwpsmduKGoLdWNWIUXlbKAEYnurMBxmHVLB/7e+zm5UEnWWkRBgruQDA6CcUzTxDv
         SBvbzfJJjERMk8PS0MaZ4FmD4vG0yciVhAzODSqMxMtSLUi0olcdAqkqOPsRm2V4z2vu
         CR8A==
X-Forwarded-Encrypted: i=1; AJvYcCVxAIhiJBqWXcxjmart2u8G2E0RY28i6J0TBjBphs/Dzad1QXkB3POtw4KFiyeqVSfqsf/I1gLONatvxSqFFpklfP9Vtd0ZybKuxZnemA==
X-Gm-Message-State: AOJu0YzVXF13nJc/R2CKZJyBzvE+h/fyRanX9PQ5sLOyYJ0EPS6EJiKQ
	UW7wFmwGpnyHveFyirmfkFNhv6ncDJVd94I+lq+kjj3qZfeD3PifOsOF169xBj4F4Gk3awTw+Iv
	APeVez+QHONpN8JxCzAOvzSeTSUKviwfSXlCzA9Jm0iuXkHZGyLpI3074Mar+/FdoCGkMoXs=
X-Received: by 2002:a05:6402:2710:b0:57c:9eef:e54 with SMTP id 4fb4d7f45d1cf-58780645f20mr6771442a12.5.1719915967873;
        Tue, 02 Jul 2024 03:26:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXQrxIK5Zv1oZ5wXcLlzx+4FACIgThy3UCNoAwLWS0yZtgZn3DpFkgN2IfgMW3Qm+k9p0y0w==
X-Received: by 2002:a05:6402:2710:b0:57c:9eef:e54 with SMTP id 4fb4d7f45d1cf-58780645f20mr6771422a12.5.1719915967526;
        Tue, 02 Jul 2024 03:26:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324f08esm5413910a12.27.2024.07.02.03.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 03:26:06 -0700 (PDT)
Message-ID: <674a5ff3-a5d7-41ec-b113-e091019bfcfb@redhat.com>
Date: Tue, 2 Jul 2024 12:26:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] media: atomisp: Prefix firmware paths with
 "intel/ipu/"
To: Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tsuchiya Yuto
 <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240603132057.255917-1-hdegoede@redhat.com>
 <20240603132057.255917-3-hdegoede@redhat.com>
 <Zl4bIoxczvKt03bF@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zl4bIoxczvKt03bF@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

thank you for the reviews.

On 6/3/24 9:36 PM, Andy Shevchenko wrote:
> On Mon, Jun 03, 2024 at 03:20:55PM +0200, Hans de Goede wrote:
>> The atomisp firmwares have been added to upstream linux-firmware
>> under intel/ipu/ add this prefix to the firmware name passed
>> to request_firmware().
>>
>> Fall back to the old location if this fails to avoid breaking existing
>> setups.
> 
> ...
> 
>> +	/* Fallback to old fw_path with "intel/ipu/" prefix */
>> +	if (rc)
>> +		rc = request_firmware(&fw, strrchr(fw_path, '/') + 1, isp->dev);
> 
> Perhaps kbasename() ?

Ack, changed while merging the patch.

Regards,

Hans

