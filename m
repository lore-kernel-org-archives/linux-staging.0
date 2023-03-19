Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E097111E;
	Sun, 19 Mar 2023 11:28:09 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z21so36621207edb.4;
        Sun, 19 Mar 2023 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679225288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYsg9F+fh9pRcm/YTvI/Kc7XzT0BxNXellA2GuZX/uQ=;
        b=XDPrlwEPBlN7/obEoEn0fWejalXZPRR5CrXIf6T4nh5usgxUiqNUzIvenLcNZkQ/Z0
         kfcM8l8EccH45qkXNZiIZDW5ugR08lF9A5V6ANBTGpLxeVC+vny0RvwSZkvEbC/FNrlv
         XDP1TfcVTa4+0WJcoce7XrWLvhFDAI5rkWmHtQfgrogwT/ctprtuvDalkTzymNz+JfIW
         irYSpwUs0YL19Qkf/K5POvvVAFHhu71hNqW9uaga5BFz2ATHcTXE04YZPui8hOKTLjr5
         Ptm3YJzRlzDBHa4QWNtvlVq8Lccph/TtKe43CbbPc5Oq4Wv+dcwW2Xjk1DY/u7kH2yfH
         lygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679225288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYsg9F+fh9pRcm/YTvI/Kc7XzT0BxNXellA2GuZX/uQ=;
        b=CXHvYvk3RegBAc8z/zJNFpLThAFxOzWQ76XgsFU6dvGOOn/YycSOCvtmts4giEVP9I
         FB4eXCBkzAuDdtq2AB2y2wjAgqc3Fz8z3Ebv27cQTgB+QKshwDq7Ji965mcBM2hzi5iC
         wZI5VFl0LLvX0oQ/RUcJUyU5oy/m4zYD6SK04S4hvR2EdaNe/7pzW+ZxF3/rccfN5+dD
         MCHVC73VYHgThKoVaYgviRyfxTiJoXXXYFel6QaCp5XOmSazUX8fNx4rJkzDCdkursgp
         +FavTbo0J9svgBTL8l8sgCzKtq4b/WdjufnFRpWUy5n3xplq48387L11rskUHdD00f/I
         xQGA==
X-Gm-Message-State: AO0yUKX1wylNYoVShws43kfLGgjOC8LH41coEWoUReIFi7bFAZ/gnVjn
	5iOZnLEIYhVtA+ndWL1isXI=
X-Google-Smtp-Source: AK7set9V99OLguKmluFKrH1BCT7mhfTeuklPoimct+I6fOTgV2yniFwkXZAY/LQpTTrC/CGvDumXfg==
X-Received: by 2002:a05:6402:b0d:b0:4fb:5607:6a24 with SMTP id bm13-20020a0564020b0d00b004fb56076a24mr9496773edb.8.1679225288158;
        Sun, 19 Mar 2023 04:28:08 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id mm24-20020a170906cc5800b009336687cf77sm788368ejb.85.2023.03.19.04.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:28:07 -0700 (PDT)
Message-ID: <15e81411-e40f-43c5-bb7f-907d6d5f93c5@gmail.com>
Date: Sun, 19 Mar 2023 13:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] staging: greybus: add blank line after struct
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303191216240.2867@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303191216240.2867@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١٩‏/٣‏/٢٠٢٣ ١٣:١٩, Julia Lawall wrote:
>
> On Sun, 19 Mar 2023, Menna Mahmoud wrote:
>
>> add blank line after struct for readability as
> The log message should start with a capital letter, so "Add".


Okay, I will fix it.

>
>> reported by checkpatch script
> "reported by checkpatch" or "reported by the checkpatch script".
> The first is more concise, and it doesn't really matter whether checkpatch
> is a script or something else.


got it.

>> " CHECK: Please use a blank line after function/struct/union/enum
>> declarations"
> I guess the #define was concatenated to the end of the definition to show
> that it is closely related to the definition.  With the #define, it seems
> rather natural, but the better soltution would be to make a static inline
> function in both cases.  There would naturally be a blank line before a
> function definition as well.


got your point, so, should i ignore this?


Menna

>
> julia
>
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>> ---
>>   drivers/staging/greybus/gbphy.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
>> index d4a225b76338..1de510499480 100644
>> --- a/drivers/staging/greybus/gbphy.h
>> +++ b/drivers/staging/greybus/gbphy.h
>> @@ -15,6 +15,7 @@ struct gbphy_device {
>>   	struct list_head list;
>>   	struct device dev;
>>   };
>> +
>>   #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
>>
>>   static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
>> @@ -43,6 +44,7 @@ struct gbphy_driver {
>>
>>   	struct device_driver driver;
>>   };
>> +
>>   #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
>>
>>   int gb_gbphy_register_driver(struct gbphy_driver *driver,
>> --
>> 2.34.1
>>
>>
>>
