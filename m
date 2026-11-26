Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713445;
	b=KruHXW95wL3veeDE7cqsYYmxXI0XTY1RMculLwual+5nd4Yzl+n8RAweCM6FsWp7Z0r9
	 bdCTyaZRqOtOmgfR8n4w8m0Dmy/oG11fjf7KwRIn8D8n2XDLCS/9IpDo1fqPF+rNp0mjf
	 YCcW/RGxcQnsQyHbvd52rAZgI8wyxiXOclQWEtLTBrEZRRlJkJLozNTfwLO/w2MOxNhrz
	 f9Ttv7wMoMR1am9BuXiTN9SMvDcfIK2ZgIP6bIWgbc6z6Vmz1V7zHdugZ2+H6UmFh3pdG
	 CPWTGDBIkbb/MoXJe29avoQIBbNqOhiNO+5ilgJRFyJbofQr/zeiy6ZLc/hWi8dsBHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
	b=iUVUv3CrVVRKa/FP+99re7t8Jjtg0TmDJr9ErGUXwZjA/auEjKVfBWQtUSMAPd3itow/
	 UknClzkaIIuxTY35gSp5kpHovs7lQHTO6L3TWkLsO++Nm3hNV3ZWF5V9+kzM/r2s4nVvl
	 LMRE7HQx3CFiRSGEyGi9tNdM9vLUhIkk7P4ojc3IuyPJ3DEKqLwCQD7SrpMx0u44KJBlH
	 2xzX8y12/ui5D1V5lJyMT6BzMB109jEpmk1Wd7pdfvidruyZiZW15klsAmlMXaAzAKy3i
	 I3ER5WjKe3ZZZR/rknFlptLakIA4hMF2PzWpFiwAItEmpTvtbr3+VtsMfoC071J3NdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRT59NAE;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9063E606A321
	for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 17:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9063E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRT59NAE
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so5066763f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Nov 2026 09:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713443; x=1796318243; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=kRT59NAE3U7OOHoiyS5mGTpvjfExiGuuOufdIl7B4V0cO9fMviNbQma4NEF1F4AFie
         q9zBmm3egI1i4dzu60EUB1elUdY8giwHQZ9HWK/9rAiQPvON7wWVw8JaJWP6RwjLjo0O
         lovqtxv8ssH/ZPkHMGH6bMRTM6LhaRX2gAkM1ipZVBiSANRjBDb+r1VQVxxc37cYgy6C
         DJg30Ei+GUbnO+2dBAer4SYJulZReK3rAMGs/SWrp6cHSy2SGvsnd0J2in1v+yKl/x6F
         1bEbeQgynHodpz95mOJzT1LaehZKvIqtBLRTsVfzpXMQt6Dx1KHC+9K3kIQ78WrMt5dF
         gqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713443; x=1796318243;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=u6Kk+RTFZb79vWDoZnAHLyvio5M3nXkA6X+U95sgHYyYhoUJmDUp6rVXB5+rsgwCQQ
         7lHEBAiVsfQtMZmMK99KthrRoAhaDWb16Z+pSXwf/zlX2OwQxq1HE38oGcEXSlHQ8jyt
         2EipcdFQcxOebPKLzLmVbwee2YHhldBoJQiFQXq801FmkD6oNPf3VYKAPjS/geVBkT67
         0AQPa5IohXAF9TGnMJwWh9QlONRa84FaejQTL0ZVJetec949STx3qz4QM6f1KAV7+8Kw
         et56hJNCEka71JWE6VmoTxS2V+xQQltf4kS5/EWNry0KET/n/0tkcOldA0KARIxO+cLI
         ma0A==
X-Forwarded-Encrypted: i=1; AL+hErFmtfCKiISpFsy/oggxs2FBmpPG0BTjg0GFzpA+Bbb8Uw0OK/JNrSrhCFB7FKaTcV4dkKBpDxDY28n/dT7b@lists.linux.dev
X-Gm-Message-State: APuU4Z8l/wVxr01t24joZPesRdG96kWAFM6pJmsqPkXoYjQ2XpvpOwI/
	0w44YKXwYB0exGJIxTtDarcAVgXiPBQa+OlF5WhSLInaQDrpQInzMn/r
X-Gm-Gg: AZFdTZfBgnT+QOVXPdda/QmMFhRGEo76JiJYV9gpePvuLknoet0yuoDbw56j1kP4fw7
	qh8SDOHeqGkmeQ+W1roNuaxqST/QnpReBH2T43NR0RhXfVbZ9Uz5qL697gcBDDlbhiYJ+ARzG0m
	PXvU3dA8tIUVl8TjDG7MUXKlbLMW0sIDNSZceS/D3ZM6Ifbsec9AKt6BfmJXE6K7kW6Tncf8pRu
	Wi48IXiLiN7C1ZKpfBOv2xh6D+372LgTrCGjsXHMZ1/4gE2v3syC0esG5PAB2qDxjLI0p19YDBC
	e8m8C8MeR7YvZr2e8N6AMk9H48VVdIP0MLJaws5OIQTLuSlX5mwcTuL4y19W/1cNlTnxHMp9yqm
	gaUy6A36QJNAhIYTOO+a3pFIOtkwAQit4z2bmp5PqKQKWtHvbiCl05p2DowMv/aBGkAXXw8X+La
	m+MLyU5fQer9SI5Ej3xRmw1XOYnJeYjZK2qKoVJv70F5walGAi05DtaRfbbMIXDuaWG0XeMQUTp
	iYkUqA6Dq7k+2ZXVXwsScUfU46g2txIKAMSgnG8c7PV69ze9GYgc9fP9j+Aih5cdK0u+tbiqiP0
	sCu6kcmm4ycSSME4u7+cpCcvMvM8kMqQNhRnoUOLwKZ/8HndXw/4jwQEtdhpDqRpaI+unr6purR
	F6uwcHD6m49CLbFV5ybpt0iuHcjd4nb586Wn43Ng9tqrk3PFwpdHoEXGvzAIxf3BwKJFIKGIaK5
	5bGswjvYow8fqUGwIi7bAfwDUyK7BC1qV2yoF/lKB1kcVRnC7tOGXv+1UVw7IKUCTHeZ9kvLitu
	jOFIXkJBwRvNdJXTBkvCjFpQoe+riwgsH8mDKDlTgBR3KGiITjDuqi30XVh6RrhFD3LpoDYQIex
	nHoHHrul
X-Received: by 2002:a05:6000:4028:b0:4b7:6dcb:e909 with SMTP id ffacd0b85a97d-4b76dcbeaa9mr18536789f8f.8.1795713442699;
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm39409423f8f.26.2026.11.26.09.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 aiyengar1990@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH] media: cedrus: vp8: do not disable the engine when a context
 stops
Date: Thu, 26 Nov 2026 18:17:20 +0100
Message-ID: <G0WUYb9qQ46JcwzsVuhrfA@gmail.com>
In-Reply-To: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
References: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 12. november 2026 ob 17:08:44 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> All the contexts of the device share the one video engine, and the m2m
> framework keeps running the jobs of the other contexts while one of them
> stops streaming: stop_streaming() runs under the device mutex, which
> device_run() does not take. Writing VE_MODE_DISABLED from the VP8 stop
> callback can therefore switch the engine off under a picture that
> another context is decoding, which then never completes and fails on
> the watchdog.
>=20
> Every job selects the engine mode it needs in its setup callback, and
> runtime suspend resets the engine, so there is nothing to disable when
> a context stops. Drop the call, and the helper, which has no other user.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

This is correct, I have similar patch on stack. However, helper to disable
engine is useful, but in different place. No worries, I can reintroduce it
once I came around to post fixes for concurrently decoding issues.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Tested on an Orange Pi Zero2 (H616) with the same change on a 7.3.3
> kernel that carries further, out-of-tree H616 cedrus patches (VE behind
> the sun50i IOMMU). The old behaviour was brought back on the same boot
> by a temporary test switch for comparison. The test is a 4K H.264 decode
> through FFmpeg v4l2-request while a second process opens VP8 contexts
> and starts/stops their OUTPUT queue in a loop. With the old VP8 stop the
> watchdog fired 12 times ("frame processing timed out!", after two IOMMU
> page faults at address 0), only 289 of 300 frames came out and the md5
> changed. With this patch all 300 frames match the reference md5 and
> dmesg stays clean.
>=20
> On media-committers next, the base of this patch, it is build-tested
> only (arm64, W=3D1, no warnings); it has not been run on that tree.
>=20
> This patch is independent of Jernej's pending series "staging: media:
> cedrus: assorted fixes and VP8 4K support" (v2) and also applies on top
> of it.
>=20
> This patch was developed with Claude (Anthropic) as a coding assistant,
> which found the bug and wrote the code and the commit message. I
> reviewed it and tested it as described above, and take responsibility
> for it (Documentation/process/generated-content.rst).
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c  | 5 -----
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.h  | 1 -
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 --
>  3 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 444fb53878d1..a22a8402fc60 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -71,11 +71,6 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
>  	return 0;
>  }
> =20
> -void cedrus_engine_disable(struct cedrus_dev *dev)
> -{
> -	cedrus_write(dev, VE_MODE, VE_MODE_DISABLED);
> -}
> -
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt)
>  {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.h
> index 6f1e701b1ea8..4edf729c556d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> @@ -17,7 +17,6 @@
>  #define _CEDRUS_HW_H_
> =20
>  int cedrus_engine_enable(struct cedrus_ctx *ctx);
> -void cedrus_engine_disable(struct cedrus_dev *dev);
> =20
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 969677a3bbf9..4438c7e1bbda 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -856,8 +856,6 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> =20
> -	cedrus_engine_disable(dev);
> -
>  	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
>  			  ctx->codec.vp8.entropy_probs_buf,
>  			  ctx->codec.vp8.entropy_probs_buf_dma);
>=20
> ---
> base-commit: 3fc9303dba01676c2090768126e5327e341b7761
> change-id: 20261112-cedrus-vp8-stop-cb2d66d855ff
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20
>=20
>=20




