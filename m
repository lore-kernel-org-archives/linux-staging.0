Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A83B7C
	for <linux-staging@lists.linux.dev>; Fri,  1 Apr 2022 03:33:28 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2db2add4516so19577947b3.1
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 20:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q1ZlIMdqwaHcVxl5vxdhmKHFJeu6p9U+TnfY5JmQ5dM=;
        b=cCsLEiaIgCsxr9TWzXMTho+oGCR5boSOsvIae/bdzdTwg7lOuuOdjz3sFy2I6rxLQN
         8gCPt4vkHPMA3zN5dXdcS14XF0dMbM0/MUleoQHqW7DH5ST/f9RLqI1ieI4tu7otfMXD
         wlVW9+NT2AU/WoLZB9jxlgcmJ/BA1zJd+J104=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q1ZlIMdqwaHcVxl5vxdhmKHFJeu6p9U+TnfY5JmQ5dM=;
        b=4lzQ32KL8p2VQtIgMsooyiM1zDD8/NWOg0dQBW4Xy6RjHu4HqdzsgQbCj0oiDx+/iC
         GQpQQXMa+UxMpv/UjuazhUhrkDiCcnxI4MLZ6QhERSqdmrv0HP1yeT6GRhFaH3YF+Vq8
         /UNF27/7TPLIjDmwBXai0nxjrxI1e7OjguQrO5I6GXwc1GFN1m/PVDB9WzrVvN3yPauh
         bWZRFBHMtAXwhPapzQS9IXZjvIjRog8qBpuBdn36Xs6ngPU+3v68oQkhwq43g7l7ph3r
         qE3TMWTjyz3eAR2A1fhkDtfZ2gaFy/dwRQw5/64DCHAaNeZ2cLsbt2Wn76ZNRoqxuqco
         i26A==
X-Gm-Message-State: AOAM5335EN5qE6s6C+1pIq8QaGt9s53WpN2dkiwCATLx/8mjtPWeg3UC
	eCt5PmkGpkTzxqEM7cjjG2rHfwGFpkpohPON8isvaw==
X-Google-Smtp-Source: ABdhPJwgwC705No/2HiCCuHkqrpend2/Epyo4yRvnIvyPJ3Ajg9/yTBw5Ox0LS4mT6R08xeM54qpyiyIa+UXx3wCyTM=
X-Received: by 2002:a05:690c:398:b0:2e6:17c3:44d with SMTP id
 bh24-20020a05690c039800b002e617c3044dmr8410985ywb.286.1648784007571; Thu, 31
 Mar 2022 20:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220331091628.641915-1-wenst@chromium.org> <YkYMo3cU2lqeDBu1@eze-laptop>
In-Reply-To: <YkYMo3cU2lqeDBu1@eze-laptop>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Apr 2022 11:33:16 +0800
Message-ID: <CAGXv+5HgK2Er5Ks8J-yj16kY-0q3vQyUJRJVcTQORQY4Rh=zzA@mail.gmail.com>
Subject: Re: [PATCH v4] media: hantro: Implement support for encoder commands
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 1, 2022 at 4:18 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Thu, Mar 31, 2022 at 05:16:28PM +0800, Chen-Yu Tsai wrote:
> > The V4L2 stateful encoder uAPI specification requires that drivers
> > support the ENCODER_CMD ioctl to allow draining of buffers. This
> > however was not implemented, and causes issues for some userspace
> > applications.
> >
> > Implement support for the ENCODER_CMD ioctl using v4l2-mem2mem helpers.
> > This is entirely based on existing code found in the vicodec test
> > driver.
> >
> > Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
> I believe Nicolas tested the patch before the splitting,
> so this is probably Tested-by as well.

The code flow changed, so I believe a re-test is warranted.

ChenYu
