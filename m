Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA10072
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 16:55:39 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id me10so5895149ejb.11
        for <linux-staging@lists.linux.dev>; Thu, 02 Sep 2021 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DdjT4Us6xIPBwUlhi0ZmrboIND0msaui3k9fDHdcywk=;
        b=MRQ5J5NcSS7kJA+NVAT9d1mDsJd8/n7Rnu9sLmT8pLWh9ftJXZqtSi8PlEUhOL84AT
         tTxglMgU891q1EsiSmgMa9okBFOpmeT3hK8xZlyZNM5AUc0/JVm8rb2WBHSnACSrWfTY
         dpWAWSt//ZkKIq9EVQw25M0w5NtMLQx/NGVskYLV7hA7B9gl4D4sHJJ4zabbj2wkgAo5
         kzKWnYZ6QigeYm/QNjmp5uC2ZGgdQuzp0lAsBHa4v6wNHNoxc8xeSWIZcTglFTneUvmp
         3wKkWOPGpfOg75hZI6Lq6kSPiYOimtTBzD9LPozCWMXgYq8QzyUgG+Pkue477uU6shQz
         QYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DdjT4Us6xIPBwUlhi0ZmrboIND0msaui3k9fDHdcywk=;
        b=IbPEj42pwX7aThw+m15s2VHqU/lUOQGfKMVTyc0spUcWsvGm5otDQQ7aXgUoUOfbii
         93GDVos1F/TsVKq86CBKuGVBfcAJEFnqbIcBxvoWUUomvfvIPVpDTbgzwwYdu8/Rc19/
         /mHvDxW8sskm3/qAJbuBfn3Eujt1gAMnvmSbSzHNjZ1S9LYB9yKq5nlh3RFm/HwRUYOR
         akxxQqluiEplGF9EE2YSlnadJH9PML7HXTlq+wlBIruCx3wciRPNZWM7PYOUzhpYi2lj
         huU8TCDyRUew++r4iyW+M4FzuI8LaaPQwGYcpIt78P1xa12BXltTdu9mhou3ITQzL03Y
         FMDw==
X-Gm-Message-State: AOAM533ZecD8RSAeHbSjJWiZGUHxnzRQpMHqp1pcgAl1ks0wym4CViSG
	ZO2X/+Iumf9n0Er/SLYc9z9EyoLxTrpz6aePRtcqfw==
X-Google-Smtp-Source: ABdhPJwh0/RZoQbsfLsqpqYa2DxpxgVPhTrvfHT/R7bfvGSqtM20ZcJksUFa4sf2GDzTTqsDLOUud4ibRTEhfeHDVWo=
X-Received: by 2002:a17:906:7749:: with SMTP id o9mr4966675ejn.141.1630601738117;
 Thu, 02 Sep 2021 09:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210831094900.203283-1-benjamin.gaignard@collabora.com> <1484b5ebb9c943c72d7d7a0481c1a2cd9899705b.camel@ndufresne.ca>
In-Reply-To: <1484b5ebb9c943c72d7d7a0481c1a2cd9899705b.camel@ndufresne.ca>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 2 Sep 2021 13:55:26 -0300
Message-ID: <CAAEAJfA9Sjr78c==1tCoqja4abY2sZ++UcAT7fgBrK7wid1-2A@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: HEVC: RPS clean up
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Greg KH <gregkh@linuxfoundation.org>, Maxime Ripard <mripard@kernel.org>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
	=?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	John Cox <jc@kynesim.co.uk>, linux-media <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-staging@lists.linux.dev, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hans, Nicolas,

On Tue, 31 Aug 2021 at 16:19, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> As per discussion with Ezequiel, I think this patch should perhaps be made an
> RFC titled "media: uapi: clean and make HEVC uAPI public". Keep it RFC until we
> have collected all the needed changes.
>
> Opinion ?

I agree.

IMO, it makes no sense to keep merging anything on Hantro G2 HEVC
support, until the BLK-CTRL part is ready [1]. Without that, we can't
test anything
so we may introduce regressions without knowing.

Also, I think it's time to start discussing the HEVC uAPI as a whole,
with the goal is having a stable interface that can be used by userspace
frameworks (GStreamer).

[1] https://www.spinics.net/lists/arm-kernel/msg913881.html

Thanks,
Ezequiel
