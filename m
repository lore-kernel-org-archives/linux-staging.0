Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C9CA73;
	Wed,  1 Nov 2023 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFYaJ9s0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso10908795a12.0;
        Wed, 01 Nov 2023 08:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698853015; x=1699457815; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hexmk49ujNpb1xtdHgW2u+GIQeyEe+vJ7SF4SxvQAsE=;
        b=XFYaJ9s0FcpgTyp3dHGvyX0V6GKK+n46engvuFu0Hy4OOifJmhpx+T6ryv8Fvh6eDA
         X+n5p08HNzxjFnt3nbCkTLea25Rqdhu0nj4ga37laV2wMzTv9e5R78R9/f8uWu2Vzzjx
         8NDCG85soEkRZo4LGzMlWg5vRmJsbQRwH0wpntwNNIBWu5MMBIB1jVIfWJzftoOjx1CH
         O8zJjJCGgwL5ETNrFL4ezYDEIzad6TdRUoft5v79EzubOhmQ/GDoHTBCgeEXzWrQALef
         CpQnNu+PEy5FUVAT/GnRVMn6DHlfrHXWbv4qnEfCmGSpoPCRA/iBR/hn//xXPG/j/i06
         nYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698853015; x=1699457815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hexmk49ujNpb1xtdHgW2u+GIQeyEe+vJ7SF4SxvQAsE=;
        b=c5qaFdUolK33r82mA5Ctt7fxEJ5Y4cVbtov8NFBAarEP2j+LU3Ktzs4syjGG5dBAVm
         e7D3Lz3fGbiQP7i7XsAiQATT49Lw2HNs/Z8pZxusDMgl1bTYbJ0/GbNXoJs2IS50wlwV
         zUjL62sWymQ9p+pgk55yvxCVNgGGq5Bh7VdihkQznq1PlkXpDIEVxF4G5AKgHzUwyf7S
         NA1nIi5G49Dgq2DTg5jzni4FZECVUmp9ep1D6ZtcOgSx9wTO6YcOmzN6QnsQmO2FRsiU
         2AaItMWH+3gIXMQBLpYtr+1GGHp8qhWSNRoFj5cNhsSP/aMtBiH6i++JBRf9x2K20CVg
         lgwA==
X-Gm-Message-State: AOJu0Yy97zkp0O5xJ/k38+qelAnrW4xKanNdZho6r+RYl+OiFPVXmvoz
	1svHYopmguE1eNIhBU5ujw==
X-Google-Smtp-Source: AGHT+IHGBq6ikaR1Vc0Dr5gti0wNOgkMImLBk6ma21/TdEmuBAI35mUjQ49xGCe1d1e1AA5A2y3fCQ==
X-Received: by 2002:aa7:d0ca:0:b0:530:74ed:fc8a with SMTP id u10-20020aa7d0ca000000b0053074edfc8amr12958328edo.41.1698853015062;
        Wed, 01 Nov 2023 08:36:55 -0700 (PDT)
Received: from [192.168.78.129] ([105.163.156.68])
        by smtp.gmail.com with ESMTPSA id v10-20020aa7dbca000000b0052ffc2e82f1sm1191247edt.4.2023.11.01.08.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 08:36:54 -0700 (PDT)
Message-ID: <9d00781f-3c24-401d-902a-451e38c19e3c@gmail.com>
Date: Wed, 1 Nov 2023 18:36:51 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] staging: sm750fb: Remove unused return value in
 display_control_adjust_sm750le()
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
 dan.carpenter@linaro.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231019101348.22076-1-anonolitunya@gmail.com>
 <20231019101348.22076-2-anonolitunya@gmail.com>
 <2023102113-barbell-amazingly-cef6@gregkh>
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
In-Reply-To: <2023102113-barbell-amazingly-cef6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 21/10/2023 13:01, Greg Kroah-Hartman wrote:
> On Thu, Oct 19, 2023 at 01:13:36PM +0300, Dorcas AnonoLitunya wrote:
>> Modifies the return type of display_control_adjust_sm750le()
>> to void from unsigned long as the return value is being ignored in
>> all subsequent function calls.
>>
>> This improves code readability and maintainability.
>>
>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
>> ---
>>   drivers/staging/sm750fb/ddk750_mode.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
> This patch doesn't apply against my latest branch.  Please rebase it and
> resend.
>
> thanks,
>
> greg k-h


Hi Greg,

Sorry for the delay. Was occupied on the project starter tasks. I have 
rebased the patch and resent it. Thanks!


Dorcas


