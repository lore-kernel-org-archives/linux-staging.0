Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88882C85
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 05:15:42 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id p18so9995567plf.13
        for <linux-staging@lists.linux.dev>; Fri, 12 Nov 2021 21:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=f6RV46JFP1vnddjnNTCzC7CXwyM/jUs5OPYC1QMeUvs=;
        b=FWlXtTaKEdajLInMJq5MS27S9bx9AzGj3jxhvVDH1Oz6rqj/YTPWHkluMEf4oVgvYA
         HA6JSz1pYRvQvloVmrXfZPu7TuSaYUK31WYF9Xcq/d4pn2U+5zqKVI5EUaH54VQC3HPi
         Aoiw1ztz6H1pmrKdXjD3NA6YlSotwnTssmNCQ2dSR/4I6uHUsIuR2Zm0Ew3pnE2d6KtI
         MQmigDwIg34yUQQy4GjE7SFsWjE6xD7Gv/yssrc+1LX/3L4HUgejLuRGdKI3NgMeUTIp
         7r8pyWxJQHeAXcydnzj6CzieJ6lWxfJfWDXtvl3Iw3QyXi9sm6vOCobyl8xQW54maOeM
         EQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f6RV46JFP1vnddjnNTCzC7CXwyM/jUs5OPYC1QMeUvs=;
        b=hiF+UlDwix32rMjzSeuhBYkNuKGca29briiP5qB1GaN3/9QIyn0z+s4dzLZuD/pg+a
         czWJxxyc9aEqdGZxjpjApAZmNmt6VI82ySloBuS+9rbYVrhMXdaLZsZnJ/HJaXhpgEeF
         9MGAwz7uC3aQJIsomJ8Pv4RDDYwbpUGawtfRB8DROc+rvlCp+f6oOOCoPp0PodVFB2KE
         fxQvynxXHg3abDJBJEWh8RoXnX2qZh2dmItQZrI21uyIEFdrTuHaehwkcajWivLoEU47
         dmk0mwybp/YJ9gP+LXYGu843+sGRrfa34h6pFhqHCpgNme1ltI4cxioVmNAgTZimHNND
         XNmw==
X-Gm-Message-State: AOAM531+XEPwfGKwa/RvBDGx1wK5H03dNqzU7k0gfPiiRpm7HQn9qclk
	EOjZqsNPY5d2Mg6n4Qc5eFM=
X-Google-Smtp-Source: ABdhPJxFuJgR3xZOql4c3JCRvPhcVjrvi+5FZY8aaqWF5MgyRe+QXo0TJACfIgX98hB3fbeZ+1IFHw==
X-Received: by 2002:a17:90b:3882:: with SMTP id mu2mr21805426pjb.165.1636780542391;
        Fri, 12 Nov 2021 21:15:42 -0800 (PST)
Received: from [192.168.1.2] ([59.88.110.49])
        by smtp.gmail.com with ESMTPSA id q6sm6092687pgn.42.2021.11.12.21.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 21:15:41 -0800 (PST)
Message-ID: <6ff3bdd8-cc32-1cc0-a31a-3a3b48c87f55@gmail.com>
Date: Sat, 13 Nov 2021 10:45:33 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] staging: r8188eu: core: remove goto statement
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 gregkh@linuxfoundation.org, straube.linux@gmail.com, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 saurav.girepunje@hotmail.com
References: <YYwMq15pQYf7nvt9@Sauravs-MacBook-Air.local>
 <20211110184525.GM2001@kadam>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
In-Reply-To: <20211110184525.GM2001@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/21 12:15 am, Dan Carpenter wrote:
> On Wed, Nov 10, 2021 at 11:47:15PM +0530, Saurav Girepunje wrote:
>> Remove the goto statement from _rtw_init_recv_priv(). In this function goto
>> can be replace by return statement. As on goto label exit, function
>> only return it is not performing any cleanup. Avoiding goto will
>> improve the function readability.
>>
>> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
>> ---
>>  drivers/staging/r8188eu/core/rtw_recv.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
>> index 51a13262a226..b38af76f3a67 100644
>> --- a/drivers/staging/r8188eu/core/rtw_recv.c
>> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
>> @@ -58,10 +58,8 @@ int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter)
>>
>>  	precvpriv->pallocated_frame_buf = vzalloc(NR_RECVFRAME * sizeof(struct recv_frame) + RXFRAME_ALIGN_SZ);
>>
>> -	if (!precvpriv->pallocated_frame_buf) {
>> -		res = _FAIL;
>> -		goto exit;
>> -	}
>> +	if (!precvpriv->pallocated_frame_buf)
>> +		return _FAIL;
> 
> 
> I hate pointless "goto exit;" labels, but there isn't a rule against
> them and I feel like this is not a good enough patch on its own.  There
> is so much other stuff wrong with this function.  It probably *should*
> have some error handling for example.
> 
> I don't think this patch really adds enough value.  Take a look at the
> function and almost every line can be improved...
> 
> regards,
> dan carpenter
> 

OK, I will send the other patch to improve this function,
Thanks Dan for review.


Regards,
Saurav 
