Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958C922A4F1
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712856; cv=none; b=MZ5ur7FjS74aAMNdF2TwTSuefh3AbjxbLpe82iVJF6QQGfWt89L7g+y/I8jcWHG1Pb6vYECDpHJC0c4RzRXyXkM5KB0229vCT3nXCvxIgTwhgmDgxSoBLOE4HrAuup/SeZaeD2VaU/xKoEUXZPUHuaRrfuYMrEuQrRopic4P2F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712856; c=relaxed/simple;
	bh=YRoyK3BALEABx2JcCF10SK+pnBjrZ9BRPIqjbg5H2Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAzVHXNR4S/77x4CEErBkSxBUV73HJdyI7zY1aYdjwxAGwmGMeS3WFqqd65MkbPDji017hzqdUbq9k9gVD+X0KKF+Be6qqoRVvj0KrYhXuxpEeqgdc6mOxC1cXtvps3iFO9Ts4m4ZrNVCPYG9B2htIwgDE3vkGCF2T196jb1FUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gIm+i1sA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gIm+i1sA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746712853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6TnCo9X9rFkd8dZfcQN25Ythz1cGmJDR0tW3PaauvIE=;
	b=gIm+i1sA9ZMQ8IWffTRwkLgIxAwkIXERxrw0mFFzC79BhnhWDztavJbnr4NtADs4Gc5u8W
	BRTxtLnHABEoa99I/i1duxDVNSe9PtOLBWaMR0CkK7lLHVtdmbIIKQlVdh8wYt50tI4Oax
	LuZlGaFOfPRDUR9s8wJsnvhcm6yjvjk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-fSTeELitPIGOeKqI-FYeSg-1; Thu, 08 May 2025 10:00:52 -0400
X-MC-Unique: fSTeELitPIGOeKqI-FYeSg-1
X-Mimecast-MFC-AGG-ID: fSTeELitPIGOeKqI-FYeSg_1746712851
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac79e4764e5so81895166b.0
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 07:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712850; x=1747317650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TnCo9X9rFkd8dZfcQN25Ythz1cGmJDR0tW3PaauvIE=;
        b=uMXxhvJwd6fcAp26NQvvqGCalq6aXW4wPgqxV+Kc81Pft1YvAXp1Os3zYT248tF2Mo
         c7p+NN8Ww3p1X33klSvgHieeKpnTB7WVDT2wZZMrzhCkx+Y8+e7CkIzO2JUI2qQxAcyF
         uqzCn4g96N/jCSfXVNp2SDhaboLX6y3mkeMn+seR3iynVZ6/ZlinAv1wmlWk/Pbr6PkX
         TcoG7qEwqHoO7sGdc7zY3N5zEVTntmxzpqo7bvjsTx07K8F7uFGtO3yvkeMogE9Cb1eA
         rUe1gAcYkvR5Wx6ez18I4dorr5ebhr7C0jDTYzyHjPmiVgm8Klh6rurURa0SeFQoCYZM
         ARjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW490mVXkqUcSZdv3D7L2riPH+UwyP7+BPiO1BsAEBMerP1Z+SDvQRTlyoVFLOBdXFnkLdiZeOyc9vBMaCy@lists.linux.dev
X-Gm-Message-State: AOJu0YxeXLLbhjyb8xbbkCgEiCI2rKEiEk1j2LG8sD1ydsULNx3rGor4
	89v3G2/H2je3L5SzgVvscaTLf6m8uiDztuU16DtbJmFVVXwXejrtjc0boHZ/DCd3Xgw0DwByvag
	PZ7EIwc/7y+id91tSmsiVBkdXirQP6uMWuBzs419Xsr1E5IN5dSmqsgLzwyrFHHSXej+eHT8=
X-Gm-Gg: ASbGncuX+oEAXl67bmA7Pcz9oBHrKU3SR9txF7HlsaRTotogiVnaq3ji7LrblcJVAAt
	NVDcl1ik59dNAsWbqTpycJeU0iGxYb+honeJaUC3V0zYc1JMhwkcOYHRAeMZFr0DRhyGuQZlLNE
	sMnNNPWG8uiesC2Om6RJGKsNxfStVVFn2EboIEGb9UHiaCvkoK8+a2S5lKazMJoeEeo8CLA1cCW
	puNDrKRpl8/R2CKwZpYBqgDgDnqJjy0fWoc0l74k72Fd0t6diRVzGTJCZ1wcPjgGIve1BKdjnza
	oQjviX7g/2LTV81ZD1cw3c0+GjMz/Ek+DCi1euSPrR++47i/jfO29gvESeQbD01SKXaMLVKQtYs
	kGbdxTK/4ZBsfFkiQy7TQYZydLcU/tPwiv3x/mi7C49ORLlV4n8W13kOOcgL01A==
X-Received: by 2002:a17:907:1b0d:b0:ac1:dfab:d38e with SMTP id a640c23a62f3a-ad1e8ca918fmr791992366b.15.1746712849946;
        Thu, 08 May 2025 07:00:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs4kUttzZ/fXfN85MKSO8+LoixBy/tJ7xib42w1vjltEhwA+sdD5VBLF+aPCStQURh6GIMiA==
X-Received: by 2002:a17:907:1b0d:b0:ac1:dfab:d38e with SMTP id a640c23a62f3a-ad1e8ca918fmr791984266b.15.1746712849050;
        Thu, 08 May 2025 07:00:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a19e6sm1081594466b.46.2025.05.08.07.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:00:48 -0700 (PDT)
Message-ID: <dc3b07a9-cb0f-4f84-9e4b-c6e62ffc73df@redhat.com>
Date: Thu, 8 May 2025 16:00:47 +0200
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
 <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ud7z_NnwfXcYajqafY-HBesKBpp5ejX7I6bqPtjHmsA_1746712851
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 8-May-25 10:36 AM, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 9:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> This patch series does some small refactoring of the int3472 code to allow
>> re-using the sensor GPIO mapping code in the atomisp driver and then the
>> final patch in the series moves the atomisp driver over.
>>
>> About merging this, maybe the int3472 patches can be merged in time for
>> the 6.16 merge window and then the atomisp patch can be merged after
>> 6.16-rc1 is released, otherwise an immutable pdx86 branch with the first
>> 5 patches will be necessary.
> 
> Overall I'm pretty much liking this series, but one comment against
> the last patch (see there) and one question here. Can you isolate GPIO
> mapping code in a separate file, please? This will help to generalise
> this code outside of two mentioned drivers (I might need it in the
> future for something else, not related to cameras at all).

If you want to re-use this elsewhere then splitting it out
further sounds like a good plan.

But which bits do you need? Do you actually need the full code calling
the special DSM and then adding either GPIO-lookups, or gpio controlled
regulators / clks / LEDs ?

Because atm the int3472/discrete.c + other c files linked into the .ko
does all of that and for the atomisp2 case we actually want all of
that (although for now GPIO -> clk and LED is unused there).

Anyway I think it would be best for you (Andy) to come up with
a proposal / RFC patch series to split out what you need. I'm certainly
open to that and happy to review such a series.

Regards,

Hans


