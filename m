Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B980B
	for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668981355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70/m7cIp/vsG8qVJ5kAKqw8ft3BEh2reYWs4pFDO8EY=;
	b=WIJZ3/GQ5CiHBVBUtTCAbQkqiy9xIplcNaNkwYpOGlruGd8YyZaijrW53N6DTCvByPStVT
	1424eOSRap5iEqZ90a8iPOFxLfRHeMZg9q6JiP+E4+4BF7XEuOjVFHz1PRHcCeymlEyy4E
	6j2Z38XXN6x2lC0jcy28+iRgwdaJxpo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-YgcmmyYzOiyRj4AVJCClLQ-1; Sun, 20 Nov 2022 16:55:54 -0500
X-MC-Unique: YgcmmyYzOiyRj4AVJCClLQ-1
Received: by mail-ed1-f69.google.com with SMTP id b13-20020a056402350d00b00464175c3f1eso5437301edd.11
        for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 13:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70/m7cIp/vsG8qVJ5kAKqw8ft3BEh2reYWs4pFDO8EY=;
        b=ZpOQm6YZSNdIEifPBU6fqak3oqXusaZHCnLcZOShh6PrdciYtepwIubftZKkx/EdZH
         OnOa15y9TToRw5QR3WuVTmL71T7fQ1S+oU8psarVGY6bKE18BIyYtJicZmDId8BRwsFD
         vQ/jZCNmqTs+RjTEihkbBGysyLeEHiQZ3srvf3O0HrDS9lY8XAVT2tm69jYo5gw+EgIr
         bfHx4H+oYXT/uljL8rLCxK+pLeaVSSFxcjgZq6bvCLXE+C+q7UX3jL9MpGKkaGV4/v/f
         XMfm1+GaQSpkaf5DUlSZDuCxaC4s3JwsX/fj00nu6wFsJojMF41e7yOrsJGFIHG2iL38
         LCUw==
X-Gm-Message-State: ANoB5plF1TLuBLK37X0N9dH3AsTPXphaXYdB7zge3lzSxVi/RYqkVZ/k
	SrKf6dO1JSmWadaPdXGYUqscpQns1vuUVI2KWERFHMaeYYp8P6Mcth/VyzUFqBxe9Lx7Hs7fyYW
	LDUEhVnosZPFC4gB8ZQMXgZFtlQ==
X-Received: by 2002:aa7:d803:0:b0:467:f948:6df4 with SMTP id v3-20020aa7d803000000b00467f9486df4mr13617622edq.217.1668981352979;
        Sun, 20 Nov 2022 13:55:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JLlGdlV7kxjwNxqnupTpkzo5Zy5GbkiSadqyGgrPUHOGYjhNYANm70MTv4LPn4tb8XoGdrw==
X-Received: by 2002:aa7:d803:0:b0:467:f948:6df4 with SMTP id v3-20020aa7d803000000b00467f9486df4mr13617612edq.217.1668981352813;
        Sun, 20 Nov 2022 13:55:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e25-20020a056402105900b004610899742asm4350678edu.13.2022.11.20.13.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 13:55:52 -0800 (PST)
Message-ID: <632a6420-3d61-841a-a18d-01b1ed1eece7@redhat.com>
Date: Sun, 20 Nov 2022 22:55:51 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 04/17] media: atomisp: On streamoff wait for buffers
 owned by the CSS to be given back
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-5-hdegoede@redhat.com>
 <Y3IalSFWZcG0ycjM@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3IalSFWZcG0ycjM@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/14/22 11:38, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:20PM +0200, Hans de Goede wrote:
>> There is no guarantee that when we stop the pipeline all buffers owned
>> by the CSS are cleanly returned to the videobuf queue.
>>
>> This is a problem with videobuf2 which will complain loudly when not
>> all buffers have been returned after the streamoff() queue op has
>> returned.
>>
>> And this also allows moving a WARN() in the continuous mode path.
> 
> ...
> 
>> +	if (ret <= 0)
>> +		return ret ? ret : -ETIME;
> 
> You can use Elvis and ETIME is not correct AFAIU, should be -ETIMEDOUT.

Both fixed in the version which I'm about to push to:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Regards,

Hans

