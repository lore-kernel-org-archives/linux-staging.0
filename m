Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BF62F2D
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 13:02:46 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id z19so4122208qtw.2
        for <linux-staging@lists.linux.dev>; Wed, 06 Apr 2022 06:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=YiEq/waq2oyIJzGj/7nxuZ6yzMPJSmp1H52xefeAhHc=;
        b=D1lexwqp1FCNCrNDikbl5ubATE7ZP6DttGxi3Q6WhWwJIYHGLwGL5C9DMXHYANQ8QK
         DjP9CdOMys3DD1Cn9E5w/AwmjapzsuT5BI2eWq0BpldikXMiyj035IsbgvfC9rqFCehC
         qITqYVd+JZy5jIaDoGBw9CcmZejZGyfDfPF3WSbNgiYMtQZL3N0Sl3vNo5HofLYEC0Z4
         PnW3toPYXNYl0SYTO+N9cJ0qu5ezRNcIPbIRpKM35GZlC5y860tR3skilDYcfCl/hR3b
         Frw6FzuYqin9lHK6yw6d6IG1wdjsf8jW1Askw81dYcYfMBYusMo8GZ/OL7D9gz/j4Z6S
         hsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=YiEq/waq2oyIJzGj/7nxuZ6yzMPJSmp1H52xefeAhHc=;
        b=tRpczW15yK2M5gD9FBgdw6MbpWBuireBUecIN1PqIZmE0IteQQiHJxOqpsN+mu4Qp5
         E4uDufQF65wlFJH4zmoNxQzfFXa3y1U/F48Nh7DBS99qhKYD3nj8yczBjDmnvl+rx+7f
         0BZoUMA/fg2GV55poZycXdqa0bfNVvnKbj0+i2BaCH0FWaocfW2+Rj8k33PJf4MbrQ/k
         u3FLYVDQnt6XbY/7pZmGabVOOdv5qvZ7gU/eR3+8uISDX51UFa6X/QzRQE7Cai275A8t
         R3T6P7JwlCubCV77BqTIh2ApETfa6NM5SBU4Bh6Tz11mkAmuCL9vo12CC/4hRKAppD4N
         xQNQ==
X-Gm-Message-State: AOAM533SfnaV3Kci7e9xEmhUkRGCvyQ6SMvMFBrQRwV55ZWoyTfghEtf
	ko4Rb3gQR5JZmI7awUtZUR86rA==
X-Google-Smtp-Source: ABdhPJw/xuitYlG7AOdJz4vUIKvxxPnBTFQWSI1Nf6HlOiv9kAC0yDwlQz0Dw9VtN/n9mM098q469A==
X-Received: by 2002:ae9:e20f:0:b0:67d:2e50:1774 with SMTP id c15-20020ae9e20f000000b0067d2e501774mr5519170qkc.430.1649250165213;
        Wed, 06 Apr 2022 06:02:45 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id r11-20020ae9d60b000000b0067e5308d664sm10325734qkk.92.2022.04.06.06.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 06:02:44 -0700 (PDT)
Message-ID: <439e5c67e66dfff8f44f63787e2cdb8379f87446.camel@ndufresne.ca>
Subject: Re: [PATCH v4 00/15] Move HEVC stateless controls out of staging
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Adam Ford
	 <aford173@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mripard@kernel.org,
 paul.kocialkowski@bootlin.com, Chen-Yu Tsai <wens@csie.org>,
 "jernej.skrabec" <jernej.skrabec@gmail.com>, Jonas Karlman
 <jonas@kwiboo.se>, linux-media <linux-media@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "open list:STAGING SUBSYSTEM"
 <linux-staging@lists.linux.dev>,  arm-soc
 <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, kernel
 <kernel@collabora.com>, knaerzche@gmail.com, jc@kynesim.co.uk
Date: Wed, 06 Apr 2022 09:02:43 -0400
In-Reply-To: <f495aa2b-81f7-a3cd-a6dd-cc5ae5f0a81f@collabora.com>
References: <20220228140838.622021-1-benjamin.gaignard@collabora.com>
	 <eefa63b3-2a4d-4470-9a4e-517087ebcfaf@collabora.com>
	 <CAHCN7xL2uZTMy30FGfDkDK4Lym6wvfr_MTv7QwtchrkTXMQiuw@mail.gmail.com>
	 <79a9c925-d930-ad23-dc53-9ebc16d1328a@collabora.com>
	 <3f778844-f655-74a7-0a00-05caa84eca35@collabora.com>
	 <CAHCN7xLy2381AFLWhLxk5YuRV7C=OwLX=XPXONX8sbkg-SqMjA@mail.gmail.com>
	 <CAHCN7xJWQa-uXb0-+CSvAr1JhFmQYt80Q=uGvaY8uyptNcfbgw@mail.gmail.com>
	 <163202bd-ea51-e80a-1481-568fae25b045@collabora.com>
	 <CAHCN7x+AwNauiyaVL=NGARkmxWOL9uLS5-AO4TjkvLGNQ=3r+Q@mail.gmail.com>
	 <bb462ee8-7bf9-5574-7cc2-098cc66e5ef0@collabora.com>
	 <CAHCN7x+DTjeP7zQJYPyqzdz=hXWjz6Br0v1sWh4n1J3TJPb+9g@mail.gmail.com>
	 <8d23c99a-4ad0-e65a-0134-12f5d119e8bb@collabora.com>
	 <CAHCN7x+YuXFrMe6dYo_VhkG7ey1jcPTpOMCM1=qoTivZO9U2Rw@mail.gmail.com>
	 <f495aa2b-81f7-a3cd-a6dd-cc5ae5f0a81f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le mercredi 06 avril 2022 =C3=A0 14:50 +0200, Benjamin Gaignard a =C3=A9cri=
t=C2=A0:
> > default=3D1 value=3D1
> > 1: Frame-Based
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hevc_start_code 0x00a40a96 (menu)=C2=A0=
=C2=A0 : min=3D1 max=3D1
> > default=3D1 value=3D1
> > 1: Annex B Start Code
>=20
> It is the same so that suggest the issue is coming from GStreamer plugin.

Can you report the GStreamer commit hash you have building on ? Also please
validate the creation date of the plugin (libgstv4l2codecs.so) against your
source update date. Reminder that GStreamer is now mono-repo (just in case)=
.

https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/tree/HEVC_ali=
gned_with_kernel_5.15
Hash: 54b7c1f98084c85d103446cc3f2edce42ad53b0f

Benjamin, can you confirm you have no local changes and this is the hash yo=
u are
building from ?

regards,
Nicolas

