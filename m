Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD337C
	for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 11:40:48 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id f17so26599041edd.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Feb 2022 03:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=txrRRj64BfB1XGOlz/p2vUCAsDRsRQyDzH1ftwqQ6nA=;
        b=ZIb9yZ0Y598ALLPAqm3u0e19ewvPYC9gpjN3o1C67Ey+fpOs/Od43NWY3z9T2AE43B
         igZXc32/RCpCu8hBGawRNDQ2bRNXgRIqck36AimfzvN1HTVEvdtAndUIrJzvni/bwKYp
         Yo4E5gijZhCQr/wEOh8EGe14H8Zxsb1pt28MiZr4lZh7GA1rkoCNGd15TnEQgS3M1JJg
         5dgQLv0usAdamVM29Z6T9T/nOC8N/726yJTh4iztWl037DCxMHukXgFR8OrNnT6NcjF2
         CD/8v79sujvrkHmkun/473gGfGeBiyVbjAUK5OiAbPI9Z1v2upUTLMfEai/VvsbMovi3
         Be3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=txrRRj64BfB1XGOlz/p2vUCAsDRsRQyDzH1ftwqQ6nA=;
        b=nQhLwgI3l+EV6sO8wQD2nhM4V0uJI2nA2i1w9/KhKgCSaDjH61KhMXAPNESFwcIUFC
         mmhIerQHJRxv0oGtCjDGNDZCynwD7zVbCRiorrqmg5oBzz1J/gOevdIHWgGRyWUK9oMx
         TiwY03M7OHO7ialXIZXzjAmz/2USaTgOOgia3ODYKqxgmKiSvxbNr1Fg0laB/pWj4VIk
         fnfbL7MyYJSPP1kzGMommHCOU8iPJTt5EzzGrjY8X1U8+xVN4XsYw8C9PZd3OOZQ9cE+
         7vue/7epZeeHYa0cXd8UjSgnEpmpWs6ZoDzUJcofoiBACqMPDqm2UbHDuUUQanL0d/Vc
         JerA==
X-Gm-Message-State: AOAM530O7EVzlQUjtBv4+tYyTuEW9+1KwEEZYsRtxvAcOHQRhN3uogwo
	JF5EE5UE7ChWmYkpjIAWjOu4F0GSGrjgyHD5/dI=
X-Google-Smtp-Source: ABdhPJyhI2L7COBYWrFKiT5hgDepOL5o4PrnmVyl3g1I4gJg9l0Tha1gReG8ZTCcVGVZC5KKs3DTfOFxXp6+FFjn1Y8=
X-Received: by 2002:a05:6402:358e:: with SMTP id y14mr14956166edc.136.1644838846589;
 Mon, 14 Feb 2022 03:40:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220211180216.290133-1-jacopo@jmondi.org> <20220211180216.290133-2-jacopo@jmondi.org>
 <CAOMZO5A09VWLGTbqggVJOh4LeLotty8s6VZB0Jq9SL2M0+P6rw@mail.gmail.com> <20220214092358.mu5vvfkzn2zfvokm@uno.localdomain>
In-Reply-To: <20220214092358.mu5vvfkzn2zfvokm@uno.localdomain>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Feb 2022 08:40:35 -0300
Message-ID: <CAOMZO5Dfah7htxY6x3_ORccRnqcHTJ0K4Mn=FLKFQW-rLJN0Ww@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: imx: De-stage imx7-mipi-csis
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	xavier.roumegue@oss.nxp.com, Sascha Hauer <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-media <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

On Mon, Feb 14, 2022 at 6:22 AM Jacopo Mondi <jacopo@jmondi.org> wrote:

> I found nothing there that applies to this driver.
> Have I missed any point ?

You are right. After reading the comments in the TODO I see it does
not apply to this driver.

Sorry about the noise.
