Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A07F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662911690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2XTgMaSHBU/lmRwABmwxshdNhhl1P9NPVCYW5gm0oZg=;
	b=R+O4EjWDkxja2QWfROlxq6bB/LYH9xa0BVczHQJYE37QX9vwUid6OB3hTWDCcOASwY6FRh
	pzMVSYG3g0rpomRBfYl3zB8tWmuX6an6zXt17hIJMqDuCMEkunMUC6KWksktjSA4kzAVzA
	xkSDuQkBU1zxuDk+askB0AQ/9X44lUM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-D8yj3gnVMver3cpyyCg7gw-1; Sun, 11 Sep 2022 11:54:49 -0400
X-MC-Unique: D8yj3gnVMver3cpyyCg7gw-1
Received: by mail-ed1-f72.google.com with SMTP id y1-20020a056402358100b00451b144e23eso791810edc.18
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 08:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2XTgMaSHBU/lmRwABmwxshdNhhl1P9NPVCYW5gm0oZg=;
        b=SWExICUuWvHpaXdp+55qFQ8a4ST8SHqaHGxN6q1F3TUiQGFFhHvs4ir7ELFvO034qm
         vCEN/tOLbU0g1t7eCyDaWxcKuzGqZurvyGcd679Nt2702h/BdkuXOjwoiVL6foZn6Mqf
         x1KJaS9WZ7DWoZeDRRqQNOLn7/d/16r3nNLnFKGIXJBpCrevvcqZ4xyLF/UydgOGmPuU
         aIyjZheI35pcLgm8NWpN59TjbWot6tzjJ7hTh8RZk+R3qdAt/K2wmHPIzYYzVAkRNw0X
         +nebYNEbe3A/3JSxnwQY5tBLu60Blxf4flprstwtB9DXbd9KcpM9FTMRHnK10rQoUYmA
         OtOQ==
X-Gm-Message-State: ACgBeo0+OdU93dG/lQqWBDeu+pFc9ZQ6KUroPYxhFgG/ooaWGiAk0VcS
	TaIQ8yDWF0ZkPLqB2y+zoJ6oWOgeg1gEjOhfEJF7TbYpVhAZSda6Wt6czlQfcntOksEzhYfl+GE
	Xyxnl6+nf86KSQY25/RN5Bex1Vg==
X-Received: by 2002:aa7:c052:0:b0:44f:147:521b with SMTP id k18-20020aa7c052000000b0044f0147521bmr19166497edo.53.1662911688262;
        Sun, 11 Sep 2022 08:54:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4RkXwfrlMn01ttEdUdKeNdDXoLBf1pLBjFJ/Wkt4v5Cg5PYqYfkL8NqnX98hhv1aLB5ZOkxg==
X-Received: by 2002:aa7:c052:0:b0:44f:147:521b with SMTP id k18-20020aa7c052000000b0044f0147521bmr19166488edo.53.1662911688068;
        Sun, 11 Sep 2022 08:54:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ly9-20020a170906af4900b0073dde62713asm3154724ejb.89.2022.09.11.08.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 08:54:47 -0700 (PDT)
Message-ID: <85bb630f-2163-9e99-1089-8050fac57a3f@redhat.com>
Date: Sun, 11 Sep 2022 17:54:46 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v1 1/1] media: atomisp_gmin_platform: Unexport and split
 camera_sensor_csi()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220730162027.1011-1-andriy.shevchenko@linux.intel.com>
 <Yud2cwiCCnq4x50L@paasikivi.fi.intel.com>
 <YxYWBSo+fceHCAOd@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YxYWBSo+fceHCAOd@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/5/22 17:30, Andy Shevchenko wrote:
> +Cc: Hans
> 
> On Mon, Aug 01, 2022 at 06:45:07AM +0000, Sakari Ailus wrote:
>> On Sat, Jul 30, 2022 at 07:20:27PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
>> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Thanks!
> 
> Hans, maybe you want to include this one into your bunch?

Ack, I've added this to my next batch of atomisp cleanup
patches which I'm sending out right after this email.

Regards,

Hans

