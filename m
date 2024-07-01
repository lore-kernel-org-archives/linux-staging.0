Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834012FF6E
	for <linux-staging@lists.linux.dev>; Mon,  1 Jul 2024 11:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719833067; cv=none; b=k648afC1rrQ9AWKX76GvWfeEsP/UHYzrMtOa9lcxvVaaWTTvZBxrXmwtqceaaZr+UaPERjm9A+IYP54RuhLxK2CnzunkR6t2hfL5inkqsoi13HuUpY6+FGRjC097fdeLMI/XbVxBvXVbTL0Cd2OYhY6F7lLoh8M3yY7+JUjy+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719833067; c=relaxed/simple;
	bh=WsrDBMgEMcLTt4oJ6+QPF9iMS1Rmq+55ucXu/SczPMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4yL7tIViZkiZ+uZaPczHFiJrYMDowxLAzJd0bAZjHScxcOn+1aS00P9dKFcN0COn4qaj5i1OGBEkIuMhbAuLl7JQMxT2pqJx56lW4h1m/u2J7Kbhc+fWr1U13w2Xk5H3PBEMTgKjIOfdIo5DN7ibOgdWrqGHwVKQ+8QUQrcYOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnSdBXpV; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnSdBXpV"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-80f6efd265bso485255241.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Jul 2024 04:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719833064; x=1720437864; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUrL67AhfddDFHRxH2TRoEF8hBbehX2Axe/cx3JPvX0=;
        b=KnSdBXpVCDVzciW3lgfTEu5nxhzdlqPWuFPAzezEdkyMiX9QnhtDGE71PUPr+IniNf
         pIs4bmIzJw/8oMwHFB2s3wGBkdv0cDbtQBz/z2mYPSw6ovOaMhRpYRGU2+vTUEvp+Dzl
         nbY6Zzb35/becmN8wMbZiAoPi5HOklHYdhavVVU/ErTM/lDpwHcr7d8Etd0K0+mg+Ycr
         NTEDqR9LrNxdFLekxf1GeajwoN3ZMNScfGpQCeheveZR/0elXFpxWguy48n35kgoBsjI
         1Bxxy5ZUFXaofid/NNVDZ2P60Y9Wxy0I8b5AmkLTrqV3IRYdAiVB2qMCr71eAmRfpa+Y
         /csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719833064; x=1720437864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUrL67AhfddDFHRxH2TRoEF8hBbehX2Axe/cx3JPvX0=;
        b=YnB+o6d00flKZ1m1PwUWU7Y34CMIbH4AS48A529zEEyaQ/hIV1ct8JyjjVV2wc1+Y1
         9+zX/QxRPund8VC1KKPrkPRx3lSHG2Zqd91xusrv81WPRifY42NdfjR9dkbkH9H370Zs
         IPJ8cGs0T/fCCcPyvwdREkMWlSRj1dHeuQ4McvzjDo3J5zDn/XH7bOksvmZvCayMyMWv
         wbVaHqXq99W2X59hQfgSv3Rt1umyzEE78ASyuVZeGLYDZM9hl2c/Hfan1VeUU7Q0RCaz
         /tR4mDEYS6ZfIP30LODw4mBCAuSO58MyFgW7hBGB8U4oBGY6W67v7kmZIXjMYq+EiCto
         JvqA==
X-Forwarded-Encrypted: i=1; AJvYcCU+bZBBMM/Gp2PsmGyeC0LZ7j7r7CWSIm9nxxyXajnTjRiJe/l1t3gFmPjHkj6rk4AiOrKW1tc7TFUPeu7a2K/xIJ6lVKnwlg5/EEhhBQ==
X-Gm-Message-State: AOJu0Yxvcero3+52MhOZf+tjvPno/iLY3tlPIBk45d5jcjfPijiiQ00T
	yuc8NH3A5TM9Xv+dVZaoAhnPXF953tVg8QCGvgVQHQwGbQ0eh7qpNglX9MO60vAT84xLgfUENZ9
	nbwJX4c9ugCz+bYSUzX8n+0bcWOM=
X-Google-Smtp-Source: AGHT+IGwyMqOfO87PLcMKYzWqKj15ArhzLp2ipo62An2cYoqn8JEiXomOKPcQ3YWcK787dlLTa9WLMfj39rGKsdv6fM=
X-Received: by 2002:a05:6122:d1e:b0:4ef:61c2:6331 with SMTP id
 71dfb90a1353d-4f2a563c321mr3165714e0c.1.1719833064580; Mon, 01 Jul 2024
 04:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com> <875xtp96zy.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xtp96zy.wl-kuninori.morimoto.gx@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 1 Jul 2024 12:23:14 +0100
Message-ID: <CA+V-a8uY6QSC4nfk5dEgB80O4z1nxpeBqwGPVBL4h5NHqjhjdA@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] media: platform: ti: use for_each_endpoint_of_node()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Eugen Hristev <eugen.hristev@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 3:32=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
>  drivers/media/platform/ti/davinci/vpif_capture.c | 14 +++++++-------
>  2 files changed, 12 insertions(+), 14 deletions(-)
>
Reviewed-by: Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar
