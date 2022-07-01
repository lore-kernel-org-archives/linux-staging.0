Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF863C14
	for <linux-staging@lists.linux.dev>; Fri,  1 Jul 2022 17:01:16 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id e132so2914286pgc.5
        for <linux-staging@lists.linux.dev>; Fri, 01 Jul 2022 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=+Y69XYFRBbGEw28WG6tz70zl5+qR6UUBVQwaftrm72w=;
        b=gngXD8tR0AX2qZkrnmgrPRVQofdQ+fKZMfl/2zJNIC8rJTvLde0FNQ82OzUj4gU8ir
         UagrXcgHzLskBY1yjUFFKr19v0D8Pl2YqBZPV27trwH3nTvm68quEw9Cg9iKW8AMSBF+
         DtJqVcRAoXEkInF9vo0MfGX3d39OeAjbwdhC+r7vtLgs++Sdql9M8oWwwpHWlHFYJhN9
         dEkg0K2CMKnezr/gfq56Yzj/9v6QqHJ1zo7/d+sDt0IT7z0m2fbZPoMLiotxLwjvU6HH
         yJ3/Uf6vbKYuHCR2/GPlzFd+f5ye6gQ0nBzipcMgCjLBoRajgtkvs6KpHVIyxsq9R0nw
         hRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=+Y69XYFRBbGEw28WG6tz70zl5+qR6UUBVQwaftrm72w=;
        b=HO7kDdaMKpq5J9/8SKQtV//j7BN3Ro9GLlggJShDepSB02/2E4LGTM172iv7vv+w+U
         OO8apbKAYgILamL6Z3CYvStbHs1IFA7AU9UcMWzv5tQpplVupznxgmXZ97RLXkVSFZ9u
         5qXuCTQWN04Z6vdZ4g45wGnaVzBWxGmpqNchKkFEs2wkkvmO9ueD/2QxF8wOTJmXSeJj
         QNIRNXVwxo/TfXuXBKDS38wPE7kJVtvr8j1stKHjEaQCsu84ItOqlCtmGKbJHsmCiNs3
         RJ+zyMh0VmMib/1t0f3X3kq2cKQGKRYLlMcYrh0xQenhcJhZLdaUxrXjocnjBQ4qjxg3
         QluQ==
X-Gm-Message-State: AJIora9HeBVYq2ravxsbyJVfzQnNba0PALWoYxxfeZaBgAzCu1XVsXcN
	vuaf5OO44HFNybBwUqD5S0A=
X-Google-Smtp-Source: AGRyM1sGkH9gDW355TsC3mue55/QsIUr9dlTC6eVp31gkux74UFodS1FUhijKJcUhdNJACkPBAqS1g==
X-Received: by 2002:a63:714f:0:b0:40c:b278:ebab with SMTP id b15-20020a63714f000000b0040cb278ebabmr13422473pgn.598.1656694876104;
        Fri, 01 Jul 2022 10:01:16 -0700 (PDT)
Received: from [192.168.0.239] (cpe-23-241-9-246.socal.res.rr.com. [23.241.9.246])
        by smtp.gmail.com with ESMTPSA id q14-20020a63d60e000000b0040cf5cd74cdsm15286927pgg.19.2022.07.01.10.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 10:01:15 -0700 (PDT)
Message-ID: <d009c550-5332-ff8f-9dfa-49bdca98b66f@gmail.com>
Date: Fri, 1 Jul 2022 10:01:13 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: qlge: replace msleep with usleep_range
Content-Language: en-US
From: Arun Vijayshankar <arunvijayshankar@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, netdev@vger.kernel.org
Cc: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com
References: <Yrk3zeyzSJ0424Aa@sug> <YrlKVg7ZN9yhTOvt@kroah.com>
 <Yrnr4yYm5mo+PXKU@sug>
In-Reply-To: <Yrnr4yYm5mo+PXKU@sug>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, Jun 27, 2022 at 08:12:38AM +0200, Greg KH wrote:
>> On Sun, Jun 26, 2022 at 09:53:33PM -0700, Arun Vijayshankar wrote:
>>> qlge_close uses msleep for 1ms, in which case (1 - 20ms) it is preferable
>>> to use usleep_range in non-atomic contexts, as documented in
>>> Documentation/timers/timers-howto.rst. A range of 1 - 1.05ms is
>>> specified here, in case the device takes slightly longer than 1ms to recover from
>>> reset.
>>>
>>> Signed-off-by: Arun Vijayshankar <arunvijayshankar@gmail.com>
>>> ---
>>>  drivers/staging/qlge/qlge_main.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
>>> index 689a87d58f27..3cc4f1902c80 100644
>>> --- a/drivers/staging/qlge/qlge_main.c
>>> +++ b/drivers/staging/qlge/qlge_main.c
>>> @@ -3886,7 +3886,7 @@ static int qlge_close(struct net_device *ndev)
>>>  	 * (Rarely happens, but possible.)
>>>  	 */
>>>  	while (!test_bit(QL_ADAPTER_UP, &qdev->flags))
>>> -		msleep(1);
>>> +		usleep_range(1000, 1050);
>> Have you tested this with a device?  Doing these types of changes
>> without access to the hardware isn't a good idea.
>>
>> Also, a loop that has the chance to never end should be fixed up, don't
>> you think?
>>
>> thanks,
>>
>> greg k-h
> I have not tested the change with the hardware. I have checked that the module loads on my PC, but I do not have the actual adapter
> to test it out. Would you mind sharing any pointers on testing changes on the actual device if I don't have the specific device?
> I tried to find an emulator or virtual device for the QL adapter, but there doesn't seem to be any. Sorry if this is a very basic 
> question. This is my first patch ever. If there isn't a good way to test the changes with hardware, would you recommend withdrawing it?
>
> Thanks for pointing out the potential runaway loop. I'm a little embarrased on having missed it. I can add a timeout if the device doesn't 
> recover within a given time, but I was wondering if there is a better way of doing it?
>
> Best regards
> Arun Vijayshankar
