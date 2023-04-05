Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C39E79E2
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 21:19:29 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9333b408ee7so6556266b.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680729567; x=1683321567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPYPYBwrFLM1Tz4ngJkdSSxofCmahHCM6HK4CfJ1m8U=;
        b=Tlgkwsoa764zsgCz1nG42H24NpfFhgDeowsLmT9bMYIlTMOUQ+YLl6jpcXzixeLVtU
         e+M5ZIYEY0mdvWJG82r4Hv8wk/A5j9sXGUbEOzP6UJhDf72LiqTDDx7oyQ+9ATtAk21t
         4DN+aUEP7vpAgixmH2ixxTsCAy3wWACobv9l/eGgldk5mh0tKDQRisU8tiFUDRsDZ9Z7
         eqVkNW4JlSruhPxYXw2Hhm5Z2QGnvq9AsfNX95oZRWPbQokbvGZqSgBaaGfIAmPdyPE+
         28Rxwj+gRpMs8JrZ6gcwr+DO70Vk5QJ13dmd1DraFk0WlcyN6oSqUuhVbtKCKYaNAawm
         HIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680729567; x=1683321567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPYPYBwrFLM1Tz4ngJkdSSxofCmahHCM6HK4CfJ1m8U=;
        b=2Fu+c6M5ZjvE4o1v2tE4VEEJuEuuvxBwgGbfjXCz1E+If+E0jCb9UtN3zS+a7hTQPD
         /2RVaSATjfGhKb/ee6niivfXNL5CM/weLB9mWSvh4WGcwjWZmMwqpyCE/mA0W9oImfws
         BfOboubwDOkRGDWifCIC7jQwT4pyLeVSZkXv1c/Jh5ipU4sOw5H1AFoRjruxCrKYzsFw
         kXDsTY4jNahcb3QOhqdS4zxY3fq8tA2K4Rpl1Kz2IUqoweuGCMlQ+KqC8mWrfl4HXB/x
         4H+95BkgrL6BeQGOGTWQSoMT+o57krSCTDeZBcqIwzSsi85DyKjWBtU3a7IPPmc/ibQ0
         SVVw==
X-Gm-Message-State: AAQBX9cz9kydbb/YUgrXRIEwK6CiypLudOEjSctoWr/z3Up87q2X4v7y
	bt9InQ7sm2kxGS/Es45BNAPNfSJl2+Q=
X-Google-Smtp-Source: AKy350ZY+QvRCNYWzU4QCyFFs92LG9Ed7ePnEQ5+K47gzGGZ3cMwrjAh7YljUkDNNNAe2IC1EWxXFA==
X-Received: by 2002:a17:906:51d9:b0:8d2:78c5:1d4e with SMTP id v25-20020a17090651d900b008d278c51d4emr2575482ejk.5.1680729567153;
        Wed, 05 Apr 2023 14:19:27 -0700 (PDT)
Received: from [192.168.0.103] (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id 19-20020a170906309300b0092be390b51asm7777889ejv.113.2023.04.05.14.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 14:19:26 -0700 (PDT)
Message-ID: <d0642a21-4675-76f7-a470-b0dc1ef37cec@gmail.com>
Date: Wed, 5 Apr 2023 23:19:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [BUG] staging: rtl8192e: oops occurs when finding hardware
 rtl8192se
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <39dc735c-fd6d-e405-856c-788a52704d63@gmail.com>
 <2023040521-angelic-emptier-1367@gregkh>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <2023040521-angelic-emptier-1367@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/5/23 16:37, Greg Kroah-Hartman wrote:
> On Sun, Apr 02, 2023 at 05:00:13PM +0200, Philipp Hortmann wrote:
>> Hi,
>>
>> when I use the hardware rtl8192se the driver
>> drivers/staging/rtl8192e/rtl8192e/r8192e_pci.ko detects that it should not
>> run on this hardware and aborts.
>> But when the driver is freeing the resources an oops occures. Find oops at
>> the end of this Email.
>>
>> When I comment out the following lines those errors disappear:
>> cancel_delayed_work_sync(&ieee->hw_wakeup_wq);
>> cancel_delayed_work_sync(&ieee->hw_sleep_wq);
>> cancel_work_sync(&ieee->ips_leave_wq);
>>
>> When I do an init before the cancel:
>> INIT_DELAYED_WORK(&priv->rtllib->hw_wakeup_wq, (void *)rtl92e_hw_wakeup_wq);
>> The oops are gone as well.
>>
>> When I use cancel_delayed_work() instead of cancel_delayed_work_sync() it
>> also works.
>>
>> Can somebody give me a hint what the expected way is to solve this?
> 
> Is this a new thing, or has it always been there?
I would need to check in several places.
It seems to me that it was an issue in kernel 4.0 already.


> 
> Why is the driver loading if you don't have hardware for it?  Or are you
> manually loading it?
Reason why they two drivers are loaded is that realtek managed to have
two different devices with the same vid and did.

from rtl8192se/sw.c:
static const struct pci_device_id rtl92se_pci_ids[] = {
	{RTL_PCI_DEVICE(PCI_VENDOR_ID_REALTEK, 0x8192, rtl92se_hal_cfg)},
	...

from rtl8192e/rtl8192e/rtl_core.c
static struct pci_device_id rtl8192_pci_id_tbl[] = {
	{RTL_PCI_DEVICE(0x10ec, 0x8192, rtl819xp_ops)},

#define PCI_VENDOR_ID_REALTEK		0x10ec

The drivers are loaded both and find out with the pci revision_id if 
they are in charge.

> 
> thanks,
> 
> greg k-h

May be I should mention that I do have an rtl8192se. But it does use a 
different device id.

I am simulating the driver that it is rtl8192se hardware by changing the 
revision_id.


Thanks for your response.

Bye Philipp


