Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1467C
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684502392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zSSykxU8qNPTT0DvW/IVIYDeZCbmXVxYSFgPp4geLgs=;
	b=Lq7UC+gw4zLPrn6k/UuFxSfsyNERXfZ8wPlMXvrM+pcVyc2vFRINeIOMRRe6VcJBHghwoR
	Y/5UsSfiFso1BePQGQ3tlqGgLBFOEFjRZ1aO67IfLPpE/c8qZjA5+dqfdKQq0UsjOVjqBc
	v5z1dOTl9Xcc72T1YkCzpAy4GK6a8m8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-XmI0J4_2NyeYTIZJe2QsHg-1; Fri, 19 May 2023 09:19:51 -0400
X-MC-Unique: XmI0J4_2NyeYTIZJe2QsHg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50de84a3861so3321151a12.3
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 06:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684502390; x=1687094390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSSykxU8qNPTT0DvW/IVIYDeZCbmXVxYSFgPp4geLgs=;
        b=DKdKcwPol9Qr4E12puVZvZehxIH0RMu1G9uAjYiDHuuqeBAgXFO9e8TVDQiqKbc58Y
         OKXbZ0fK968FHpYWYJTZ+K24EKWh3/BbG1pE07zyaVz7ozgaT9fGDNlXkb014+UsLGuM
         zO77O2mNBWC4GloLE3SiPSGuGtRdg/6sHJJGJM88cnZfAY4H1c8Qn7rCY8yvPZunndUP
         txad+YhMCgSKNDxzisQXhT0lyfrtLFfmh6gsVgHikDw/0czDgpDdXac03loDUq6/ZYBQ
         R53xD59FLg9YACGFxmOYuL9jceqQBBwlqbRYN8AQ9DGy9SX07pAMbkerwAZJzsdKqqiR
         dc5g==
X-Gm-Message-State: AC+VfDzSiUKQAuHgwNpsXaTTB3d9LBiyjzIkGZnorZG/oknBeTzgWBKh
	30GvyyJjR7OZtwzO3MgaBId82Ebyaxf9vDyeKs7l55Wdum5dpPwZmos6PASnWDK5UhdIRwVbq3K
	5peIfnkLknMamEtRqj+/q9guWgw==
X-Received: by 2002:a17:907:9443:b0:96a:e7cc:b8b1 with SMTP id dl3-20020a170907944300b0096ae7ccb8b1mr1674595ejc.56.1684502390352;
        Fri, 19 May 2023 06:19:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62v2aoLN+QzWXHnBj2QkAUBMwygdNpEGbnEfBLI8e4Z8i443l9g5odvPHgNNOxLSVL/ujGQg==
X-Received: by 2002:a17:907:9443:b0:96a:e7cc:b8b1 with SMTP id dl3-20020a170907944300b0096ae7ccb8b1mr1674568ejc.56.1684502390024;
        Fri, 19 May 2023 06:19:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gv24-20020a1709072bd800b00965a4350411sm2276030ejc.9.2023.05.19.06.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 06:19:49 -0700 (PDT)
Message-ID: <ece718a3-4d8c-17c7-ded0-0096c2f0fdc7@redhat.com>
Date: Fri, 19 May 2023 15:19:48 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 9/9] media: atomisp: Add support for v4l2-async sensor
 registration
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230518153733.195306-1-hdegoede@redhat.com>
 <20230518153733.195306-10-hdegoede@redhat.com>
 <CAHp75Vf2CjdtchvOAYFpCdsqDxMy8d2CB5O6ApeqJsx98+gyXQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf2CjdtchvOAYFpCdsqDxMy8d2CB5O6ApeqJsx98+gyXQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

As always thank you for the review. I know you spend a lot of time
on reviews and it is much appreciated!

I agree with all your comments and I'll address them as suggested
for the next version.

Regards,

Hans




On 5/19/23 14:45, Andy Shevchenko wrote:
> On Thu, May 18, 2023 at 6:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>> +static const guid_t atomisp_dsm_guid = GUID_INIT(0xdc2f6c4f, 0x045b, 0x4f1d,
>> +                                                0x97, 0xb9, 0x88, 0x2a,
>> +                                                0x68, 0x60, 0xa4, 0xbe);
> 
> Can we use the de facto pattern for this kind of assignments?
> 
> ... guid_t foo =
>  <TAB>GUID_INIT(...first 3 parameters...
> <TAB><TAB>[spaces if needed)...last 8 parameters...);
> ?
> 
> Also would be nice to have a comment where the GUID is represented in
> text format so it can be easily googled/searched for in
> internet/documentation.
> 
> ...
> 
>> +       for (i = 0; i < obj->package.count - 1; i += 2) {
>> +               /* The package should only contain strings */
> 
>> +               if (obj->package.elements[i].type != ACPI_TYPE_STRING ||
> 
> i + 0 ?
> 
>> +                   obj->package.elements[i + 1].type != ACPI_TYPE_STRING)
>> +                       break;
>> +
>> +               if (!strcmp(obj->package.elements[i].string.pointer, key)) {
> 
> Ditto?
> 
>> +                       val = kstrdup(obj->package.elements[i + 1].string.pointer, GFP_KERNEL);
>> +                       dev_info(&adev->dev, "Using DSM entry %s=%s\n", key, val);
>> +                       break;
>> +               }
> 
> I would even go for temporary for element pointer
> 
> ... *elem0 = &[i + 0];
> ... *elem1 = &[i + 1];
> 
>> +       }
> 
> ...
> 
>> +use_default:
> 
> out_use_default:
> 
> ...
> 
>> +       status = acpi_evaluate_object(adev->handle, "_PR0", NULL, &buffer);
> 
> acpi_evaluate_object_typed()
> 
>> +       if (!ACPI_SUCCESS(status))
>> +               return -ENOENT;
> 
> ...
> 
>> +       if (!buffer.length || !package || package->type != ACPI_TYPE_PACKAGE)
> 
> See above.
> 
>> +               goto fail;
> 
> ...
> 
>> +               if (strlen(name) == 4 && !strncmp(name, "CLK", 3) &&
> 
> strlen() assumes that name is NUL-terminated, hence it can be simply
> replaced with name[5] == '\0' check which can go at the end of
> conditional, so that it's also implied in strncmp() for the start of
> the string, but why not using str_has_prefix()?
> 
>> +                   name[3] >= '0' && name[3] <= '4') {
> 
> It's also possible to have it done via kstrtou8() that does almost all
> checks along with conversion. You will only need to check for > 4.
> 
>> +                       clock_num = name[3] - '0';
>> +                       break;
>> +               }
>> +       }
> 
> Altogether
> 
>  if (str_has_prefix()) {
>    ret = kstrto...(&clock_num);
>    if (ret)
>      ...
>    check for clock_num range if needed.
>  }
> 
> Yes it's longer in code.
> 
> ...
> 
>> +fail:
> 
> err_free_pointer:
> (It will be also in align with the rest of the code AFAICS)
> 
>> +       ACPI_FREE(buffer.pointer);
>> +
>> +       return clock_num;
> 
> ...
> 
>> +       /* Intel DSM or DMI quirk overrides PR0 derived default */
>> +       port = gmin_cfg_get_int(adev, "CsiPort", port);
>> +
>> +       return port;
> 
> return gmin_...;
> 
> ...
> 
>> +       if (dev->fwnode && dev->fwnode->secondary)
> 
> Please, use dev_fwnode() instead of direct access to the fwnode in
> struct device.
> 
>> +               return 0;
> 
> ...
> 
>> +               struct v4l2_fwnode_endpoint vep = {
>> +                       .bus_type = V4L2_MBUS_CSI2_DPHY
> 
> I would add a trailing comma here.
> 
>> +               };
> 

