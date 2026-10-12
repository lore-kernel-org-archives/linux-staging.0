Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF4A4BE43C
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 17:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827867; cv=pass; b=BL8c6+6skjVGknIvOb3i3oAvAFl3/Q1u80ZTd/j0z6LFGrAC9pRvKs8K7/GcD9ZVixuyLnu1i7i19rjqihpU83mHvyC9V+5gkJroykOQOkkWEopFQroYn7Bl5IMSHkFhYuz15q+0Cw0yeLrw8P6oqQE9EAMaFC76xxpTbk+4pUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827867; c=relaxed/simple;
	bh=tKHEGCY6r76koL/l5S9mzJ+wF3wLymIG9V6xeMYDS8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6yVrCb9ftv5TPYmBr9WVuHxtrnrQGcUfbtsAUyX0t1vGZA2vvjp1+E64khGYal1syQncdZv9/bqmBnYnSddAbB3WSDtAfcJIf+dXS3491fuPPOkAnUbg1VlBMhTuK3FwEAASDiVP7+wJ9nCTDiZRvHRBPNcLOuu0R/poruZATY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZmGoWPY; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZmGoWPY"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso295869366b.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 10:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791827864; cv=none;
        d=google.com; s=arc-20260327;
        b=TXtBlqd4k/TaQWZT8nnJ5mHdI9TBCK1+8UUNGL3xae+d13JhN//0Y05yKLOmKjDF8T
         WAFXjwrnsca4flshS2efBrrxIkoZulyPkY6Jv79KbloG+zcJo1OHMUE6MxD0ac4r/m58
         gTHKs8tcendOyUCwa+BmhDWIgNGKYagl9Nsdq+GGdHiJNwuG2Hb0qawE+7d31dX6MaWH
         GNi0PKvGtSBfE0enq1zNfzU68gk4TVwPF8MjcMhNZcV2Ju7MEdtSaO6Kyma3A4hlwkuL
         DpmHOWtLEpvHhyW3EFABo0k3T8SpAmAUiR0Fm0yUb0z5yBS569RwagJZrtbKyndCOV2P
         +oQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rvsjKUEKpCMLc9hcdJqN8gh1y0AqhQ0pFlm8r1MXE7M=;
        fh=qX0C5/GrSpn1lhdC69A/iYBkawxFgKQiTBttVQc5suU=;
        b=nMCUkQBFOzqDYEHirwfgmmP6TV/NIldS2l2vUwqzN0lcj0qapRV89eHBSjuEOjntcT
         rRycgxuVZxWXz1cDu6oHIcUn+yf/wGigwayACaZ3gTvTkZgIz4w8hkI9GpLwtga2VsDH
         arqtG9fO97+noHnfnZMgholipT0R6kVQOT8c6OLtcp4EbZTlMjYzWUF7pmKboh5Bsm3k
         Ufl7TQlRyaIUkOanBv+QiKoQDLeWRyjmwytWNywH0KCqbS6Kol+3LNWQ69WEGFDwOEeP
         zeJgASZUU4zucC3Hm08gPv3Znh+whxYiqFRLoMJMXUd06h6zcM36e6ITNDoR/YRP3E6C
         fMdw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827864; x=1792432664; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvsjKUEKpCMLc9hcdJqN8gh1y0AqhQ0pFlm8r1MXE7M=;
        b=BZmGoWPY+wYOz8gQJzdMJzGyE8L6wcc42YAwP1t1Fx29eTglJMGoWowqqOY3lmuE/g
         KQE3oIk9ra+WT1qNRuAWl+ciS0pXAJuR0myiDiH3PQtpLka4GGMU1mRw7z/DfMfZIBr0
         OjQaWc3CGnXer1R0tNWGhlZqxhziNBPIzck2vKqDvCsoiZY9mNLNysf0KFH3/U7CNyEP
         1RZYlo2fY1DgsWSjX48e6k1/gsLiFSlbIMyjtCQmhabGrzUeWh6npQZyfr4WlvPf+rts
         cGFPxmXD5bTLnYOfwjohOSgCG5Lm4yJe6zhhOvDlEPSEHnecQeA79YFH+lE6qYGiKTtK
         ukOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827864; x=1792432664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvsjKUEKpCMLc9hcdJqN8gh1y0AqhQ0pFlm8r1MXE7M=;
        b=j72LXVwrSNncbo3iJZXEIfPCJsx8pjacGj+10cFsh90eBrwirg5fQkKmBmPfIlmScz
         dvgViqMN+vEKvO38YHzRj1fatOaNVSLT7I9/BhKWi/vW8kEw45cr8+SWfa+jVUWvjiOL
         ZiQgrLvEYANTohOE2T5mU+VIy4WuryigWxwuuJUFJbOo6wcuuWVJ5T9nk2eAyLllLt0I
         NW5lkZOrM1Wq6ZGPEeJ+JhbL5tvUAo/DLlhK77dkFxN2Mq9RUmXofp9V5CGSwJBbxdPr
         eEuV434HSkP9aPv68FfMA1Pz1d5ODwLRuZ5Rsw3QxgHo99q8m0HRA1kLG+Yt3tzmE9NC
         RmIg==
X-Forwarded-Encrypted: i=1; AKwUvBxMWS8w7pGztQtLjTQCS5V6zaJ485/3NDWTMCkZ1EUK8UgYJhsXtoqHN/l67Zm5c3b9HoCb3YoyQWTpqSXx@lists.linux.dev
X-Gm-Message-State: AFq9FYLZSvNd8oV3NgsZ1eGPGuRDGarzoFu3q7adExHP5dAk+U0yVUR5
	dH2/TfW9189eIgPlCwZ1X1xtBPnPfVzmfamDObgU8r3y8E6JCzUEompJQLsi8smxKtlcdn5YcQD
	IK5EM/7Es8gpeAOMR3v+jIK7FRzmDZFU=
X-Gm-Gg: AYBFou15GTb0pvn0+yJ9vyENhJua5mSf03Qvj892AJCUZwYWQ+amkvtoHRE5hxzEdPC
	tD0iwLngH9S2HsHBzCPoeain0vSTzaBZRbRFA5L6TpaoF2BseHO4vUKdH/OJMZvOlb00ORdgVUa
	ZfVt7OgP9H++ph+5IK/nUDqlI7GR5r22yKgWXlEtl3r5d7HDhUnALM74dKO9IDiFC4rFFOnMcI6
	OmIUoYLKBdAMZ41GmWjrVNgYGI8jlsKFwEIK1EhMBaUr4zf9cbSfgyVPxE734EzN8qgtV+etkYP
	MTCFcUM1LCgnxBQJbVCPXB0MktWuU0lhdIuBhN/uEVFhDYI1kNSagnT7+kBiM1zWy1v9VrdUIvO
	8MS4fD0jheqeW
X-Received: by 2002:a17:907:eccc:b0:c29:7953:6c06 with SMTP id
 a640c23a62f3a-c31aa0f72bamr946074266b.49.1791827863579; Mon, 12 Oct 2026
 10:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012170014.68898-1-pavankumaryalagada@gmail.com>
In-Reply-To: <20261012170014.68898-1-pavankumaryalagada@gmail.com>
From: Jeremy Clifton <gservice341@gmail.com>
Date: Mon, 12 Oct 2026 11:57:26 -0600
X-Gm-Features: AclHuK9ZnaJO_VOcPMtAKRiGApXxopBu_93ZaUEgo7I2pXSxZlLgJ0Tt_dcxXaQ
Message-ID: <CAC2RYzLMQSOi961mmyNkK1aVuMDafXdvRj_mCEAZQnU37sKA8w@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: replace PTR_ERR() with %pe in error messages
To: pavankumaryalagada@gmail.com
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org, 
	elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For this patch I have only one immediate suggestion.

The firmware management case (case GREYBUS_PROTOCOL_FW_MANAGEMENT:)
should match the other cases. Found around line 96.

You've changed the pointer variable to display and this seems correct.

For consistency, each should match.

On Mon, Oct 12, 2026 at 11:00=E2=80=AFAM <pavankumaryalagada@gmail.com> wro=
te:
>
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>
> Use %pe to print error pointers directly and display their
> error names.
>
> Keep the other PTR_ERR() call because its return value is
> needed for ret.
>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> ---
>  drivers/staging/greybus/fw-core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/=
fw-core.c
> index 2016a74f137f..7053afa9ab3e 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>                         connection =3D gb_connection_create(bundle, cport=
_id,
>                                                           gb_fw_download_=
request_handler);
>                         if (IS_ERR(connection)) {
> -                               dev_err(&bundle->dev, "failed to create d=
ownload connection (%ld)\n",
> -                                       PTR_ERR(connection));
> +                               dev_err(&bundle->dev, "failed to create d=
ownload connection (%pe)\n",
> +                                       connection);
>                         } else {
>                                 fw_core->download_connection =3D connecti=
on;
>                         }
> @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>                         connection =3D gb_connection_create(bundle, cport=
_id,
>                                                           NULL);
>                         if (IS_ERR(connection)) {
> -                               dev_err(&bundle->dev, "failed to create S=
PI connection (%ld)\n",
> -                                       PTR_ERR(connection));
> +                               dev_err(&bundle->dev, "failed to create S=
PI connection (%pe)\n",
> +                                       connection);
>                         } else {
>                                 fw_core->spi_connection =3D connection;
>                         }
> @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>                         connection =3D gb_connection_create(bundle, cport=
_id,
>                                                           NULL);
>                         if (IS_ERR(connection)) {
> -                               dev_err(&bundle->dev, "failed to create A=
uthentication connection (%ld)\n",
> -                                       PTR_ERR(connection));
> +                               dev_err(&bundle->dev, "failed to create A=
uthentication connection (%pe)\n",
> +                                       connection);
>                         } else {
>                                 fw_core->cap_connection =3D connection;
>                         }
> --
> 2.43.0
>
>
