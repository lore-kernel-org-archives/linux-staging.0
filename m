Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9539234
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 20:18:32 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50d897af77bso1223039a12.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686169111; x=1688761111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ag0Zb0tQVIKFhYpth7TyBzzfO6OzmNaWjp5H9Lmc/Y0=;
        b=WW+HEszCeEXzYQpeXWWFQloQNhynhfuERyLc2J7luikQlFtPf0pA6kTvxcOPI1xQCy
         m+USe2Urj4bpEGg+/xGiOCmggDf0yK8+gnu+7VVUoG5QVeHqeJbGX+E2jTtmRqk+J/QS
         ggksPtASg//2NNylsky8RMD7JlZ6TaXVFmwGJoIeBbmegoFwiUqCiUpeTVAWhta+pqOp
         S9xh3CkQLS3vs5B2ccmoqkJBHWZhYDXDa2Z35MlluN044/oiJ/Ju5RrtnPjIaS+vQ58x
         hG99u4+wmOR57VU3GOWvoFmG2FEz9djdKn8n58HDWx1xAslqBjoRsKqtG4eUFe7RsNDh
         54WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686169111; x=1688761111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ag0Zb0tQVIKFhYpth7TyBzzfO6OzmNaWjp5H9Lmc/Y0=;
        b=R3V6UqohFCaB+9NC1DFEFtKLKVsjCo+0sPi1pko+4oXd2EKZaHj3pw+LNUQzEM3E/Y
         wGewXzFxlF95g1AMheKWsfa2ziqxbcpNacNqxZ60G2ZJMY4r8bilopaFoGTnL0JJP9R3
         /80DK8VCHHpfjFKjI7H/LTXiJZpIsQ2AXRurXglmGC8pb0/fiTMz7oJEgw/euiUlu8lj
         VMNg66csVpdtOMOGlsv2KIOcO1L9zzRQlXv7DpFlWlWyL84cJJHHVA/6RXuUMPg9/xy8
         Yk3DGNtMcLVLEzUZXOED9LhqWVjKM3MHvamwnvbrDi50ERUIhmu/Vk1grcv1mS1twuoc
         p0lw==
X-Gm-Message-State: AC+VfDwIvkPdVuqNUu1cOSy3WAcuh4UNShG7w15tb+2iR61nAjhSXzRT
	0AQOHscTa9XEDF3cIBl2J7I=
X-Google-Smtp-Source: ACHHUZ7J+CIUJAaMLo020VxRutLX59tFbcjvQ7T8LkZ1pXHKvEOOxrXchuTkN9KxVQDrQRGDnDeaRA==
X-Received: by 2002:a05:6402:26c7:b0:506:6c2a:528f with SMTP id x7-20020a05640226c700b005066c2a528fmr2857967edd.4.1686169110639;
        Wed, 07 Jun 2023 13:18:30 -0700 (PDT)
Received: from [192.168.0.101] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id f21-20020a05640214d500b00514b8d5eb29sm6471685edx.43.2023.06.07.13.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 13:18:29 -0700 (PDT)
Message-ID: <90813181-02a1-b54f-132b-c68e7b797bb6@gmail.com>
Date: Wed, 7 Jun 2023 22:18:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/5] staging: rtl8192e: Remove variable SetWirelessMode
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Yogesh Hegde <yogi.kernel@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1686149467.git.yogi.kernel@gmail.com>
 <fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel@gmail.com>
 <01a162c5-f0de-47b1-97e7-8a451a89df80@kadam.mountain>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <01a162c5-f0de-47b1-97e7-8a451a89df80@kadam.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/23 17:07, Dan Carpenter wrote:
> On Wed, Jun 07, 2023 at 08:31:41PM +0530, Yogesh Hegde wrote:
>> The variable SetWirelessMode is set in only one place throughout the
>> driver. This patch removes the variable and calls the real function
>> directly instead, eliminating the unnecessary indirection.
>> Additionally, the removal of the variable aligns with the checkpatch
>> guidelines by removing the use of CamelCase.
>>
>> Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
>> ---
>>
>> v2: Removed the variable and called the function direction instead of
>>      just renaming the variable as suggested by Greg Kroah-Hartman
>>      <gregkh@linuxfoundation.org>.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> regards,
> dan carpenter
> 
> 

Hi Dan,

thanks for all the work you do. I always appreciate your comments.

But I think it does not work because this driver is divided into two 
modules.

To load the driver I am using the following lines:
sudo insmod drivers/staging/rtl8192e/rtllib.ko
sudo insmod drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko

So this line is required:
priv->rtllib->SetWirelessMode = rtl92e_set_wireless_mode;
as one name is used in one module and one in the other module.

But the change was proposed by the masters so I thought that I must be 
wrong.

My compiler does not compile this patch:
   LD [M]  drivers/staging/rtl8192e/rtl8192e/r8192e_pci.o
   MODPOST drivers/staging/rtl8192e/Module.symvers
ERROR: modpost: "rtl92e_set_wireless_mode" 
[drivers/staging/rtl8192e/rtllib.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:136: 
drivers/staging/rtl8192e/Module.symvers] Error 1
make: *** [Makefile:1978: modpost] Error 2

Did this compile on your system Yogesh?

So I am looking forward to your response what I am doing wrong.

Bye Philipp







