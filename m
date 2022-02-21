Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD5333ED
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 20:54:54 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id b9so20838212lfv.7
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 12:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9O3/P6nDT9vew0ys+NqmJ/EyY8z22EgOFRFm9Et7xg4=;
        b=kG9GzAkheiHFSYStMre7Sbd4nDnyVbI9S6lYxgznlRwabVMFV+6NYKe5C1y19RzNhi
         9pYuMftc9tFm2b5WlMsD4f8nnNP3hCIFLYPKTztX1q8uodWNn07Th0yoPcl9CBixLcQi
         9/CvZhL3Y0LcxON1qET6MGSGMSaDfzm6nGZA/DURDrvSbexXEjRxrpE2zkindlxpqUrE
         XBbUazcyXadWAo9tQuaGN5OPZc7XVPhYxNDW2u2eDcng08fSVvay5rZ7H9un2Yj1VE6g
         TIai1GiBhMuT2rCcT/CxuJe25C9YaToNXd5HL623gkQ0b0nmjgWMxw8G/u3ldHUYGp7f
         HqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9O3/P6nDT9vew0ys+NqmJ/EyY8z22EgOFRFm9Et7xg4=;
        b=SK2S40YhJje+6mqV2Z4PqNutYzioZx7Ci8jV22r2Gny5q6eDbkUrTi9jBbOvyoGKwp
         XA1QHZCIPzkJOhSuD38iVPp7HHdaMCa6YYBpZS2uXmxHQ7bW902oz4hCI5wcRy7WhoVR
         8IG9kKNALFU2KgvJBXmgQcOH8sr6Jtq4boc+IPdRQgxjx7Rz5/WYs7XfxxPVlQ8Csoq1
         xbSg080ED4dTUZn6SpQ5whOAZH6QPVoncsOlYzV0XcgNbGaouOKWPLMiqIOUlAhpgkXc
         /k7PUsbFBpX/pXj2zmlJ06wlmNRlQkC9YFXOSxt8IXKcEeDr27wnnjbAlqmEFwyjk7U2
         G8Cg==
X-Gm-Message-State: AOAM530FVkQyAgouGWj0WnUjT9ZosMNi1dqrKchBeYsq2bi+oLIlufkW
	m/gY+zxlW+oZ2TZhzWvD7Go=
X-Google-Smtp-Source: ABdhPJxqC+dfNhYkr89kIWaeS6hp2VDMz4tsyJMXGQ0VMknz69H/1Zu07idN9LJ40JYAy7NH2Jru0w==
X-Received: by 2002:ac2:5e2f:0:b0:438:a4b5:4c72 with SMTP id o15-20020ac25e2f000000b00438a4b54c72mr15526215lfg.304.1645476892223;
        Mon, 21 Feb 2022 12:54:52 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.64])
        by smtp.gmail.com with ESMTPSA id o1sm1203816lfk.62.2022.02.21.12.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 12:54:51 -0800 (PST)
Message-ID: <8d5cf235-27f0-9c7a-3659-d2b1fe7a02dd@gmail.com>
Date: Mon, 21 Feb 2022 23:54:50 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/3] staging: r8188eu: refactor rtw_ch2freq()
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220220154847.7521-1-straube.linux@gmail.com>
 <20220220154847.7521-3-straube.linux@gmail.com>
 <cb7db1ac-8e7e-d549-a5c0-fcd072ae815e@gmail.com>
 <94160654-ec16-cad2-3cc2-46628caaa17e@gmail.com>
 <20220221122250.GE3965@kadam>
 <32a2b74b-f541-ddf6-d8c9-6bd6ca0ad07b@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <32a2b74b-f541-ddf6-d8c9-6bd6ca0ad07b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 2/21/22 22:20, Michael Straube wrote:
>> I'm glad that Pavel noticed this change.  This is a risky thing and
>> should have been noted in the commit message.
>> 
>> Just from a review stand point it would be best to leave the original
>> behavior.
>>
> 
> Do you mean to leave the whole original code including the 5 GHz
> frequencies? Or returning a default value if we have a channel value < 1
> or > 14?
> 

IMO, your version is much cleaner than previous one. This table walk 
seems really unreasonable, since 5 GHz support is really redundant (I 
saw it in other thread)

I'd put just sanity check and return the default value from previous 
version. Maybe even wrapped with unlikely() if we sure, that in normal 
state we won't hit it ;)




With regards,
Pavel Skripkin
