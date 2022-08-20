Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0682917
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661007601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRBJ+kAGwL9njr3QeEpYkg6rLy9UHweAjQ9xbzfD4hM=;
	b=PbbBfGrMfZZNZniUjgb1S0tQLY0lYEaucbywL3E38OCEeDL7hMC1fmDi7HiWldYEpsvhj6
	3FMpNGkkSySMsWk3KiUVSgUVVqS6hu11Tpz2S+bgGS2oMIUkRHAm2uXEOUTNop2M/qhjVP
	uveQe723YltmVdPiaGcF206WWxaJTRk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-i5qLD8lVPW67AdKf3Ik4vQ-1; Sat, 20 Aug 2022 10:59:57 -0400
X-MC-Unique: i5qLD8lVPW67AdKf3Ik4vQ-1
Received: by mail-ed1-f70.google.com with SMTP id l19-20020a056402255300b0043df64f9a0fso4380519edb.16
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 07:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=iRBJ+kAGwL9njr3QeEpYkg6rLy9UHweAjQ9xbzfD4hM=;
        b=eQZIFaZ503dvsrqfzCsRlt3H0zq/zDI5nR02E+fA02XhaRhikuLqytDwbluR4/rDcw
         D49P49LhBoERb7c0Iyo67O5g7UUx/tOYBdtBevk0fOuADZpbm0csrtlu+qucg3FFP62m
         glc451DjCH5tZPH4f0iOqbi9insy/ihRLvd0uHFaYB5aarIGT+BCPW1T2IIcgXYkFwOF
         L0rjndnSplJJIAX0RQ5ZgkWhn5MAqAcJi+hHHN73Ry1xYN2bk7X6AiExIZvbPM4rCLAv
         8OVcsESBfN6MUhl3hL8VB+EqGeWuTDiiawsdcXVP7JrPP5SiSJf6+rHsL514qrpQEJ+C
         SI3A==
X-Gm-Message-State: ACgBeo1+fCLECh7Mt9bYIBj4/ueaVGs/HlCro2sCyKCtbfljfbikBcKV
	zoIXpxLi2CIUHOIl4bJsWrrK7jqYD+b9cZMOmvjxSuRog8ENrM1ZsYUIiP7ra8Que2OEA90kLaJ
	n53UNvWinPW6EZRP/kslYUNZ0AQ==
X-Received: by 2002:aa7:dd50:0:b0:440:3e9d:784 with SMTP id o16-20020aa7dd50000000b004403e9d0784mr9937681edw.195.1661007596853;
        Sat, 20 Aug 2022 07:59:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7iYD2MRBgV5NEFkuv9ew7bcztbYfWXBL8oqUI0InxYrx8Gz1WG2JPPGpklNs2KDJrFKXZvLQ==
X-Received: by 2002:aa7:dd50:0:b0:440:3e9d:784 with SMTP id o16-20020aa7dd50000000b004403e9d0784mr9937668edw.195.1661007596675;
        Sat, 20 Aug 2022 07:59:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709063c4f00b0073132fa9393sm3666326ejg.65.2022.08.20.07.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 07:59:56 -0700 (PDT)
Message-ID: <13600e0c-bde2-198f-26c4-00531f277bf8@redhat.com>
Date: Sat, 20 Aug 2022 16:59:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/4] remove useless files
To: Nam Cao <namcaov@gmail.com>
Cc: lkp@intel.com, Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <202208200447.kdEhBy9a-lkp@intel.com>
 <cover.1660977535.git.namcaov@gmail.com>
 <63626444-a7ee-a0c4-ec0a-f44a810e25ea@redhat.com>
 <CA+sZ8B8ouMSMmArTVzbkqeWQx4Zqg2=gPaviTrkOFvBoswv_Jg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CA+sZ8B8ouMSMmArTVzbkqeWQx4Zqg2=gPaviTrkOFvBoswv_Jg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/20/22 16:35, Nam Cao wrote:
> Hi
> 
> On Sat, Aug 20, 2022 at 2:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> Patch 1/4 seems to be missing?
> 
> Patch 1/4 is there:
> https://lore.kernel.org/linux-staging/46d73e331bae2192a328f6691763f39ea6c18b08.1660977536.git.namcaov@gmail.com/
> 
>>
>> Also please squash patches 3 and 4:
>>
>>    staging: rtl8723bs: remove odm_NoiseMonitor.o from Makefile
>>    staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c
>>
>> together. Ion other words remove both the files and the Makefile
>> target in a single patch please.
> 
> Sorry but I am not sure what I am supposed to do with kernel test bot.
> I agree that it makes sense to squash these 2 commits together. However,
> I separated them because I want to have 1 patch addressing the problem reported
> by the bot, so that I can put the "Reported-by" line to this patch.
> 
> If I squash them, should I still put in the "Reported-by" line, despite the
> commit not exactly fixing the reported error. Or should I just leave it out?

You should just leave it out, that is the standard thing to do for
bot reported problems which are fixed before the patches are merged.

Regards,

Hans

