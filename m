Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03F3254A8
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778955932; cv=pass; b=XiS0GGXuFAJ+I65K9WXullblNOr3Y6YdpWHmLoUna8H4WYlqauM2MJx+zBwdta72+5K1yLdFoR/Iy2ev9D08sYbCSKbsCWRcsSgnqe2xF1REnRmKEcrCqC3pfR3XjlSbdhI6fVzKwzSUPij8hl2m2qTtEKngsM2A+8hlRdnZDnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778955932; c=relaxed/simple;
	bh=rlnP6BSKk3y+57gPpnvq0Nwo15+DtNNEApQU1WzrYAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ohx9YScfPulA86lSg+eKXvTIVEwK5sYOVDcJCiyinXHzwZdw9vMLHXnVe7A9SwkRq9pHE8K0POWpPOXD9+S/Z8YbC4pucOekzkPnl6TIsaUVhxzkJMSokYytkAJZMqG0B0VCw47J/OmAXQSJ+nGmy03VqGx+zYI3Xrnm4JzGMDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfmJSXBN; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfmJSXBN"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-573a81abef0so733296e0c.2
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 11:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778955927; cv=none;
        d=google.com; s=arc-20240605;
        b=QZV/x6S87usHMb2xTockcZosFaD5oGzP830nQzZGfJYvmOQSZckaCwjLpUOEJUTJty
         JUJ3h2tsdqFR8jd0knL1smIKD0r4iLi/pB5/CJw8Yy+sgbzuwCX6Hv2Wy9J1LHpF125S
         yn9xMALS3VvxqbRgfldc8yA3N1XyyebngW4miu9U7Z8D/qjUqAiMrOSAcKwydnv98G9D
         2RtZNAGuL+Qasj8HuCLcFvb0fObpX5yWIJuSO7pB9935vTLxGNXf2mZbAisyhTiuzumt
         t+2nmsmc+WQnRZ2jD09kY6xRKGIkXXujHDW+JoYmsqQGCznDXohhb8LaoZPZJlEQ6MWL
         0L9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SkG/mV7/+T57gOebLhjBWLUXJSJDsOeED6RV9YmxRq0=;
        fh=OYUFtTODIkIycZezm5i3xW9Mjwdp5TgoRBL4mDzGsw4=;
        b=AHa/zqZ/3n0TOl1nVIIpw8VI/Y5KRxgROKbLjbKQQ51pzl4pRH9uEw5wiYsg9gu6WF
         HBOlArhcIEJRpnWgDw/4+FwJnujDeueyYjO0h4dLBRe3FkbUwAIwVEAwBCU1E8nuxXQh
         d5ENRdh5EdeMhVF9fQjC7PwcxKUNrsjPvR4pQpDnH5qefTz/lnz3NvtN4Kct72+p9yZl
         ZiabmJC2EriH7gF0DA9EZmFzlKiBKmf20b+h8yqaFbEU8yGNgJkHhFSqshCXuL+EEey/
         sUGIPsb2a9kophi7eEzMs42skemwFIa3tl9a7tNTzVGVS/6SjPFqHNbijgCq6m4atJEc
         ftOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778955927; x=1779560727; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkG/mV7/+T57gOebLhjBWLUXJSJDsOeED6RV9YmxRq0=;
        b=kfmJSXBN6B6x0DEgowgRC0DDEbItuabIzkvMsFdeMce4jZHvOI3wu0gt/TzMIj6A9L
         DWl44WB6Y+Eo9T0GocrbMbsgfGszqDaeKq2QLyUkkUVAuBH1N6KOWucZDXobAo//cJwt
         VmUuevxzb1t4IPKj9xLxDVFs0LPYRu1ezOv3S6GMQRl+Hq0VAfAXT+zuEItIbUSJHGFV
         7tebJ+LLR0JfDCxNwFmytPdwmCI/1zLr/6SXgsBE09wQDMehqoWIZ3X/LXMPUY9mQ3I/
         pHuItzWsORDvM6HM0J4o/MLSO0jF1Cm+bxMqjKd/LU8HnyF1KYOeKhuypnOgx3yMJzTb
         P1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778955927; x=1779560727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SkG/mV7/+T57gOebLhjBWLUXJSJDsOeED6RV9YmxRq0=;
        b=fv4icGcZUY0pi40HvB9USFnTFMEhHFVDes3ZNdQ1S0nmVDejKk6iboAuApeYXqiiaY
         62i7AYaAxp8/k8TAf4YG6MNMfUefpFJOiEvWw4f3K1OAKsTV35ckBaH1mQrUKXIptBli
         Isx0gGkQgIm/sGjILJ0w4pRDij+aRzUDRD4+Cdw3Zu2QyWlKu08RWcE2L6LTD8QseNMG
         YccxdKY3SV2JRRYDcoNtfUsSEZGT0Y1rhT7bRPq17sGXjkSgnUnKfbEg/M4wBxoKAzC4
         WbYmjWb/d6QlhsdtUtENHiAcf9+loRJnEiBJUPuHaKy1NqUIYJ1+Nf7rmPX2nTP9+ZkE
         RCmw==
X-Forwarded-Encrypted: i=1; AFNElJ/p4DCWjxQT1XXPIucw6htBplxNEVaFpcMspr3tGL4TLi4au14lfi+oZwcaQnPQN9dLcBS1ZOi5nt6SwgUC@lists.linux.dev
X-Gm-Message-State: AOJu0Yx41LpgHR/pUkEPAjf8WZ7vIlIYdEXAg4xWWEDyWiQzvW3mrlBy
	xcsKfgKI6tUzcwyMiGUA6Mr7puhc2MmR8QXtES/CwUTp+rq3vFvwSpkvX761V95d1hqeRUxhYxy
	BNWv4xVGi2giKB7rKSTsNGwpsJ82eZw==
X-Gm-Gg: Acq92OGHo4W6F2AMx5cBNihFMeSV/C/QWer7BCAZAYouAexPWfe0cWD9XZOELQ1BcVm
	ViTSrYZ4E6xmB2H6co8U9Gs9MEUIn71HMyO6kcTvzLvBe9MpbnsWW7Yu3pAWzA2Kk+U8fGhkNxg
	1i3xcw1gJaQ4P0tFalrQlwrKlCFj33H34LsQ+DKbW7MybIQ5C4T8H3DFRhiKNA8SelRZEdcV5Pj
	jFY9Ao2cgrd0YGW7xl9syn24yyhKtmddqxFL1QrqnZqTAO/hF+vQYLVXvMJUxdkBj0tUpuWJgZG
	ZhYM7vcZL2FQqHt4WLDjSPwqzmESs0k9GQQllW/U
X-Received: by 2002:a05:6102:a4a:b0:631:3cbe:24a9 with SMTP id
 ada2fe7eead31-63a403acd61mr5104520137.31.1778955927317; Sat, 16 May 2026
 11:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org> <20260504-wip-fix-core-v3-1-ce1f11f4968f@kernel.org>
In-Reply-To: <20260504-wip-fix-core-v3-1-ce1f11f4968f@kernel.org>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 16 May 2026 14:25:15 -0400
X-Gm-Features: AVHnY4Ld3uQxrMVDp5dOpfkW5jEH4X-4ObNKlmAwKJn9zSPCBkcMEhByKE4-YXg
Message-ID: <CAMzpN2ijE3vqnh30T0ETQBp6qcVbsxNZZ32h4oEri9nBFUd-UQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] HID: pass the buffer size to hid_report_raw_event
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 4:48=E2=80=AFAM Benjamin Tissoires <bentiss@kernel.o=
rg> wrote:
>
> commit 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing
> bogus memset()") enforced the provided data to be at least the size of
> the declared buffer in the report descriptor to prevent a buffer
> overflow. However, we can try to be smarter by providing both the buffer
> size and the data size, meaning that hid_report_raw_event() can make
> better decision whether we should plaining reject the buffer (buffer
> overflow attempt) or if we can safely memset it to 0 and pass it to the
> rest of the stack.
>
> Fixes: 0a3fe972a7cb ("HID: core: Mitigate potential OOB by removing bogus=
 memset()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
>  drivers/hid/bpf/hid_bpf_dispatch.c |  6 ++++--
>  drivers/hid/hid-core.c             | 42 +++++++++++++++++++++++++-------=
------
>  drivers/hid/hid-gfrm.c             |  4 ++--
>  drivers/hid/hid-logitech-hidpp.c   |  2 +-
>  drivers/hid/hid-multitouch.c       |  2 +-
>  drivers/hid/hid-primax.c           |  2 +-
>  drivers/hid/hid-vivaldi-common.c   |  2 +-
>  drivers/hid/wacom_sys.c            |  6 +++---
>  drivers/staging/greybus/hid.c      |  2 +-
>  include/linux/hid.h                |  4 ++--
>  include/linux/hid_bpf.h            | 14 ++++++++-----
>  11 files changed, 53 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf=
_dispatch.c
> index 50c7b45c59e3..d0130658091b 100644
> --- a/drivers/hid/bpf/hid_bpf_dispatch.c
> +++ b/drivers/hid/bpf/hid_bpf_dispatch.c
> @@ -24,7 +24,8 @@ EXPORT_SYMBOL(hid_ops);
>
>  u8 *
>  dispatch_hid_bpf_device_event(struct hid_device *hdev, enum hid_report_t=
ype type, u8 *data,
> -                             u32 *size, int interrupt, u64 source, bool =
from_bpf)
> +                             size_t *buf_size, u32 *size, int interrupt,=
 u64 source,
> +                             bool from_bpf)
>  {
>         struct hid_bpf_ctx_kern ctx_kern =3D {
>                 .ctx =3D {
> @@ -74,6 +75,7 @@ dispatch_hid_bpf_device_event(struct hid_device *hdev, =
enum hid_report_type type
>                 *size =3D ret;
>         }
>
> +       *buf_size =3D ctx_kern.ctx.allocated_size;
>         return ctx_kern.data;
>  }
>  EXPORT_SYMBOL_GPL(dispatch_hid_bpf_device_event);
> @@ -505,7 +507,7 @@ __hid_bpf_input_report(struct hid_bpf_ctx *ctx, enum =
hid_report_type type, u8 *b
>         if (ret)
>                 return ret;
>
> -       return hid_ops->hid_input_report(ctx->hid, type, buf, size, 0, (u=
64)(long)ctx, true,
> +       return hid_ops->hid_input_report(ctx->hid, type, buf, size, size,=
 0, (u64)(long)ctx, true,
>                                          lock_already_taken);
>  }
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 61afec5915ec..a806820df7e5 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2033,24 +2033,32 @@ int __hid_request(struct hid_device *hid, struct =
hid_report *report,
>  }
>  EXPORT_SYMBOL_GPL(__hid_request);
>
> -int hid_report_raw_event(struct hid_device *hid, enum hid_report_type ty=
pe, u8 *data, u32 size,
> -                        int interrupt)
> +int hid_report_raw_event(struct hid_device *hid, enum hid_report_type ty=
pe, u8 *data,
> +                        size_t bufsize, u32 size, int interrupt)
>  {
>         struct hid_report_enum *report_enum =3D hid->report_enum + type;
>         struct hid_report *report;
>         struct hid_driver *hdrv;
>         int max_buffer_size =3D HID_MAX_BUFFER_SIZE;
>         u32 rsize, csize =3D size;
> +       size_t bsize =3D bufsize;
>         u8 *cdata =3D data;
>         int ret =3D 0;
>
>         report =3D hid_get_report(report_enum, data);
>         if (!report)
> -               goto out;
> +               return 0;
> +
> +       if (unlikely(bsize < csize)) {
> +               hid_warn_ratelimited(hid, "Event data for report %d is in=
correct (%d vs %ld)\n",
> +                                    report->id, csize, bsize);

This fails to build on 32-bit with this error:

In file included from ./include/linux/device.h:15,
                 from ./include/linux/input.h:19,
                 from drivers/hid/hid-core.c:25:
drivers/hid/hid-core.c: In function =E2=80=98hid_report_raw_event=E2=80=99:
drivers/hid/hid-core.c:2053:43: error: format =E2=80=98%ld=E2=80=99 expects=
 argument
of type =E2=80=98long int=E2=80=99, but argument 5 has type =E2=80=98size_t=
=E2=80=99 {aka =E2=80=98unsigned
int=E2=80=99} [-Werror=3Dformat=3D]
 2053 |                 hid_warn_ratelimited(hid, "Event data for
report %d is incorrect (%d vs %ld)\n",
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The proper format specifier for size_t is "%zu".

Brian Gerst
