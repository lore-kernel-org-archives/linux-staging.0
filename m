Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE11855
	for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 11:55:50 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id kx6-20020a17090b228600b001bf859159bfso17170140pjb.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 04:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KTvK/tAz5DZFZ3Kzshxhj1MZq5011xDi3PnkIqV+z7Y=;
        b=C2AHHDQQIiqrD/AwF/0JYGpuDv/xfIZDqkvxnaWi3sP8ONj8vNrzZsswi3ZIpJ+atv
         c4aQYR/L+VWpc3jNAuazuTGI1s+Gu3YaSUvn1GBt9vq061wX1vvTfvbwBsgWzIqUqF2u
         VXnbR+ayVV/2uPqmMSSphKMTaG63mfArsORumeDbc5fPOM8du8WxRKq9qH25iec6OrW6
         KGKPkT/T346K0rFucth/rJv2+8Cgvho0IUBLgNrz4okICFCzrfpuM+4LetNIpBxkqAyx
         Ykw2cSuPT1nr8rjrG1fx1Z+NcXRKcEq92Cz8r8Y/lks9NuHfVa7Qy/b8sweuqMD9DceY
         ENZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KTvK/tAz5DZFZ3Kzshxhj1MZq5011xDi3PnkIqV+z7Y=;
        b=7acxqhpDbaXT+w1qlcJebsCWhfsWCnKk5/vXuakOmumo3TL3hA2KGQmBgfQV139lMs
         oBT7yRpm0W5aJqDH2TO45p0fCfaS2P+nmMNBUzLaIH03I55LAffSVccle31h7RvwVpYV
         WFGRfuMCXCK3lZXZQhssExuEFyocxES2G0gDENVEt9sUAfdZgEZwWpxtRQygHf8jGnwj
         UiI854xCiXALzSGqQgdQotr4mL0I6pDKA7BHKqf0mEXdVW2/q2ekKW2b0cW8aewEcwzX
         s6VAGzbEdXc0nxGolHVEjM9747fH3BMX9tnS6eEcS7ZUkm6T0AWkcV9tnUBIUkOGLrjZ
         VUzw==
X-Gm-Message-State: AOAM533aOvDU8Oq6g/XgeXlHRJ1o85vKBSDzQPZ/nEDHmj3VwF0Io1j+
	rIsfRjHLu7A5wmk1NcX+GHc=
X-Google-Smtp-Source: ABdhPJyGcMgUVAsUijvdWNO1aFsGNt8yUNTBb7lptKjjJfkHLhF0x1sLyDOu+xd+UFiijxixlot6JA==
X-Received: by 2002:a17:903:183:b0:151:af32:890d with SMTP id z3-20020a170903018300b00151af32890dmr23648983plg.0.1647258949670;
        Mon, 14 Mar 2022 04:55:49 -0700 (PDT)
Received: from [192.168.1.102] ([45.250.64.116])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090a2c0c00b001bc4cf0107esm17348655pjd.53.2022.03.14.04.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 04:55:49 -0700 (PDT)
Message-ID: <3ee0dda3-d80b-4058-49e7-88ceb6426459@gmail.com>
Date: Mon, 14 Mar 2022 17:25:43 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: android: ashmem: Declared file operation with
 const keyword Warning found by checkpatch.pl script.
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pavel Skripkin <paskripkin@gmail.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOl?=
 =?UTF-8?Q?g?= <arve@android.com>, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>, Hridya Valsaraju
 <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220312204128.3942-1-shaikhkamal2012@gmail.com>
 <303ed0c8-8e2c-51a4-a4da-be973a25cdec@gmail.com>
 <bf27518d-4990-8b0e-c6ea-26a658ce2e54@gmail.com> <Yi8oFtMxfTkPF8/h@kroah.com>
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
In-Reply-To: <Yi8oFtMxfTkPF8/h@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/14/2022 5:03 PM, Greg Kroah-Hartman wrote:
> On Mon, Mar 14, 2022 at 04:55:55PM +0530, shaikh kamaluddin wrote:
>> On 3/13/2022 3:13 AM, Pavel Skripkin wrote:
>>> Hi Shaikh,
>>>
>>> On 3/12/22 23:41, shaikh kamal wrote:
>>>> Signed-off-by: shaikh kamal <shaikhkamal2012@gmail.com>
>>>> ---
>>>>    drivers/staging/android/ashmem.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/staging/android/ashmem.c
>>>> b/drivers/staging/android/ashmem.c
>>>> index ddbde3f8430e..4c6b420fbf4d 100644
>>>> --- a/drivers/staging/android/ashmem.c
>>>> +++ b/drivers/staging/android/ashmem.c
>>>> @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file
>>>> *file, unsigned long addr,
>>>>    static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>>>>    {
>>>> -    static struct file_operations vmfile_fops;
>>>> +    static const struct file_operations vmfile_fops;
>>>>        struct ashmem_area *asma = file->private_data;
>>>>        int ret = 0;
>>>
>>> Are you sure this patch compiles? vmfile_fops is overrided few lines below
>>>
>>> odd checkpatch.pl warning...
>>>
>>>
>>>
>>>
>>> With regards,
>>> Pavel Skripkin
>>
>> Thank you,yes vmfile_fops is overrided in below code.
>> Building the kernel - make -j4,
>> drivers/staging/android/ashmem.c: In function ‘ashmem_mmap’:
>> drivers/staging/android/ashmem.c:431:16: error: assignment of read-only
>> variable ‘vmfile_fops’
>>      vmfile_fops = *vmfile->f_op;
>>                  ^
>> drivers/staging/android/ashmem.c:432:21: error: assignment of member ‘mmap’
>> in read-only object
>>      vmfile_fops.mmap = ashmem_vmfile_mmap;
>>                       ^
>> drivers/staging/android/ashmem.c:433:34: error: assignment of member
>> ‘get_unmapped_area’ in read-only object
>>      vmfile_fops.get_unmapped_area =
>>                                    ^
>> scripts/Makefile.build:288: recipe for target
>> 'drivers/staging/android/ashmem.o' failed
>> make[3]: *** [drivers/staging/android/ashmem.o] Error 1
>> scripts/Makefile.build:550: recipe for target 'drivers/staging/android'
>> failed
>> make[2]: *** [drivers/staging/android] Error 2
>> scripts/Makefile.build:550: recipe for target 'drivers/staging' failed
>> make[1]: *** [drivers/staging] Error 2
>> Makefile:1831: recipe for target 'drivers' failed
> 
> As always, it is expected that when you submit a change to the kernel,
> at the very least you have test-built it to ensure that it does not
> break the build.  Please remember to do this next time.
> 
> thanks,
> 
> greg k-h


Thank you, I will do that.

Regards,
Shaikh Kamaluddin
