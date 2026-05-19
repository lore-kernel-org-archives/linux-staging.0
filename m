Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE023BD1B
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195140; cv=pass; b=tGve00U4C37VYt5uYLRfnK7a0N0LcKXEhR6qAcpsGB0jRJV+ufv8tS1qXocJyMgYNUNce1yCTx+dwp8ZenAm+XoFFK2uj4H3sK71D/42cadQL5pdXDZKl+DZdDcFn3pN1bHsd8FSLMcHJM3SKP7IXzRR0WR7i9tbGd/YODe3N5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195140; c=relaxed/simple;
	bh=a4BQ8I08x1EPEigNRSyXm6VtrTFQK4h2Nn2Ek1yqIqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=too8lsBLUi42XONKyKSfGH6OfnWlX6piSX7FHWuud9Y7O96ln8OwwX6OQdwMCgcjsXeJKr69DaX7/ygdUOp+NSk63kWle0LDId5gw9wRYP5lv/Zc5UhwqFh/B7Hb1i8yz7YJrQVnKdaJAxjO6h2xDAqsSZK9/ne9xqq3B5Zh0k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csFjeW8h; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csFjeW8h"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd8f9725b30so190614866b.3
        for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 05:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779195137; cv=none;
        d=google.com; s=arc-20240605;
        b=V7CIybiVHgmpYmlguoKU0VpHjWfHlZGTY+/qoUfNSU/5BRF39C2PMaCcOnoeamd098
         //BIbDUZdz+5OsC43cCPdPOE3VqVL6HzXUG8QYHn311lc9u3d6v/E5eNeFe5kUauHSlO
         Y38mqJewfpjeJdLeqPy8Qee+tWJniBo+tpdYWMPviolV5/GF++LHJl/5oiOIlnSqpWBO
         WxJdszrJbpM5jaBp776jcrIB2gG7DVizFoCZJbOgb8/SOblq+AqJYJVsMp/HD0T3WMY1
         glH9ilIVwoStLkaslbta9m2/m5sULASsJt8uPbsUR/54JP4m2JEWj6CiJ4s7lhT3lvAD
         eACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        fh=3/tm5acniZPUSbtC3sf+JZ1tpG5Q4Ht0bc+V0VquDy8=;
        b=VMjt1vMO1yCcpvMAh0rCTYzTVfIfCyc1MdJ4Yr1yE9oPiwm18qFb6V8IMgOW6ppICQ
         3gBHiDCJNYWOKy1iRs8vi7c909oywZWUIs8++yspclmn+QjQIKancKmo9WbZU/muCyDF
         8dtD4wyinEuxIAGtLQmG3kCbbOkkhAzdzf053u33PeiswubfgkOleTx/iqXaiQlPs8KG
         xqYQrlTMz18DbtFuMa5mOBePDsPbxozWkPt7gu42uvWKQZoySmKrSUvHMd59PCreAJWA
         2jxHQmujMIhQpHSPIW19Jb4wClSxTwo4ajJUjmmS3s709GTLdVhYtJug8lAnhrMHcAYu
         KY8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195137; x=1779799937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        b=csFjeW8haA/soTMT7Zk2AM7JeWOQRMEdv6XIoAZ4yYSAdZFoN5sL7oRv8sW1XLBwtS
         BCcya2YLLcA043Sw+K2yUcydWUtpw64WQKPvps0uRbyFjo3o6WOPQfaPxxMry8vI/MRY
         sER23XklGbXOcpIhxFCZJfHVaP76LhGf3iFY9NlmtwNRjpVsoYUqdFnyWMr1kKTXl77G
         ouAFhXj6B5iruW4Xi5v+cWmMSlzVpghRHij2rewDal3REN9+0I5HoEfj/qjrZ6db82ZL
         gD9tcKUBTB+f+xRiYHUAwsjrj1E8qlvgHqm7ZIRIHWjKr34SS8tajpPlp0XIk+SsPyJj
         NEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195137; x=1779799937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNhrOfvUs4Ys3+1Z3tMpWGGrhZ7sbxpwpvvFyMvDqg0=;
        b=PaMNfpt7AmAbx4qE8gsXVRqmbMpZWH8IduOQM9bxJG5qyIT8NqWtTawK5R8DfssIwy
         C3xKLwquStf15k2qql7O/fu/eVc+/RqDrwjecbEajyOY04zT2jWJi0f0FJbakaBqogR8
         gB2MV+tnQtLB4BZHKzJFeIVLBm/JFklAHzZpJYz3ONTORtoJahs+djeHKVk0ZE5qUX9J
         A1NlGq0vBr/A+wLOkm2v8T4dM69+VqxvW1yrjdN+FSdFXy4XAkjdZ85U9AFvfUg2RVhQ
         PFvQS1Y3dfOlejrto2emdeTMkuyJ9uaJOdSh9pu3in5WZgoqZsn3D7goE5z93YfJBUxS
         omvg==
X-Forwarded-Encrypted: i=1; AFNElJ8z/kPtr2M2fjOgeER4VJQTecF2tbr4OiDIHzLnhT/QNs+C2EVO40N/5F7e49cCpnUBQii/y3qnaNFH2Yrp@lists.linux.dev
X-Gm-Message-State: AOJu0YyIdNAI/htPiELC2x39dwWjzsKo4ckvVB7qBQU5QkCyqq30zedy
	UmZM13Q7z+kPVFtxw15cK24mKisPDOATHR12aHn4UQ85Y7AaikVE01XDG183PllO1RxddCkwn5h
	gR/dpT9Ktdt4alclhESVVAERmYZQHjLo=
X-Gm-Gg: Acq92OGjP4kBCHQxPB3+zY638dSMnB4y+fnSt1CCwIaR3v7DnjxH5cyfkjsg9uau2PU
	e5UERfeciXUkp5aoR+oBNakaJ/ZqI2gHgSBx8buTwRn0CLgKM/UzMPBTXbedJ3eeywIVGbNgA3y
	F/Yi3ACnyJf4syZDUEE+4+DmLjWgjIwOsZuzcX47pLafSUlMxmX4WNQkxyTN4aQsoiBQaRVI9v+
	iyQABNsbB5CF8LgBi3E/laP6A7Urzbkv0gE3SH3C8CV6Zb1uwIvj8jTTViZBAgsbyUS6gNOHhzD
	rgrsQg==
X-Received: by 2002:a17:907:971b:b0:bd8:61ff:f916 with SMTP id
 a640c23a62f3a-bd86200058amr420267566b.44.1779195136644; Tue, 19 May 2026
 05:52:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260321065408.209723-1-linux.amoon@gmail.com> <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
In-Reply-To: <49260ed9ce09b0684ed72787b5635e2c26059297.camel@ndufresne.ca>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 19 May 2026 18:21:58 +0530
X-Gm-Features: AVHnY4JJCSZj_mhTfm6UH5xrsKXtX_jQr95CpJqy1MIGyRQBSz4PwDNhz0eVEgg
Message-ID: <CANAwSgRf-pPwsqfXTALrnYV2e7K9bkbOzNrrFjB5pA0QjT1hhg@mail.gmail.com>
Subject: Re: [PATCH v2] media: meson: vdec: Fix memory leak in error path of vdec_open
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan <mjourdan@baylibre.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas.

Thanks for your review comments
On Fri, 8 May 2026 at 23:28, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi,
>
> sorry I missed your patch, catching up now.
>
>
> Le samedi 21 mars 2026 =C3=A0 12:24 +0530, Anand Moon a =C3=A9crit :
> > The vdec_open and vdec_close functions in the Meson VDEC driver failed
> > to release several resources, leading to memory leaks and potential
> > use-after-free scenarios.
> >
> > This patch addresses:
> > - Missing v4l2_ctrl_handler_free() in both the close path and error
> >   exit of the open path, preventing control memory leaks.
> > - A leak of the M2M context if vdec_init_ctrls() failed.
> >
> > The error labels in vdec_open() have been reordered to ensure a proper
> > Last-In-First-Out (LIFO) teardown of all initialized resources.
> >
> > This was identified via kmemleak:
> > unreferenced object 0xffff0000205d6878 (size 8):
> >   comm "v4l_id", pid 5289, jiffies 4294938580
> >   hex dump (first 8 bytes):
> >     40 d2 49 18 00 00 ff ff                          @.I.....
> >   backtrace (crc d3204599):
> >     kmemleak_alloc+0xc8/0xf0
> >     __kvmalloc_node_noprof+0x60c/0x850
> >     v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
> >     vdec_open+0x1f4/0x788 [meson_vdec]
> >     v4l2_open+0x144/0x460 [videodev]
> >     chrdev_open+0x1ac/0x500
> >     do_dentry_open+0x3f0/0xfe8
> >     vfs_open+0x68/0x320
> >     do_open+0x2d8/0x9a8
> >     path_openat+0x1d0/0x4f0
> >     do_filp_open+0x190/0x380
> >     do_sys_openat2+0xf8/0x1b0
> >     __arm64_sys_openat+0x13c/0x1e8
> >     invoke_syscall+0xdc/0x268
> >     el0_svc_common.constprop.0+0x178/0x258
> >     do_el0_svc+0x4c/0x70
> >
> > Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> > Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gma=
il.com/
> >    tried to address the issue reported by Nicolas
> >    improve the commit message.
> > ---
> >  drivers/staging/media/meson/vdec/vdec.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c
> > b/drivers/staging/media/meson/vdec/vdec.c
> > index 4b77ec1af5a76..3a5e4ebe0b34c 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -877,7 +877,7 @@ static int vdec_open(struct file *file)
> >       if (IS_ERR(sess->m2m_dev)) {
> >               dev_err(dev, "Fail to v4l2_m2m_init\n");
> >               ret =3D PTR_ERR(sess->m2m_dev);
> > -             goto err_free_sess;
> > +             goto err_m2m_release;
>
> If m2m_dev creation failed, why do you want to call v4l2_m2m_release() ?
>
I don=E2=80=99t recall the exact details, but the current handling appears =
incorrect.
I=E2=80=99ve prepared the following fix to resolve the issue, based on
sashiko=E2=80=99s suggestion.

[1] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gm=
ail.com

-----8<----------8<--------
$ git diff drivers/staging/media/meson/vdec/vdec.c
diff --git a/drivers/staging/media/meson/vdec/vdec.c
b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..a039d925c0fe 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)

        ret =3D vdec_init_ctrls(sess);
        if (ret)
-               goto err_m2m_release;
+               goto err_m2m_ctx_release;

        sess->pixfmt_cap =3D formats[0].pixfmts_cap[0];
        sess->fmt_out =3D &formats[0];
@@ -913,6 +913,8 @@ static int vdec_open(struct file *file)

        return 0;

+err_m2m_ctx_release:
+       v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
        v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
-----8<----------8<--------

Thanks
-Anand
