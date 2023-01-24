Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A3663BF
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674567465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ja1Boq6JcSFXCMZhXgFdCI/xjNx9lt77gCIPTTWiLqY=;
	b=ftF7kB8AZfFg65puNqmub8G00X/eArgkSvLEd2rSD68f0nVn+IImfUVCKA/oDNE69FngG5
	c/fYaXBZg12L0wzgCANboYuyTVj00H+q1fLn8Zo0E4KV39jkfY6UT3On3X4OG20spJ+raP
	Ghv72qEnYi3odmGRdfQKLpLdgy4TmFs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-U0HyRZa1PyGAb8wdVTgYBg-1; Tue, 24 Jan 2023 08:35:49 -0500
X-MC-Unique: U0HyRZa1PyGAb8wdVTgYBg-1
Received: by mail-ed1-f70.google.com with SMTP id m12-20020a056402430c00b0049e4ac58509so10719955edc.16
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 05:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ja1Boq6JcSFXCMZhXgFdCI/xjNx9lt77gCIPTTWiLqY=;
        b=G9cJYQobjZIGYYy8UA0T+LJ1YRU/9Bp+uzMUsHLIvCAP25VQaok2GAdRQgGyqohuDB
         jd7lWaGS+A88Alyezhnbw32GdRco6ZTnzNsjKHmSGcWPbe1J7V7JXHyJghJbCGx/7vXJ
         Gl9PB3rdfNhSm6pdq+IQspvGtoV8ai7hToAC4h9rH0JHHwWhb757txC5KkUshnmRzbzM
         4nP1896+pkNXYZkHVvb3im+PQEPQlb29Qlv/EhRcqTmSeatCfKLvjs28f8oGgX1jwXzX
         bmOwdq8QqfoXgLoFTsQR6F1nxg9wjc3baG/PWbRpDXmsGFj31qhJysGyCshIE6HGsKcd
         310w==
X-Gm-Message-State: AFqh2ko8GrbMBKUZqIRpEviiWd6lJj+O7Effma0kG/Sgnmqbcy3OWgGQ
	yPn2OE57LrFSXcidpNGUtlYM0s+8dobLvzhucy+hPfokl82smgIfPzSeReJ2pqUEKltL1A+Zp9g
	blZxuoLusuoBtwGgJwK2YFIdLOw==
X-Received: by 2002:a17:907:62a8:b0:86a:d385:81df with SMTP id nd40-20020a17090762a800b0086ad38581dfmr41535512ejc.3.1674567329582;
        Tue, 24 Jan 2023 05:35:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt//+kuObY87nZxu3COedx8quy/73VjZYsYfGZKXBUbXcz+uJPJh4p54v4VFtWUDLdyM+d6xg==
X-Received: by 2002:a17:907:62a8:b0:86a:d385:81df with SMTP id nd40-20020a17090762a800b0086ad38581dfmr41535502ejc.3.1674567329376;
        Tue, 24 Jan 2023 05:35:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rn3-20020a170906d92300b00877a9d2e5e1sm915695ejb.79.2023.01.24.05.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 05:35:28 -0800 (PST)
Message-ID: <af5eed6c-7913-cd52-4d87-ce3029137f07@redhat.com>
Date: Tue, 24 Jan 2023 14:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 46/57] media: atomisp: ov2680: Delay power-on till
 streaming is started
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-47-hdegoede@redhat.com>
 <Y8+4SZzMpgI1yNaU@smile.fi.intel.com>
 <1bd8ac47-03f8-245b-7708-defd150eff00@redhat.com>
 <Y8/UeKTin7fyUrLl@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y8/UeKTin7fyUrLl@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/24/23 13:52, Andy Shevchenko wrote:
> On Tue, Jan 24, 2023 at 12:31:14PM +0100, Hans de Goede wrote:
>> On 1/24/23 11:51, Andy Shevchenko wrote:
>>> On Mon, Jan 23, 2023 at 01:51:54PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>> +	if (sensor->is_streaming == enable) {
>>>> +		dev_warn(&client->dev, "stream already %sed\n", enable ? "start" : "stopp");
>>>
>>> stopP ?!
>>
>> Yes the format string is "%sed" so "stopp" gives us "stopped".
> 
> Can we, please, use full words, so it will be easier to find a candidate for
> including into string_choices.h or so?

Sure I'll update this before adding it to the PR.

Regards,

Hans

