Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D247A
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 06:10:40 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 11so3864935edw.0
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 23:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yZK1aloE4NcRFJpUcMOYel3NphqGgMdnwyOVwX33QOs=;
        b=U9+WVlHalxi7H57sau6QSkuKMv2MWHS/5P+S956ZjjyTuQ8RKfdBxh2bi1qbwLRlvd
         skzz5aCDZ/89t4gIrBOoEn5oR9nrF0Z2SN34XZIYzLjgEU6WkeFSfBVUBZIKlw7T1+72
         M2HWH5R44yVFealq9KxccsniB3k3MWu6vRCHfIb9outynu+V7mZQ+PimAHAN5uaBgE65
         WEnroJrDIrCrnwMEaZQnrr3zUzMlw8io18/qbc+IhcGvKI7o+/EIJj0wE8yAxqks0xEY
         rM2nAfs7AXMiOwuMIY3Zx/iic+z+pjUHURlwSjK/EewxyVO8g2pbXuq+Laj2gxrljd3e
         0XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yZK1aloE4NcRFJpUcMOYel3NphqGgMdnwyOVwX33QOs=;
        b=AldfbTyUpJoI32RbZG3D2yDoOfKE4IccghQfPXsnummcV2SihLsq7q3MQ9xh6QhW6L
         dAS85wmIdVF1xQx8fyTbgvOvD2/33ddUNehw4W36Db9UKJrm0yaaJF8m/F308ppTOw/p
         UY9HPSX16XU989IU7ie2AI3Kgvk5zbjTd4lf9i9kn0C6kgdi+nmBUPotSft4BRUtHFOR
         k7llVyPKnfBGNQFqCtAaQPf1TRavSjIP3RPDg7TPhHbUk6R0wPKsh/98PtjxhJVrtZYi
         l3OQCQAqmqX+zgkW4cnIgF/I74I/VH3QNTMnYa+SmLuQIiXsKhhZVW3Ym9jfKBysYYHL
         R/zA==
X-Gm-Message-State: AOAM531zJ5zRzQEEFtWRjefOe1EYFtgt7qQnr93TRsy77dW3AbmNEEDr
	4oEB88octOMLcw5P/1403yc=
X-Google-Smtp-Source: ABdhPJw9yVcZt1UgXVG9oF4OCzM62Pz8XY5umRDDqZPTpiME1PPpVjKX1pd8Y41igc0qGYA8HiDMyQ==
X-Received: by 2002:aa7:c612:0:b0:41d:7ad7:4a4d with SMTP id h18-20020aa7c612000000b0041d7ad74a4dmr6668648edq.125.1650003038475;
        Thu, 14 Apr 2022 23:10:38 -0700 (PDT)
Received: from leap.localnet (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id cq24-20020a056402221800b00420ad7d2dd0sm2142646edb.29.2022.04.14.23.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 23:10:36 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Haowen Bai <baihaowen@meizu.com>
Cc: Haowen Bai <baihaowen@meizu.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] staging: rtl8192e: Fix signedness bug in rtllib_rx_assoc_resp()
Date: Fri, 15 Apr 2022 08:10:35 +0200
Message-ID: <4370787.8F6SAcFxjW@leap>
In-Reply-To: <16182197.geO5KgaWL5@leap>
References: <20220415053116.GN3293@kadam> <1650001836-25956-1-git-send-email-baihaowen@meizu.com> <16182197.geO5KgaWL5@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On venerd=EC 15 aprile 2022 08:06:17 CEST Fabio M. De Francesco wrote:
> On venerd=EC 15 aprile 2022 07:50:36 CEST Haowen Bai wrote:
> > The rtllib_rx_assoc_resp() function has a signedness bug because it's
> > a declared as a u16 but it return -ENOMEM.  When you look at it more
> > closely it returns a mix of error codes including 0xcafe, -ENOMEM, and
> > a->status which is WLAN_STATUS_NOT_SUPPORTED_AUTH_ALG.  This is a mess.
> >=20
> > Clean it up to just return standard kernel error codes.  We can print
> > out the a->status before returning a regular error code.  The printks
> > in the caller need to be adjusted as well.
>=20
> This commit message suggested by Dan Carpenter is much better. The=20
previous=20
> one made me think that you were doing several different logical changes.
>=20
> >
> > [snip]
> > =20
> >  static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct=20
> sk_buff *skb)
> >  {
> > -	u16 errcode;
> > +	int errcode;
> >  	u8 *challenge;
> >  	int chlen =3D 0;
> >  	bool bSupportNmode =3D true, bHalfSupportNmode =3D false;
> > @@ -2292,8 +2292,8 @@ static void rtllib_rx_auth_resp(struct=20
> rtllib_device *ieee, struct sk_buff *skb)
> >  	if (errcode) {
> >  		ieee->softmac_stats.rx_auth_rs_err++;
> >  		netdev_info(ieee->dev,
> > -			    "Authentication response status code=20
> 0x%x",
> > -			    errcode);
> > +			    "Authentication response status code %d",
> > +			    le16_to_cpu(errcode));
>=20
> This is something that I'm still missing. Why do we need that call to=20
> le16_to_cpu on "errcode"?
>=20
> "errcode" is returned by auth_parse()? I see that this function already=20
> changes the endianness of the returned value.

Sorry, I missed that you also changed auth_code().

=46abio

>=20
> Thanks,
>=20
> Fabio
>=20
>=20
> >  		rtllib_associate_abort(ieee);
> >  		return;
> >  	}
> > --=20
> > 2.7.4
> >=20
> >=20
> >=20
>=20
>=20
>=20
>=20
>=20




