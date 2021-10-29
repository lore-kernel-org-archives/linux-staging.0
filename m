Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ED772
	for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 15:41:29 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id t184so9648720pfd.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=e2LSeR+1aB83iQx8bvm+vqfIRk8zSNNwY57NGmv6bj4=;
        b=ZaOh3z6FebFptV8F7W7jaNXgILOtsJzduEsWYpjfhjJKFG4vPWG9kIC1Chz8XuE/eo
         cUjkreDzjc3xmkJ7TPNV0o+DHj465FnLBhhWTBcBjFGzS8/WfKXWGRVwFVTVtNlc316b
         XpYqihOXOKJOD/DfxtTuS3GWkc5IUkWGh5zbs106vpcVZS05nYDU+m70jImdMsdpDFJJ
         Q+nk+yoChsE9p0nz98Y4bGuM/RpZ4qh5XwB1qWVzQ/OzVbXyVVSEOUuEmMGiLlY1PBVN
         o3V2l4kHgv2ZkPWc4UgU0LGcE0WGqY9Zcg62S1CCY/iDTqnLxgGIyO9R4YTN7A98ey3G
         3+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=e2LSeR+1aB83iQx8bvm+vqfIRk8zSNNwY57NGmv6bj4=;
        b=zIq8qgJna6WOP/PDlF21WfKcpb/X9lIiLUn/fnvSkVE4orfeF5T75fDG+Y9m+8bZh/
         60BLh8kyVfDv43Alm+O3wR877Ju4KBaJt8+7yAFJVYqR4/SHmfREcle5HLJOK13IB4Ry
         Fl4MRqZGHVfZSVWa0nxdftTTssybpAA7MdT87ukivGKeJ367a45mg7xK+nA+XwCyqD61
         knWY7bPRJTM52g51RsRIdcI9ofJu/EDRooJpzacpU2SUOOllha9r6z31U7Yqg6BmIXGU
         DULMkw6nS/gzOzK8OW+gqqVkjQQGfTjZr+KomHjh6QXZhrebroDBOCQG5XijvVfN8MSX
         TjHQ==
X-Gm-Message-State: AOAM533cZnfc+wornHHf7fle9ARO16l/6KJd7JrpFCPj6EGIg/gweHTh
	Eg9liNgbFWyrca/c6WBivdw=
X-Google-Smtp-Source: ABdhPJxbB8WeXrsiKGbnPBSSatdQoSmtKxWmYBFTsHypX46n58qgzvVc6vFWDG4ezmD3elYI7ntIhg==
X-Received: by 2002:a05:6a00:b46:b0:47b:f401:d76a with SMTP id p6-20020a056a000b4600b0047bf401d76amr11458363pfo.47.1635522089276;
        Fri, 29 Oct 2021 08:41:29 -0700 (PDT)
Received: from ?IPV6:2405:201:d007:e827:3d78:7315:8c23:fdaf? ([2405:201:d007:e827:3d78:7315:8c23:fdaf])
        by smtp.gmail.com with ESMTPSA id t22sm7622252pfg.63.2021.10.29.08.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 08:41:29 -0700 (PDT)
Message-ID: <edfd74c7-9b6d-f8f5-65c4-c1bae3015247@gmail.com>
Date: Fri, 29 Oct 2021 21:11:25 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Outreachy kernel] [PATCH 2/7] staging: vt6655: Use
 incrementation in `idx`
Content-Language: en-US
From: Praveen Kumar <kpraveen.lkml@gmail.com>
To: Karolina Drobnik <karolinadrobnik@gmail.com>,
 outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
 <c569952d92ba51f32679c2fd87fd48ad8e49e3fc.1635415820.git.karolinadrobnik@gmail.com>
 <3dfc45e5-12bc-72da-a260-5551a483fe6e@gmail.com>
In-Reply-To: <3dfc45e5-12bc-72da-a260-5551a483fe6e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29-10-2021 20:26, Praveen Kumar wrote:
> On 28-10-2021 16:05, Karolina Drobnik wrote:
>> Increment `idx` in a loop instead of adding the loop counter
>> `i` to do so. Thanks to this change, the cast to unsigned short
>> can be removed.
> 
>>
>> Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
>> ---
>>  drivers/staging/vt6655/rf.c | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
>> index f195dafb6e63..c07653566d17 100644
>> --- a/drivers/staging/vt6655/rf.c
>> +++ b/drivers/staging/vt6655/rf.c
>> @@ -700,11 +700,11 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
>>  			return false;
>>  
>>  		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
>> -			MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_init_table[i]);
>> +			MACvSetMISCFifo(priv, idx++, al2230_init_table[i]);
>>  
>> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table0[channel - 1]);
>> +		MACvSetMISCFifo(priv, idx++, al2230_channel_table0[channel - 1]);
>>  		i++;
>> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table1[channel - 1]);
>> +		MACvSetMISCFifo(priv, idx++, al2230_channel_table1[channel - 1]);
>>  		break;
>>  
>>  		/* Need to check, PLLON need to be low for channel setting */
>> @@ -717,17 +717,17 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
>>  
>>  		if (channel <= CB_MAX_CHANNEL_24G) {
>>  			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
>> -				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table[i]);
>> +				MACvSetMISCFifo(priv, idx++, al7230_init_table[i]);
> 
> If I'm not wrong, there is a problem here, we are using the modified idx value here, instead of original which is *MISCFIFO_SYNDATA_IDX*.
> I don't see idx value being reset either. Am I missing something ?
> 

Looks like I missed, the case statement, thus, idx will be intact. Please ignore my previous comment.

However, as mentioned in previous patch, we can also make *i* as unsigned short and that should IMO remove the requirement of cast.
But again, this works as well. I'm fine with either. Thanks and sorry for the confusion.

> Further, this bring a question, how are you validating or planning to validate these changes ?
> 
>>  		} else {
>>  			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
>> -				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table_a_mode[i]);
>> +				MACvSetMISCFifo(priv, idx++, al7230_init_table_a_mode[i]);
>>  		}
>>  
>> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table0[channel - 1]);
>> +		MACvSetMISCFifo(priv, idx++, al7230_channel_table0[channel - 1]);
>>  		i++;
>> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table1[channel - 1]);
>> +		MACvSetMISCFifo(priv, idx++, al7230_channel_table1[channel - 1]);
>>  		i++;
>> -		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table2[channel - 1]);
>> +		MACvSetMISCFifo(priv, idx++, al7230_channel_table2[channel - 1]);
>>  		break;
>>  
>>  	case RF_NOTHING:
>>

Regards,

~Praveen.
