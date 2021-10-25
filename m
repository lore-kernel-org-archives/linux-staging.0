Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E7172
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 17:46:55 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id r28so7345808pga.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 10:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lRCLonp2m0ZX/kiQpm22eJ4VdDoH6ZXlTAQKw42QYHM=;
        b=BkvodgijNEcYV6LipVkdNO7Uk4Gx5XoOY1SvowNsr2pVsYsfL8JLEnIE0jMiw407lz
         4m4sCoHuxvK/rByGutr3rZokoqC60KIr11xvgf1chF8oP286qMReKqjJ7mdLwfEltm86
         nwxmTqxC5KIM+lEVFg76qtEUn4pyVk9V2pj8LU6iJ1zXIgXoy/DqoBUsIE3V6M/sOYSF
         uspWDNr5qUJJr2wLPtdOcsr7VUmEhwEzPIYMqPzrjXCb6af5oN+gVW9GXY159fmy7kul
         Jqwkl0zQtkklB7JCtKH+ZQjH5piDGedizoE6FirWiAedgse2zc+Ds3CO2eCqz/Dr0eGc
         v3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lRCLonp2m0ZX/kiQpm22eJ4VdDoH6ZXlTAQKw42QYHM=;
        b=kQkySWRBxbYY7UCFss9vXswbf2EKli1kcjLAunNhEkIBbppWH+PVm1pxivgUCTr5OF
         dWRMpAg1XhehQdbUSXu4cKCsu5mkxYe7tnVo4rF6H2OcKOjXta1ScaCNV/Y9622A7JN1
         KJqc9KvdOxop/1MGui3l6lP6bVoMGoMOK7DbO+RsLzaKURxl3ByJBOJQc7iZJi45eR9o
         pqdV/sxhnBQ2PgOq+Gp1WM6+SDow4eHSB22nxWqYdSYZdurdPKotqOvIVXFu7ZHADsOw
         FLQdBzh4ERc5dIFS1o4lO1F0LO2twxmHDtJmw1lJaCWKovi8AwD4A28vN1oJUjiSNUvY
         dgqA==
X-Gm-Message-State: AOAM531rM5rjCxF/v7gQ2XcGw4+AdBeFpQFGGLbzjrD4Ge8m5mhFBk9H
	GuLOG4UzViIKRfeP0coWTaw=
X-Google-Smtp-Source: ABdhPJzQWu/Q2DLK/fUyYZu+CvIe9LlEWeg7Z5LQxaYwtsg8Ymyq1d9sYVLhL3DGgCunbixrc1IkKQ==
X-Received: by 2002:a05:6a00:198b:b0:47b:ac2d:68f4 with SMTP id d11-20020a056a00198b00b0047bac2d68f4mr19545483pfl.1.1635184014896;
        Mon, 25 Oct 2021 10:46:54 -0700 (PDT)
Received: from [192.168.1.4] ([59.95.95.35])
        by smtp.gmail.com with ESMTPSA id b10sm20770695pfl.200.2021.10.25.10.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 10:46:54 -0700 (PDT)
Message-ID: <896901f9-7659-7e05-ab61-2a76b76e999e@gmail.com>
Date: Mon, 25 Oct 2021 23:16:50 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] staging: r8188eu: core: remove goto statement
Content-Language: en-GB
To: Larry Finger <Larry.Finger@lwfinger.net>, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YXafzp5F8T7/+tk2@Sauravs-MacBook-Air.local>
 <7dc4eba4-c009-b8b7-bc08-5b608bdf86a0@lwfinger.net>
 <e2020caf-1b0c-ce0e-3d94-d105be85ed38@gmail.com>
 <de1bddd8-8e09-4b8f-1fd8-ae9047e60269@lwfinger.net>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <de1bddd8-8e09-4b8f-1fd8-ae9047e60269@lwfinger.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/10/21 10:56 pm, Larry Finger wrote:
> On 10/25/21 12:00, Saurav Girepunje wrote:
>>
>>
>> On 25/10/21 8:45 pm, Larry Finger wrote:
>>> On 10/25/21 07:15, Saurav Girepunje wrote:
>>>> Remove the goto statement from rtw_do_join(). In this function goto
>>>> can be replace by return statement. As on goto label exit, function only
>>>> return it is not performing any cleanup. Avoiding goto will improve
>>>> the function readability.
>>>>
>>>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>>>> ---
>>>
>> Hi Larry,
>>  
>>> You need to read section 14 of Documentation/process/submitting-patches.rst to learn how to submit a revised patch.
>> Resubmitting such a revision using the same subject line is likely to confuse reviewers and maintainers alike, if not patchworks.
>>>
>> This is original patch (v1). I haven't get any review comment for this patch.
> 
> Why did I get it twice? At least I got two messages with that subject line.
> 
> Larry

I checked on lore.kernel.org . It is one patch with subject "[PATCH] staging: r8188eu: core: remove goto statement"

https://lore.kernel.org/all/?q=Saurav+Girepunje

Regards,
Saurav

