Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694A71
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 11:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624360504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=002w5D0lwhYSH2t/vQFvpXDZXSTcT1c6YHrb39gLjf4=;
	b=fJ1ySI0/9RsGr7GJwBhRUMDRAnxsbJ0aFQvTfzrjgP0qguyNcWcYsUIIn1a9+1JaXfiBvq
	rGZ2CAym19IfKOfdUYyYjFS9YCRNHxSScZ+N6h3fhCnQ9ANncQtWRA5qdPJi7aN9E8F/lV
	Rh6aEd62OKVBr9D+aB3y70FWh2f6ECY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-cXoRzzL5MRq82Smrwx8OWw-1; Tue, 22 Jun 2021 07:15:02 -0400
X-MC-Unique: cXoRzzL5MRq82Smrwx8OWw-1
Received: by mail-ed1-f72.google.com with SMTP id v8-20020a0564023488b0290393873961f6so9300320edc.17
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 04:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=002w5D0lwhYSH2t/vQFvpXDZXSTcT1c6YHrb39gLjf4=;
        b=S1TQ4NwN7jjtfHzyRHMv2mWk36vj3A6UzsTt9G4IS1Z9AWoK4VF7pOyNs05XrdgZjL
         /PN6bZjQKRKVQl871clPFG0/2ZB5K2SVjavi7cuKSLYfp+gJFpAOfEEMdDkRR1y05wF+
         KwmMWTH2i3k4JpP5j2qNyVhJed0hhmpcDqpJbfqTzzXuvDapSdCeZ/CqKtXbiD45lxbu
         m7u818Z6LsJLWZVqX0m1e2LHGbhO05L42IvlLGmdIUDjSlj2w3m1G8YWNoRqkXROioFL
         om8oKjFq3lyUOMvt89UNnJB7FH6S2Xx358nCoCRlTLepeTt5nqqyYefUBGzJAw0x+vjQ
         i9LA==
X-Gm-Message-State: AOAM530E7oy/+P0RJ4PJZJw4aNXN+7wPqtB9v4zuouQWo7fc3Ajp4dz8
	15lKkJsTVxNdzveJhSl4BWQwr8jMmxitAn3GK4pp3hPBwyNE9yfd+wSGjWTNHHYZ2puY77Qo5kJ
	EID5QeKGDcTel++r8rqNB/tI6Rg==
X-Received: by 2002:a17:906:1792:: with SMTP id t18mr3410999eje.38.1624360501742;
        Tue, 22 Jun 2021 04:15:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtAR7cvER8LBqam9WJT7jBKdk4usUVYQ34KS15ZoaF7GfNIbLUHWC94RV9siHCe0nNJqWolg==
X-Received: by 2002:a17:906:1792:: with SMTP id t18mr3410983eje.38.1624360501611;
        Tue, 22 Jun 2021 04:15:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jx17sm2837266ejc.60.2021.06.22.04.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 04:15:01 -0700 (PDT)
Subject: Re: [PATCH 12/18] staging: rtl8723bs: remove VHT dead code
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
 <d3f79570088ad339bd80fe9d6b24604ac91ea8d3.1624099126.git.fabioaiuto83@gmail.com>
 <dd0332d7-5d9f-49e5-3fc6-8ae3e623f29c@redhat.com>
 <20210622091602.GA1426@agape.jhs>
 <4f128bd2-b84b-132e-c75f-0030701a8a9b@redhat.com>
 <20210622095757.GB1426@agape.jhs>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <d80cf1a5-d70c-97c2-a6a2-af2f4209715d@redhat.com>
Date: Tue, 22 Jun 2021 13:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210622095757.GB1426@agape.jhs>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Fabio,

On 6/22/21 11:57 AM, Fabio Aiuto wrote:
> On Tue, Jun 22, 2021 at 11:19:36AM +0200, Hans de Goede wrote:
> 
> Hi Hans,
> 
>> Hi Fabio,
>>
>>> Moreover I have been quite conservative, for I left untouched HT indexes above
>>> 7 which rtl8723bs doesn't support.
>>>
>>> So IMO I think this patch is fine as is...
>>>> Perhaps this entire block can never be executed ?
>>>
>>> the block is executed but there's no register write happening. Just
>>> updating of values which will never be fetched.
>>
>> Ack, my bad I was under the impression that phy_SetTxPowerByRateBase()
>> would actually do a register write, but I checked and it just updates
>> some unused table values, so dropping this code is fine and you can
>> keep this patch for v2 of the patch set.
>>
>> Regards,
>>
>> Hans
>>
> 
> thank you, what do you think about what I replied about patch 1,

I somehow did not receive your reply, so I've just read it on the archives.

> shall
> I remove the '> 14 if block' or leave it as is?

I think it would be best to keep the '> 14 if block' for now and
remove all of them in a later patch-series (I assume there will
be more of them).

> Do you think is necessary
> to keep the conditions inside the block and pack them?

You could also remove the condition and just set
the band to WIRELESS_INVALID unconditionally as you
suggest, that is fine.

But if you keep the condition, like you did in v1 of the
patch, then you must pack the 2 masks together.

Regards,

Hans

