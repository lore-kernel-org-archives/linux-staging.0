Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052BB2C82
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643195914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srD1l04gPQ84q1XF/RWjCuwwGgitsqKSn4fv06ciBhg=;
	b=jKG7ZkCrvIV2mJY2yIpbkIVX7cz8PcF3JCWy8pQixJyKJ7y+7xBuUNQbWAfjTIeHBVbJaC
	IJbrKiBXEzUFMUZZudRDxMLyKGAWZayHsyTTACd6TbiuYYbHlDY99wKhbnLOdKEJYF7Ijl
	+1u1u0EdXRkvvCoTTAaKcB8BaFo2PhM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-GpddVGRpN--ATnrIWBO1Wg-1; Wed, 26 Jan 2022 06:18:33 -0500
X-MC-Unique: GpddVGRpN--ATnrIWBO1Wg-1
Received: by mail-wr1-f69.google.com with SMTP id c9-20020adfa709000000b001dde29c3202so309738wrd.22
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 03:18:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=srD1l04gPQ84q1XF/RWjCuwwGgitsqKSn4fv06ciBhg=;
        b=I4CAmVWzgu/g/oVaYo6auX6QXXtqVtJile80PBI7DVxotRstQGZzwHPg1chcOMoz+A
         sBvr6NvWlDdZNxKIDg/OtiYFcKRfZ941Xdvnw8NqNM/Pi5yTbYBJR6mdDD/9nGT6Ls7u
         PgLHHwHREKqf/H0FIe30ELmAF7dvT/JtkByXijbPOkE3qexDmA4zbijg/Y+/uMScTU44
         VdIzd6JC0C4xrI3UztzbwdHcVl3z1bs4W/Xjy9GNxq650TANU14jGSIYUrvdDCbPhBDy
         9R04EwQ3LngEMcWRqATgCzmb09ILD6qk5LjNrgtgooKnVARZ+JWOm3q5n+QQSr/zlKa/
         aOfg==
X-Gm-Message-State: AOAM532b8tOWhnMWOeLYnJ83V46J9/J9KLIaLN4FDnocVm+sh7QKQyyV
	EOOOgwV8821ibEkz0/R/7XvrYVqjM3d8IKG2z7vuveZMZPD0wVF6V05U+6xQOMR0jrnGQuHFWLm
	Bi+shFQRc+vkOgkylFb4tUVPkQQ==
X-Received: by 2002:a05:6000:156d:: with SMTP id 13mr1586778wrz.66.1643195912593;
        Wed, 26 Jan 2022 03:18:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvCzW4Jn73KJItw350M3F/f6JTN+7T8OA7kDxsaF2hqvwBivMpTbBXPxCTm3unY1Mql6OAYg==
X-Received: by 2002:a05:6000:156d:: with SMTP id 13mr1586760wrz.66.1643195912374;
        Wed, 26 Jan 2022 03:18:32 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i17sm19005103wru.107.2022.01.26.03.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 03:18:32 -0800 (PST)
Message-ID: <b13c0634-e766-74db-ab1f-672f5d0c04d6@redhat.com>
Date: Wed, 26 Jan 2022 12:18:30 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Helge Deller <deller@gmx.de>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de>
 <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
 <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <3877516e-3db3-f732-b44f-7fe12b175226@gmx.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/22 11:59, Helge Deller wrote:
> On 1/26/22 11:02, Andy Shevchenko wrote:

[snip]

>> P.S. For the record, I will personally NAK any attempts to remove that
>> driver from the kernel. And this is another point why it's better not
>> to be under the staging.
> 
> I agree. Same as for me to NAK the disabling of fbcon's acceleration
> features or even attempting to remove fbdev altogether (unless all
> relevant drivers are ported to DRM).
> 

But that will never happen if we keep moving the goal post.

At some point new fbdev drivers should not be added anymore, otherwise
the number of existing drivers that need conversion will keep growing.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

