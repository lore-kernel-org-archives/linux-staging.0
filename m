Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B303FC2
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 21:29:19 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id s3so33883295ljp.11
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tsqcHJkTL2fwURihrviyy7Cwkwx4G6lXSSPjLR0KWHA=;
        b=JLyDSXz2ooq5hoTFgTsBZ3yJxbEMxnfB2qai9sZm0Y9JXXqEcZt61Axi6BwHZnaByq
         1DuWeagXkuwwjVe9GIYGnfH4iA29DvqJk/oMzCGfCvUu55OqS4lap4RdNT/bww3N5hRe
         2krmH2j+I2+EYh1j/y5qS6GXnTejn/fPbXzOrpcfSA70tLObaZ+1urdfmgRC7a48nKUw
         mxQCaFZdAGEGkSRmaIDlvVG5vzB88jqPIOo5HLkk3Scm4qFGRbxSmzs5mpRVKj/tvVy0
         w4+9ayBxXj4ycBBsMrdvDK1IPAgW3znirFjjQZ0bh3wLXxk8xDF99nOSx5dWRSZCLWsF
         tPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tsqcHJkTL2fwURihrviyy7Cwkwx4G6lXSSPjLR0KWHA=;
        b=oRoEKlGCUfh14Cck2WDz10/q0vBT245kSff7183Xy6cKfWjY7CYEAsXKI890ryk+tu
         bU1ZO5o4PnpHvgley1wUC0UbArCSqwp0inqtJWaK3766Q5ZKXC1S+dgZCDhVp/mJTPaO
         NWrEstiNdiyU2k71r6R6vL5DwYzR/K4wiuv6IrhPkSBLbrEJrr2qrco9w/m0MRuWA38a
         BVTdBx639dPgWs3hZP/o7zZne+Qdh+NVFpjyeZBukRQNqs0vue6wj9SEtUY0sO/jRBw6
         YLAYalFJu0HOBntmWQFsot4GYXH0Dy9ocnAzIfog2xryVU24yd5BWVR4c5qxoIpQrmeM
         xtdg==
X-Gm-Message-State: AOAM531P8jZUE8xoRhnePMXUCE4IfHhLaIaNSDaLzjogsRwcYXrmqnDY
	wJOA0rRLoZ/YUrPp4+/Cghk=
X-Google-Smtp-Source: ABdhPJwA+Thpe43qf0OcjA5eV7od8LAT3E9efxlkbAZ171f8CCW0fKsjZoPWWeN3+CTtAEDi0bKBVQ==
X-Received: by 2002:a2e:9781:: with SMTP id y1mr29834479lji.307.1629754157624;
        Mon, 23 Aug 2021 14:29:17 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id 13sm1590528ljf.110.2021.08.23.14.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 14:29:17 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: make rtw_deinit_intf_priv return void
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Greg KH <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210823184059.19742-1-paskripkin@gmail.com>
 <CAA=Fs0mW_4aVNYuLkZMS9ov0CPNKfPB7C=FS2z67Ui+hEvtaRA@mail.gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <262ccda0-0aed-26e9-0585-e5376db86596@gmail.com>
Date: Tue, 24 Aug 2021 00:29:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAA=Fs0mW_4aVNYuLkZMS9ov0CPNKfPB7C=FS2z67Ui+hEvtaRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/24/21 12:20 AM, Phillip Potter wrote:
> On Mon, 23 Aug 2021 at 19:41, Pavel Skripkin <paskripkin@gmail.com> wrote:
>>
>> rtw_deinit_intf_priv() always return success, so there is no need in
>> return value
>>
>> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
>> ---
>>  drivers/staging/r8188eu/os_dep/usb_intf.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
>> index e002070f7fba..37694aa96d13 100644
>> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
>> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
>> @@ -129,13 +129,10 @@ static u8 rtw_init_intf_priv(struct dvobj_priv *dvobj)
>>         return rst;
>>  }
>>
>> -static u8 rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
>> +static void rtw_deinit_intf_priv(struct dvobj_priv *dvobj)
>>  {
>> -       u8 rst = _SUCCESS;
>> -
>>         kfree(dvobj->usb_alloc_vendor_req_buf);
>>         _rtw_mutex_free(&dvobj->usb_vendor_req_mutex);
>> -       return rst;
>>  }
>>
>>  static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
>> --
>> 2.32.0
>>
> 
> Dear Pavel,
> 
> Looks good - going to test your RFC series now btw.
> 

Thank you, Phillip!


Testing this RFC is very important. If it's all ok with it, I am going 
to add proper error handling all across the driver code, based on read() 
errors :)

Btw, we also can add error handling for write() operations, but I think 
it's not _very_ important, since driver won't misbehave in case of write 
failures



With regards,
Pavel Skripkin
