Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799DD7F
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661155379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OcGMrHwXxery3fNfqLaGaKLxZkus6uNZDMgbem/2nFM=;
	b=dA3XccPXmfYle+H/uVi4TRYVbWTZgR75Og9Uc9D7IJcaLPbxrA4sL1hsi7SnapNfQ/tXic
	NZFqCPmRh2gt4AVkeg89uAYAxrw/Y6aQdtQE0/a0wyVzkTWHwSgom4pXtu1QEMgHDqOxWG
	HnWvXQeBZWzbdyYxhjECLJ1LwnEKCFU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-FN3_5U9NPimu7XXLCUUpsw-1; Mon, 22 Aug 2022 04:02:58 -0400
X-MC-Unique: FN3_5U9NPimu7XXLCUUpsw-1
Received: by mail-ed1-f70.google.com with SMTP id t13-20020a056402524d00b0043db1fbefdeso6492835edd.2
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 01:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=OcGMrHwXxery3fNfqLaGaKLxZkus6uNZDMgbem/2nFM=;
        b=1nQnMc1FiCc0ptYUuY6tIAo0Wxq5depBvckilqDUObtjyCmVz1on1SslcqIqokxEy6
         jNhtsAF+juUTkJsyNmuLUI0ihY0f6/a2XeVNKsCpl4UQs48PHtx3uKtgFuqVxQmH6rMK
         8zEezMlP0DCp3f22L7LPzbH7L6FIGX7k1SzqB6zPsfXDb58SvMpm3OdMAJjO3Q2QTjXk
         gMPphrugcc9CpJbK77f3t5vtXv5YUf2lI+BxvHR4NJPfG/hltCn3Buf2IGWlmfa0A+oE
         7lRoUYJH/xZrWz8bm5geZ9bkkLsVTwP+usVfl4XZBzkdrWH24r9M7CgyKW/mcayScvP1
         6lEw==
X-Gm-Message-State: ACgBeo3BBemgnukwpeQYKS2I20nHptwUXjqC6s63LF1GKEUlkilRT9Xe
	UOqmKtNzGUPMqIKdTGeZFb1gG0Lkrty1SO0Wuij6pRTNRIW+6vHgUDJ4IqJ9exEu+xgAC7gJcPu
	iBeVEbZ7G/pmQTQwm9apKsCbrZA==
X-Received: by 2002:a05:6402:3681:b0:446:ba68:573f with SMTP id ej1-20020a056402368100b00446ba68573fmr3719945edb.137.1661155377268;
        Mon, 22 Aug 2022 01:02:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Gfim5h1SgIV/zy7BtMc/ezzHDZEzqwL1iP/GBBwg4aVt3oJszr8kbB08Z744PGCKfrL9F3A==
X-Received: by 2002:a05:6402:3681:b0:446:ba68:573f with SMTP id ej1-20020a056402368100b00446ba68573fmr3719931edb.137.1661155377126;
        Mon, 22 Aug 2022 01:02:57 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id o26-20020a170906289a00b0071cbc7487e1sm5784243ejd.69.2022.08.22.01.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 01:02:56 -0700 (PDT)
Message-ID: <3834201e-95a3-02e7-c549-e5630fb64892@redhat.com>
Date: Mon, 22 Aug 2022 10:02:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/13] media: atomisp_gmin_platform: Switch to use
 acpi_evaluate_dsm_typed()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
 Fabio Aiuto <fabioaiuto83@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-staging@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220821215027.461344-1-hdegoede@redhat.com>
 <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfV-goir434sZfwLhoCZbu48uZ0pcwdjfG7WzX_-eVuPw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/22/22 00:31, Andy Shevchenko wrote:
> On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> The acpi_evaluate_dsm_typed() provides a way to check the type of the
>> object evaluated by _DSM call. Use it instead of open coded variant.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Link: https://lore.kernel.org/r/20220730155905.90091-1-andriy.shevchenko@linux.intel.com
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Tested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks!
> I believe the v2 of this patch (when it was sent standalone) has been
> Acked by Sakari. But I might be wrong.

You are right:
https://lore.kernel.org/linux-media/Yud2hzq3JQBzf+oK@paasikivi.fi.intel.com/

So let me add that here, then patchwork should pick it up:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Regards,

Hans

