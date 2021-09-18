Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EB73FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 17:32:34 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t8so20637483wrq.4
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 10:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UVE7QZS3RWL2QAHWQXoCR4muirEC/eJJlq5hFMqUVLk=;
        b=atis6OazR0/togfP8brQNQvC7+QKZJNyciGtQ1X6sWCGSoMGn3KhPptr4NAG5oEbIY
         48pfpY+T1gjwiG0yc/zOCLIjHf6crzb74w3tnxuSeaiV4+8kiqQT50jZZgeRVEPTezHa
         ga2O4V/hCOsB8OJ6wn2xKrHmLRhmBTU4/1hhxiCL5c/6yb1/21Gxi6kGT6YNFjRZN0UA
         bvjGcGmCmip9IZZ2nEn9SCWSTOQMxU43aF949F86t4RBQBww4OzLpL5aiEK4kGc0yja4
         Ova/NKGpETJ5RNGnCzyw3EL1IXP6Nn4LPu05dsGtCIwv/A745+HJkL5JMBAUL0ShjbUM
         5QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UVE7QZS3RWL2QAHWQXoCR4muirEC/eJJlq5hFMqUVLk=;
        b=uwMRsLPBNDwJEk4/7/+0dr5AqXniQ9nKzZ3Unm3mDyu7mAPYGPFsYv6GgghKxxoYy6
         jH0lR60EdiyaJ8ktn+gShDp6NlamlbBW+F2VsL1Atxv9j26khUxxfkkZQJWP2Pw6SCaA
         moaGs69QPWLb4zvFU7pGtqxOYZ2SwMJY50G5FUEQpOn69uqXoyfYMhgxlTDIp/CG/8HR
         QzO74YrWN4XIqtq5GBEi9hT2zCk+AWB5iA5uT2eQxcB27Q/IfenMc8tbmy6hzinZDN2d
         V/MWs4VpBKaylft55q/c31hboouLuYb4ifh9i5RqxtMFv+L7CELJnjBMeipU0U9vIwsm
         LJcA==
X-Gm-Message-State: AOAM533PCuHscrhpQv67aGckBlXtsmGiTWRULw74ti7KGYxg/KHq9m04
	1eOtClac/7CNLEvMytObFpk=
X-Google-Smtp-Source: ABdhPJzm4XHTg1a0lmsW83bFN7OND2/M9x4+Hk9byAK+hB1rOZd7kgeEwxm1M/bXqM1ufTYwwG0x4A==
X-Received: by 2002:adf:8170:: with SMTP id 103mr19241290wrm.167.1631986352831;
        Sat, 18 Sep 2021 10:32:32 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::cde? ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id y64sm7475517wmc.38.2021.09.18.10.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 10:32:32 -0700 (PDT)
Message-ID: <0701af92-b341-f7b0-8a0c-3bea8a69f580@gmail.com>
Date: Sat, 18 Sep 2021 19:32:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: staging: r8188eu: Can odm_DynamicTxPowerNIC() be removed?
Content-Language: en-US
To: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <7f1c135a-d85d-d271-f315-d665a5fe1472@gmail.com>
 <89d9424a-d792-633a-d8e8-cebe7c3a2e20@lwfinger.net>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <89d9424a-d792-633a-d8e8-cebe7c3a2e20@lwfinger.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/21 18:46, Larry Finger wrote:
> On 9/18/21 08:31, Michael Straube wrote:
>> Hi Larry, Phillip and all.
>>
>> While removing code that checks for the chip type I stumbled upon this:
>>
>>
>> void odm_DynamicTxPowerNIC(struct odm_dm_struct *pDM_Odm)
>> {
>>      if (!(pDM_Odm->SupportAbility & ODM_BB_DYNAMIC_TXPWR))
>>          return;
>>
>>      if (pDM_Odm->SupportICType == ODM_RTL8188E) {
>>          /*  ??? */
>>          /*  This part need to be redefined. */
>>      }
>> }
>>
>>
>> (pDM_Odm->SupportICType == ODM_RTL8188E) is always true in this driver.
>> Currently the function does nothing and the driver seems to work fine.
>> Because of the comment I'm not sure if the whole function can just be
>> removed?
> 
> Yes, I agree. No later driver does anything with this routine, thus it 
> is dead and can be removed.
> 
> Larry
> 

Ok, thank you.

Regards,
Michael
