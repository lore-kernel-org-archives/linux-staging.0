Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133023A1
	for <linux-staging@lists.linux.dev>; Fri, 24 Jun 2022 05:26:24 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id e2so1893564edv.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 22:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=E0Vio1eDOkHCcMuXx/FcwjAfZ6Sibb/sL0zggNnOows=;
        b=G/tc/RNPaZ6l83AwA1tcUrgdw7mje1k9HRjFQBAvwC63C7P2av4Oo5/DpHgSKD/fF4
         45zVPiQu70XFNkMBJEpV31uRusXcW3mC/VhA5rFObvkQQ3ZSWK2Hlv+up2311Jx3f2DM
         KKbPLHvcT97Qpase7OMgTA5ED1dRJScP9kMxqBvkHCb4MJlYX9w/B16MqdLvCChiqTZU
         7NzjUGAA3xjgeK2tT+EUeAIRO4uMpia1SNrl5NZbZlUSm0dvwOEOkj9TZ0+D525FTnMh
         f9NjDx3edndcBST3VEqEDmh26i1cz95Jv7e1rrIB+t8NWodi9L7xCjJ+XEllS0M7rfRN
         VXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E0Vio1eDOkHCcMuXx/FcwjAfZ6Sibb/sL0zggNnOows=;
        b=7m+W6qYuIsTdTrH/89W2rz2h7qmRNkpQADp4Mo17q8JOPxPy1/l19od7pv3dM+o/Um
         JFHtKMIVXIYQVMNjwzIuwL/ovCLF3xaVB0Zb6b2IBh15ERpo9OMGLiCVC56fe7iWcx4m
         yZpDtbRCwwMhF3OJ9SAOOXy4fSUdrUQ6tiAPqDiAquRvs6Bpn9T5tM0bQbs5mBRmcqzB
         bhhN8FiKhRpxVXNGy2O/NccNfMnbuKdd/3eiVXhIllKSVb7krpBVwD21nAM7i4b85861
         uxvzZKuLcdV2mNYqOx3Gqi1Ic/2DUKDtfUNiuqlfTcSfi/gbwRmllQRLTEsBSTbZutoR
         6gMg==
X-Gm-Message-State: AJIora9LfU1LXLLdieK3iu19/3qoc8xIjwxv95o+8742sWWNGGBIjjFn
	+nWB+QyYy2lE+jbKnapoGZs=
X-Google-Smtp-Source: AGRyM1u3KX85pJU0WyD0yEuLGGnkt7ZHD6RDuyG/cFW8XyUoNND3EQO+zMAA/kjcGChMcjukFk5rXg==
X-Received: by 2002:aa7:d685:0:b0:435:7910:f110 with SMTP id d5-20020aa7d685000000b004357910f110mr14842540edr.247.1656048382372;
        Thu, 23 Jun 2022 22:26:22 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2e:6903:8f42:a6e8:b267:63e? (p200300c78f2e69038f42a6e8b267063e.dip0.t-ipconnect.de. [2003:c7:8f2e:6903:8f42:a6e8:b267:63e])
        by smtp.gmail.com with ESMTPSA id z8-20020a170906434800b00722f2a0944fsm490619ejm.107.2022.06.23.22.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 22:26:21 -0700 (PDT)
Message-ID: <ac6d83d6-c8b0-e0bd-10aa-a49897679edb@gmail.com>
Date: Fri, 24 Jun 2022 07:26:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: r8188eu: combine nested if statements into one
Content-Language: en-US
To: Chang Yu <marcus.yu.56@gmail.com>, David Laight <David.Laight@aculab.com>
Cc: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220623031515.402691-1-marcus.yu.56@gmail.com>
 <d50c16c1-0bc2-fdc4-16ab-0c27df824ffb@gmail.com>
 <06893216a5a04d7e84dfe3e132d333f6@AcuMS.aculab.com>
 <YrUv1sPuny1M1Orh@zephyrus-g14.localdomain>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <YrUv1sPuny1M1Orh@zephyrus-g14.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/22 05:30, Chang Yu wrote:
> On Thu, Jun 23, 2022 at 12:05:40PM +0000, David Laight wrote:
>> ...
>>> Seems to work. But the rules which operation is done first && or == are
>>> not too easy.
>>
>> They are the way around you want them to be.
>> == generates a truth value.
>> && and || compare truth values,
>>
>> The only 'wrong' operator priorities are & and |.
>> The short-circuiting && and || weren't in the very early
>> versions of C - the bitwise & and | were used.
>> When K&R added && and || they left the priorities of & an | alone.
>> I they they've later said they should have bitten the bullet
>> and changed the priorities and all the existing C code
>>
>>> I would prefer to have:
>>>
>>> if (padapter && (pfree_recv_queue == free_recv_queue))
>>>
>>> So it is very easy to read what is evaluated first.
>>
>> That just starts adding too many () and makes more complex
>> conditionals hard to read.
>>
>> 	David
>>
>>>
>>> But this is just my opinion and does not have to be right.
>>>
>>> Thanks for your patch.
>>>
>>> Bye Philipp
>>
>> -
>> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
>> Registration No: 1397386 (Wales)
> 
> In my humble opinion it just boils down to personal preference in this
> case. The kernel coding style guidlines don't seem to have a definitive
> gold standard regarding this. I will leave the patch as-is for now, but
> if anybody feels strongly that the () needs to be removed please feel
> free to let me know and I'll make the change.

Please consider that the person you want to sign-of for this patch is 
most likely Greg K-H. I propose to fix first what he is asking for.

Bye Philipp

