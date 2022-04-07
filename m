Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0652570;
	Thu,  7 Apr 2022 18:02:40 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d29so8999629wra.10;
        Thu, 07 Apr 2022 11:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZI2zq9mkd2prXmULME2LtrcZkY8ywRvQtGF9At1AEMM=;
        b=liamQE/kdVhSCuAi5OWNzVoQ3g4xNM16YZqC0W7s0Aq7ZJNeiP06CAqHQ+hSc4MVM6
         UjOOz1zh1WxpOU+yHJEZoS4DAbmODPzE84f8QLMP3ZkUON9vU3JglbB/Zvg2m91ibbbP
         Uqt/5ENtb8hY0DuQgmMhzUXb8Tm4keng/c9bPZi9L2hfRJSSpoTbMYIQSKJd57h1BOVd
         6XUeDR4VzJcSEtAfy4v6dSJlw4gf6CrqrxQXUnfDvBjfuJQGn+etz4xcotMOCMAsCHho
         XfC+N710MMlJ1Dm9r+2+7bcYkhsLAIiDxIqVmRsuFVJ44EiYRVGxTj2vl4nivmFA7hdw
         o0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZI2zq9mkd2prXmULME2LtrcZkY8ywRvQtGF9At1AEMM=;
        b=R7VCaAp7O+AlHRdfS1HcrOBPZz5ETWIAKALw77o1/++3DWbzQdl+xq9kvGyVnc4hQh
         tALyvZMKwh2QCQwL0BArV7cutdJGPtka2e7j1qzCLCy9oLjYQdeQTJY+JT2uIi9Ehu3q
         s4OZAHG8UL6VA0O22RLL0WESA/S/+N97H0QgCl7FdS8SwUcQGUjzYl5Ulcq6xVlKdtXv
         aSce6J/06xKq+vqMU9mQrj6nK3myFqo6+HeECz9+pyR8bc5zt28N9oaJj9gn2o5i7TBQ
         rWG2tFdUc9cSPEE2LlxEb0087M5lLab+s32yvz9MKClv1qgE4q+TWlKFWlomid9UoG6p
         U3bg==
X-Gm-Message-State: AOAM532CBQWUwdKifjokH9AxKUusOSnHu85wNSmKyE4pk23a8A56wmNW
	v9xdTC9XyRPT5etMKbhQtyk=
X-Google-Smtp-Source: ABdhPJzQka+xTNU7ql8arJI82ehOltbzm2rvGQHJA9CwS4HmmPHVaxrgpjhgiXExl+NTmFEefB9ASQ==
X-Received: by 2002:a5d:55c8:0:b0:206:f52:902e with SMTP id i8-20020a5d55c8000000b002060f52902emr11330443wrw.597.1649354558824;
        Thu, 07 Apr 2022 11:02:38 -0700 (PDT)
Received: from [192.168.1.14] ([197.57.231.245])
        by smtp.gmail.com with ESMTPSA id 10-20020a5d47aa000000b00204012e4373sm20030480wrb.101.2022.04.07.11.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 11:02:38 -0700 (PDT)
Message-ID: <96a1de63-5b66-b6a6-731e-d7263f3328a5@gmail.com>
Date: Thu, 7 Apr 2022 20:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] staging: rtl8712: remove unnecessary parentheses
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
 florian.c.schilhabel@googlemail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220407125947.8525-1-eng.alaamohamedsoliman.am@gmail.com>
 <Yk8jbTSjvsHXpX2U@kroah.com>
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
In-Reply-To: <Yk8jbTSjvsHXpX2U@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ٧‏/٤‏/٢٠٢٢ ١٩:٤٦, Greg KH wrote:
> On Thu, Apr 07, 2022 at 02:59:47PM +0200, Alaa Mohamed wrote:
>> Reported by checkpatch:
>>
>> Remove unnecessary parentheses around structure field references
>>
>> Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
>> ---
>> Changes in v2:
>> 	- Edit commit subject
>> 	- Edit commit message
>> 	- Fix the same check in more lines
>> 	- Remove space before '.skey' in
>> "memcpy(psta->tkiptxmickey.skey," in lines 84 and 86.
>> ---
>> Changes in v3:
>> 	return the space before '.skey' in
>> "memcpy(psta->tkiptxmickey.skey," in lines 84 and 86
>> ---
>> Changes in v4:
>> 	edit commit message to be clearer.
>> ---
> Why did you send this patch twice?
That was by mistake , sorry
>
