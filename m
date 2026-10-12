Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EBA4D2EE0
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 18:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829920; cv=none; b=XS2NJjBAHdxAMJOpaNO/jHcnseq1b+KFqWtjOe2w81uHQRLyX42jkbQVk+T8xiVuzhPMnWOdq/V15k5GAcsXq3EuFG0wnE/Hcd5o1r0iY1MQxK1Fl54Op/7fmXc2/mbFWeHVkjuWWKc4//J4ZdHoaVolg1LoCM64y6CbF84TusM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829920; c=relaxed/simple;
	bh=k9HtPMK4WmShh9hH2m6JsRRZjIhJbSVtYZbsq3mNdfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=haT+WH//xRooQNWo7jq8HK4S1UHEARSyMKIxnBjpf3tHbNia4o4Q5eQTpH3Uhw0KH1yoDjb0WrrdW88Du2xlzAMj6nQLYzebDHYWId7yF5r987QwVavtBWd19OpAf3IsA08dt/7vTDk7tYp2Pt0nlZiAUiIKFd7BKbL2MAVThtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rD6etQKX; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rD6etQKX"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso487487eec.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 11:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829919; x=1792434719; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vuxsYH17qqFJ+udnCi2xzzMEsHX7wYHv3CZAY6j8oU=;
        b=rD6etQKXglndFcQG1HfbkxjpV8NzAaqS0oM3WfWhyoj1HIsgSy3vNIzh4wzLPmV2IO
         SL3jsc1rnWSk+XzOB29l/3xk8AL2zGyHm+EHAcPj1Yo38H9vl47U2uu9mO/BpU2Rbx6o
         UmJ40e02eqMHduMEcZWv0Y2giwz8KrXuvNTestwXZUiwAhGo3ipvEZAxnRkXB/GmUoJU
         u3T91fMbYcAqw/NpR/nRg8ySxHhZsmx1tCDTKfeHSTPAtnQkYo1anQfzx8Zd5qCuoTSU
         1m7+4PSUiVymzkdwHLiw+KH+zALA05/YMgB7YjGed7KsFcjHWXPAs6bE8L6zj7/EYpyG
         tHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829919; x=1792434719;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4vuxsYH17qqFJ+udnCi2xzzMEsHX7wYHv3CZAY6j8oU=;
        b=V0Vqo2yhn5BcIDDEXapL+PxGInDXBW9oe+cBafIp/tzdixeUv0+dqW7PrmjwgdHddT
         r1MIcUMt+pjNCg9bc52R+8mfPCnDfEI4NZlJbSAOE8BMtqkLGsR6NeGVrW5NihHNBZQ9
         Rr7eqXLT41yHuS62psHtYBAcjTbASB2nxZ4AnzqBVOukzmjcFgg+PWadlmgvmdmDRCmQ
         vZwSpStpsWshvmr1uH6hbMlRCFqF4suwbH6t9L9TT/xf4phEBGef2HC/wX6KrU3WME6c
         h5KoJoA1FlEfoFk2WSP4ijYXsBbWtf/yYF0StQvp7saI5RthcC9ZFmLVgRzrKgZbnRvU
         Mfew==
X-Forwarded-Encrypted: i=1; AKwUvBzto1A1wVZEPhmwhbSk/mJqDXsmG1c4lgIG/nND5dlaSRpjIGIf7fiQJw7arqDozoH/SumGIOdDnTA8RziE@lists.linux.dev
X-Gm-Message-State: AFq9FYLP7xoWh07HrqNjPTe0F1wpXq82VUr11uFdj/qDpFb/Pr4fyPZP
	hVImBuNfS147+zWJF9qYbcdxTykY5d+/JklM8xVX56aIBz3cObUiVGAzmVor6MIv
X-Gm-Gg: AYBFou0iUg/TwgZywrO3JuoXowjRISa5PE8fdvrwEucReXMp7sTx7aJcglWmX0PREly
	rgsCRj/taWMEmlX5qqu4DkITX1t1pXClHY8SKCJuu9wt3Shs2XrXvosqQq012FXKKRy+pmCqhvZ
	l+YWJHh4OYMybB0eH8D6iDHdNeORYF+AH4r3MTQ2kSm1/fJep/Ss2dtJvtSTt8JWM9/pTPQD/ON
	Gmy86Tb4GmZoYH9J8+G67Kdq/NNsDZT3u8nS2vOeBkgSCN4oSup2ujiXfNlLzL3lmBUdHxLagpO
	SY4An0mkN1p7v5bgKStgxE/rH4WC3ePZdEjdvw2ENpXiHysacDn4I6cbtKCgj6eEl4AFx/16e78
	Gx94YWTFyc0fLqLshyGuzd9hSGfD+uCsTrmpY8Sujf6IcR+Q3QPNx7YuBwPQkFqxF/DjmDs0ZSG
	Cy9AJmCiL64UE6+NECyDGE+tIMzZwOFHOn8Rm8sbcQTAtcm+K0z9SfPtARMPAmgPZiJe4uQ5BNB
	YwHHUsQsoBzGns=
X-Received: by 2002:a05:693c:8811:20b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-3567ddb2f02mr13073058eec.29.1791829918494;
        Mon, 12 Oct 2026 11:31:58 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:c154:b925:c82b:b0a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm37755039eec.21.2026.10.12.11.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:31:57 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:01:33 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Jeremy Clifton <gservice341@gmail.com>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <as0nhVbagZa8Birm@user>
References: <20261012170014.68898-1-pavankumaryalagada@gmail.com>
 <CAC2RYzLMQSOi961mmyNkK1aVuMDafXdvRj_mCEAZQnU37sKA8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC2RYzLMQSOi961mmyNkK1aVuMDafXdvRj_mCEAZQnU37sKA8w@mail.gmail.com>

On Mon, Oct 12, 2026 at 11:57:26AM -0600, Jeremy Clifton wrote:
> For this patch I have only one immediate suggestion.
> 
> The firmware management case (case GREYBUS_PROTOCOL_FW_MANAGEMENT:)
> should match the other cases. Found around line 96.

Thanks for the review. I'll update the firmware management case to use %pe
for consistency and send a revised patch.

Thanks,
Pavan

> 
> You've changed the pointer variable to display and this seems correct.
> 
> For consistency, each should match.
> 
> On Mon, Oct 12, 2026 at 11:00 AM <pavankumaryalagada@gmail.com> wrote:
> >
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > Use %pe to print error pointers directly and display their
> > error names.
> >
> > Keep the other PTR_ERR() call because its return value is
> > needed for ret.
> >
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> >  drivers/staging/greybus/fw-core.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> > index 2016a74f137f..7053afa9ab3e 100644
> > --- a/drivers/staging/greybus/fw-core.c
> > +++ b/drivers/staging/greybus/fw-core.c
> > @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >                         connection = gb_connection_create(bundle, cport_id,
> >                                                           gb_fw_download_request_handler);
> >                         if (IS_ERR(connection)) {
> > -                               dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
> > -                                       PTR_ERR(connection));
> > +                               dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
> > +                                       connection);
> >                         } else {
> >                                 fw_core->download_connection = connection;
> >                         }
> > @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >                         connection = gb_connection_create(bundle, cport_id,
> >                                                           NULL);
> >                         if (IS_ERR(connection)) {
> > -                               dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
> > -                                       PTR_ERR(connection));
> > +                               dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
> > +                                       connection);
> >                         } else {
> >                                 fw_core->spi_connection = connection;
> >                         }
> > @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >                         connection = gb_connection_create(bundle, cport_id,
> >                                                           NULL);
> >                         if (IS_ERR(connection)) {
> > -                               dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
> > -                                       PTR_ERR(connection));
> > +                               dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
> > +                                       connection);
> >                         } else {
> >                                 fw_core->cap_connection = connection;
> >                         }
> > --
> > 2.43.0
> >
> >
