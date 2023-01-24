Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A010110F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 11:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674558564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYWcGPAz6QIYZJJbGq0zOHIyyGv/CshPeC5FZEnQikw=;
	b=E1Dky/haZxpiiH0lmpmej72jZARxtQ5RYy8gsoImQChxjCofZYYCAnUITm5aNGOtcQ3csR
	m/6S7uOrd5DUKPGxf88tnPLASLLt2l6yulk641HwBjKasUNhxkEtpGWJSy8h2giYKaOcjZ
	dN+YEpMPA301SXxROxU8X2uuebCDEsE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-HKtWNhwjOXuy0Q6ak9Xe7A-1; Tue, 24 Jan 2023 06:09:23 -0500
X-MC-Unique: HKtWNhwjOXuy0Q6ak9Xe7A-1
Received: by mail-ej1-f69.google.com with SMTP id hc30-20020a170907169e00b0086d90ee8b17so9707776ejc.10
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 03:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYWcGPAz6QIYZJJbGq0zOHIyyGv/CshPeC5FZEnQikw=;
        b=Mc1rhnt6MGzGdac9pXRm1D5SugwRgKLaxhRmHCy8xGyQEDJPefyMc/bucv/iLrvGeF
         8lRUckIDJ/hUlemHrKY+HIZJwm3iq/KXqsXG3YXSy9jTbKhQ6nLyN9aBHM5sKAibrX1D
         t0METZI7PMnrGnvEwKOJqKyB3tsiClHox1o3W/dT/EbNxHtaO9ov482Zzn5vRHR1wXlE
         LY+0yMSMfzB/r93BDJO+IEaPPcM2proF1dKIKo77o62belwIPIsp8kiKVO2c6mDxXdBG
         dmcvFdQIJfE/XzRY7aNWvjpcdK/pCYDssiAZhKRzodI8ghfQpqqM+w9CqK7PI6js+ZRe
         M64Q==
X-Gm-Message-State: AFqh2kqfM3o59TPetKqWUF7TczP6RPsGXscQfQ0yFhJh4UymcE1mdNl5
	40k1yyu/Ptahk8F0JI/Pbk1S3kkSLclB0gc0qWFRkhp0C6KZqTYbE3z3A+/U0S8m/DIeQ0swgD6
	bjN/SzKyTGPIWLN5pu/FXR9xvmQ==
X-Received: by 2002:a17:906:4a8f:b0:84d:3403:f4f4 with SMTP id x15-20020a1709064a8f00b0084d3403f4f4mr29129983eju.64.1674558562110;
        Tue, 24 Jan 2023 03:09:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsFHNXVUfRaQzLzoCDaiVwwwHwen6bSo1ycB5sNIugxNbIRoF3kIXwYBVq4ttVjp3ACbTm2SQ==
X-Received: by 2002:a17:906:4a8f:b0:84d:3403:f4f4 with SMTP id x15-20020a1709064a8f00b0084d3403f4f4mr29129967eju.64.1674558561910;
        Tue, 24 Jan 2023 03:09:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gv41-20020a1709072be900b0080345493023sm735155ejc.167.2023.01.24.03.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:09:21 -0800 (PST)
Message-ID: <d8cd94a8-88a5-d169-636d-a5bfb8776869@redhat.com>
Date: Tue, 24 Jan 2023 12:09:20 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 14/57] media: atomisp: Check buffer index is in range
 inside atomisp_qbuf_wrapper()
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-15-hdegoede@redhat.com>
 <Y86b86l5Bi1mb7oj@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y86b86l5Bi1mb7oj@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/23/23 15:38, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:22PM +0100, Hans de Goede wrote:
>> Check buffer index is in range inside atomisp_qbuf_wrapper() before
>> using it do index pipe->frame_request_config_id[].
> 
> ...
> 
>>  	/* FIXME this abuse of buf->reserved2 comes from the original atomisp buffer handling */
> 
> Does the comment belong to this check?

Yes and no, the whole reason we need a wrapper at all is because
of the reserved2 abuse; and likewise the index check is also only
necessary because of the code below using index. If it was not
for that, then we could simply rely on the identical index check in 
vb2_ioctl_qbuf() itself.

Before sending this to Mauro I'll amend this to replace this comment
with a comment above the entire wrapper function explaining that
the entire wrapper should eventually be removed.

Regards,

Hans



> 
>> +	if (buf->index >= vdev->queue->num_buffers)
>> +		return -EINVAL;
>> +
>>  	if (!atomisp_is_vf_pipe(pipe) &&
>>  	    (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING)) {
>>  		/* this buffer will have a per-frame parameter */
> 

