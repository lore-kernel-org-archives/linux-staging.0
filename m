Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09923C9D
	for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684428571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErMabRDduELolLVz51Rzbw7t9VD/UXkGPcjr4o8l4Wc=;
	b=Fl/US7MZRKvVMm/QJzL8R3SMJ3SfDeNf+qZFO1Qsb/om99PKJt8R9VfDd//bsqvnFpAWfZ
	wewrslb4Inaa3QrxGcqGFLT4h2Wc8nAZmkyfQllEHensz0UpJF+lNdjqTNLvKTm55AOUn5
	ebSW9DJIIIwXcu0kQDv3l09g5ZLaTmY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-2SXQfHemMLuIh8XWL4oc5Q-1; Thu, 18 May 2023 12:49:28 -0400
X-MC-Unique: 2SXQfHemMLuIh8XWL4oc5Q-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50bc456a94dso2323861a12.1
        for <linux-staging@lists.linux.dev>; Thu, 18 May 2023 09:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684428567; x=1687020567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErMabRDduELolLVz51Rzbw7t9VD/UXkGPcjr4o8l4Wc=;
        b=iXP+uu2vMCkiNIXmaLPZ8iIgMMVe2uqkWuVon8SmlM9BnFYWhQXdWeFFeUIlG7N83x
         ZRYYUGWIMAPhGJ8NIn77bnQCd91P8zyE3CUIFc7mj0I3QK6DIEqesrnusMYRxgvzZwqS
         ElMWUfN3ZUSC/t6c3/vS54GGvWKQWLAEL2z82NoU0bQd2tGVw9rcBfeFR9LoSjjZpA0o
         JVlI/mjrM2PnPdwVSqa+aPQaO6sUm/aCyDABKEKOsC+EoSNZlANmnjhVI7YOcLuGIydS
         niSiLzy8FgPrZxRkzmcoxwkZzgujtZjnVjqBEs1wiAen8q8gRL9kb8YEnkD1y055KP/j
         Wg+g==
X-Gm-Message-State: AC+VfDz99Ayg0SXP4jyKzH4sLcJSMmYSaxbvHe1RllDqiThrHhJ/3XYo
	EcirD+C1BimJuN2P42RNlx/DS9Ld5hQzrPQrRp6S/cjQ130gu6c1T7QAQmvXuio0gCxFq5bf0+W
	KfYgHnTbl3PmUVwNUoxIJ+/Nu/g==
X-Received: by 2002:a05:6402:32e:b0:510:86cc:f687 with SMTP id q14-20020a056402032e00b0051086ccf687mr5940487edw.20.1684428567551;
        Thu, 18 May 2023 09:49:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4bIYW6JN4v4XvK/YVwMc84h7OWQcCGtODeDwfD3mhRxa1Z6BqYYP8TYUy++Dn56/uSdcbzsQ==
X-Received: by 2002:a05:6402:32e:b0:510:86cc:f687 with SMTP id q14-20020a056402032e00b0051086ccf687mr5940467edw.20.1684428567243;
        Thu, 18 May 2023 09:49:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l25-20020aa7c319000000b0050bd9d3ddf3sm776972edq.42.2023.05.18.09.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 09:49:26 -0700 (PDT)
Message-ID: <4a53c677-a0c2-1829-9bd7-5da5e04414e8@redhat.com>
Date: Thu, 18 May 2023 18:49:26 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 + gc0310 sensor driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <CAHp75Vd=0oXwKqwDghX8suK0qcYp8Ny31CRDkYFKa9M6QUax5Q@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd=0oXwKqwDghX8suK0qcYp8Ny31CRDkYFKa9M6QUax5Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/18/23 18:02, Andy Shevchenko wrote:
> On Thu, May 18, 2023 at 6:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Now that the atomisp driver supports v4l2-async sensor driver registration
>> (I'll post this as a separate series), there is no longer a need to have
>> atomisp specific sensor drivers and after cleanup atomisp sensor drivers
>> can now be moved to drivers/media/i2c as regular v4l2 sensor drivers!
> 
> Cool!
> 
> But since the patch 9/9 in that series is WIP (as far as I can see), I
> think we first need to concentrate to review that one. OTOH I'm not
> sure I got this right that I'm thinking that this series depends on
> that one one way or the other.


Only patches 3/9 and 9/9 depend on the other series in the sense that
they would break gc0310 support in atomisp without the other series.

3/9 can be moved to the end so the other 7 patches can be merged.

Most important in this series and the reason for posting it
separately is getting Sakari to ack patch 1/9 .

Sakari, I know you don't want platform dependent code in the sensor
drivers and I understand why. But in this case it is really
unavoidable.

To make this as painless as possible the helper function has
been made so that all sensors which may be used on affected
platforms only need this one extra line:

	v4l2_acpi_parse_sensor_gpios(&client->dev);

And on none ACPI platforms or when client was not instantiated
through ACPI this will be a stub / no-op.

So I hope that you are ok with this as a solution for
how the ACPI tables on these devices work ?

Regards,

Hans



