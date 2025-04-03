Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E78524EA95
	for <linux-staging@lists.linux.dev>; Thu,  3 Apr 2025 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689994; cv=none; b=rJURXXXC2vhzvTRbXhLxdwbJ3ZdkoJJa+2jku22TC1Upec1b/5Vi7AI16/eO9WWMLq4GxHrq3LLGjB6ciiQyoPMXzko0jS3V3BUVNdXysNxBFYIe+oVPaapfd0EuhsgHee99niVek+6TEQOgSWt2oRpzQOlXbrq0C+ZD1EHpSRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689994; c=relaxed/simple;
	bh=l32nJhWlvQpJaXMheQIHq7EaHrAGjn3ePH6vgGK3ZrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c74PvKxxvEjq2bDaKH61EzORJy51o12Z70qvJgezlr0eP6/Z1m0pyw+Ub/QkyDzZrbIaq7Kw9RsO8LsAYTN0fuGSjsQiNCd0h5uce6W5DF9kUBowdH2tQvIj5NHm7tXkIKbgtgbRGIZo+aS398EG+Iik5zf9X9oi/c/5Q/Boxpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GBCVS14u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GBCVS14u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743689991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRj4duMKWuLhK3/1HC13xNiJuwQlUGnDJUVVcga109M=;
	b=GBCVS14uVsZbkK27B8a3WRQuSa9JjcQa4Tzaa1NKasPHBGFprqBS0YhWVXn9yLAj80WOwr
	jL6aGSZ17XIrRCdWDQHYHl8v2kHur49Hu6ajILaGsrPNnb61sZT3ZAgpEZ4p9+YD4BFfDj
	Zi4taa8fyuVDvnfK33B8l3ZajKsOIIo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-cdC9acqKOduaTUvVPtenqw-1; Thu, 03 Apr 2025 10:19:49 -0400
X-MC-Unique: cdC9acqKOduaTUvVPtenqw-1
X-Mimecast-MFC-AGG-ID: cdC9acqKOduaTUvVPtenqw_1743689989
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac737973d03so84092066b.1
        for <linux-staging@lists.linux.dev>; Thu, 03 Apr 2025 07:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689989; x=1744294789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRj4duMKWuLhK3/1HC13xNiJuwQlUGnDJUVVcga109M=;
        b=Uk99O2CuIH7A3a2mxDUqIuCQb3odmwCGcddFt4HhzqC6EcG2CpwkvVaSuOFom21UJc
         +tvGlO5FbTsqTOelamKrPRJzae8YsMxoaQhvvAikdh65utGEL2lmvyHrJtN/R8yfxokY
         AbK9OE1Ja3UeLA5YeiAQVSBhAbhINX/5Kt62b7TjdXqrYl6V9KMSbeaDgv3f+bsvXdB7
         UrADg9ki3ptmGXC9gCaq1SE2yVLHWD+nnI8esQXiELJVWBgc+1aqnstlQFCc8qjsXU/u
         nxkOMlAaqPbgZ2dvkjdzSedZPFERd/Au63zhZs0mN90wj6s+OR0mkadhx7d8YnhHxcGa
         YU+w==
X-Forwarded-Encrypted: i=1; AJvYcCX4TQcGV3gXp7ipqWwbw3HhWAk5UgcolkfNfmg7+TlYPgKUPY9ihCfK5isA21OebXT38rFfrP2MFcYiKM18@lists.linux.dev
X-Gm-Message-State: AOJu0YzJpCNzckHeglC4Fq00ZfscZT4iDleJ00aC0uwjW3E3Gf3zgztX
	zjwlqd1VWPsVf6jsaKyrDqX4LaxQWP2gnWeHaCVtqR+sBEyvKb4ywQqGBFrHGMIP9HC7aLAO5RM
	P/PTiIYzqSmEg6aAUbcNLZ347/eVeM6wiVflJLqEabYTJRcElDBG160AcWXKxccM=
X-Gm-Gg: ASbGnctLtdDF0Gu7MW5MpaWiCrsdgdcC07gghWICRlRwFi19j1t6ropsbTQoVZCoL5U
	naxK42Ye+QtCTE1fFegDBzGv3npttDovllw1Wv2ARSPt4BRtI35/ajnGmVVPlyLwVckD0AAK+5C
	ggqDJFx9o6mJ0Q6XEG+Ei77Oo5mstDI3lsirv3XNO2AdIv821eRNqEp8p3/HQZye1RrGkYL07WG
	w+w/xNvr2BLfRBqx6oFrjLtonrO4AV9fJ23K4PEwnxNhoh/iILzfdGOFbz5HlVggnCu+DUg0pUR
	5GaPdvzhPqP5qKyWiL+RYGu0TqPgRH33TD4MtbEmQ1CaFT+I/ditYqGOUzUrr0xO8ilmxrLlnMD
	kvPPeVc927AIGhCyG1W12mYPeue0QGF7UndNeGu5q0AuM/uxF6gLbI7Lp1CG6BVxOXA==
X-Received: by 2002:a17:907:72d1:b0:ac2:b9c8:b7ba with SMTP id a640c23a62f3a-ac73895fbbemr1917788366b.10.1743689988659;
        Thu, 03 Apr 2025 07:19:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE389JF5t/NVOtZsuHT6ZzEofdOeTC/k4+UGMGsxdz2+Ni5DDJM4CsvuVwaY3ElTZolYu+ZhQ==
X-Received: by 2002:a17:907:72d1:b0:ac2:b9c8:b7ba with SMTP id a640c23a62f3a-ac73895fbbemr1917786166b.10.1743689988309;
        Thu, 03 Apr 2025 07:19:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d44dsm102241066b.13.2025.04.03.07.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 07:19:47 -0700 (PDT)
Message-ID: <3beaf600-1670-44de-a782-6e34010061e3@redhat.com>
Date: Thu, 3 Apr 2025 16:19:46 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a
 value in pci
To: Greg KH <gregkh@linuxfoundation.org>,
 Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 andy@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
 <2025040320-fraction-bagel-ea64@gregkh>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2025040320-fraction-bagel-ea64@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ODcVKRtThylZvykn1QR0PfC3jj5sjsSOvX-NXEuuqNA_1743689989
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Apr-25 3:54 PM, Greg KH wrote:
> On Thu, Apr 03, 2025 at 02:26:41PM +0100, Abraham Samuel Adekunle wrote:
>> When a value has been tested for NULL in an expression, a
>> second NULL test on the same value in another expression
>> is unnecessary when the value has not been assigned NULL.
>>
>> Remove unnecessary duplicate NULL tests on the same value that
>> has previously been NULL tested.
>>
>> Found by Coccinelle
>>
>> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
>> ---
>>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
> 
> I can't take any drivers/staging/media/ changes for outreachy
> applications, sorry.  That should have been in the instructions
> somewhere.

I don't know if this helps wrt outreachy but I can pick
up this atomisp (and I plan to do so).

Regards,

Hans


