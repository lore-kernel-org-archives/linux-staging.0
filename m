Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CAD1855
	for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 11:26:01 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id cx5so14291554pjb.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o+I3gcydvpgsmI9xrJbonqfw/abZjMM8fb3Nm3LnnaY=;
        b=pq+bojTShDrNULnHGc2tXu0mQO7B8YiI0O5rAp52/+6qkCZPTNAMbw5xoo6QdjIS70
         5f9bG5x/Mh7C04Ui7xfIfIEDlGySlwtDu4HJqDLOrEtmesalv8Whydt89mFX6MUyINsY
         fE91wFTBExhWtgjYmJBE7PetbeUkIxhe5dODcWwACMZD8l9Q12GVqdjGeJBk8NYC/EtR
         sJiLsg6QlcAQXPqq7Vi4diQlPTwwek4KG01GI7+wG0SMDz1N5W8tRGjw9/nQfMM3Cw/W
         jQo67ypirRrcCBysyJ6/4EcuvYwNPl+xJHOa3HpPzf4yhsJXPYj1SEdre/29iSzeNK/y
         Zbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o+I3gcydvpgsmI9xrJbonqfw/abZjMM8fb3Nm3LnnaY=;
        b=ZwBcCqKcy9nFBWc76xq4rcQY794he3PgU/+oQLP0v+eka53keSSvL5yFGMV0YxY879
         Owf6DX5gKU0znPUlh3+KBs97zz9k9gcZuS13DEo0KrQzh2wQbhFJvenv++t0Ae3ZWm1d
         FYO4La4BueW4OWiyfb1sZOHBmQALK1HCNjCY7lrUDkCIY2XpFDo9rWDzbizjHJ+/9GyW
         rBwLRK4A17XqTqLpiyXUSMruj1/ovmtEl2Atqig7ju08dLTg8E8dMK64IoB/IrWbtoE+
         bSV41XhsWZp+DMP48fxOzSjBbgh5gqJw2Z8fNma4X5lsSe06mCkCGLUOhhsoBuRxu0D8
         mLgw==
X-Gm-Message-State: AOAM532/I8a1JBH7SQ12QQYGKKkNbdSke1/Suqrq7HSpSD4ZxWKQx/JC
	6mCR3jTwPKVYgpqSSAkmVxM=
X-Google-Smtp-Source: ABdhPJyVSK8GHgVSt6s5fJFM0Q75z+o93j5EUPjPPSuXmSEnRXPVMQ5JJdD/pp1A6fCl5z4/daL16w==
X-Received: by 2002:a17:902:f70a:b0:153:88c7:774 with SMTP id h10-20020a170902f70a00b0015388c70774mr1013596plo.166.1647257161117;
        Mon, 14 Mar 2022 04:26:01 -0700 (PDT)
Received: from [192.168.1.102] ([45.250.64.116])
        by smtp.gmail.com with ESMTPSA id i11-20020a63bf4b000000b00380d3454c38sm13381561pgo.13.2022.03.14.04.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 04:26:00 -0700 (PDT)
Message-ID: <bf27518d-4990-8b0e-c6ea-26a658ce2e54@gmail.com>
Date: Mon, 14 Mar 2022 16:55:55 +0530
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
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>, Hridya Valsaraju
 <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220312204128.3942-1-shaikhkamal2012@gmail.com>
 <303ed0c8-8e2c-51a4-a4da-be973a25cdec@gmail.com>
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
In-Reply-To: <303ed0c8-8e2c-51a4-a4da-be973a25cdec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/2022 3:13 AM, Pavel Skripkin wrote:
> Hi Shaikh,
> 
> On 3/12/22 23:41, shaikh kamal wrote:
>> Signed-off-by: shaikh kamal <shaikhkamal2012@gmail.com>
>> ---
>>   drivers/staging/android/ashmem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/android/ashmem.c 
>> b/drivers/staging/android/ashmem.c
>> index ddbde3f8430e..4c6b420fbf4d 100644
>> --- a/drivers/staging/android/ashmem.c
>> +++ b/drivers/staging/android/ashmem.c
>> @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, 
>> unsigned long addr,
>>   static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>>   {
>> -    static struct file_operations vmfile_fops;
>> +    static const struct file_operations vmfile_fops;
>>       struct ashmem_area *asma = file->private_data;
>>       int ret = 0;
> 
> Are you sure this patch compiles? vmfile_fops is overrided few lines below
> 
> odd checkpatch.pl warning...
> 
> 
> 
> 
> With regards,
> Pavel Skripkin

Thank you,yes vmfile_fops is overrided in below code.
Building the kernel - make -j4,
drivers/staging/android/ashmem.c: In function ‘ashmem_mmap’:
drivers/staging/android/ashmem.c:431:16: error: assignment of read-only 
variable ‘vmfile_fops’
     vmfile_fops = *vmfile->f_op;
                 ^
drivers/staging/android/ashmem.c:432:21: error: assignment of member 
‘mmap’ in read-only object
     vmfile_fops.mmap = ashmem_vmfile_mmap;
                      ^
drivers/staging/android/ashmem.c:433:34: error: assignment of member 
‘get_unmapped_area’ in read-only object
     vmfile_fops.get_unmapped_area =
                                   ^
scripts/Makefile.build:288: recipe for target 
'drivers/staging/android/ashmem.o' failed
make[3]: *** [drivers/staging/android/ashmem.o] Error 1
scripts/Makefile.build:550: recipe for target 'drivers/staging/android' 
failed
make[2]: *** [drivers/staging/android] Error 2
scripts/Makefile.build:550: recipe for target 'drivers/staging' failed
make[1]: *** [drivers/staging] Error 2
Makefile:1831: recipe for target 'drivers' failed


Thanks & Regards,
Shaikh Kamaluddin
