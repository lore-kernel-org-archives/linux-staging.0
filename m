Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB372
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 09:16:30 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z2so13085998lft.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VwzfECxpCdVoPZvMBUhjsZ1CU0bHcG8tMQUcJoB03Mc=;
        b=U6YJzYHhiIzC093S977N4kojGE2WwMIjAs6xGSKaleQLY4hI+jPjthAivr0L/Gglbw
         rMS8U5STB3QsD9UWWCSfk44W4FuDQfh5Wu8apnVfbkJG2LPYy1wbRLzhdEgNHKpuaFnm
         hLNC4JjpVY+xFm68Tcdh/Bo+E/4edjIbq+9Talzc7BYXyOyI7SDEknfVB/k2QSbRJBwM
         5Oj2GYe2HnqMJfM7QHWRDHau5p0hiyiIypJ5SIG4A4M6WDMSoZAGExo5TW1Au22D6g24
         3hPbgoxNVgzSN+HjavzL4o8xdIw819E6P1kv4qQwznfPyroedtmLrhBIMCLld5O3cNFa
         OGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VwzfECxpCdVoPZvMBUhjsZ1CU0bHcG8tMQUcJoB03Mc=;
        b=RdTcY/OBEFf3EYThIbenOl0j4pzvw2eqhnvkPcSE4NS6wFnp57KXbf1CBK8DfgX10w
         d2sMgqZq5hP8+qjVWmj99l+5t/iNIVT8mgGeulGr+fUDRiU2b8ui3Y29GuO26H6QO7pQ
         a+Z/CbxYtZScWpAAIE0Jzg0AIz2SrrACzRYO8Z1h4VKFqgP3xjTWcKdJ1F3aanQMicIJ
         OY1I+CBFcNCq3Pg3Cn1TJrDbtnkusrwu4S+Xvz4VDXKs/6VcL7FiviD3Lr49wmmaot/7
         LrguiA/P8dS41OIVOhN+jtxdigTpznVT9vLpa5xSoKtmdWHbu72boR1tmVthL01ejZ/I
         8tFQ==
X-Gm-Message-State: AOAM530Fok/tTJ6xUOGLrxQ5Y56T9sk+BPu9Wih0F3J8f2TE9XWKvHEt
	b2RrHDrt9Q1Xj2IVLsOS6IA=
X-Google-Smtp-Source: ABdhPJycNrabdok/Z8eft5BVQ9a42ip6dQ5f2EGgX78UHL4HQER2tKNGQSgPBTtYULu8nrHnjYWp4A==
X-Received: by 2002:ac2:5456:: with SMTP id d22mr6112299lfn.139.1630055788705;
        Fri, 27 Aug 2021 02:16:28 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id m28sm615005ljc.46.2021.08.27.02.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 02:16:28 -0700 (PDT)
Subject: Re: [PATCH v3 3/6] staging: r8188eu: add error handling of rtw_read8
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com,
 fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1629789580.git.paskripkin@gmail.com>
 <c59d5d850bf9aab208704182c83086609289cb9c.1629789580.git.paskripkin@gmail.com>
 <20210827090706.GA12231@kadam>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <84e04d0e-8a07-aedd-117a-6b6337b865c7@gmail.com>
Date: Fri, 27 Aug 2021 12:16:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210827090706.GA12231@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/27/21 12:07 PM, Dan Carpenter wrote:
> On Tue, Aug 24, 2021 at 10:27:27AM +0300, Pavel Skripkin wrote:
>> @@ -83,7 +83,12 @@ int proc_get_read_reg(char *page, char **start,
>>  
>>  	switch (proc_get_read_len) {
>>  	case 1:
>> -		len += snprintf(page + len, count - len, "rtw_read8(0x%x)=0x%x\n", proc_get_read_addr, rtw_read8(padapter, proc_get_read_addr));
>> +		error = rtw_read8(padapter, proc_get_read_addr, (u8 *) &tmp);
>> +		if (error)
>> +			return len;
>> +
>> +		len += snprintf(page + len, count - len, "rtw_read8(0x%x)=0x%x\n",
>> +				proc_get_read_addr, (u8) tmp);
>>  		break;
> 
> Oh my goodness...  :P
> 
> If you look at what proc_get_read_addr is, it turns out it's a 32bit
> address which is controlled by the user in proc_set_read_reg().  LOL!
> Just a giant security hole.
> 
> My advise is just delete this dead code.  No one is using it so how
> necessary can it be?


Yep, it's dead code as was already mentioned. My plan is to convert all 
this code to sysfs. One thing I am wondering about should I include 
these changes into this series?...





With regards,
Pavel Skripkin
