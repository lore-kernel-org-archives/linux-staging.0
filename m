Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EED1855
	for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 11:18:54 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id z12-20020a17090ad78c00b001bf022b69d6so14165717pju.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 04:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dpq2jd5nmzdPBxLx2tXJQXsCy3Tj/t5W3K7mDTr0mRA=;
        b=jh/Cnw1mFIfgU+lkoZrJoF0z6Z6W9mFhDXhB5+RnCHYuKE5YhSDNj9/g7UVKLRN/3y
         ngf5XPbBFRBYJxq9ucd7l+r91HkUvWYN4cffHl68Z07pcKMUiJWixniIYPdiQ6hpT/0t
         Sk91booBlv/neFQH87+V1m+zaEqXSoKwW0A+/lUVKmEo5F4Q690hCPa1tBS3sjW4e6os
         YBGI+5KSwBwLdwjdOT4iCLqCd9Bd+nxcf1ba3jN4nh+e6Gdl4ZzrOE6RsKyU8OtWULP4
         rbMjgyE8AL/rPY7Sxe5PlylhulojeITZgBlCAUN1fD9AYPShvUTV3vpgpIdUNzxrZDuz
         UWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dpq2jd5nmzdPBxLx2tXJQXsCy3Tj/t5W3K7mDTr0mRA=;
        b=BdoXXn5cbdN9q8n+TKwkWTg/nOlu4Ud6Eh1YioReCazT/TQokkVg6Fy1w9st7ImAKa
         N+iMk8ZTApRFko/eyaFb65rzqmypC23woTpho197m1K8nRI96XLaHvz2+8rv1CxSFYRj
         4i1DiCFpuyHYUqyV6kGeH9Hi2vxRq8G1Rsko+8l436dicW2pJp85Qt1A0nZKJ3epFx/U
         bxYH0AOmx/DwtTZDZwOzv4PsYr4tHyPVEfcN99SGe6zzbn7QJ1HeGFIhnDQ1AX0cawA3
         wrMFY4YpOuk3LEnIXOhh4nXZqnvVOxRmCaSc5BK1Erdd74oTFR03ZWN7RfxEVKw5Nicf
         XpIQ==
X-Gm-Message-State: AOAM533H6LU6Qf/kU8BF4LeMX78JgAHG1y5M1a9cikfGvDL6xVK/fXlQ
	nJ3126IMSBHtS6hc3eXtDy0=
X-Google-Smtp-Source: ABdhPJw7TrZDmVqj0LeEGjx3ITiP3HqPpbBotW11n2lnXv64Cc62Cb792fcZnNvgCutVVrheuog0iw==
X-Received: by 2002:a17:90b:1e47:b0:1bf:6d79:b1fd with SMTP id pi7-20020a17090b1e4700b001bf6d79b1fdmr35927360pjb.49.1647256734337;
        Mon, 14 Mar 2022 04:18:54 -0700 (PDT)
Received: from [192.168.1.102] ([45.250.64.116])
        by smtp.gmail.com with ESMTPSA id e4-20020a17090ab38400b001bf9519fe8bsm20757369pjr.38.2022.03.14.04.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 04:18:53 -0700 (PDT)
Message-ID: <85279e7c-bc63-5ee0-0a4b-443b4b1a87c9@gmail.com>
Date: Mon, 14 Mar 2022 16:48:47 +0530
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
To: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>, Hridya Valsaraju
 <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220312204128.3942-1-shaikhkamal2012@gmail.com>
 <19a139d0dde6fadfce79c10d40c9810b50702fb1.camel@perches.com>
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
In-Reply-To: <19a139d0dde6fadfce79c10d40c9810b50702fb1.camel@perches.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/2022 2:57 AM, Joe Perches wrote:
> On Sun, 2022-03-13 at 03:11 +0530, shaikh kamal wrote:
> []
>> diff --git a/drivers/staging/android/ashmem.c b/drivers/staging/android/ashmem.c
> []
>> @@ -377,7 +377,7 @@ ashmem_vmfile_get_unmapped_area(struct file *file, unsigned long addr,
>>   
>>   static int ashmem_mmap(struct file *file, struct vm_area_struct *vma)
>>   {
>> -	static struct file_operations vmfile_fops;
>> +	static const struct file_operations vmfile_fops;
> 
> Make sure to compile any files modified by your suggested patches
> _before_ sending the patches.
> 
> 

Thanks for your suggestion, Kernel build is failing.
