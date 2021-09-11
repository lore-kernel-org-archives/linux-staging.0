Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0FF3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 10:24:12 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q26so6379172wrc.7
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 03:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YqGDZZMJKPugLbHU1Z+KSXD5nBkqoBERs7vHAT2/hzo=;
        b=Q3l5j9tTDRzH0acAC7NMkA87vTfP4ro0ABYJMQakGilztDnr3CkxusgQKX7HvQNAXT
         DVza84wZe+jYqKzSiq0mU+89Q0RbjbmGKF5Y5iOtRqMeJ0KeGimOUI3oZb0JKyNWa1Q2
         rMWintNWJy243GdKTPUdn5PykLQqmvGqB3RgP5ar0wqlqTm9iLH0wa8D3uE0227MTDdj
         DGvDGamsp+WH9QzV7HweU+X3u+K1hk6yRX4S42LExH3rnE6qvs5k23wZJRlp7q4/YsNq
         Es6YtM0pc/0s20yv5ITHqCFwZ08O79zHLaDlWVueM/s8YN+jaQ1d9wP4f3hvtIMgiem5
         PqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YqGDZZMJKPugLbHU1Z+KSXD5nBkqoBERs7vHAT2/hzo=;
        b=tdAgD3RYqmvaDCQx+lig9mCchWoxhpMLLISoNwvyA3457nFSWvvtNZlkgvQc4sJ8Qj
         tarsnKds9R++UmxSVLxtP85PyTbliXvId6tkMO6uvm0z48saLfAGrNB7jg+nQPEToab3
         Xkcj8THgSfeti0wUBSdtojlP3m1JUeQMynIEtUuJaKUCI414oehRfjHAwWjATGByUl++
         +tATNfZJ209zjRQPVWzY4zPWjKH/4z1D4QbTRgkIut+vh7bcbT0Lns2jdp008K8itGF/
         egu7YJfliTCIZFcrICQjXDxvGx23fWSTNSkslZMuxkOg6qUwqXWaMNymX2wb4I9eXTdU
         j1rQ==
X-Gm-Message-State: AOAM533Jcac24QaioXpBC0SNgOvIOOMnJJrPAoJBxRmYlvqrWasiOk7f
	zP51ylWQ3VGb+WNt4xQW1TM=
X-Google-Smtp-Source: ABdhPJyWawzrPoeggbJueCiuR65y3mZN0kFClQFojNFf0Y5ecIXX1lCT5YBC2k4SQ3hHh7qDvMGKPQ==
X-Received: by 2002:adf:ee49:: with SMTP id w9mr2476358wro.158.1631355850945;
        Sat, 11 Sep 2021 03:24:10 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::8fe1? ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id u2sm1213238wmj.29.2021.09.11.03.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Sep 2021 03:24:10 -0700 (PDT)
Message-ID: <296aa357-1bba-4136-c651-a18d04c8d32a@gmail.com>
Date: Sat, 11 Sep 2021 12:24:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH 0/7] remove pointers from struct hal_ops
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210910205033.3778-1-straube.linux@gmail.com>
 <1858319.rr7sHpn3up@localhost.localdomain>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <1858319.rr7sHpn3up@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/21 11:38, Fabio M. De Francesco wrote:
> On Friday, September 10, 2021 10:50:26 PM CEST Michael Straube wrote:
>> This series removes some more pointers from struct hal_ops and
>> removes the function rtl8188e_set_hal_ops() that is empty after
>> the removals.
>>
>> Michael Straube (7):
>>    staging: r8188eu: remove mgnt_xmit from struct hal_ops
>>    staging: r8188eu: remove hal_xmit from struct hal_ops
>>    staging: r8188eu: remove read_bbreg from struct hal_ops
>>    staging: r8188eu: remove write_bbreg from struct hal_ops
>>    staging: r8188eu: remove read_rfreg from struct hal_ops
>>    staging: r8188eu: remove write_rfreg from struct hal_ops
>>    staging: r8188eu: remove rtl8188e_set_hal_ops()
>>
> 
> Hi Michael,
> 
> This series is good.
> 
> Furthermore, I compiled the whole series with gcc version 11.2.1 2020816
> [revision 056e324ce46a7924b5cf10f61010cf9dd2ca10e9] (SUSE Linux) one
> patch at a time. There are no errors or warnings at any time in any of the
> seven builds.
> 
> But, unfortunately, I have no time to test. So the whole series is...
> 
> Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> Thanks,
> 
> Fabio
> 

Hi Fabio,

thank you for the review. I have tested it on x86_64 with
Inter-Tech DMG-02 connected to a CCMP network without any
issues.

Perhaps I should have mentioned that in the cover letter. ;)

Thanks,

Michael

