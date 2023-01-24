Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C4F10F9
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674559509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1PHsqg4+jSCeazkAX0hBPJun41mBhpJj7P6tW7D+3E=;
	b=MBNr0bwfZqegEF84jVt6GJYTcK0XjimjTZ4CeUXS3McFPqxpbr7+HIdUaoa8AJLRDK7Iih
	W/9t3t4lfy9BHHMo0cNTAwzee1o6VcZERbQ8Lvt3HafCl7zLguVkI9FR8jUWSyhtIEbmA6
	/GtuK4SB84fpvmUD1Aq5ZKvXo94l9Ic=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-BFmIy95gPAmNbg_Z7hkARQ-1; Tue, 24 Jan 2023 06:25:07 -0500
X-MC-Unique: BFmIy95gPAmNbg_Z7hkARQ-1
Received: by mail-ed1-f71.google.com with SMTP id l17-20020a056402255100b00472d2ff0e59so10474427edb.19
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 03:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1PHsqg4+jSCeazkAX0hBPJun41mBhpJj7P6tW7D+3E=;
        b=t/G+8+yZLdNfOMXCQithvDSqpvlWpYVhFltA7C0kk5I9vAHyKMjBQnkN9HD/523I1z
         DHiWH6RXIPpGYuV0WD0EUNiU9XHdk4q6I0akD7+JdPKhBgE+hiEId9hwRyN1MNDuvMoU
         OE3J8c+5tQWX8ve/m5JlaA1e3exsCZ2oQ4rogGXSil120uU3ZiLg78ra9E4HDNFqjzND
         T5xNeLswNxwpkgPen3k3C3KbmmusTV6/Qu0uj/sQ3G0+e3mxo40EG7iLtYZJYE6s+87y
         L4qN2N3pCiZtC67/VtXxDcaVWeM5PcnN8fMQqBtZoOHoAvW9WcZfK9kqF978Ed2VxXQ4
         LfKQ==
X-Gm-Message-State: AFqh2kqBrOSVj8VSlt91ZsK9PQWD5w7hEWzRWGt+az8Gjv21HMfr38R6
	R14x+Mm2UqieTftevID7km31wljCMwHnacxFwZROIJNyL0Rahh2ZPi3yTXn/EZtjw/rhX0TeUDP
	/xYL9RBeohGM5EAVvqrmouAtytw==
X-Received: by 2002:a05:6402:28c7:b0:47e:f535:e9a0 with SMTP id ef7-20020a05640228c700b0047ef535e9a0mr31843225edb.24.1674559505961;
        Tue, 24 Jan 2023 03:25:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsEFtNuB3c2wqgZpNfJzICpWBfxb1idZ0g6D8jIT2Hw2sPJ9WTJtO+hBa5lpWDccCMJKC9yAQ==
X-Received: by 2002:a05:6402:28c7:b0:47e:f535:e9a0 with SMTP id ef7-20020a05640228c700b0047ef535e9a0mr31843216edb.24.1674559505773;
        Tue, 24 Jan 2023 03:25:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g16-20020aa7c850000000b00494dcc5047asm917861edt.22.2023.01.24.03.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:25:05 -0800 (PST)
Message-ID: <1645ddd5-0f08-fe1f-dfaa-45f3978a7416@redhat.com>
Date: Tue, 24 Jan 2023 12:25:04 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y87QvdlvLLLDhve/@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y87QvdlvLLLDhve/@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/23/23 19:23, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
>> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
>> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
>> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
>>
>> as well as various "atomisp" sensor drivers in drivers/staging, *all*
>> use register access helpers with the following function prototypes:
>>
>> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
>>                     unsigned int len, u32 *val);
>>
>> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
>>                      unsigned int len, u32 val);
>>
>> To read/write registers on Omnivision OVxxxx image sensors wich expect
>> a 16 bit register address in big-endian format and which have 1-3 byte
>> wide registers, in big-endian format (for the higher width registers).
>>
>> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
>> versions of these register access helpers, so that this code duplication
>> can be removed.
> 
> 
> A couple more comments.
> 
> ...
> 
>> +#define ovxxxx_write_reg8(s, r, v)	ovxxxx_write_reg(s, r, 1, v)
>> +#define ovxxxx_write_reg16(s, r, v)	ovxxxx_write_reg(s, r, 2, v)
>> +#define ovxxxx_write_reg24(s, r, v)	ovxxxx_write_reg(s, r, 3, v)
> 
> Btw, we probably can use _Generic() for these...
> 
> ...
> 
>> +static inline int ovxxxx_mod_reg(struct i2c_client *client, u16 reg, u8 mask, u8 val)
> 
> Can we actually s/mod/update/ as it's more regular when we talk about IO
> accessor APIs?

Ack, I'll replace the mod with update.

Regards,

Hans


