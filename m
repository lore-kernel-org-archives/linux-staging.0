Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3060F6ABA
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 13:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678282003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oKRxau3irol8jvjjSkixUGo9Iw+/UAjaIS/mBoMB6Uc=;
	b=TIPQt/QNsGDfRSOJWYscObzfOMdxhbdNJsoFaPufbdnoaB8i/v/lKqH5sWThE9Zh5vCdLs
	6qMMj1cFb1HI11W3nKeQY0x51ZL/dTSamF8SjslTOWR7FA0Sx/GcxnUHjmH9uZ8yz950qj
	3W7O+FcSdYo1qzkX7cRy993IvBzyR8g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-21rBtZ4zM0eDq0Mxs0CwPg-1; Wed, 08 Mar 2023 08:26:41 -0500
X-MC-Unique: 21rBtZ4zM0eDq0Mxs0CwPg-1
Received: by mail-ed1-f71.google.com with SMTP id dn8-20020a05640222e800b004bd35dd76a9so24045206edb.13
        for <linux-staging@lists.linux.dev>; Wed, 08 Mar 2023 05:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678282001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oKRxau3irol8jvjjSkixUGo9Iw+/UAjaIS/mBoMB6Uc=;
        b=MITQIsK/k+tnesiyFZLtNZ1OsLbxRHNwaOP77IRvQYmIbLlW+MJJ+QcOk2idfMWCUE
         9j6m3Kf65PWlF1XNm+rHtWa822Ur02dx9e+0MKYHBj0Jy11wwxHjp6WiSzxeHbIyaeQ4
         KHb/hKfeQkqP1cVFMImgHKq27cQ8IrJIP2X1i4fR+v7Q9pNNy3AvFolEbM+NUZLqdimK
         FFpoaGV7DKmjvUgQVhn9TN+fbyYPwTmsJ+3038CW4PYK3x6Bno2UGfPsqA8uJOmqDiIf
         qIzHMlVOGjYDZOixIfRscbqxwMKp+2LWyThIlegSuNfsEc+RBnFb6XKK0jHk2LJhWLEA
         gkhw==
X-Gm-Message-State: AO0yUKV0djS9Nj5hR4CsVQ947r67y2I6Qjo3EvBEUzsNVLUHPwuOWQ+7
	Jz7icaQIlswdwPfvtOqkaWLlmIQWxuUKJ/pj0bAQRsmRCEaWCzDnqo6Pn0mVLGNYmpMEWNWYZcP
	d6HQnmEh3hTawO9+bckHSqNXjiQ==
X-Received: by 2002:a05:6402:2037:b0:4c0:821a:40da with SMTP id ay23-20020a056402203700b004c0821a40damr19099347edb.34.1678282000916;
        Wed, 08 Mar 2023 05:26:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9NHgSrN2m6Mo2d+vjEBdpCn2la3XrnQjGOgJZhp1hgejDPNH9Eb3ztNvvBE57RyAAI1gIiUg==
X-Received: by 2002:a05:6402:2037:b0:4c0:821a:40da with SMTP id ay23-20020a056402203700b004c0821a40damr19099330edb.34.1678282000617;
        Wed, 08 Mar 2023 05:26:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l3-20020a1709067d4300b008e54ac90de1sm7448825ejp.74.2023.03.08.05.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 05:26:40 -0800 (PST)
Message-ID: <92a9442a-cece-4179-fbdc-3c9188da073e@redhat.com>
Date: Wed, 8 Mar 2023 14:26:39 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] staging: r8188eu: delete driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 Martin Kaiser <martin@kaiser.cx>, Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, Pavel Skripkin <paskripkin@gmail.com>
References: <20230308131934.380395-1-gregkh@linuxfoundation.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230308131934.380395-1-gregkh@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

> Now that the same hardware that the r8188eu driver supported is
> supported by the real wireless driver rtl8xxxu, the r8188eu driver can
> be deleted.
>
> Also the rtl8xxxu driver supports way more devices, and is a fraction of
> the overall size, making this a much better overall solution.
>
> Thanks to the r8188eu developers and maintainers and reviewers over the
> years, your work allowed Linux users to use their hardware before the
> real driver was implemented properly.
>
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Cc: Martin Kaiser <martin@kaiser.cx>
> Cc: Larry Finger <Larry.Finger@lwfinger.net>
> Cc: Phillip Potter <phil@philpotter.co.uk>
> Cc: Pavel Skripkin <paskripkin@gmail.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thank you for doing this, I agree that this is the best solution
moving forward:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

