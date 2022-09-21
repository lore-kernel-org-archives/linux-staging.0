Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB3F7C
	for <linux-staging@lists.linux.dev>; Wed, 21 Sep 2022 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663751465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHgtB/tFl8du0yqbQXDXdBCyCZjsIYKdtK32iodIEPM=;
	b=SFCZs1Hyd3WSuFvKVN5w39LOgo1TA02nefxn+zjj2lbt0SuVXxmTXDhzjMZL8aZjjmQ5Iq
	dB+GCTz3eCMBAJtQfcBYUFZddPx5bPDnNF0DnEiksvAVQrNQOZcvQVcgmLo2EPFBHEOlVu
	TLgjVfKp5siGqpTg7DgbLtJwdgcGdus=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-gJiMSYaMMZeZ2MNvGINiWg-1; Wed, 21 Sep 2022 05:11:04 -0400
X-MC-Unique: gJiMSYaMMZeZ2MNvGINiWg-1
Received: by mail-ej1-f69.google.com with SMTP id gt19-20020a1709072d9300b00780ec98af88so2777987ejc.13
        for <linux-staging@lists.linux.dev>; Wed, 21 Sep 2022 02:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mHgtB/tFl8du0yqbQXDXdBCyCZjsIYKdtK32iodIEPM=;
        b=I58C8oryXr5H7ssQDoyu0tfya9KIxdKmemttnFanxiUk8+mOjAF58jKv7NulE2xEg0
         Zp7TnYJAw6eCv/qp0/B6fzoxSmIUxvy8LWSg4hUzRVkTlbCMIBSe2dDe220dZNEpUqnh
         Mpa//IMJ8zHLVNFLEA3wI/if/L5p4QelPe+LzlMXkDgJd3hu6a3gyyhe9OWMj+KHBYHg
         pDFaM5EyDZE8kZR1408A+OqWiQfz9tyKtG61YH1NLVOC5MS0FHDRro4nSwJxJsi/jKfo
         pEFGWuAcifLNYrIiuJhap+5/xpGEpYCGe8dG2GucwxUcuWKN3zzjWN+dOqf8haFpAF1F
         wnVQ==
X-Gm-Message-State: ACrzQf0ADhj2uQstLKigCDHYjVKXMRuCNa0hlfH6ERWPvr3G1ugILggl
	/SBF9yzyiqBEn7vXFFKma9s+45k8ZbbWg6cAw3qWjZAGhOoIoFognAZag15HNVBqVCdkLsVQ3Lw
	TxuBciBTzdQQ0D6OGUihJ70eUXg==
X-Received: by 2002:a17:906:8463:b0:771:a3d2:7c3 with SMTP id hx3-20020a170906846300b00771a3d207c3mr19144951ejc.592.1663751463337;
        Wed, 21 Sep 2022 02:11:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+DjbASLOe6LwCU8Po/eoRZVDi3/zb0SGJ6uagMY8Q5rrYm2tTAWYc/stFfB2zlNEb2/wyWg==
X-Received: by 2002:a17:906:8463:b0:771:a3d2:7c3 with SMTP id hx3-20020a170906846300b00771a3d207c3mr19144929ejc.592.1663751463161;
        Wed, 21 Sep 2022 02:11:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402195300b004531b137e4bsm1425060edz.67.2022.09.21.02.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:11:02 -0700 (PDT)
Message-ID: <5f00424c-b18a-7b81-82fc-4363f4796de5@redhat.com>
Date: Wed, 21 Sep 2022 11:11:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 16/17] media: atomisp: Remove
 atomisp_source_pad_to_stream_id()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-17-hdegoede@redhat.com>
 <Yx8bZ4h8wrCGy80m@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yx8bZ4h8wrCGy80m@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/12/22 13:43, Andy Shevchenko wrote:
> On Sun, Sep 11, 2022 at 07:16:52PM +0200, Hans de Goede wrote:
>> atomisp_source_pad_to_stream_id() returns ATOMISP_INPUT_STREAM_GENERAL
>> unconditionally now. Drop it and directly use ATOMISP_INPUT_STREAM_GENERAL
>> in its callers.
> 
> ...
> 
>> -				atomisp_css_capture_enable_online(asd, stream_index, false);
>> +				atomisp_css_capture_enable_online(
>> +					asd, ATOMISP_INPUT_STREAM_GENERAL, false);
> 
> asd can be left on the same line. no?

Right, I changed this to make checkpatch happy about the arguments not being aligned
the same way as the first argument. But then it complained about a '(' at the end of
the line ... so this was not really better (nor worse).

I have changed this to:

				atomisp_css_capture_enable_online(asd,
								  AOMISP_INPUT_STREAM_GENERAL,
								  false);

now which does make checkpatch fully happy. I will change other 2 blocks in the same way.

Regards,

Hans


> 
> 
> ...
> 
>> +		ret = atomisp_css_copy_get_output_frame_info(
>> +			asd, ATOMISP_INPUT_STREAM_GENERAL, output_info);
> 
> Ditto.
> 
> ...
> 
>> -		atomisp_css_input_set_effective_resolution(isp_sd, stream_id,
>> +		atomisp_css_input_set_effective_resolution(
>> +			isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
>>  			crop[pad]->width, crop[pad]->height);
> 
> In the similar way...
> 

