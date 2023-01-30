Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8547E364
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675067798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4d/SMT2oPu4pWDgGmvW3ooby0A6gn9g87bNk00NILRw=;
	b=ZnO3GNKI7QfMtNVfCTX4LiTnDzJJMppgtAnDFZrgXO7+Xtl0fbLBmSvlNmPFNnyfpTfAbj
	FO8ATd7juWWfQcjRDogw2bYg2owVhlJuO0BjbF6oaM3PrsaeT2yWlQXI/jeS5ZGkF0ZgFr
	hVybVNBB+dxWHuSQx/dcPIJqnw5UOTo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-afuOX35xMVyZZyvBWK-T8g-1; Mon, 30 Jan 2023 03:36:35 -0500
X-MC-Unique: afuOX35xMVyZZyvBWK-T8g-1
Received: by mail-ed1-f72.google.com with SMTP id q20-20020a056402519400b0049e5b8c71b3so7665452edd.17
        for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 00:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4d/SMT2oPu4pWDgGmvW3ooby0A6gn9g87bNk00NILRw=;
        b=t544Tl1RZWk7iMIzm9GVdo9hJyF4iQ6U3AMLqxKj2PoQW9ifBMdUIY0eVn1pYl2Pxl
         ucWhBPuXsIqgZ+/fi4T3026Yp5b9aVvnBq4f7CVqFAwvkQNztsR3duBg+ZS654idoqOi
         WtT/Vn1OoxrwW0SfSx8AG2aATG/K6UOHLHn46nFt5eyvch0fDCg+bXCGLa/SYhXcndri
         /DsiGrPuXWF4ULb3Xxg7s11WQFMefS4vigQMRt/aEcGEOSef+ikwkjhFYPsyJQeJZn9D
         pa1LTZ19hYI4ojLZxgCM50jYXmFkhUUGD3aQK0QgYM6ds6KeeFFiSb6VAs8XIwerxCHo
         Os4g==
X-Gm-Message-State: AO0yUKXa2QDJM2f80FLySf8Em4Q4BucvIKYhy6K8KwqKfD5l/5Oea9M1
	EsQzidT7kVRR8xTHJHvc2uFi8Uyw14go6N0oYZ2rxZpnG8K2ReG1Vl4uLt6fn2fI77bCvEGZFkr
	uyasWY5ZuPKDUwJ9XAel5AOOdrQ==
X-Received: by 2002:a17:906:475a:b0:887:981:5f7c with SMTP id j26-20020a170906475a00b0088709815f7cmr5019121ejs.11.1675067794095;
        Mon, 30 Jan 2023 00:36:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/0R+gvMcJBFdYRnrzzxOkxWBZLXr5z/Tqk0BP+fIcTMCHK94EHX6VpDr3nSMq6rTGD5CNmOQ==
X-Received: by 2002:a17:906:475a:b0:887:981:5f7c with SMTP id j26-20020a170906475a00b0088709815f7cmr5019103ejs.11.1675067793927;
        Mon, 30 Jan 2023 00:36:33 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z2-20020a170906714200b00888161349desm1582823ejj.182.2023.01.30.00.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 00:36:33 -0800 (PST)
Message-ID: <0937b9a5-0caa-2a73-33c4-82e6cab02ef0@redhat.com>
Date: Mon, 30 Jan 2023 09:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/9] HID: Constify lowlevel HID drivers
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, =?UTF-8?Q?Filipe_La=c3=adns?=
 <lains@riseup.net>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, Mark Gross
 <markgross@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/30/23 04:59, Thomas Weißschuh wrote:
> Since 52d225346904 ("HID: Make lowlevel driver structs const") the
> lowlevel HID drivers are only exposed as const.
> 
> Take advantage of this to constify the underlying structures, too.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thanks, series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll also pick up / merge patches 7 + 8 into pdx86/for-next
sometime this week.

Regards,

Hans



> ---
> Thomas Weißschuh (9):
>       HID: amd_sfh: Constify lowlevel HID driver
>       HID: hyperv: Constify lowlevel HID driver
>       HID: logitech-dj: Constify lowlevel HID driver
>       HID: steam: Constify lowlevel HID driver
>       HID: intel-ish-hid: Constify lowlevel HID driver
>       HID: surface-hid: Constify lowlevel HID driver
>       platform/x86: asus-tf103c-dock: Constify lowlevel HID driver
>       platform/x86: asus-tf103c-dock: Constify toprow keymap
>       staging: greybus: hid: Constify lowlevel HID driver
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_hid.c      | 2 +-
>  drivers/hid/hid-hyperv.c                   | 2 +-
>  drivers/hid/hid-logitech-dj.c              | 4 ++--
>  drivers/hid/hid-steam.c                    | 2 +-
>  drivers/hid/intel-ish-hid/ishtp-hid.c      | 2 +-
>  drivers/hid/surface-hid/surface_hid_core.c | 2 +-
>  drivers/platform/x86/asus-tf103c-dock.c    | 4 ++--
>  drivers/staging/greybus/hid.c              | 2 +-
>  8 files changed, 10 insertions(+), 10 deletions(-)
> ---
> base-commit: e04955db6a7c3fc4a1e6978649b61a6f5f8028e3
> change-id: 20230130-hid-const-ll-driver-fcfdd3af11b8
> 
> Best regards,

