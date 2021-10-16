Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A02C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 10:08:35 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e3so30574090wrc.11
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 03:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YVpDip1j3vRjw5WDtQuqw0fNLROhuqjm1S+7iv5ym8w=;
        b=CJqbEHQfC/SDpz+dWJDHd9frn6eKjckDKbtQ3hcrTbtzZhwLHJJ9j7RXWLqJQrjinj
         JCEI07rN3LQlS8dF6j9k1Tu1kVzJPNLDcY2qro9YzsXA5ofvg+oUdQH1D3fgcdpZS2PV
         CdFLpO/PjRMgub5kLv+nNJ+90udKZWJrUg0t5gcvMApSTHVpbPPGPYTsdocLf3TZEFh+
         3U3qyxp6vV7qTQu7H/q1CLV2UORTtftjf61S2zcZwW/J602FwALmfhBiHwYFINxGAv7Q
         ETC9v4WNk95mYJraPNUoH08oVLiF97pkJcsT0E0EZYezRXiDYa5993Gs0GtASBUyz1Tv
         oq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YVpDip1j3vRjw5WDtQuqw0fNLROhuqjm1S+7iv5ym8w=;
        b=VO84+zI57DK7FgbVvNOPieTbAz/j6QPHp3kahBJGDSlX69mXDaliXg4WSwyViuF/GS
         e86r2waDYIOZ6fUljiqX+5negQ+tOes7gUqguashgULxNZuOpqJJoQZCzdZszvl7OEtI
         dIxDl9GiBDoVOUL7F0mPrxoeZ7MllAijPLilc0j9Z4AK9SeeAGpvcO/bpe4rFbAKhlUg
         Erns33PFjzoeP74ruA40GLGqq70AGZYiDrYciodF/RlnU2jltccM5Vpi2erPQgR8LO4j
         NoZH2ATQ592h8VrDtZ/8ney4KobKPNbiGxgIAAgiHzs4PN7aO1EKIkb5LxtNhZ15zg0x
         6AKg==
X-Gm-Message-State: AOAM531zhWWqX1RFMyQ3sigmIoeGitgtfIUImqmMMX58fWpANDygVgnf
	mSJRroT+7TdpELjZTWtZ2OM=
X-Google-Smtp-Source: ABdhPJxk7zEgVdkCdy6iPiu0cmgs9CXBbcDC3b1AV0x4KEXKFktk0WgszPnh+g92gbJxuDxs6CPJ7A==
X-Received: by 2002:adf:a45c:: with SMTP id e28mr20584956wra.347.1634378914284;
        Sat, 16 Oct 2021 03:08:34 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id a5sm7136618wrn.71.2021.10.16.03.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Oct 2021 03:08:33 -0700 (PDT)
Message-ID: <26b353c5-ba77-c446-5a8d-7f2394a795c7@gmail.com>
Date: Sat, 16 Oct 2021 12:08:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/7] staging: r8188eu: remove empty functions from odm.c
Content-Language: en-US
To: Martin Kaiser <lists@kaiser.cx>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211015163507.9091-1-straube.linux@gmail.com>
 <20211015163507.9091-2-straube.linux@gmail.com>
 <20211016092949.7746u74o2f5lgyzo@viti.kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016092949.7746u74o2f5lgyzo@viti.kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 11:29, Martin Kaiser wrote:
> Thus wrote Michael Straube (straube.linux@gmail.com):
> 
>> Remove empty functions from odm.c.
> 
>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>> ---
>>   drivers/staging/r8188eu/hal/odm.c             | 32 -------------------
>>   drivers/staging/r8188eu/hal/odm_HWConfig.c    |  7 +---
>>   drivers/staging/r8188eu/include/odm.h         |  7 ----
>>   drivers/staging/r8188eu/include/odm_precomp.h |  2 --
>>   4 files changed, 1 insertion(+), 47 deletions(-)
> 
>> diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
>> index 2178ffe41bb3..627213392795 100644
>> --- a/drivers/staging/r8188eu/hal/odm.c
>> +++ b/drivers/staging/r8188eu/hal/odm.c
>> @@ -196,13 +196,9 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
>>   	    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV)	||
>>   	    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
>>   		odm_HwAntDiv(pDM_Odm);
>> -	else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
>> -		odm_SwAntDivChkAntSwitch(pDM_Odm, SWAW_STEP_PEAK);
> 
> This was the last user of SWAW_STEP_PEAK. The define can be removed now
> (maybe in a follow-up patch).
> 
> Acked-by: Martin Kaiser <martin@kaiser.cx>
> 

Thank you for your review Martin. I'll send follow up patches to remove
this and other now unused variables I missed.

Thanks again,
Michael
