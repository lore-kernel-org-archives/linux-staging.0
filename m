Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8567D2D5402
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570656; cv=none; b=SZtx4lPQMld2t20MKab4AINCUGL+OnQYnPpaRfjERcwDcmLvpLEk3WmAWO7hLrh9Ysh0frDfnv68MqYbpE2xBqRre8ER+O2urFfMv3ttNh68xAg5K8CVR7YR9cA5CMTBgZNfwTZN4P0MODrTDXIPLgGhdidOOM/3dM4pMVbjp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570656; c=relaxed/simple;
	bh=N3v6yre1w59ynmHLJIPCSWSZrxzyqtlDbvmNV1Ort1U=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=otJLG5PAMNRkKSU/Wc6utL11QHrO6xpbGhicI44ZHCgQt5LqXenrkKLPcQlS3XFrCwX8eMpe/7jX0raof/WCQxLESRMfN+0+aOw8Fdi40fpJjf+j9eA46fE+9fc7KY69RXfJtnmN72y4AMerbDDAOIyKrDduwZle/pKDbguAQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqKMEOh1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqKMEOh1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-455e6fb8057so39110325e9.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752570653; x=1753175453; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1h5Pc6jSMg8b1cL/wTGNUWLlJ8UBTATqjvEdBDjUk0=;
        b=TqKMEOh1LxA26PR8RrZWlgWPe9Z8QdgrCHDv3mHZO8+8OJwA8WZsLGokJGI+UMIw30
         HF96c2cD7Y03ah3jDFTxrhLm4K1DchFmUypSy0hA6eMptjUvtf42k/6r/mGx5iFbpL2+
         83tZhTM0gmATGiR/rOa0iWOypYxrI4lw7rTigKv2Ji+HwPYNi35ZbnymDjRzCa5a5fUv
         Nm/chgcFOZvQtb5bb+gNaSb4AUfxItF8U9eBqIQzSV1g8xbtGAtVBUWkbEElmKLzVmtN
         AeOt+AQf2FAht305BvDQVBDXm1miqqkIpMYyWan0xqhOimlVrKXg+8cj8UQlIOm7pOky
         rdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570653; x=1753175453;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o1h5Pc6jSMg8b1cL/wTGNUWLlJ8UBTATqjvEdBDjUk0=;
        b=rWHsxX4v2Ka7PzUWpvBS/h4Rs+W+xN9m0LvJicLfdkPAozmOhAh45HwlFhukI0EOJF
         FxpWKsJqGBMkFsf3x6ZkGRJa3IBD4FtZ6cZlWQX+7B7/zZj8LRvyS37y5RAD3IGSeGDR
         1esKKX/A+U4BANpjDjpE1BQqX4I+ohRwae9tSAvAlIP7dF4csimu4QiWF0Vb5z0pNQhZ
         noeNxyrCBI9n7p9//mZgG1JbmKjbMlqJKqGUkoFOcVgr7q2D7GX3eM+/rwxCClehGuHx
         IbG2bJtFlHUl69JxuCPdBl3D/t2Pu3PpGeEvlvqftxtl81xuNWVcAo7y/G6K54YLmfW0
         4XuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm08mMNsEyfN8hNdyaOPfc7pdmmHnclBv9Kq2HFqwRWiIG/7QBf5WAyojMSSCiuJcWffID92GhRochDwvK@lists.linux.dev
X-Gm-Message-State: AOJu0YxkGe62aCIyUFhPCZ/m9zYP8hcwb6MguZ4OKqp44wETbp1WkPpe
	04UvwFWjtB8YkFZvj0/MKCtE1YyMZ92y8V82H2NlUVoHZEJTrwUtCpfV
X-Gm-Gg: ASbGncuzuERAkt/K7FjxRTPcUrQ1Sxf267L9hUPkhKWEgyHs1Xb+fcpv81jDp7UcliY
	EeTlla7N8zwpDb0iEWeZisDrjWlBwdtCn1Tun2haBNDQFKN3C8ZS2Gst6d7tDwTvb9URlWZxjNU
	eEuiAGhYSi9gilBvuvv9cmXIVJyAwm/Dla9hwOjOkrC/cDU9dx8cfSejGmMoUc4B0Tg0Ko3qsbV
	9sFmnsSpnvuQqqdP9alO0gm7gSTIsxNo8dWm5MbKAfcazJ7IoZDtPNvSEbfyEGiJfdrNJbEl2fW
	pglFoGl74WUnzTECJkkK/7PyfNDt+fBZWdI+aOfv3JnX+RH2P0bpy6TLYSIbN6cMfX1kqKhsc/M
	L89rTc4DAjBeMPC8/on23c2Ht1hYjvONt8NGv/ztr/TT7/OFiGw==
X-Google-Smtp-Source: AGHT+IG8LxAVomRTxHB3htRD5s0m3l9g2VSOjPHXCnIu+z0xdDALWIcnXTdVY9yN2PnTDlOwgoRERg==
X-Received: by 2002:a05:600c:3589:b0:456:1c4a:82b2 with SMTP id 5b1f17b1804b1-4561c4a856amr67890905e9.10.1752570652494;
        Tue, 15 Jul 2025 02:10:52 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454dd538b63sm156999395e9.19.2025.07.15.02.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 02:10:52 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 10:10:51 +0100
Message-Id: <DBCIG2AHAZHR.31GUITYRTUZXJ@linaro.com>
Cc: "Akhil Varkey" <akhilvarkey@disroot.org>,
 <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <johan@kernel.org>, <elder@kernel.org>,
 <~lkcamp/patches@lists.sr.ht>, <koike@igalia.com>
Subject: Re: [PATCH] staging: greybus: power_supply fix alignment
To: "Greg KH" <gregkh@linuxfoundation.org>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>
References: <20250714135606.41671-1-akhilvarkey@disroot.org>
 <DBBXCAEMM5ZO.GTKVMMR2XDJ7@linaro.com> <2025071540-sepia-amuck-c757@gregkh>
In-Reply-To: <2025071540-sepia-amuck-c757@gregkh>

Hey Greg,
On Tue Jul 15, 2025 at 9:05 AM WEST, Greg KH wrote:

> On Mon, Jul 14, 2025 at 05:38:31PM +0100, Rui Miguel Silva wrote:
>> Hey Akhil,
>> Thanks for your patch.
>>=20
>> All looks good with the exception of a small nit...
>>=20
>> On Mon Jul 14, 2025 at 2:56 PM WEST, Akhil Varkey wrote:
>>=20
>> > Fix checkpatch check "CHECK:Alignment should match open parenthesis"
>> >
>> > Signed-off-by: Akhil Varkey <akhilvarkey@disroot.org>
>> > ---
>> >
>> > Hello, This is my first patch, I appreciate any feedbacks. Thanks!!
>>=20
>> Welcome, and continue...
>>=20
>> > ---
>> >  drivers/staging/greybus/power_supply.c | 14 +++++++-------
>> >  1 file changed, 7 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/=
greybus/power_supply.c
>> > index 2ef46822f676..a484c0ca058d 100644
>> > --- a/drivers/staging/greybus/power_supply.c
>> > +++ b/drivers/staging/greybus/power_supply.c
>> > @@ -324,7 +324,7 @@ static struct gb_power_supply_prop *get_psy_prop(s=
truct gb_power_supply *gbpsy,
>> >  }
>> > =20
>> >  static int is_psy_prop_writeable(struct gb_power_supply *gbpsy,
>> > -				     enum power_supply_property psp)
>> > +				 enum power_supply_property psp)
>> >  {
>> >  	struct gb_power_supply_prop *prop;
>> > =20
>> > @@ -493,7 +493,7 @@ static int gb_power_supply_description_get(struct =
gb_power_supply *gbpsy)
>> >  	if (!gbpsy->model_name)
>> >  		return -ENOMEM;
>> >  	gbpsy->serial_number =3D kstrndup(resp.serial_number, PROP_MAX,
>> > -				       GFP_KERNEL);
>> > +					GFP_KERNEL);
>> >  	if (!gbpsy->serial_number)
>> >  		return -ENOMEM;
>> > =20
>> > @@ -546,7 +546,7 @@ static int gb_power_supply_prop_descriptors_get(st=
ruct gb_power_supply *gbpsy)
>> >  	}
>> > =20
>> >  	gbpsy->props =3D kcalloc(gbpsy->properties_count, sizeof(*gbpsy->pro=
ps),
>> > -			      GFP_KERNEL);
>> > +			       GFP_KERNEL);
>> >  	if (!gbpsy->props) {
>> >  		ret =3D -ENOMEM;
>> >  		goto out_put_operation;
>> > @@ -634,8 +634,8 @@ static int __gb_power_supply_property_get(struct g=
b_power_supply *gbpsy,
>> >  }
>> > =20
>> >  static int __gb_power_supply_property_strval_get(struct gb_power_supp=
ly *gbpsy,
>> > -						enum power_supply_property psp,
>> > -						union power_supply_propval *val)
>> > +						 enum power_supply_property psp,
>> > +						 union power_supply_propval *val)
>>=20
>> Here you fix the alignment, but the last line goes over column 81, even
>> though 80 is not really one hard requirement anymore, all code
>> (strings is ok to go over to be easier to grep for messages) is on that
>> register.
>>=20
>> So, to be coherent, if you could please send a V2 without this specific =
change
>> would be great, Or even better, if you could get rid of all the _ and __
>> prefixes in functions names that would be great, and will give more
>> space for function paramethers.
>> Your call.
>
> Nah, this is fine as-is, we can go over the limit to 100 for tiny stuff
> like this.
>
> And the __ prefixes should be there to show no locking, or "internal"
> functions, right?  So changing the name needs to happen very carefully.

Yup, we can go either way here. I do not have strong feelings about
this.

So, LGTM, Thanks Akhil.
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

>
> thanks,
>
> greg k-h



