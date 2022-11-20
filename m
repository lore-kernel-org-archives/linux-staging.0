Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123B3D99
	for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 21:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668981547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwBWsFKvrbqfiKa4gmMjzhOepWlGG2NUw03g19n66y4=;
	b=cX02+GFZIYB22E3wjIAGrfVyTCW7tq88ssbgXpYSTLJZoNKr/4Fev4sQ8h4kzMjS8KLtzV
	5wRfOcxBWbkk/6gzCC9I1w4s9WrO5ccFzYumcbshafofsAE0YCM5jricKr/0cQC/WpkCpl
	1h9TR5QhUF8vclteK1N3TmqMxizjwEc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-sQ-Wnu8cNAeVbuaq6nTskQ-1; Sun, 20 Nov 2022 16:59:06 -0500
X-MC-Unique: sQ-Wnu8cNAeVbuaq6nTskQ-1
Received: by mail-ed1-f69.google.com with SMTP id m7-20020a056402430700b0045daff6ee5dso5539384edc.10
        for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 13:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwBWsFKvrbqfiKa4gmMjzhOepWlGG2NUw03g19n66y4=;
        b=h94aJB1FpTP8d6R7OF/iCS/2orUz9RDNob3Hp3oe16isXqvkpPe35jkLvk0vpxMe3H
         3dJjeRT3jd5YZ4apxjW956p81aLE7hyA84c6Ob5PgJNEYCc9OQKBleAlM4BJV9CeynuR
         0xGbXjKU+04R3pwCt3pUGeVPeOgpXBZg33fhpPloNO3HwyqS/pvyWjxeBsHfMJu14icg
         f/Z1OsIDq9460AESOu0zk50JGwxl93jm9htQTY57KV2V02P3j+fbm5LNINpE/kSHdYQd
         rIl+A7R1k4V01n72wdM7NeyS5ylSh06JP8CcuNPoID1k472c1Dfo3DfedCOSWzzu92ye
         MMtQ==
X-Gm-Message-State: ANoB5pnKa5muDnmxWSIlkxW94/tW2jPXkSJ/VeLeDVNEuKUlE66M//ck
	RIRxtAVmhyvN3xtiNjv5y0MM5+ujawRxooA4FLIkcv1qSaxmtGwJfwt13fbb8htJCb+Gnu+JQ68
	MhJ0wrlDLx/ifU43G5XH5X7/jwg==
X-Received: by 2002:aa7:d844:0:b0:458:fa8f:f82c with SMTP id f4-20020aa7d844000000b00458fa8ff82cmr13659067eds.246.1668981545050;
        Sun, 20 Nov 2022 13:59:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Gar3N8Hyi6mwsbDm9bH0P/hxbZ1qv+flxwNDdbKITcrrtrpHCiR2vaR4vmS4fscJtW9bFwQ==
X-Received: by 2002:aa7:d844:0:b0:458:fa8f:f82c with SMTP id f4-20020aa7d844000000b00458fa8ff82cmr13659063eds.246.1668981544898;
        Sun, 20 Nov 2022 13:59:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id er21-20020a056402449500b00451319a43dasm4377085edb.2.2022.11.20.13.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 13:59:04 -0800 (PST)
Message-ID: <8a32c643-491c-d039-6fd2-7c86d41144b3@redhat.com>
Date: Sun, 20 Nov 2022 22:59:03 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 06/17] media: atomisp: Also track buffers in a list
 when submitted to the ISP
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-7-hdegoede@redhat.com>
 <Y3IsUUUjonfNclcb@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3IsUUUjonfNclcb@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/14/22 12:53, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:22PM +0200, Hans de Goede wrote:
>> Instead of using an integer to keep count of how many buffers have
>> been handed over to the ISP (buffers_in_css) move buffers handed
>> over to the ISP to a new buffers_in_css list_head so that we can
>> easily loop over them.
>>
>> This removes the need for atomisp_flush_video_pipe() to loop over
>> all buffers and then (ab)use the state to figure out if they
>> were handed over to the ISP.
>>
>> Since the buffers are now always on a list when owned by the driver
>> this also allows the buffer_done path on flush vs normal completion
>> to be unified (both now need a list_del()) and this common code can
>> now be factored out into a new atomisp_buffer_done() helper.
>>
>> This is a preparation patch for moving the driver over to
>> the videobuf2 framework.
> 
> ...
> 
>> +int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe)
>>  {
>>  	unsigned long irqflags;
>> +	struct list_head *pos;
>> +	int buffers_in_css = 0;
>>  
>> +	spin_lock_irqsave(&pipe->irq_lock, irqflags);
>>  
>> +	list_for_each(pos, &pipe->buffers_in_css)
>> +		buffers_in_css++;
>> +
>> +	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
>> +
>> +	return buffers_in_css;
>> +}
> 
> Looking at this I come up with the
> https://lore.kernel.org/r/20221114112842.38565-1-andriy.shevchenko@linux.intel.com
> 
> But I think your stuff will be earlier in upstream, so feel free to create
> a followup later on.

That is super useful, thanks. But as you mention it is probably best to
just conver the code here to this alter. I've added this to my atomisp
TODO list.


> 
> ...
> 
>> +		vb = list_first_entry_or_null(&pipe->activeq, struct videobuf_buffer, queue);
>> +		if (vb) {
> 
> Wouldn't simply list_empty() work here? (Yes, you would need to have else
> branch under spin lock, but codewise seems better to me).

The problem with that is that the else branch does a "return -EINVAL;"
so then I would need a separate spin_unlock_irqrestore() for the else
branch and I really dislike not having my locks / unlocks cleanly
balanced 1:1.

Regards,

Hans



> 
>> +			list_move_tail(&vb->queue, &pipe->buffers_in_css);
>> +			vb->state = VIDEOBUF_ACTIVE;
>>  		}
> 
>>  		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
>>  
>> +		if (!vb)
>> +			return -EINVAL;
> 
> 

