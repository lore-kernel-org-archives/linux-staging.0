Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1367C
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 12:00:40 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id i186so25600633vsc.9
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n7p8Uq2+lZWPYal2atoqxtilGwC7bZj30FTcIre8js8=;
        b=bqEyU9czIxM2OrF6DA/wE3J8vr9cBJZA2LzCfiKSISgPpa/TESqOK2qL3GirYtGp2w
         /nJdRX66BTMYmHxSx7yLAaqFDcUn+k2AVJ2TMql0zuwajox5QXagtYTxQvv1SVHCAjc8
         ShvNbrSsyz9ZNLPs1cq1xIDOn5v+MqS/7ApKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n7p8Uq2+lZWPYal2atoqxtilGwC7bZj30FTcIre8js8=;
        b=y6s3jd4RL6vzbQ8/VsYMA6pqEc9t1b/XbfS+jE/Dq99POvTtSo2zAstQTXO3S8Nny3
         16/xgBSsMwkGpn9QeeM0wSGRvaU1yt3VqR2cgIIwOZbJy6FVAEGaxfGw8jYny3FwQCJu
         zv7gSp2W+cVIwrqbE3S2n9Zgx4DvMCT3b6srZNKn73HEcdX2wo96Rupo1zzlgXS33ilW
         Y1YDpIkf1wA1DVLqAZExxxTkoIuyHclb0Izokh9MN6tb0fUuxxiB2R3Gk3TmQVhWkAAB
         02t1YJElDM9UoIvHTTJhHlHzILBCCTAwXrKAZwycXomQD8oVvjcGW/LE3+07VyYWBdUw
         Iz3Q==
X-Gm-Message-State: AOAM530aPjcRM1FalKN3Txo36cL91OtGh5n/CI7lvjnPTKOQ1XdGYUMs
	5dVt9OpmvkdVVPaFVtX5+Xw6x/80jt7l2aFbogeONA==
X-Google-Smtp-Source: ABdhPJwDM4xS5vEd9KdONZjoeyi4xmvPxFKo/aadxZWwYA48QQoGh1IvN+jWltCA/JbpwdWTlMNjWUsabNEmni0bYmw=
X-Received: by 2002:a67:fd0b:0:b0:31b:e36d:31b1 with SMTP id
 f11-20020a67fd0b000000b0031be36d31b1mr1587242vsr.44.1648728039267; Thu, 31
 Mar 2022 05:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <SL2P216MB12463DE2E1E100E2498A5C33FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <SL2P216MB1246D7900A0B9620F1E1A038FBE19@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <YkWRN4ac0ivRn4aB@kroah.com> <CAFr9PXm3Mvr0guGoPDKmashMhFG6OQMvXHxwX-SD5ZHPi_sw4g@mail.gmail.com>
 <YkWV6HGkGHvgSwCj@kroah.com>
In-Reply-To: <YkWV6HGkGHvgSwCj@kroah.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 31 Mar 2022 21:00:28 +0900
Message-ID: <CAFr9PX=s0CRtcVw_5xk7F6MRZ+svFK_cUDRzdaOFxcPGe4tBmA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] staging: media: wave5: Add TODO file
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nas Chung <nas.chung@chipsnmedia.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "kernel@collabora.com" <kernel@collabora.com>, 
	"dafna3@gmail.com" <dafna3@gmail.com>, "bob.beckett@collabora.com" <bob.beckett@collabora.com>, 
	"kiril.bicevski@collabora.com" <kiril.bicevski@collabora.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>, 
	Scott Woo <scott.woo@chipsnmedia.com>, 
	"olivier.crete@collabora.com" <olivier.crete@collabora.com>, 
	"dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Thu, 31 Mar 2022 at 20:52, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> According to the text in this driver, it will not work on these hardware
> as it is broken.  Unless that text is incorrect?

I think that's for risc-v.
The other chip this is in is ARM Cortex A7. The crusty vendor linux
BSP for this chip manages to play videos using it so it does work in a
real piece of hardware.

Cheers,

Daniel
