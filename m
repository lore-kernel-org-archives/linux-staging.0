Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D573D9C
	for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 22:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668982299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw5YLmBV3zvgBgPqfqVMCiPaHG3CK9Os8KGj2+0wVYA=;
	b=CfaBtRU7ii8/1GjEqCWRf8TLC2AkwXb9ENmrNKuuOryZLnqij1m7tGJ3hc9gK72dN4/3Ab
	priSETk0XByxZMFGuyZJynbr4UoPTEc0sX8Rpb/yWr6bDHTbB/RZdxNcNFaHZ0MKnCTvdM
	Eo81rzC05Eda6IPzUFk11Yt9vmooU/Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39-DYoO3q8mMS2WhYWk6qc7kA-1; Sun, 20 Nov 2022 17:11:38 -0500
X-MC-Unique: DYoO3q8mMS2WhYWk6qc7kA-1
Received: by mail-ed1-f69.google.com with SMTP id f17-20020a056402355100b00466481256f6so5501192edd.19
        for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 14:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw5YLmBV3zvgBgPqfqVMCiPaHG3CK9Os8KGj2+0wVYA=;
        b=kwCPQppeBvmWENgRPH6aYukkA6YR/EYk1T9RkL1aCkVdt+0xcjUNHd374kIQUiIQDv
         BXQT45Xh/yDFCPYY+mRjjlyfwQ6L9SEqMdE4u9F46/1eEItlEVzI/ZC+kGO7NFbmz2yY
         qxOjwPcDLrVF/tHwpxw4rSCA0em/lav757xgHeHdV1EAdbcvh7Cf0qWH/mRGW7431leh
         2fjGznqnpXwIuoKMmZ5piL0IjChnF8tVoHqhAOrAEfBep9lsOKRkiLs3tRCv7VPi2dTP
         QaLozhXXxLJA5cEG+9ygPdOBcnBDsAEaH6QYDr3lXmXnt1M2xN7E9xXPZpud9MmB6IHr
         NqBQ==
X-Gm-Message-State: ANoB5pnMh3jl3MbY47tskvjQKE5DIBTvGpsYrqB0izRuj8RMxFUyIFoK
	zlL/eTmJsCe1jWLx7aJGrkXRTve/emJ/WJs9JRPNBujbTBTvNAqrz6LwqbMDLbTaXO7oQJpYi4b
	nU1zk7i53rsCF3PZ7v7NI9RqFbg==
X-Received: by 2002:a17:906:b794:b0:7ae:6450:c620 with SMTP id dt20-20020a170906b79400b007ae6450c620mr13285789ejb.270.1668982297115;
        Sun, 20 Nov 2022 14:11:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5u5KSYHqmEK/ViaF1gT/5mAcAehoWkQ3IknmGdtE0s6DtgplFle6AyfvYaiGmWlVe3OuXK/A==
X-Received: by 2002:a17:906:b794:b0:7ae:6450:c620 with SMTP id dt20-20020a170906b79400b007ae6450c620mr13285784ejb.270.1668982296939;
        Sun, 20 Nov 2022 14:11:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kw10-20020a170907770a00b0078d4ee47c82sm4316439ejc.129.2022.11.20.14.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 14:11:36 -0800 (PST)
Message-ID: <22f1d502-4d0f-e7b3-b14d-3a99d1584912@redhat.com>
Date: Sun, 20 Nov 2022 23:11:35 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 10/17] media: atomisp: Convert to videobuf2
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-11-hdegoede@redhat.com>
 <Y3IxGxZuJEO+yfcp@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3IxGxZuJEO+yfcp@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/14/22 13:14, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:26PM +0200, Hans de Goede wrote:
>> Convert atomisp to use videobuf2.
>>
>> This fixes mmap not working and in general moving over to
>> the more modern videobuf2 is a good plan.
> 
> ...
> 
>> -				/* The is the end, stop further loop */
>> +			if (list_entry_is_head(param, &pipe->per_frame_params, list)) {
>> +				/* The is the end, stop outer loop */
>>  				break;
>>  			}
> 
> You can drop {} by writing this as
> 
> 			/* If this is the end, stop further loop */
> 			if (list_entry_is_head(param, &pipe->per_frame_params, list))
> 				break;
> 

Fixed in my media-atomisp branch.

> ...
> 
>> +		if (!list_empty(&pipe->buffers_waiting_for_param))
> 
> Why not positive conditional?

This is existing code which is moved around, I prefer to keep this
the same to make it clear when looking at the entire diff that
this is just moved around and not changed.

> 
>> +			atomisp_handle_parameter_and_buffer(pipe);
>> +		else
>> +			atomisp_qbuffers_to_css(asd);
> 
> ...
> 
>> +	/*
>> +	 * Workaround: Due to the design of HALv3,
>> +	 * sometimes in ZSL or SDV mode HAL needs to
>> +	 * capture multiple images within one streaming cycle.
>> +	 * But the capture number cannot be determined by HAL.
>> +	 * So HAL only sets the capture number to be 1 and queue multiple
>> +	 * buffers. Atomisp driver needs to check this case and re-trigger
>> +	 * CSS to do capture when new buffer is queued.
> 
> Indentation of the above seems arbitrary.

Yeah it is, again this is existing code (existing comment) which
is just moved around.

> 
>> +	 */
> 
> ...
> 
>> +	/*
>> +	 * FIXME This if is copied from _vb2_fop_release, this cannot use that
> 
>  _vb2_fop_release() ?
> 
>> +	 * because that calls v4l2_fh_release() earlier then this function.
>> +	 * Maybe we can release the fh earlier though, it does not look like
>> +	 * anything needs it after this.
>> +	 */
> 
> ...
> 
>> +out:
> 
> In some cases you use 'unlock' in some 'out' for the same, I would suggest to
> unify as
> 
> out_unlock:
> 
> in all affected locations.

Fixed in my media-atomisp branch.

Regards,

Hans




> 
>> +	mutex_unlock(&isp->mutex);
>> +	return ret;
> 

