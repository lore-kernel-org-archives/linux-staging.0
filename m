Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6701FB8
	for <linux-staging@lists.linux.dev>; Sun,  9 Apr 2023 13:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681045316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuvnNk7wAmRbcO6BnXTKaMEXDzW/U+623FcOgVvEcps=;
	b=h4HragYEwL43n8JELvrvD3RaKZKw/jiCmPHl+TyXqKo4yXXymT3zaYr/SiNw5XnkdYrr1e
	X7Jo5DI8mSwKVl+lv+pLhvhW+vBcE4zeUUOa5jTLo3jxtCy7hKfQB3YhmosDd1OGdBfZkt
	HlSLOSLH+sGeSms+AL+sAkbXakrc4SU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-iiIximisNkywEZOJULmOcA-1; Sun, 09 Apr 2023 09:01:55 -0400
X-MC-Unique: iiIximisNkywEZOJULmOcA-1
Received: by mail-ed1-f70.google.com with SMTP id v21-20020a509555000000b004ad062fee5eso1763398eda.17
        for <linux-staging@lists.linux.dev>; Sun, 09 Apr 2023 06:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681045312; x=1683637312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuvnNk7wAmRbcO6BnXTKaMEXDzW/U+623FcOgVvEcps=;
        b=vHgGWKoOWZQ+YLI702oxEDDhfH8wPUfbnvLKsFeG2NTGnewvDeC1HAyja6z1ofgXq0
         36NNPHYcQmIq0duJ+vP4f1cUk9IusTqO0pfdUd2goOGx2VMXiSgEJisSZ3XYLn0Ce0e3
         D/8DY/LTsVCAvR3kEHAUmoUqDL87v8V1+SZBuSAfOfzOkFeKbV7WbBwhvbFhLG9Rgsl7
         1wWhe/FXENdgcNOeEmsBkjISA2gB9ZHetEOYsLTGlzWYSgeObAtQx7B5J1nSvtdQh636
         at8XgsXKWefaijs9ctt9WeglAYzkpTd4pYvxzroyYJRy/CygW5j8w4qJ9zwUqCGwaeLV
         gX8g==
X-Gm-Message-State: AAQBX9eCyZiqr0DiFJs6R7iyUQLl5tSAEfghH8yq7qm7ObaQa9ZAUmGX
	eE5UknxH700x9ZNObcqN+eF36gYHP7IAC0Dgl6toGxgGvrlEA2Io5lGjvu0JnG1lPbDKnXgWUD1
	Sp3H1OMoyGeJfaKDaARr90RzX6A==
X-Received: by 2002:a17:906:8544:b0:94a:783d:cd1e with SMTP id h4-20020a170906854400b0094a783dcd1emr945339ejy.32.1681045312616;
        Sun, 09 Apr 2023 06:01:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZxbrhUp1Rce4uDyip6rmaIeOpZ7Sl+L+9WUpxm1h5Kt3BSqd+h2jbWYa+ZiPUwsdeDW7mTdw==
X-Received: by 2002:a17:906:8544:b0:94a:783d:cd1e with SMTP id h4-20020a170906854400b0094a783dcd1emr945309ejy.32.1681045312299;
        Sun, 09 Apr 2023 06:01:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ch1-20020a170906c2c100b009353066595csm4107746ejb.136.2023.04.09.06.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 06:01:51 -0700 (PDT)
Message-ID: <7a7d442b-938d-4d99-a368-a6ce917d571b@redhat.com>
Date: Sun, 9 Apr 2023 15:01:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 28/28] media: atomisp: gmin_platform: Add Lenovo Ideapad
 Miix 310 gmin_vars
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230401145926.596216-1-hdegoede@redhat.com>
 <20230401145926.596216-29-hdegoede@redhat.com>
 <CAHp75VcOpL=aL9suDvBxiCK3cqm4vqCwVfwUp9SSFc31H+15cQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcOpL=aL9suDvBxiCK3cqm4vqCwVfwUp9SSFc31H+15cQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/2/23 21:12, Andy Shevchenko wrote:
> On Sat, Apr 1, 2023 at 5:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The _DSM used to get sensor variables like CsiPort returns the wrong
>> csi-port for the front OV2680 sensor on the Lenovo Ideapad Miix 310
>> add a gmin_vars DMI quirk / override setting the right CsiPort.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  .../media/atomisp/pci/atomisp_gmin_platform.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> index f83de0ffaf16..efcfc133311f 100644
>> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
>> @@ -304,7 +304,17 @@ static struct gmin_cfg_var surface3_vars[] = {
>>         {},
>>  };
>>
>> +static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
>> +       /* _DSM contains the wrong CsiPort! */
>> +       { "OVTI2680:01_CsiPort", "0" },
>> +       {}
>> +};
>> +
>>  static const struct dmi_system_id gmin_vars[] = {
>> +       /*
>> +        * These DMI ids where present when the atomisp driver was merged into
> 
> IDs
> were ?

Ack fixed.

>> +        * drivers/staging and it is unclear if they are really necessary.
>> +        */
> 
> MRD7 and FFD8 are the reference designs. At least MRD7 is what we have
> in the lab and we can run some tests there. That's, for example, one
> which I used to run atomisp before it got removed from the kernel a
> few years ago.

Right, but do these need the quirks ? Or is our auto-detection code
good enough to get the right values ?

Regards,

Hans



> 
>>         {
>>                 .ident = "BYT-T FFD8",
>>                 .matches = {
>> @@ -341,6 +351,7 @@ static const struct dmi_system_id gmin_vars[] = {
>>                 },
>>                 .driver_data = i8880_vars,
>>         },
>> +       /* Later added DMI ids, these are confirmed to really be necessary! */
>>         {
>>                 .ident = "Surface 3",
>>                 .matches = {
>> @@ -348,6 +359,14 @@ static const struct dmi_system_id gmin_vars[] = {
>>                 },
>>                 .driver_data = surface3_vars,
>>         },
>> +       {
>> +               .ident = "Lenovo Ideapad Miix 310",
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10"),
>> +               },
>> +               .driver_data = lenovo_ideapad_miix_310_vars,
>> +       },
>>         {}
>>  };
>>
>> --
>> 2.39.1
>>
> 
> 

