Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914C54428
	for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 22:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668983058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsuiREUBAtxZhsYAijrEDfxF5vu/EWlEJis9HV/mqf4=;
	b=NxNRtqt6GfozECV1YFfvDulpIJ9eKr8ZHtq6qXQc26jnfonojOonNRtPxGy5VGp36DfkiI
	ZGdsdRPmKdtC8pHU94432OWhiy3z8SsyPdISpM9CWpcuRo/XbSebjfp3jcdIp+/3bPcO1E
	uykneuoUWbZZmEA4mw8fNZVSN2l0P/w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-75-OsothWh8MjyZe3NBIqW8rA-1; Sun, 20 Nov 2022 17:24:17 -0500
X-MC-Unique: OsothWh8MjyZe3NBIqW8rA-1
Received: by mail-ed1-f69.google.com with SMTP id g14-20020a056402090e00b0046790cd9082so5571351edz.21
        for <linux-staging@lists.linux.dev>; Sun, 20 Nov 2022 14:24:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsuiREUBAtxZhsYAijrEDfxF5vu/EWlEJis9HV/mqf4=;
        b=QnyVrbhoebl8Ey76tjt2Mv64FJekkUq0SBiRUyATDsvnOZU0mrT3JVw+9N+NADU7Xe
         +PPiX1YtB8+p6mZ3mpc0xdacy4rO+tySqvikPzqmXsw8ybe0WSP7bbwntHqITEIXIQcm
         0WXhFDGwlSpAt7BoNQ1+Wt9SBYOT84lZ9Mm3yAA0vIW0W3AZiypZdO8ABDzKFyFsmHco
         7zBYRUSXZoB7cs9+K1phzJXvHeJUBxsCprpYq2XpcM0bYS+RINEkdVvXlGTtUWEO7PWC
         z9AfBIJysUx3dyzIVf63vTR1T13dhBU0NGtU/SW6/g1UsbARzeND82BEU0vUdxQLVOM3
         LibA==
X-Gm-Message-State: ANoB5pl1SU8JZri5ca3bXMLXsNuSaMpc1UH31KU33mdGkXMvl1y/cvck
	VYDJSlOLAsgyvEZEtcM5MaaZTijC5YIgP7i0w77nLYq3Ly6aaqaUvW0YcyXwyBi8RoH3cPHctd+
	ktOqIaiBU/pecSvyxOUw8yRBbLA==
X-Received: by 2002:a05:6402:3644:b0:45f:c7f2:297d with SMTP id em4-20020a056402364400b0045fc7f2297dmr14043255edb.266.1668983056088;
        Sun, 20 Nov 2022 14:24:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6gGU+K9fqnOHZgwjB7Fkmw6we7sYQdwFIh5U7HS34ZoDGuDcYvgQyK9vVwWpOPUO3wt0af7A==
X-Received: by 2002:a05:6402:3644:b0:45f:c7f2:297d with SMTP id em4-20020a056402364400b0045fc7f2297dmr14043247edb.266.1668983055947;
        Sun, 20 Nov 2022 14:24:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id jg20-20020a170907971400b007a9c3831409sm4369113ejc.137.2022.11.20.14.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 14:24:15 -0800 (PST)
Message-ID: <754a31cf-491c-0bfb-1041-9aae93e3e3eb@redhat.com>
Date: Sun, 20 Nov 2022 23:24:14 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 17/17] media: atomisp: gc0310: Power on sensor from
 set_fmt() callback
To: Andy Shevchenko <andy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-18-hdegoede@redhat.com>
 <Y3Iyh4Fqd81sFxlS@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3Iyh4Fqd81sFxlS@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/14/22 13:20, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:33PM +0200, Hans de Goede wrote:
>> Depending on which order userspace makes various v4l2 calls, the sensor
>> might still be powered down when set_fmt is called.
>>
>> What should really happen here is delay the writing of the mode-related
>> registers till streaming is started, but for now use the same quick fix
>> as the atomisp_ov2680 code and call power_up() from set_fmt() in
>> combination with keeping track of the power-state to avoid doing the
>> power-up sequence twice.
> 
> ...
> 
>> +	/* s_power has not been called yet for std v4l2 clients (camorama) */
>> +	power_up(sd);
> 
> if camorama is fixed, will this become a problem?

This is not a camorama issue but an issue with the atomisp2 + sensor driver
combination. camorama uses a slightly different order in which various
v4l2 ioctls are done so it needs the power_up() here. Note that power_up()
checks + sets a flag so that if it gets called multiple times it only does
the actual power-up once.

Regards,

Hans


