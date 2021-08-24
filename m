Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1E72
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 10:26:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 79-20020a1c0452000000b002e6cf79e572so1505070wme.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/8erZYE2cD+Vlo7X+889l81VIhNHRmt0/HRXy3thEP4=;
        b=Yh6K5HwtU/khm1gO+RRAN+TGZ0nBSSC7pXNJxX93WV+FQUWbn0oUjpL+00M4f9DdYz
         XXttERFqS/lakjHgdflBnvPvi6jAz1zNDvZkJwV0SAWsHMUz16GcUJlz0BLi3fI6rJwJ
         OfuZ0ts0Y3VmLq1ayJ+4j9q0FchnfHlSJfdClXNNlEkYHBgtaWBdB9tDXfXPnpjl09ei
         x5DZfu0Ye+SkkkSxUyrTwJvUgz7Lnuj6bbia7WDs8O6YYX2DbQ9jakPA6cDM6kvjsVss
         wb88i9JHTxzng6SJ1nNY+ymnVqC2qQIWxXM0HyMqbAXv5Jx8AVlHxKP6vBPMpPOdlEqn
         9WjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/8erZYE2cD+Vlo7X+889l81VIhNHRmt0/HRXy3thEP4=;
        b=LaYpdQPcvWQoA38DvioO/bhOO8NO4mZt8adrG0lFLfStruj4TRc9kvj1bQRBIHccLL
         IZd3dM57esmmdcs6dMiLbXaF2ySONQ1a7EvXr9Ny0ui7oSipN9DlLk9m7ByZQEdlXKL8
         V2W2tJu07FgH/hC8xqCKiKMxWnmZ6b3ApJPLKCiDHKaqeab897EaCDW9YlyanIvCLLlZ
         +ei0ukf3OlXI5sdYzWJGbrBm6GsNIxXsmtnaCBVsFa1nvhCZ3i519UB9R3N9kfTZmu+V
         EMMB7XHtjcGt7P3Si7kvPRdZv+B2JwtbPWgae7i9Rv0nSO/DimUKD03K0i/1dyXNvn+n
         wcEw==
X-Gm-Message-State: AOAM532nhKdeTJRbkfBxvU+9wJwkBf3QTiZ3j6QlP/EHPqGU8Llcakco
	/ecVsja/jczWaG0ySw5TtGw=
X-Google-Smtp-Source: ABdhPJwklu7zScEE++H2vJFMMEwUnTUfcuRtS3eTwxnayYyZu8KhOnVMHdbKX+47IK8zw9D7SjJe4Q==
X-Received: by 2002:a05:600c:3795:: with SMTP id o21mr1638535wmr.130.1629800802336;
        Tue, 24 Aug 2021 03:26:42 -0700 (PDT)
Received: from ?IPv6:2a02:8108:96c0:3b88::5d87? ([2a02:8108:96c0:3b88::5d87])
        by smtp.gmail.com with ESMTPSA id z7sm1857033wmi.4.2021.08.24.03.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 03:26:41 -0700 (PDT)
Subject: Re: [PATCH 00/23] staging: r8188eu: clean up spacing style issues in
 core dir
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, martin@kaiser.cx, fmdefrancesco@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210816155818.24005-1-straube.linux@gmail.com>
 <20210824085845.GN1931@kadam>
From: Michael Straube <straube.linux@gmail.com>
Message-ID: <bfd22fe0-27d4-4248-bef4-bad43f464fad@gmail.com>
Date: Tue, 24 Aug 2021 12:25:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210824085845.GN1931@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 10:58 AM, Dan Carpenter wrote:
> Thanks!  This was very nicely broken up so it was easy to review.
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> regards,
> dan carpenter
> 

Has been merged already. But many thanks for taking the time
to review it!

Thanks,
Michael

