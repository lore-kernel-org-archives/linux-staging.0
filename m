Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8060D2C81
	for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 18:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637260816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vru2W1BeVpnwxOEZvAFt7zBwoQOzWpReS0Uqf8DJZdg=;
	b=SoV05SnhFpTHjrQ7NWLAlfVk85sEoOTbJew/5jO4VsMYipir5A6GHFh0VnGF52qo2xAh3L
	jAtRXXzlLO1qKhOb5GrhMvQzROA1ZQ8i8G2QGx/fHkchQPFzeaEg9nlgsJWjr42wjj6f5S
	CzwL9zYi6bjvNQE8wyUsKUcJA4nZz4Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-ZteigUzwN4qX5VCeJA7NgQ-1; Thu, 18 Nov 2021 13:40:15 -0500
X-MC-Unique: ZteigUzwN4qX5VCeJA7NgQ-1
Received: by mail-ed1-f69.google.com with SMTP id c1-20020aa7c741000000b003e7bf1da4bcso6071505eds.21
        for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 10:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vru2W1BeVpnwxOEZvAFt7zBwoQOzWpReS0Uqf8DJZdg=;
        b=mTNV+1z/nM5bHVuhlehHjBxQ8mLp4FF+1fk6g5e0v+fxremzzUj/tIqC3TxJD6REEm
         qOAmwHe1tobW2pN6lMF7pWBGbahg0jG6faVnjGW+UbxO2On7O+9V9g+nxgfkpDdoixdu
         v15qRpVTARULD55Y3tDLqwdwf97RVuDdmmgpwmKg5ZxavDU5RPHzdZYppNphKota7EOR
         zbDfKkUvZ3T3Lia2CeqKKcF2saN3dSaCDW6Sic5vXnqZTsMnuJ0rlv/s0vMNgL5GHNxS
         Lz4guBKeFdJKY8jDwPKlGEwvRXO93DoCT0KUJcEafKr1y72Bf+hG87X1Tlh4lTRshiqu
         KtyA==
X-Gm-Message-State: AOAM533f8K9aK5K+0CLv+slLBnfqMUl9GG5QtTVjiyMEOZf49KCDGhVE
	5VLHUO+qjaA9lImRxxS/jHqVcErODtlJeOwDq6pWQuiVG25ssWJfzkH0L1r58tF3Zbw1QzkbqsC
	Wk3sdFtntGGRg9Jrqdna20zMakw==
X-Received: by 2002:a05:6402:354e:: with SMTP id f14mr14101483edd.245.1637260813943;
        Thu, 18 Nov 2021 10:40:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSVDlRWa6fp3A4EfHiAXVYnY82/YpRv+CLMpIQWhz2fRWiIjbGbuaFa0BBwfvzv4UUj7EfLg==
X-Received: by 2002:a05:6402:354e:: with SMTP id f14mr14101446edd.245.1637260813743;
        Thu, 18 Nov 2021 10:40:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b11sm385014edz.50.2021.11.18.10.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:40:13 -0800 (PST)
Message-ID: <976c645e-42ec-d29c-5a50-446d4be908a4@redhat.com>
Date: Thu, 18 Nov 2021 19:40:12 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [libcamera-devel] [RFC] media: Auto exposure/gain support for
 atomisp / libcamera integration ?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, andrey.i.trufanov@gmail.com,
 linux-staging@lists.linux.dev, Fabio Aiuto <fabioaiuto83@gmail.com>,
 libcamera-devel@lists.libcamera.org, Nable <nable.maininbox@googlemail.com>,
 Yury Luneff <yury.lunev@gmail.com>, Andy Shevchenko <andy@infradead.org>,
 linux-media@vger.kernel.org
References: <20211107175013.355188-1-hdegoede@redhat.com>
 <a13e1ed6-3050-3adf-fa6d-8506da66d9fa@ideasonboard.com>
 <YZYv+owv3agp/lOD@pendragon.ideasonboard.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YZYv+owv3agp/lOD@pendragon.ideasonboard.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/18/21 11:50, Laurent Pinchart wrote:
> Hi Umang,
> 
> On Thu, Nov 18, 2021 at 03:43:53PM +0530, Umang Jain wrote:
>> On 11/7/21 11:20 PM, Hans de Goede wrote:
>>> Hi All,
>>>
>>> Now that we have the atomisp2 driver running on some devices like
>>> the Asus T101HA; and with the exposure + gain controls for the ov2680
>>> sensor found on that laptop fixed:
>>>
>>> https://lore.kernel.org/linux-media/20211107171549.267583-1-hdegoede@redhat.com/
>>>
>>> I believe we need to start thinking about various userspace API
>>> concerns. Thanks to Mauro's great work on various V4L2 API things
>>> are starting to work (somewhat) with regular V4L2 apps, but we really
>>> also need some processing / 3A stuff to make the cameras really
>>> usable.
>>>
>>> The most important thing needed is automatic exposure + gain control,
>>> ATM this relies on a custom ATOMISP ioctl, but I believe that we can
>>> just export the controls as regular v4l2 controls on the sensor subdev,
>>> at least for the ov2680 the exposure is already exported this way
>>> but it is read-only. Does anyone see any problems with just making
>>> these normal v4l2 controls on the sensor subdev ?
>>>
>>> We can then simulate the custom ATOMISP ioctl through the subdevs,
>>> or we can just remove it alltogether.
>>>
>>> Once we have the controls available this way I think we should write
>>> a libcamera plugin, which like the older versions of the Rasberry Pi
>>> plugin (if I've understood things correctly) won't use the MC framework
>>> for now. I believe we first need to understand the atomisp code better
>>> before we add MC support (*). But I still believe that an (experimental)
>>> plugin would be good, both to get something usable so that we can get
>>> more testers / more people interested in contributing.
>>
>> I am trying to understand what 'plugin' here means? Is it a wrapper 
>> pertaining to use libcamera (fined tuned for atomisp) that apps can use?
> 
> I think it means pipeline handler (and IPA module).

Right, I'm still getting used to the libcamera naming of things :)

Regards,

Hans

