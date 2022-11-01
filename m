Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73B920F6;
	Tue,  1 Nov 2022 14:56:06 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id h10so10444333qvq.7;
        Tue, 01 Nov 2022 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=91Pi1sgd0zTVujDHIVVyfFUD/3uaMubrRUnbeHfYyeI=;
        b=fRDx55YIuvo3rjltGc0Bfuid1YLiG8Aj2v7JiRiqgJzNtqOigagNjxgTi21qsG60da
         31/WYflyGGBailfSZhPkcKHnpIxsjqw2a3iGIpSm4W+/bbNxaUb2YWfRLLkdgGr809Xb
         02CzHgVQhrhe+wgCBDBoERD+OQgg4VS+9yiPcOkDKlbDQxMP22ISAOLDWfj2frFbw0ug
         INy4keqNqMCS8mZfnmfKOTKER42HQHw4XM78vqIScoO5ynaqm0jlTxosKb3A1tEyVQj8
         +D5Wg9WyaCTZRPxRBhBfDjhx62EDu+OGdh+qSj6AIQ97SwpFMX/bM63fFGWsLr7xPPSe
         NUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91Pi1sgd0zTVujDHIVVyfFUD/3uaMubrRUnbeHfYyeI=;
        b=niCpdiMUjqMErH5dgZE26x/f6kTWwZWKxYyu+wSTA+k0k8Abcz8GonTiDPA5xwJp9V
         hW8DxZiv7l/sKPqixeAxr1MGgOOXC/xXIbloJTSpCDEVj/QXh1I6FtUFhbWnxGJj2DOR
         pW7pBI31GFvFYrK+6urACc0GBfeYpuvjWbTYcyZ9Qad5vNS6lXA9KDpwphg+JHMxBbT5
         IYOZmlWvF4xGJcxNWao8QeamK28EugP/5rFDIt6aILOM1im50PnAgAIuuYy4dighqxaT
         Ttxq/dDN+/w0AExgehIEhVdg28u40YijGTwwSuiKuorDe1zMZP1H7X+rqStC8oOpu7ho
         ag9g==
X-Gm-Message-State: ACrzQf3kpi0b7NK88fZVzhW07ZFd6yDu1DX/VeNAC0Qq8n9u/GJaJuqe
	o1Haufa2RQGPILTHqdAUrQemF1CQgwS/v3G1cWY=
X-Google-Smtp-Source: AMsMyM5+VC0MbPsIUuv66pB203xFny42zcAiRVPVoqdEHirqq+IojKHlO94SZEMMAfcULWsc73j3D3FjHaoi+Gs/A4w=
X-Received: by 2002:ad4:5bac:0:b0:4bb:db4d:b60f with SMTP id
 12-20020ad45bac000000b004bbdb4db60fmr13176764qvq.105.1667314565724; Tue, 01
 Nov 2022 07:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1667305446.git.tanjubrunostar0@gmail.com>
 <ea25c687d28f5cf40c315b8191d98fa0608f8a76.1667305446.git.tanjubrunostar0@gmail.com>
 <ea1476128e2f21956ad99e52b01f0c99f46e70ba.camel@perches.com>
In-Reply-To: <ea1476128e2f21956ad99e52b01f0c99f46e70ba.camel@perches.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Tue, 1 Nov 2022 15:55:54 +0100
Message-ID: <CAHJEyKXhEGnFRfdv5xSQeEp4bTS4FsvU9oU=hfeuUdYVaovWHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] change the function name s_vFillRTSHead
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 1, 2022 at 2:32 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2022-11-01 at 12:37 +0000, Tanjuate Brunostar wrote:
> > Remove the use of Hungarian notation, which is not used in the Linux
> > kernel. Reported by checkpatch
> []
> > diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> []
> > @@ -23,7 +23,7 @@
> >   *      s_uGetTxRsvTime- get frame reserved time
> >   *      s_vFillCTSHead- fulfill CTS ctl header
> >   *      s_vFillFragParameter- Set fragment ctl parameter.
> > - *      s_vFillRTSHead- fulfill RTS ctl header
> > + *      fill_rts_head- fulfill RTS ctl header
>
> Perhaps use header as head is conventionally used in lists.
>
>         fill_rts_header
>
OK, thanks
