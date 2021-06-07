Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFBE70
	for <linux-staging@lists.linux.dev>; Mon,  7 Jun 2021 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623080094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fC52jz+2EwUa5zIRYlXAAQK6YDu590Vm4X5n2bov1Fo=;
	b=fpe7Fbr0T4+7vKogrsOD5JLpyqdIH9vFvrWHsTxXdlWKsw4fT9fCjIeEuaDt2KUq5WIKTc
	V6sbvmt+SqXH3Uf9axIfNwOO3Sb5baAFgcZe0kXT45mwy5rEcR3uIBVIOAPLbxSjE3LTiz
	hc67S5hnHoSlp1ZGiMGmGFp6lTaNQ4w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-dFEksJkzNkS_BRcSZDqVWQ-1; Mon, 07 Jun 2021 11:34:53 -0400
X-MC-Unique: dFEksJkzNkS_BRcSZDqVWQ-1
Received: by mail-ed1-f70.google.com with SMTP id c12-20020aa7d60c0000b029038fccdf4390so9465673edr.9
        for <linux-staging@lists.linux.dev>; Mon, 07 Jun 2021 08:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fC52jz+2EwUa5zIRYlXAAQK6YDu590Vm4X5n2bov1Fo=;
        b=hEAcgDrrm3EGEZPQ3p6SKECuUehy3MXYsX/wcF8kJfv236vZyFdyMc0QrsBQdOvdaF
         aQ3nOSG6wAmg48nPQIxE57PwqN6DhGn4rf45DftmO8FPgk8d1AJrPrcfzSulcHqUOSRk
         RbzWpCtyjW8Dc9KFAbfTNCaT8v/rwMj+R5VABkLAyuhk92mCpFOvWsAhiw9fdcOQQfoh
         pbYRlCdaYeQ2i0u4tjeRqtl44aEK6fWHmm/ddt/VeEbH0q2D/NtJnPkdG9L/VTSJEUug
         cY1E93UOeRSQJjzwuI9COGpe0YJutgWgXflARkjDZMAlAeUApuR9hiWdMjIGX2cLGFSk
         nQew==
X-Gm-Message-State: AOAM532HzILjrbOAt56w7jMti+6pNDlfadvdLdMLAeXgICgIBdYNid+W
	2e8PdhtKkTnWTnkE8oejfajSJS5WLGmGB2f772acmqrSC5zA/etvODxY4HG0bpfQKkS/eCUlRfH
	sDtzsLFIlI8Xfj06S2VNh5ZkcmA==
X-Received: by 2002:a17:906:f849:: with SMTP id ks9mr17844138ejb.402.1623080092186;
        Mon, 07 Jun 2021 08:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvYbA8Z4c2aPeidNy0bihhkvjuCkf1TCaQ+5APscZmcpDDj5Khk091HytcsvJrtAJDuFGDsg==
X-Received: by 2002:a17:906:f849:: with SMTP id ks9mr17844132ejb.402.1623080092036;
        Mon, 07 Jun 2021 08:34:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gw7sm6602267ejb.5.2021.06.07.08.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 08:34:51 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: Use list iterators and helpers
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, gregkh@linuxfoundation.org,
 Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210428173301.149619-1-linux@roeck-us.net>
 <20210604172632.GA1526@agape.jhs> <20210605005422.GB255680@roeck-us.net>
 <20210607111704.GT1955@kadam> <20210607112648.GA314533@roeck-us.net>
 <20210607113624.GA1410@agape.jhs> <20210607121106.GU1955@kadam>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a2fc4f6d-a7c7-b8ca-3633-10479a183f20@redhat.com>
Date: Mon, 7 Jun 2021 17:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210607121106.GU1955@kadam>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 6/7/21 2:11 PM, Dan Carpenter wrote:
> On Mon, Jun 07, 2021 at 01:36:24PM +0200, Fabio Aiuto wrote:
>> On Mon, Jun 07, 2021 at 04:26:48AM -0700, Guenter Roeck wrote:
>>> On Mon, Jun 07, 2021 at 02:17:04PM +0300, Dan Carpenter wrote:
>>>> On Fri, Jun 04, 2021 at 05:54:22PM -0700, Guenter Roeck wrote:
>>>>> On Fri, Jun 04, 2021 at 07:26:33PM +0200, Fabio Aiuto wrote:
>>>>>> Hello Guenter,
>>>>>>
>>>>>> On Wed, Apr 28, 2021 at 10:33:01AM -0700, Guenter Roeck wrote:
>>>>>>> The rtl8723bs driver manually re-implements list helper functions
>>>>>>> and macros in various ways. Replace with existing list helpers.
>>>>>>
>>>>>> I'm testing rtl8723bs on a baytrail tablet (Lenovo Ideapad MIIX 300-10IBY)
>>>>>> and applying the tag staging-5.13-rc4, loading r8723bs makes the whole
>>>>>> system freezing while trying to connect to local AP.
>>>>>>
>>>>>> Only a power off is allowed.
>>>>>>
>>>>>> I found that commit b3cd518c5abd42fbc747ef55a5fdc40bf7bf01c0
>>>>>> (staging: rtl8723bs: Use list iterators and helpers)
>>>>>> introduced the bug.
>>>>>>
>>>>>> I'm trying to find out what's wrong with this patch, have you any suggestions?
>>>>>
>>>>> Some of the iterators needed the _safe variant which I didn't take into account.
>>>>> I thought that was fixed, but maybe some locations were missed.
>>>>
>>>> Ah...  Crud.  As near as I can tell Martin fixed a lot of these in the driver
>>>> he is working on, rtl8188eu.  But they still aren't fixed in rtl8723bs.  I looked
>>>> at the functions and the following loops need to changed to list_for_each_safe().
>>>> (Doing a search for list_del_init() helped during review).
>>>>
>>>
>>> Hans wants the patch introducing the problem reverted, so I won't bother
>>> sending a fix. Sorry for the trouble. Learned a lesson (I hope).
>>>
>>> Guenter
>>>
>>>> expire_timeout_chk() (both loops)
>>>> rtw_acl_remove_sta()
>>>> rtw_sta_flush()
>>>> stop_ap_mode()
>>>>
>>>> rtw_free_network_queue()
>>>> chk_bmc_sleepq_hdl()
>>>> rtw_free_all_stainfo()
>>>> rtw_free_xmitframe_queue()
>>>> dequeue_xmitframes_to_sleeping_queue()
>>>> wakeup_sta_to_xmit()  (both loops)
>>>> xmit_delivery_enabled_frames()
>>>>
>>>> xmit_xmitframes()
>>>> cfg80211_rtw_del_station()
>>>>
>>>> regards,
>>>> dan carpenter
>>>>
>>>>
>>
>> thanks to Guenter suggestion I made the fix needed, if there's no particular
>> hurry to revert the change I'm submitting it today or tomorrow at most.
>> Will cross check with Dan's hint either.
> 
> Thanks Fabio.  I feel like we can fix this.  No need to revert.

Ack. My suggestion for reverting this was because I did not know a fix was
in the works / almost ready, fixing it indeed is better,

Regards,

Hans

