Received: from p3plsmtpa09-01.prod.phx3.secureserver.net (p3plsmtpa09-01.prod.phx3.secureserver.net [173.201.193.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4515F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 12:27:19 +0000 (UTC)
Received: from mail-vs1-f47.google.com ([209.85.217.47])
	by :SMTPAUTH: with ESMTPSA
	id TOHplm8RYEpcQTOHpl887M; Mon, 05 Apr 2021 05:24:57 -0700
X-CMAE-Analysis: v=2.4 cv=SspVVNC0 c=1 sm=1 tr=0 ts=606b0199
 a=GFkePgBPOPvmhUBO7sJnuQ==:117 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=3YhXtTcJ-WEA:10 a=pFd2Zl5z2vwA:10 a=ZZnuYtJkoWoA:10 a=pGLkceISAAAA:8
 a=4RBUngkUAAAA:8 a=1XWaLZrsAAAA:8 a=VDxRAwm8vqx6A6xO54EA:9 a=QEXdDO2ut3YA:10
 a=cDyXFGGuxjcA:10 a=_sbA2Q-Kp09kWB8D3iXc:22
X-SECURESERVER-ACCT: vthakkar@vaishalithakkar.in
Received: by mail-vs1-f47.google.com with SMTP id r12so5943838vsj.5
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 05:24:57 -0700 (PDT)
X-Gm-Message-State: AOAM532MzCHjvYtd+TX5H7FCogLDuBfgz2tITyKBs6/8vDjp9IoEnBC1
	yNL79cCMUhjcZMzK1j3ti0zS+igtBgIU2Ufkrmo=
X-Google-Smtp-Source: ABdhPJw8oNhc2iZlao2rYtRTr1BJxos5bPsxvxGtCHAuOUol3rpcVoj9IR6OgSIea8rGAxxX1A3+mUUu4xd3wfLvx+w=
X-Received: by 2002:a05:6102:2e5:: with SMTP id j5mr13469215vsj.38.1617625497136;
 Mon, 05 Apr 2021 05:24:57 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YGo8q4R5dqgtDMlg@fedora>
In-Reply-To: <YGo8q4R5dqgtDMlg@fedora>
From: Vaishali Thakkar <vthakkar@vaishalithakkar.in>
Date: Mon, 5 Apr 2021 14:24:44 +0200
X-Gmail-Original-Message-ID: <CAK-LDb+Sdd3ubX-Mv-pPcnkrBPp_Q0_O=D4dq+b75LiSUfJrqg@mail.gmail.com>
Message-ID: <CAK-LDb+Sdd3ubX-Mv-pPcnkrBPp_Q0_O=D4dq+b75LiSUfJrqg@mail.gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] staging: iio: cdc: remove repeated word
To: =?UTF-8?Q?David_Villasana_Jim=C3=A9nez?= <davidvillasana14@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Outreachy <outreachy-kernel@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CMAE-Envelope: MS4xfMBThR5zNMPsKvW9T+XBNduNK/KPN8/nWB6O15xu95R4ROwjmMHXrFv/HzmsMtjUKnD3O5HmwOvzEOasIdCmZvZIFYGVnjC62znjFgrnB9vmJrM1ePE4
 /zgjet4gkHMtq3J6umTI8j3ByaMxZ68qCN0kwsnp/mjjwEX4lWqRps2zOQtC7feZ07XYZjX6PCHpY5oVAiqs20RrX58dQHCGjXDioqLiwTAlTijGX9/QA65p

On Mon, Apr 5, 2021 at 12:24 AM David Villasana Jim=C3=A9nez
<davidvillasana14@gmail.com> wrote:
>
> Fix checkpatch warning:
> WARNING: Possible repeated word: 'from'

You don't need to include the checkpatch warning in the commit log.
Your commit log should just be able to give enough information about
why you're doing this change. Then you can give credit to the tool by
adding a line like this:  'Issue found by checkpatch.pl'.

> Signed-off-by: David Villasana Jim=C3=A9nez <davidvillasana14@gmail.com>
> ---
>  drivers/staging/iio/cdc/ad7150.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/iio/cdc/ad7150.c b/drivers/staging/iio/cdc/a=
d7150.c
> index 48132ab157ef..1be214512ff8 100644
> --- a/drivers/staging/iio/cdc/ad7150.c
> +++ b/drivers/staging/iio/cdc/ad7150.c
> @@ -57,7 +57,7 @@
>   * @threshold: thresholds for simple capacitance value events
>   * @thresh_sensitivity: threshold for simple capacitance offset
>   *     from 'average' value.
> - * @mag_sensitity: threshold for magnitude of capacitance offset from
> + * @mag_sensitity: threshold for magnitude of capacitance offset
>   *     from 'average' value.
>   * @thresh_timeout: a timeout, in samples from the moment an
>   *     adaptive threshold event occurs to when the average
> --
> 2.30.2
>
> --
> You received this message because you are subscribed to the Google Groups=
 "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/outreachy-kernel/YGo8q4R5dqgtDMlg%40fedora.



--=20
Vaishali
