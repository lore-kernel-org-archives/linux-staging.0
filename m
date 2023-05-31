Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0E513AE1
	for <linux-staging@lists.linux.dev>; Wed, 31 May 2023 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685532491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIe2VLChaGoGFUcsLp1Fwj2LtG2O4kza/ApvISYYA7o=;
	b=XuFfx/e9JEYMpmXTcVEek09ELWzby3vXGYTxnLzxswnT+09S1HvEEFWJiv+aS9wAoBVaB/
	h1NC6TKXwnhrrPUrAhgjJjhWUP8/LjoP13umxq7iBe0X3QFiqj0PhxmHc6cCsCeeTxP9gY
	HxDz2prxpPy3BKOKzUYCENRXncA6QxI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-FpJFv9lGPhmivFbLcNaebA-1; Wed, 31 May 2023 07:28:10 -0400
X-MC-Unique: FpJFv9lGPhmivFbLcNaebA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-96fffd1ba46so479552366b.0
        for <linux-staging@lists.linux.dev>; Wed, 31 May 2023 04:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685532489; x=1688124489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIe2VLChaGoGFUcsLp1Fwj2LtG2O4kza/ApvISYYA7o=;
        b=kgk66bfH0HL4NUDTPlcfPiVmquDNls7roWzXeHZnX5/QkoxrrTxBZJ59Lw/NL0Y2/W
         tjPiK5D/Z0AOw7s96hr+DgjOO6cycLA9JYYVp8OesnJrJTflkeolAwdu1udViXisykaH
         G4ziIbeX85g4ccW67/zBG2QNGiAgD7jaCKVnsP2GmdFzpurS+6LVR4YbNTaPY5Q+q2lV
         7zH2uzEnWgudcsqaconcSPl58/XBZY4g80nfjRga5U7thumZ5/Jsq0HYq0yTH/pw09l5
         QahgJweP0NQvzyu4ntfIx19+5dcAKe5ZOAGJP6Up7/TonPAa+GnPL9gdoz+ueimgg/h4
         TWsw==
X-Gm-Message-State: AC+VfDzuph9GsVRle212pH9VL3w69Bi2ihFp3R0K7RBhOzK1Ub6XWi1T
	eoi7ypsCgly5ERtb03izDVL3MHXpHZfXG5CDkX9WbpIxDzFwVaCDHztMT5YjYJNdIm7vqSDZdRQ
	FIQDl5VeR7449SfOZb/Qc/vi9DQ==
X-Received: by 2002:a17:907:7e85:b0:951:756d:653c with SMTP id qb5-20020a1709077e8500b00951756d653cmr6275843ejc.39.1685532489311;
        Wed, 31 May 2023 04:28:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6CxuXIiei6Zmk0ioNRqgjUTw9Z/CkUEsW/pkXT+cebu+E8iZe+7ncQyE+mlln4IK3Ktg8h4Q==
X-Received: by 2002:a17:907:7e85:b0:951:756d:653c with SMTP id qb5-20020a1709077e8500b00951756d653cmr6275829ejc.39.1685532489076;
        Wed, 31 May 2023 04:28:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090666c900b0097073f1ed84sm8848345ejp.4.2023.05.31.04.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 04:28:08 -0700 (PDT)
Message-ID: <624d3c7c-b15c-4346-bf40-3d6ef0816b6a@redhat.com>
Date: Wed, 31 May 2023 13:28:07 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 14/21] media: atomisp: Refactor atomisp_try_fmt() /
 atomisp_set_fmt()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230529103741.11904-1-hdegoede@redhat.com>
 <20230529103741.11904-15-hdegoede@redhat.com>
 <CAHp75VeCfTjw_Lu5SUx6u-O7QtFe2QXvCy2wZLSajJi6WDFiwQ@mail.gmail.com>
 <CAHp75VdsCQ3g+OtfUdUgQ-3eor66Y=6Qpg5S=bn923Zt+B46XQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdsCQ3g+OtfUdUgQ-3eor66Y=6Qpg5S=bn923Zt+B46XQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/30/23 13:58, Andy Shevchenko wrote:
> On Tue, May 30, 2023 at 12:05 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> A couple of additional comments (based on the branch contents).
> 
> ...
> 
>>> 2. atomisp_set_fmt() starts with basically an atomisp_try_fmt() call,
>>>    except that the only atomisp_try_fmt() caller: atomisp_try_fmt_cap()
>>>    adds the sensor padding itself rather then letting atomisp_try_fmt()
> 
> than
> 
>>>    do this (duplication).
> 
> ...
> 
>>   bytes = DIV_ROUND_UP(br_fmt->depth * width, BITS_PER_BYTE);
> 
> It's actually NIH BITS_TO_BYTES() from bitops.h.

Thank you, both are fixed in my media-atomisp branch now.

Regards,

Hans


