Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31621EF934
	for <linux-staging@lists.linux.dev>; Thu,  7 Nov 2024 11:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730979957; cv=none; b=JibcE7n3cg2dMPQjqxKtr1kTOfS0pZAtTzss1ohW34e4sv5pAWuMSbvBQBDbr2hb3dNjMf5yXUwZiG4D6wINWYNOSgrydHzWDedSSt1OU8eScPpQ0BYcZmo6T5wfbhF+5QB3UmXqLy9QtAXVHV8uE3oLf7gL1jwXU7je6TaXe/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730979957; c=relaxed/simple;
	bh=8o4ZlsbN/83dpA2r6AFMzSLTgFmivq5iT0OHld+yKi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtOFJWcVT0EC0ywWctLCofGLVF1aBRai8i8oyyS2z5SWAxkhuz6dgS8pBPFSjyDjdRcDG0T5QfodrAWsSH7pE0rO7IEoxMXU9yzpjtFVpa45AEAKY4vR0sgtYc7GShWMCCABWCgwAhQLfHQYizOnGWE+xIq7GfZBP+Pp9GoihDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQ8Qn2B8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQ8Qn2B8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730979954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8bCnP9403Z99+tF9uquHAPYB7nlg8pf/oQAUghnzYyc=;
	b=dQ8Qn2B8+rwEgBQFGx6mqx81JzYZ2mPfUdB107kF+h6hAniHHQg9G61upbe2228DbYKef1
	BAtN9hUe1yb/TslOVB1RsKQsjTc45ceyjXTcQVwDownP2HpD+7P8+amyeSUPV1cp+TwuBY
	VPovBYGt+t3KbmdliYUVQxL0UTacKFg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-KdSwUBMkO7u1WCmEncXBfw-1; Thu, 07 Nov 2024 06:45:52 -0500
X-MC-Unique: KdSwUBMkO7u1WCmEncXBfw-1
X-Mimecast-MFC-AGG-ID: KdSwUBMkO7u1WCmEncXBfw
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c936f71759so603470a12.2
        for <linux-staging@lists.linux.dev>; Thu, 07 Nov 2024 03:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730979951; x=1731584751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bCnP9403Z99+tF9uquHAPYB7nlg8pf/oQAUghnzYyc=;
        b=nftJGyOCmj6ph+OMSqjt4CyJtrGXvUUU72SURFXpbYS2UXFeLuEygY5+IHaDZk8Ld+
         tx7hIwiAFvhvx6AvUUXWwfgew+tK3IKiPwUXnFgmjom3nd/jhcQEO8ZAao0Cby3aOkMz
         0xMtE5e8XsysFPBnwMXoLIkqcz1m6guptUTqnEFOLSid4IagR2PXdskUSTlWALKYb2sw
         e1Y7GLKXrvORR+0jsapASeXtWMaxjqFFvYNduUMt/a3YnQsd7NJ8hO2Croe6EryjYKuL
         zJQBgFXdsa6ef9xMZ0gnP7TcOG6oaFs3H8mAd9/hUpSxMz+yCNtadLF6cLsRRmpR59OO
         VPKg==
X-Forwarded-Encrypted: i=1; AJvYcCVoa+nOLTKZRFQaOAWwt9MuUT4Ik+Qb0Uo8pTrsD6sTP4Q7XAPyLMpHiGGmTaXgcqTLce4ChPJl5oTYMkg3@lists.linux.dev
X-Gm-Message-State: AOJu0YwFmaviLCEgNCl7F+uvClwNdX7EcbSm4y/OsJ8bXa2X9BcoYf2d
	rnKgRN2AfcV+/xG89tamoTcponlUzZr5MFHFPTvIAWEqEQR6t+q50NVRTJJPxI0BHK8YOFtyh1j
	xHnpqolp2N+wjqNaJl3hnY6WFFKMI+jJ8Y/nu5ogXFj2xgrEe8Ybxcfrs7P1Q4A0=
X-Received: by 2002:a17:907:2cc2:b0:a99:f861:ebd with SMTP id a640c23a62f3a-a9ee74bbbd6mr71295866b.14.1730979951515;
        Thu, 07 Nov 2024 03:45:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjEa/cDXmsHFDdKP3G1NdW3oe41pc7rWH8MGIDNROSNf6aA07yr12W74sOrI2Q5jzUVRS7iA==
X-Received: by 2002:a17:907:2cc2:b0:a99:f861:ebd with SMTP id a640c23a62f3a-a9ee74bbbd6mr71292866b.14.1730979951055;
        Thu, 07 Nov 2024 03:45:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4b90esm83709066b.65.2024.11.07.03.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 03:45:50 -0800 (PST)
Message-ID: <028717bf-e10c-4876-9be4-1b41661c447c@redhat.com>
Date: Thu, 7 Nov 2024 12:45:49 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: atomisp: Remove License information
 boilerplate
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Bergh <bergh.jonathan@gmail.com>,
 Roshan Khatri <topofeverest8848@gmail.com>,
 Dipendra Khadka <kdipendra88@gmail.com>,
 Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Kartik Kulkarni <kartik.koolks@gmail.com>,
 Kathara Sasikumar <katharasasikumar007@gmail.com>,
 Tchadel Icard <hello@tchadelicard.fr>, Kate Hsuan <hpa@redhat.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com>
 <20241107123233.495dc548@foz.lan> <20241107124238.694fc4ef@foz.lan>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241107124238.694fc4ef@foz.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MR7xbwZcn2Dow_2ZS8WSJJfIqsMVTs31MGPorLkS-Tw_1730979952
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7-Nov-24 12:42 PM, Mauro Carvalho Chehab wrote:
> Em Thu, 7 Nov 2024 12:32:33 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
>> Em Mon, 23 Sep 2024 13:53:06 +0300
>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
>>
>>> We have the respective SPDX identifiers that are already being applied
>>> to the files in question. Remove the License information boilerplate.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> ---
>>>
>>> Here to fix one of the missed TODO item before moving from staging.
>>> This depends on 20240923085652.3457117-1-andriy.shevchenko@linux.intel.com.
>>> But can be applied before that (it's trivial to adjust).
>>>
>>>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c  | 10 ----------
>>>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c  | 10 ----------
>>>  .../media/atomisp/i2c/atomisp-libmsrlisthelper.c    | 11 -----------
>>>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 -----------
>>>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c  | 10 ----------
>>>  drivers/staging/media/atomisp/i2c/gc2235.h          | 13 -------------
>>>  drivers/staging/media/atomisp/i2c/mt9m114.h         | 11 -----------
>>>  drivers/staging/media/atomisp/i2c/ov2722.h          | 11 -----------
>>>  drivers/staging/media/atomisp/include/hmm/hmm.h     | 11 -----------  
>>
>> Hmm... there's no SPDX for hmm.h header. We need to ensure that all files
>> have SPDX license before removing the boilerplate.
>>
>>>  drivers/staging/media/atomisp/include/hmm/hmm_bo.h  | 11 -----------
>>>  .../staging/media/atomisp/include/hmm/hmm_common.h  | 11 -----------  
>>
>> Same for the above and for other header files.
> 
> Nevermind. I didn't show enough context while checking it. All files
> have SPDX. Patch LGTM.

That is good to hear.

Note I've included this + a bunch of other atomisp patches in an
atomisp pull-request for 6.13, see:

https://lore.kernel.org/linux-media/51e5e1cf-8aff-44fc-b40c-a0074a770a69@redhat.com/

(in case you have not seen that yet)

Regards,

Hans


