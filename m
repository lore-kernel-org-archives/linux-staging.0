Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3ED46B4
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685444140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hX//i7eKthHlEADvre2Ih07qiiu9glDio+QitwtEYmg=;
	b=LJRO4Pv4m3yPf361+dLMaVejKtsiUMClFZJSNWPoRWRuxsiPZNodfpmuok/IvYxKmkvIVl
	dvqflilTOv435weIQR9wUeDbvCIfuncMtIUkhdBQWzwh9yc1QL7BFef+OEEfEVNSvoHm42
	SbgmiszytiUk0BfHevGOK+V4C9dXpPY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-9E9xTOZVOIitr5kf0zTe3Q-1; Tue, 30 May 2023 06:55:39 -0400
X-MC-Unique: 9E9xTOZVOIitr5kf0zTe3Q-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-514a1501b0eso1507615a12.2
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 03:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444138; x=1688036138;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hX//i7eKthHlEADvre2Ih07qiiu9glDio+QitwtEYmg=;
        b=UsaN3JhNDT2PifB7iwFwyBHkL11Nj2i+gMHF/cYghKusVOnmn+jSef1seTk2o0Faa0
         fSe8UZsWMzvrGxWmpblKW9PDuG/CQuiQNtio4MjPX6jGQ/r33LYu9Rz68dR/pwjVNxqG
         eGaY7Q04TCWlYtVnHm2epYlvyt4JVALPKybgsM2H0YLstIxLbNOJEI8/QTPER7lVkC8U
         vg0uNoqYwODLWqGLrC4KONJ25DcvNNxBnr8cQDf41YeIumXlPvMGuWUn0nDSh8JzJnU8
         zY2xxk5wGiObgxx25JnGI82bGHC8NcrHOYs7hG0jYp+3OpaeEV1qau5YvE27Glt6Azw4
         FU+g==
X-Gm-Message-State: AC+VfDzEhIeCQGjcR82XiOsiQiDjpYz9G83vl/74hZ5iq9gIiYbFvOGl
	VGPx9YrJwdefET/lmjBUK2tf/RTRA7Q/jU9oh/zap/RYnPiZ9MqQTodRAUzLh8VvVXrf6HggpUL
	BQWoQCqWVZj+L+q6cnUc1zbq/7Q==
X-Received: by 2002:a05:6402:1358:b0:514:91e5:d622 with SMTP id y24-20020a056402135800b0051491e5d622mr1255501edw.36.1685444138730;
        Tue, 30 May 2023 03:55:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PkmRRttQVB8w9I6OMYkcvoHyNIJj8oetmf/+CT8a+6gTVhKQgbrQ7v2N8kExN6g+V2HKMMw==
X-Received: by 2002:a05:6402:1358:b0:514:91e5:d622 with SMTP id y24-20020a056402135800b0051491e5d622mr1255490edw.36.1685444138466;
        Tue, 30 May 2023 03:55:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j8-20020aa7ca48000000b00514971c293asm3030260edt.11.2023.05.30.03.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:55:38 -0700 (PDT)
Message-ID: <63bb6add-51cd-b2b5-e229-82009276549c@redhat.com>
Date: Tue, 30 May 2023 12:55:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/21] media: atomisp: Use selection API info to determine
 sensor padding
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230529103741.11904-1-hdegoede@redhat.com>
 <CAHp75VfDvoq8+WiO6Pwm40roeS7pNJq1ae04b3qp0C5rL6Hrmw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfDvoq8+WiO6Pwm40roeS7pNJq1ae04b3qp0C5rL6Hrmw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 5/29/23 23:59, Andy Shevchenko wrote:
> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Here is my next round of atomisp work.
>>
>> The atomisp wants some extra padding for processing in the data it receives
>> from the sensor. E.g. For 1600x1200 it wants to receive 1616x1216 from
>> the sensor. Currently the private sensor driver copies it uses give it
>> e.g. 1616x1216 and the ISP2 code then substracts 16 before reporting
>> the resolution to userspace.
>>
>> This patch series adds support for the v4l2 selections API and specifically
>> the crop target so that atomisp can request the extra padding from standard
>> v4l2 sensor drivers. This is implemented / tested with the atomisp_ov2680
>> driver.
>>
>> Besides that there is the usual cleanups / prep work.
>>
>> With the padding solved, the last bit of private atomisp sensor API is
>> gone now. So we can start working on getting rid of its private sensor
>> driver copies.
>>
>> As mentioned in the updated TODO file the next step is to port
>> various improvements from the atomisp_ov2680 private sensor driver
>> to the generic ov2680 sensor driver (such as the selections support)
>> and then switch to the generic ov2680 sensor driver.
> 
> For non-commented
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> If others will be addressed in the suggested way, feel free to add the
> tag as well.

Thank you for all the reviews. I've pushed this to my media-atomisp
branch now with all remarks addressed:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Regards,

Hans


