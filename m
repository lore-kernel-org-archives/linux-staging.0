Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6EE1C0C
	for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 23:22:26 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id e40so8910380eda.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Jun 2022 16:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6C+HzdvnmDTu8XOljcOnXRbyprFx36b3IfhRieOMMeo=;
        b=kc7ILBdqRI13JYxlU8Trik1Ro/e/jxvaRdIf/oKr5Ro47P9ktgxa23xtjA/dumVZco
         UTXNOCr7vOpYx1xWMrfSbBckMTHK+bgfjhFAFPHaAmyvRzYf/rttl/ey2LdLgN2EXZb5
         mfwTd4kOSHrNb33qbqPyUMAzdguRgwroxRT5SkQh4wSdIojcuws0uB3syNUFkkBMpKBK
         ojGqa9JdOO4PrLIunx6QB6Ds2Ay+b3Igtjs2U7O89B27FXxO4QjPDw829JROLdU+e7KO
         2L+bbcVTLkhF0WuQLWY3FpBZCCLAOdKlUMzjDvAyG0+pxUvC7yUzBjunUkNYTh7J0Ank
         SCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6C+HzdvnmDTu8XOljcOnXRbyprFx36b3IfhRieOMMeo=;
        b=CvWPG78KcPLgdXv9aW52WwW4RUGMZWDricpgasicXUbJM3mFlMigjf/h+TOXs2KaiV
         xO3oRtDeOoTcuUzcLMoUxEU/ecOZLINmfy7AxnyWVTRG1KS02WHIl51egJsxbJs6dTjY
         2DZldZR7c3XRjQBH/YYKTIMEzKgA1UeNte4vRwJVKPGFw/NhBwRO30PP/z/q0OgF/ae8
         eByjMw4/i/NwHVSOE/R9Z5LE8DrrvqfpkyV8PxzkjGw+NiTSu27OtWN1gczYFv5bUGUY
         GKtNi/PRVug4vG6MpMGuoVoIDxWnHgLBdMmE4/jYp5YBTcxhyGsyTSg66ZjvmpGuOv8l
         kl7g==
X-Gm-Message-State: AJIora/ipETkbI/C03CKT6/2MWxrBDdlXVsiK3FKN9A0QRSH9dovI2jj
	C9RP5NwEymJqk3w/Gi3vwzPK2V8JZ7gH7bxhnqU=
X-Google-Smtp-Source: AGRyM1tk4dyOxRMQ2zNMeK9u6f7mbpssmmo02VF4dqazq9eyZI6lgzn5DALDBm2WkAUjXW3qMnJXwUHKncWrsmlT5es=
X-Received: by 2002:a05:6402:1249:b0:435:5e0c:20ac with SMTP id
 l9-20020a056402124900b004355e0c20acmr659770edw.100.1655853745231; Tue, 21 Jun
 2022 16:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
 <20220621145523.GJ16517@kadam>
In-Reply-To: <20220621145523.GJ16517@kadam>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 22 Jun 2022 07:21:58 +0800
Message-ID: <CAD-N9QWi4BxSxCX01zoDVWP1oZwW6vgSyi7TOLbqzR_ZsH-pjg@mail.gmail.com>
Subject: Re: Unitialized Variable and Null Pointer Dereference bug in gb_bootrom_get_firmware
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: vireshk@kernel.org, Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 10:55 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Jun 21, 2022 at 10:36:04PM +0800, Dongliang Mu wrote:
> > Hi maintainers,
> >
> > I would like to send one bug report.
> >
> > In gb_bootrom_get_firmware, if the first branch is satisfied, it will
> > go to queue_work, leading to the dereference of uninitialized const
> > variable "fw". If the second branch is satisfied, it will go to unlock
> > with fw as NULL pointer, leading to a NULL Pointer Dereference.
> >
> > The Fixes commit should be [1], introducing the dereference of "fw" in
> > the error handling code.
> >
> > I am not sure how to fix this bug. Any comment on removing the
> > dereference of fw?
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a4293e1d4e6416477976ee3bd248589d3fc4bb19
>
> No, there is no bug there.  It is a static checker false positive.
>
> When you are reporting static checker warnings then please at least
> mention it is from static analsysis so we can know what we are dealing
> with.

Thanks Dan. I will do it next time.

I am just playing fun with the built-in coccinelle script. Static
analysis has many false positives. Sorry for my false alarm.

Thanks for your valuable feedback.

>
> Here is the code.
>
> drivers/staging/greybus/bootrom.c
>    241  static int gb_bootrom_get_firmware(struct gb_operation *op)
>    242  {
>    243          struct gb_bootrom *bootrom = gb_connection_get_data(op->connection);
>    244          const struct firmware *fw;
>                                       ^^^
>
>
>    245          struct gb_bootrom_get_firmware_request *firmware_request;
>    246          struct gb_bootrom_get_firmware_response *firmware_response;
>    247          struct device *dev = &op->connection->bundle->dev;
>    248          unsigned int offset, size;
>    249          enum next_request_type next_request;
>    250          int ret = 0;
>    251
>    252          /* Disable timeouts */
>    253          gb_bootrom_cancel_timeout(bootrom);
>    254
>    255          if (op->request->payload_size != sizeof(*firmware_request)) {
>    256                  dev_err(dev, "%s: Illegal size of get firmware request (%zu %zu)\n",
>    257                          __func__, op->request->payload_size,
>    258                          sizeof(*firmware_request));
>    259                  ret = -EINVAL;
>    260                  goto queue_work;
>
> "ret" is -EINVAL.  "fw" is uninitialized.
>
>    261          }
>    262
>    263          mutex_lock(&bootrom->mutex);
>    264
>    265          fw = bootrom->fw;
>    266          if (!fw) {
>    267                  dev_err(dev, "%s: firmware not available\n", __func__);
>    268                  ret = -EINVAL;
>    269                  goto unlock;
>
> "ret" is -EINVAL.  "fw" is NULL.
>
>    270          }
>    271
>
> For the rest "fw" is valid.
>
>    272          firmware_request = op->request->payload;
>    273          offset = le32_to_cpu(firmware_request->offset);
>    274          size = le32_to_cpu(firmware_request->size);
>    275
>    276          if (offset >= fw->size || size > fw->size - offset) {
>    277                  dev_warn(dev, "bad firmware request (offs = %u, size = %u)\n",
>    278                           offset, size);
>    279                  ret = -EINVAL;
>    280                  goto unlock;
>    281          }
>    282
>    283          if (!gb_operation_response_alloc(op, sizeof(*firmware_response) + size,
>    284                                           GFP_KERNEL)) {
>    285                  dev_err(dev, "%s: error allocating response\n", __func__);
>    286                  ret = -ENOMEM;
>    287                  goto unlock;
>    288          }
>    289
>    290          firmware_response = op->response->payload;
>    291          memcpy(firmware_response->data, fw->data + offset, size);
>    292
>    293          dev_dbg(dev, "responding with firmware (offs = %u, size = %u)\n",
>    294                  offset, size);
>    295
>    296  unlock:
>    297          mutex_unlock(&bootrom->mutex);
>    298
>    299  queue_work:
>    300          /* Refresh timeout */
>    301          if (!ret && (offset + size == fw->size))
>                     ^^^^^
> The "!ret" is only true when "fw" is valid.
>
>
>    302                  next_request = NEXT_REQ_READY_TO_BOOT;
>    303          else
>    304                  next_request = NEXT_REQ_GET_FIRMWARE;
>    305
>    306          gb_bootrom_set_timeout(bootrom, next_request, NEXT_REQ_TIMEOUT_MS);
>    307
>    308          return ret;
>    309  }
>
> regards,
> dan carpenter
>
