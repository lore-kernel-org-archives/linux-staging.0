Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599B93FC2
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630309445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbCYBJ5L58cJSBbw8FF7cXPHj0GCoH2oZb8jcw5g0h8=;
	b=SK07Gkh6tX65EksT9/dJz9cOu1sVKE3Y+eMoS0tCs9Qv20cz/lbVc3GQv98GfwsNcJ5Zdn
	WqNVpRhNw0DuPMYJJPHyySDVbnQBSombzwxhJsr2NVEgOtKdv7+emC8IeKiTcOH1skH3f5
	sfXgfuYUF/Y5ZlZvyTqJ5gbpWclg7EA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-7IUIjnUwO-C2hmtY9QkLrA-1; Mon, 30 Aug 2021 03:44:03 -0400
X-MC-Unique: 7IUIjnUwO-C2hmtY9QkLrA-1
Received: by mail-ed1-f71.google.com with SMTP id z17-20020a05640240d100b003cac681f4f4so1633627edb.21
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 00:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VbCYBJ5L58cJSBbw8FF7cXPHj0GCoH2oZb8jcw5g0h8=;
        b=eMCFpijNQgIUwqZk56y3dOxqn5RheSD/2z59NS6CyqPFX9QY2JJhz3sVnY+z/e5FdZ
         WJsf2ebvRjXCIUaiJYveT8ON/4OGko6pIuTeZEGQafg5WTfYjUnE3+YtdV/wDXEeQpq5
         fdTOaHs2H5S6huzkecmgkfVrjQjeS6ItMNWBAjQymBvnhQPy9zdtZrVoMpxjeUFeVIsW
         sbrf2hckYzJ/CYsDggjld3ngD8Zg8hgUj58U1azdwmu9/xvQlQEXwxkW00uNudPedOev
         D5AfSG1kS4iK7FDZd4yAdiG/QzX3K96Gx8DujQZPOSBXnfelfzJ+FpKEU/w9yxnlaZaS
         PuOQ==
X-Gm-Message-State: AOAM532sTSTPj1CZz2pYoVFRJ6Txj3ojuLEzqTlRhTgAL+7yqCIzaWDG
	eh+3TvbeMIXYSkLzSvFiG3bvxRrGtAZCQ5bvM+B9X9fqXk3GFr3LxTjHjRduLpQwDU2otyat6qs
	2ihOMn9NJueH5kwANXMU1+YuwFw==
X-Received: by 2002:a50:8ad7:: with SMTP id k23mr22927462edk.310.1630309442281;
        Mon, 30 Aug 2021 00:44:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytmTh1FuKFfXv/3tgJfJ6JpdS3PLc9jKKnTuqyAPzyF74S8/dKUzr1ZIs7kfe5olfMkIWLmg==
X-Received: by 2002:a50:8ad7:: with SMTP id k23mr22927451edk.310.1630309442116;
        Mon, 30 Aug 2021 00:44:02 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id b8sm7108980edv.96.2021.08.30.00.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 00:44:01 -0700 (PDT)
Subject: Re: [PATCH 0/3] staging: rtl8723bs: remove lockdep warning
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <cover.1630307025.git.fabioaiuto83@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <85ef4038-24e7-fdd4-fe42-35416f705b99@redhat.com>
Date: Mon, 30 Aug 2021 09:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1630307025.git.fabioaiuto83@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 8/30/21 9:09 AM, Fabio Aiuto wrote:
> This patchseries removes a lockdep warning that turned out to
> be a false positive.
> 
> All "lockable" queues in the driver are initialized by
> a single function. This confuses lockdep which puts all
> locks in the same unexistent class.
> 
> Fixed it by doing the initalization of queues in place.
> 
> Done a small code cleaning and removed the no more
> used function.
> 
> Tested-on: Lenovo ideapad Miix 300-10IBY

Thank you so much for fixing this.

The entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series.

Regards,

Hans





> 
> Fabio Aiuto (3):
>   staging: rtl8723bs: unwrap initialization of queues
>   staging: rtl8723bs: remove unnecessary parentheses
>   staging: rtl8723bs: remove unused _rtw_init_queue() function
> 
>  drivers/staging/rtl8723bs/core/rtw_ap.c       |  3 +-
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      |  3 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |  6 ++--
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 12 ++++---
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  | 15 ++++++---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 33 ++++++++++++-------
>  .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  6 ++--
>  .../staging/rtl8723bs/os_dep/osdep_service.c  |  7 ----
>  8 files changed, 52 insertions(+), 33 deletions(-)
> 

