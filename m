Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9397FE
	for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669033920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oKpZnG0rPqEKAL5LH5lU2H5pnJQYE0Ll66mz17vxttU=;
	b=EKmZe4VOSNFOlbWoN8NwqXp6aBblv85UfhSLSV8T8x7sXfq+2Oh7s9E6LQTdZCBkOS+hK0
	AxPOIa66JJShGapvD9cmbfo6zHjNrZ6g0hN8HBK0AfAn3F2wO12sdvNua5zTWNw/nB+T5+
	jPHGhXxJj8F78V4I3MY/vMraguGBR2M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-JpYhuS-eM1a4VIduVmcGrw-1; Mon, 21 Nov 2022 07:31:59 -0500
X-MC-Unique: JpYhuS-eM1a4VIduVmcGrw-1
Received: by mail-ed1-f72.google.com with SMTP id b13-20020a056402350d00b00464175c3f1eso6693413edd.11
        for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 04:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oKpZnG0rPqEKAL5LH5lU2H5pnJQYE0Ll66mz17vxttU=;
        b=iyZ2UbfcWQmyHjrq884PdSqWvnQfFvfist6yNOXvkQSajsjhuxPoju85i8ZXIJrUrF
         r4ZdK7o9BAZWbp5UEaltWO1V6VJmv1wXAIHTCSb0EkpcNmsVx+SmufkPHytk/N3kU94C
         eQHSk5dBBYW3v8eRRCCMvaRKJZ4U+sgk5HWuLBkV5mMdWqSCK8GZWr0GHjCWWI57kDxo
         qmnrCaLfz5qgoJVH07C8oezZCOWmdNXu0oSpgm9STyw/ICoYd4F+KwGtGDW8D68U1hnK
         XgfbYaz8HscjSCVHreswdlX7LEmUyocvkl+9fKWXwDUmL+NXfnmNtfFzrd5zRO27EuzH
         KRHQ==
X-Gm-Message-State: ANoB5pnsFTOmKD0pDSkq3jSDOz+eLwz4bJ6MKLXzjiOik8x7qk1W7Imy
	on5vRWUIBa3Z+l9jJXHL/kkHGQaUVQXCb5n7bWNXRqqp7ewNxqc7U171Yq7YYU19knbKh/KScux
	15xzN9q9kkSRDnhmZR8vKWfdjbg==
X-Received: by 2002:a17:907:900a:b0:7ae:f6e8:2502 with SMTP id ay10-20020a170907900a00b007aef6e82502mr15403877ejc.157.1669033917963;
        Mon, 21 Nov 2022 04:31:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf640EdQG3DAJkEsZwbS/HagKIL/ehxH8OD0wvYhdnpJ42Koh7AN/IIMshwJnE29O/POqPlNsg==
X-Received: by 2002:a17:907:900a:b0:7ae:f6e8:2502 with SMTP id ay10-20020a170907900a00b007aef6e82502mr15403858ejc.157.1669033917818;
        Mon, 21 Nov 2022 04:31:57 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f16-20020a17090631d000b0073d81b0882asm4915823ejf.7.2022.11.21.04.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:31:57 -0800 (PST)
Message-ID: <a9862f25-3762-dbb1-3091-162dc3e6bebc@redhat.com>
Date: Mon, 21 Nov 2022 13:31:56 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 10/20] media: atomisp: Drop userptr support from hmm
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221120224101.746199-1-hdegoede@redhat.com>
 <20221120224101.746199-11-hdegoede@redhat.com>
 <Y3s+YOqkvdBrfLy+@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3s+YOqkvdBrfLy+@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/21/22 10:01, Andy Shevchenko wrote:
> On Sun, Nov 20, 2022 at 11:40:51PM +0100, Hans de Goede wrote:
>> After the conversion to videobuf2 userptr support is no longer needed,
>> drop it.
> 
> ...
> 
>>  	dev_dbg(atomisp_dev,
>> -		"%s: pages: 0x%08x (%zu bytes), type: %d, user ptr %p\n",
>> -		__func__, bo->start, bytes, type, userptr);
>> +		"%s: pages: 0x%08x (%zu bytes), type: %d, vmalloc %p\n",
>> +		__func__, bo->start, bytes, type, vmalloc);
> 
> I believe we may drop __func__ here as well.

Fixed in my media-atomisp branch.

Regards,

Hans

