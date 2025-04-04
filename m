Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495A21714C0;
	Fri,  4 Apr 2025 06:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743749913; cv=none; b=QFu0XKLi6MzDtGo7yxUcGg5VSO5jPy1cSa1CIpey/N00VWp+UXjMsP6xSHFZuPfSptGXgZIBnom6smBZB1ORLdqKCUMPNWunpiBQefoFT20y+VkbZwfp906wxVIn2tFAVV9U0nZ8vor1YjJSF1B6yUIKyhIpi7F8Ee9tyU/OVXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743749913; c=relaxed/simple;
	bh=piW/A3OwiufTSHwZYjD1aHQCvC+ZqDsLQKoDh/71WKo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M+8ldXFyeZ/WvYYTvo7EzdXjEWO0/m0yQ8ryiV6Uedm25c6LI4VM1Z05l9DCsYbcEq8v9qINLk4x11PV6ZVWnE2j9bOR9gEAYvhelSxoRBA7u7zSmVQk62cT+9JSUNYMrYYWauy6x2yNHCHxLUHO6HtTbrjN6cAjhn/wA7uY+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eirxNpCW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eirxNpCW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1294518f8f.3;
        Thu, 03 Apr 2025 23:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743749909; x=1744354709; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SJcdXyBWzI+SzmxP6jxYSY0bJoYAQjTBPA13lqWwAtc=;
        b=eirxNpCWFB5Aousgx7Dn8ZdqMV3u8fCYa7WNQi6QxXOk1qJ12QtEYT4M/k2QmCFHPM
         K6g3s1daIuLfqbk6hBn1eibiGq7vwUxZRrljYpXZIwqGoihtB5c9yA9TNpMEyEUMTURA
         EViayL29AWz3LcB5sjQYQoAOi0Jah0Tuyi3UgiUZTXUjJB49gQiw6nDmbO5GpZZNRsiV
         Xtdyq3aiUbuI0yoP8Y6VMEh165vS3SbWK5LQiQBstt0gQlA4mBCGhGMYcy54kX99WJPC
         bOV04xVWBqXod2jI9KJr9YOpjx7q6LmNhNLuJHvvkVTHPxontCOsZFvG6k4EDyfOROU9
         Gzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743749909; x=1744354709;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJcdXyBWzI+SzmxP6jxYSY0bJoYAQjTBPA13lqWwAtc=;
        b=QwP7Ja7Et/+BH/5v0c/om/BDwVTdyhiD3QWp8dXubtdfkKN156v5gSmql9QmyZd3h8
         WrD9uoGpSuZvHElBZixrdybNxtwP3wY81wMPaaeRObufGYPED0agx+aYqaj3WLEo0kW/
         wIvTPTzhy6qg+/M1yrBaXYUrAP4gVCvifKDSU0964KFQpi1DI/fVOy8i+4giGye92wbl
         ZIHI9KpwM7QxkpIcrhez6nZCNS4XUBJrSP0GT/yV43JPFvQokvMY7OBjR5tTjUYDgFO/
         KlpYbfwLuhKGhWqsK/IGl1+ASrFvZ0CrPFcjny+ZAYh224bqe2IPdWZZwoX2KRoBufWP
         D7/A==
X-Forwarded-Encrypted: i=1; AJvYcCUrfO+NO7Eq6M8CrMzKA8HyVwdyOcgOFV907nQZJWuGpPXySljLOZKzSApKnkOakONvc/MFIVrjsX7nHE9W@lists.linux.dev
X-Gm-Message-State: AOJu0YxAoZZjnsg2mKpAl0z9I3zsz+xPrCqoB73dvfzxXRCVvxIW5fw4
	3VV9e5Lw63Gm55v05KhSVDNy/N/fvKHenlqe37jqOtjNRklUF0hE
X-Gm-Gg: ASbGncuZWW1EkweHbRg1H0iLtszubf27FHaIXkuoBbzqdq8lWDQZBHHDoLy90ZJeDOb
	EFIwOoK5HPNQOIoc2GjeSKmkvbnZeiUwlWhheVgQ70I1pqR4r2K0GGEDws390bCMkoHXgB47TVE
	c38BNkmi4ny6f5siytP8Rsvn6WNe3m4R6hMe2aCwsEYzmraEt3ZimlIVoCvqwe/QqjYDB7FUSvw
	F/JsKfTTJo9ocAFnlvJ5DLn2POuK9vEvgbT9S/N+dqpqCJIFiRi7tFDNR3y6zaw7NO06k0nFYCL
	KrMsCdFRdemW5G4FlZ3nzNyoglOisyx/OYM0p0edf7mhPJc0evjnMZg=
X-Google-Smtp-Source: AGHT+IFk/m6k9OOpcDqx2KupzlBkZJdPITA8VnARFP+hysgf3puT/fMX6ACaTMECjZJlHwdC0K/GEw==
X-Received: by 2002:a5d:648e:0:b0:391:2c0c:1247 with SMTP id ffacd0b85a97d-39cb36b2a7bmr1718258f8f.1.1743749909339;
        Thu, 03 Apr 2025 23:58:29 -0700 (PDT)
Received: from [172.16.8.120] ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020da17sm3608295f8f.64.2025.04.03.23.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 23:58:28 -0700 (PDT)
Message-ID: <cebaec5995fd21c429160b30795e03c2caa29cef.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
From: Erick Karanja <karanja99erick@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>, Julia Lawall
 <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 04 Apr 2025 09:58:23 +0300
In-Reply-To: <2025040246-series-tusk-bec1@gregkh>
References: <cover.1743613025.git.karanja99erick@gmail.com>
	 <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
	 <2025040215-confusing-sibling-f99f@gregkh>
	 <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>
	 <2025040246-series-tusk-bec1@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-04-02 at 21:41 +0100, Greg KH wrote:
> On Wed, Apr 02, 2025 at 10:34:22PM +0200, Julia Lawall wrote:
> >=20
> >=20
> > On Wed, 2 Apr 2025, Greg KH wrote:
> >=20
> > > On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja wrote:
> > > > Standardize boolean representation by ensuring consistency,
> > > > replace instances of 1/0 with true/false where boolean logic is
> > > > implied,
> > > > as some definitions already use true/false.
> > > > This improves code clarity and aligns with the kernel=E2=80=99s boo=
l
> > > > type usage.
> > > >=20
> > > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > > ---
> > > > =C2=A0drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > index a389ba5ecc6f..fd04dbacb50f 100644
> > > > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > @@ -1358,7 +1358,7 @@ static signed int
> > > > validate_80211w_mgmt(struct adapter *adapter, union recv_frame
> > > > =C2=A0			u8 *mgmt_DATA;
> > > > =C2=A0			u32 data_len =3D 0;
> > > >=20
> > > > -			pattrib->bdecrypted =3D 0;
> > > > +			pattrib->bdecrypted =3D false;
> > >=20
> > > but bdecrypted is a u8, not a boolean type.=C2=A0 So setting it to
> > > "false"
> > > does not seem correct here, right?
> >=20
> > Is false different than 0?
>=20
> Does C guarantee that?=C2=A0 I can never remember.=C2=A0 I don't think it
> guarantees that a 'bool' will only be 8 bits, or am I mistaken there
> too?
>=20
> > Elsewhere there is an assignment to true.
>=20
> Was that in the original driver?
>=20
> If this doesn't come from the hardware, then it's fine to make the
> change.=C2=A0 If it does, it needs to be verified that the layout and bit
> values are identical.
>=20
> thanks,
I have compared the generated assembly code
before and after and I have observed the only
change is the comment below.
-# drivers/staging/rtl8723bs/core/rtw_recv.c:1361:
 			pattrib->bdecrypted =3D 0;
+# drivers/staging/rtl8723bs/core/rtw_recv.c:1361:
 			pattrib->bdecrypted =3D false;
There is no change in the assembly instructions.

>=20
> greg k-h

