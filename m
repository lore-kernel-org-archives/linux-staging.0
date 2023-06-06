Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849A815ACE
	for <linux-staging@lists.linux.dev>; Tue,  6 Jun 2023 13:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686057597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C5XybOvws+6gkhvcwZNSqRF3mGXbtoymf+lx6kJinwQ=;
	b=A4SFu/s8uGxan9B73qzznDzwRvymigMBmVPk4ZL0UJoOydXh3jkt9oFBZlrb4WlrtsKyZl
	btNc8zBg7PkYJ0E+t59tBEEc8IYhPGtIWvcAltsvk2Zlzmig4s5iGTwm5YucQzogEa7vml
	HqWjxTjMb1Bcj6fXj7jDEXWJvlpl44E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-t00zMp2uMAiLrPtT805OEg-1; Tue, 06 Jun 2023 09:19:54 -0400
X-MC-Unique: t00zMp2uMAiLrPtT805OEg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50a16ab50e6so3965454a12.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Jun 2023 06:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057593; x=1688649593;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5XybOvws+6gkhvcwZNSqRF3mGXbtoymf+lx6kJinwQ=;
        b=Zro0agrRYCKGd3avRU5XPZz0XQAV9xysGdcLBjpS9cGZIHHraiJX2YqXSnXqfAw4w3
         /TOP8R01BB4ZV4B6c2m63u9qWtoBPpOeoTgYqtsZt6BE5Rc8ifGHxH0KIX1TRE9s63Z6
         UTNs/e+zAjXDVwHOyjRH3xNYH5wy1UXJIXkUY9DiONzCBHjYwAYhQfIvh6ZJY8MdnefK
         iTkfjKx9I4wdfCDrTaLg8pVEoEqsfq8fpM9K4MhpnO9Nv8mGWZcwUbfus8vn2TDNemKk
         apuEFouCPmp2DhkWziKtx3a8RnUcV1nhRYGMnFdJbtm43xXGCmirB77JE0jddxApD3vC
         7DDw==
X-Gm-Message-State: AC+VfDz0MA59o8T0OKjg/Iqbivx+oaLNH3Ib8oyxDKzYXFn+fcEob+KN
	psL0BpMn9uTsZi/C53p99eSGVztToqYbxoo9tKqJ2HnOQInygDnqBKmpF5xZFzcxbTlrRfho/yM
	Z1VEjNgAIYfGxbbUAXOWqYc0VJg==
X-Received: by 2002:a17:907:d29:b0:973:ea73:b883 with SMTP id gn41-20020a1709070d2900b00973ea73b883mr3380381ejc.66.1686057592947;
        Tue, 06 Jun 2023 06:19:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HX1s/zPOuyY1Dmb4+r/d5IcrElziI7GUFpcGFH9QTvBl38/PyyLd18U5MsRJf4kl+VEhOBw==
X-Received: by 2002:a17:907:d29:b0:973:ea73:b883 with SMTP id gn41-20020a1709070d2900b00973ea73b883mr3380356ejc.66.1686057592654;
        Tue, 06 Jun 2023 06:19:52 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.131.166])
        by smtp.gmail.com with ESMTPSA id q25-20020a170906a09900b0096f7e7d1566sm5584027ejy.224.2023.06.06.06.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:19:52 -0700 (PDT)
Message-ID: <264b29be-e48d-c06f-c7ed-1f1c9dc3205e@redhat.com>
Date: Tue, 6 Jun 2023 15:19:50 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] atomisp: sh_css_params: write the sp_group config
 according to the ISP model
From: Hans de Goede <hdegoede@redhat.com>
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230605102903.924283-1-hpa@redhat.com>
 <20230605102903.924283-3-hpa@redhat.com>
 <f57f6070-aab7-87aa-b838-906b570a8265@redhat.com>
In-Reply-To: <f57f6070-aab7-87aa-b838-906b570a8265@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kate,

On 6/6/23 13:02, Hans de Goede wrote:
> Hi Kate,
> 
> On 6/5/23 12:29, Kate Hsuan wrote:
>> Pick up the necessary part of sp_group configuration for both model and
>> then copy those parts into a tempetory buffer. This buffer is finally
>> written to the ISP with correct length.
>>
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> ---
>>  .../staging/media/atomisp/pci/sh_css_params.c | 37 ++++++++++++++++++-
>>  1 file changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
>> index 588f2adab058..2913d9d6d226 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
>> @@ -3720,10 +3720,43 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
>>  
>>  ia_css_ptr sh_css_store_sp_group_to_ddr(void)
>>  {
>> +	u8 *write_buf;
>> +	u8 *buf_ptr;
>> +
>>  	IA_CSS_ENTER_LEAVE_PRIVATE("void");
>> +
>> +	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
> 
> Please use sizeof(struct sh_css_sp_group) here, since you have dropped all the #ifdef-s in the header now that is the largest size which you need now.
> 
>> +
>> +	buf_ptr = write_buf;
>> +	if (IS_ISP2401) {
>> +		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(u8) * 5);
> 
> This is wrong, there is a big hole between:
> 
>         u8                      no_isp_sync; /* Signal host immediately after start */
>         u8                      enable_raw_pool_locking; /** Enable Raw Buffer Locking for HAL
>         u8                      lock_all;
> 
> and:
> 
>         u8                 enable_isys_event_queue;
>         u8                      disable_cont_vf;
> 
> filled with ISP2400 specific data now, so you are copying what likely is some empty alignment bytes before the ISP2400 specific input_formatter struct now instead of copying enable_isys_event_queue
> and disable_cont_vf.
> 
> So you need to split the memcpy into 2 memcpy calls. You can calculate the source offset of enable_isys_event_queue in sh_css_sp_group.config with offsetof(struct sh_css_sp_config, enable_isys_event_queue), or better yet, just take the address of it:
> 
> 	if (IS_ISP2401) {
> 		memcpy(buf_ptr, &sh_css_sp_group.config, 3);
> 		buf_ptr += 3;
> 		memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event_queue, 2);
> 		buf_ptr += 2;
> 		memset(buf_ptr, 0, 3);
> 		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
> 	} else {
> 
> Also note I have dropped the "* sizeof(u8)" here, you already dropped that yourself for the memset / padding bits and dropping it makes the code easier to read IMHO.
> 		
> 
> 
>> +		buf_ptr += (sizeof(u8) * 5);
>> +		memset(buf_ptr, 0, 3);
>> +		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
>> +	} else {
>> +		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp_group.config));
>> +		buf_ptr += sizeof(sh_css_sp_group.config);
>> +	}
>> +
>> +	memcpy(buf_ptr, &sh_css_sp_group.pipe, sizeof(sh_css_sp_group.pipe));
>> +	buf_ptr += sizeof(sh_css_sp_group.pipe);
>> +
>> +	if (IS_ISP2401) {
>> +		memcpy(buf_ptr, &sh_css_sp_group.pipe_io, sizeof(sh_css_sp_group.pipe_io));
>> +		buf_ptr += sizeof(sh_css_sp_group.pipe_io);
>> +		memcpy(buf_ptr, &sh_css_sp_group.pipe_io_status,
>> +		       sizeof(sh_css_sp_group.pipe_io_status));
>> +		buf_ptr += sizeof(sh_css_sp_group.pipe_io_status);
>> +	}
>> +
>> +	memcpy(buf_ptr, &sh_css_sp_group.debug, sizeof(sh_css_sp_group.debug));
>> +	buf_ptr += sizeof(sh_css_sp_group.debug);
>> +
>>  	hmm_store(xmem_sp_group_ptrs,
>> -		   &sh_css_sp_group,
>> -		   sizeof(struct sh_css_sp_group));
>> +		  write_buf,
>> +		  buf_ptr - write_buf);
>> +
>> +	kfree(write_buf);
>>  	return xmem_sp_group_ptrs;
>>  }
>>  
> 
> The rest looks good at a quick glance, but I need to take a closer look later.

I have taken a closer look at the rest of the patch now and except for my one previous remark this looks good to me.

Thank you for working on this.

Regards,

Hans

