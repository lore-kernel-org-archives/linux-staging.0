Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB2812B60
	for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 14:24:24 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-c49777d6e7aso5769704276.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 07:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688999063; x=1691591063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfaw5NXpBN+ToDeNW38gue7dW1/lsMjnYJ8JVvMgX/M=;
        b=QzKFYEuEyJBmyVNrCTuM3xu2kiOzdJ733dpATnK2KIsTftxaxQrkFSHDoRvXkS62Q1
         ZzwxUIDQFUGUncjgMsGBUdc5tMOXaMH7dl8GnPzoL/6n9pZw09b0ZmaNjHrbLutDuZJh
         a/IGw3N3kW+LesbGXy/lgYCtStCtLi8WbADaDxdcgg/i72vh0e80Elo65bRMQQIf0Aii
         gN8CYJcj/oLYPQitrqhEbeCC8Dqly+59rFrVMMzcHkBCY8kPruGJfjOthtbaTFipQd0Y
         imjIM+aDF60N/+bSFzJQShrBYNXK2Y2WrWcLMYmFYY7kegF/rtNVJpKE8Vnnw/jKXqh9
         IERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688999063; x=1691591063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfaw5NXpBN+ToDeNW38gue7dW1/lsMjnYJ8JVvMgX/M=;
        b=VgetA2taDeb7PN13E7i85OroGyiVBwn0AxA3wv+fV09El+Veggd53mgWlZ0mUU1kXB
         woGUB26tULwBNcW+JtdCD2CyXS4UkCm0QPJ85OQbCJSA/spHce86xFn4ew4eUt1XfkJV
         cOUroEX3MjYSwTVrbzALtpXvLuWw1aMwmWvgrN+fisxKjIpi/3e9VuIySX2WBd/698CC
         rb9uYGjtkc6f26YEmKzL5MsNO7frpTEjkm61C3D5hv7GIbM+evPpxtBxJxRh859ZxDGc
         KqIcoeldcVda93mwyKS5cJWuRfqVbtGA/Z5YSvUMklCV6APjWIRRiEIOfkcOr9O6XAnt
         tZdg==
X-Gm-Message-State: ABy/qLamkmI9UuLXOyz9UQIjVO5w4MVcD/VLUxDoNlmYQoi22FpyuJ9m
	3018istEvKbl4onz0k21qwjxXG5VsZ9dF/Vn4LE=
X-Google-Smtp-Source: APBJJlFF/ZPZBeFTUlJJsVw6gvqSC+NnftxoKLaqOH3sDOKdvIyhB4DTRi4Sp3yg5NFbGfCt55R+jTwkG5L/EeefwtY=
X-Received: by 2002:a25:842:0:b0:bd7:6810:6646 with SMTP id
 63-20020a250842000000b00bd768106646mr12374371ybi.44.1688999063346; Mon, 10
 Jul 2023 07:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710130113.14563-10-tzimmermann@suse.de>
In-Reply-To: <20230710130113.14563-10-tzimmermann@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Jul 2023 16:24:12 +0200
Message-ID: <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com>
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, linux-sh@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com, 
	linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 3:01=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
> fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
> not set it.

`framebuffer_alloc()` does indeed use `kzalloc()`, but the docs do not
mention the zeroing. Should that guarantee be documented?

> Flags should signal differences from the default values. After cleaning
> up all occurences of FBINFO_FLAG_DEFAULT, the token can be removed.

occurences -> occurrences

can -> will maybe? Since the intention of the patch series is to
remove it (them) altogether).

Thanks!

Cheers,
Miguel
