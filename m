Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8643F189916;
	Fri,  4 Apr 2025 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754881; cv=none; b=j6/6EB2QV9mm/6zRP0HXTL2ICRWpIJgnOW2Jwfe8amUVUBYxN2SVkAWqZjXAB2LU+r4SKfrXT19ovSTqa/Xu6IRhF/BCDZ0VOcmZD7syhHgZamubLfgmIrp0V88CyuWZgb7KYrE4Ka63ZYojIYopqfIB4aLX09Gprr/xwzxXego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754881; c=relaxed/simple;
	bh=oEBBa0UwT4LpK4NzDfGAM+pvxfyxo+z9Ez6buIMXpIQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tc7rpwKQxvbJeKj7k/gs1DHX1qnHtLmdRrz8WL6I4kYpErPEe6mzb9icMyFrt5avCuyARphblMWorccZ2FpgJyb84+8bMNp3GcuTqNTqErKMR6lenjJJoLadkz6BePjwAT7xOwLMDfOilCgB6ZzkHnZlg2zoabH0jOK+7ArtdLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBgtieWe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBgtieWe"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1794045f8f.1;
        Fri, 04 Apr 2025 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743754877; x=1744359677; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cJnag5N/E8imO6D4V20WNDdVIE9vBf0jkcorR9CB1ZI=;
        b=hBgtieWeTrewlLlTiHkmc6JKsQVZ4cs22otcj8TcMKruuIisfWazXoq9LvbqN8FeOV
         DCkf846RJYddOH8waYOrqffw+lsRPZNid4x/oUAL5hDcrFgT40KABNMEfCfC7ZuFHSV3
         k+yHB9dAKshqdESoFodGSe8hm12YnpiJAjrb+W2ZPy22fZFFnz7jwZpCNhjUrsDxiDj5
         jORxNPDzZGaF0Yhxf8J6ZpFlmOuehC5Z7ol6GtQuB8u2bVys49JvtBP2QgvDBDKMMpq8
         kFm/iqjVDZ65juTYO7HLosg2bTN/H3H9D19WmDjLjxQ7P88sl8j7DEcHR5G+4aXFtPw8
         M0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754877; x=1744359677;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJnag5N/E8imO6D4V20WNDdVIE9vBf0jkcorR9CB1ZI=;
        b=Mz/K+GiQos2SBg4rJHPniLCSP+2ArynasxEB+6GXiUAYfnhDG6s/OfxYLTKGtT9bnF
         n4XCfB5wpqu8eRCVT291mPOnl7n7Zz+C1hvUoOxSk+MFR93bMDGg/UL+AC5eH30aAQpD
         C1lKxTJ5tAfSMYmB6zMwQF5ZSs74pl5vvclRV5xzOQIguTVQYiJCAzaQ/Ly1VBAw8WGh
         VaQfqwBVmcXfOmydlN7nAQFZx1KddieqRJx2dr7cfpo/B6PV/ciB1TaAqjZJg1OXqBkT
         LU0/sd8t8dAYpsOywk1pjEUWHBeB5viofQcpAmJkUGiI97IFphHp44IKXga3oeKWYkJo
         VNzg==
X-Forwarded-Encrypted: i=1; AJvYcCUCTbnloqEX4ttjurJ4L7DJgvZDQxduT1itlb5pAfZcCXPwBb+a0mN7cABZND11TlM/CIt9NsaDKbqpZdRj@lists.linux.dev, AJvYcCWWSTSRHO+SqP7SURjEENQk1Y8rmlfUwdvVYfkXlk2JOUuNeZb37YJN9XHdN7h0GEHVPkzOiiFkccxY@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7kCeze3QDkObi2sf6Lh3Srz21gvBS6beR45VLpC7MD1KyUf/w
	Z/rNvuIsROoXYI41RgaKjLCa8h3/rmaex7BN6ZACrVuWj8r4xKXXu0TKGw2B2yk=
X-Gm-Gg: ASbGnctErItTYaLT2M593uPSMN2Wq3MKieDOMGS+0Az2eUy4pKy+QCKr/O8wJ2RM2ZJ
	sb28buEKUF4Z/GAtp2MstPJlaffPLsCLQvbjLxGgDY8o/sYHaglQSEjVdZHiVuLbXvLLse3sNql
	vutZbJOpNERyLrR/N768L+HZ4e7Fbm7H/fQs2Qlpb29cuXB7LAn7rU8J1YnXWFXYE55wZJObxql
	dAZCVba+YMgpcHtNiwVxVnCrdUZ6aiDFCwquiF5H7WAUxipR6cuLxiAcRmUVcDGuRV/5o6j7cQ1
	BfkmfXFmrqgEImf68c6uh7wOp5fHQKFZlG181DQFFx5MBmSV37ta9qQ=
X-Google-Smtp-Source: AGHT+IHjwKEYxClJ24d2Sr1Kx1XpSNoc5grq1wldrqVQn3q7Oax0SKHigAo7e6h2ExclO/2V4oBmxg==
X-Received: by 2002:a05:6000:22c5:b0:39c:2c0b:8db4 with SMTP id ffacd0b85a97d-39c2e610ac9mr5747391f8f.10.1743754876537;
        Fri, 04 Apr 2025 01:21:16 -0700 (PDT)
Received: from [172.16.8.120] ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm43123945e9.8.2025.04.04.01.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:21:16 -0700 (PDT)
Message-ID: <03ecf162e93d23e1224f0b6c07f08cb85547d3d8.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
From: Erick Karanja <karanja99erick@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Fri, 04 Apr 2025 11:21:13 +0300
In-Reply-To: <2025040440-provolone-uncertain-77a0@gregkh>
References: <cover.1743613025.git.karanja99erick@gmail.com>
	 <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
	 <2025040215-confusing-sibling-f99f@gregkh>
	 <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>
	 <2025040246-series-tusk-bec1@gregkh>
	 <cebaec5995fd21c429160b30795e03c2caa29cef.camel@gmail.com>
	 <2025040440-provolone-uncertain-77a0@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-04-04 at 09:00 +0100, Greg KH wrote:
> On Fri, Apr 04, 2025 at 09:58:23AM +0300, Erick Karanja wrote:
> > On Wed, 2025-04-02 at 21:41 +0100, Greg KH wrote:
> > > On Wed, Apr 02, 2025 at 10:34:22PM +0200, Julia Lawall wrote:
> > > >=20
> > > >=20
> > > > On Wed, 2 Apr 2025, Greg KH wrote:
> > > >=20
> > > > > On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja
> > > > > wrote:
> > > > > > Standardize boolean representation by ensuring consistency,
> > > > > > replace instances of 1/0 with true/false where boolean
> > > > > > logic is
> > > > > > implied,
> > > > > > as some definitions already use true/false.
> > > > > > This improves code clarity and aligns with the kernel=E2=80=99s
> > > > > > bool
> > > > > > type usage.
> > > > > >=20
> > > > > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > > > > ---
> > > > > > =C2=A0drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
> > > > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > > b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > > index a389ba5ecc6f..fd04dbacb50f 100644
> > > > > > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > > > @@ -1358,7 +1358,7 @@ static signed int
> > > > > > validate_80211w_mgmt(struct adapter *adapter, union
> > > > > > recv_frame
> > > > > > =C2=A0			u8 *mgmt_DATA;
> > > > > > =C2=A0			u32 data_len =3D 0;
> > > > > >=20
> > > > > > -			pattrib->bdecrypted =3D 0;
> > > > > > +			pattrib->bdecrypted =3D false;
> > > > >=20
> > > > > but bdecrypted is a u8, not a boolean type.=C2=A0 So setting it t=
o
> > > > > "false"
> > > > > does not seem correct here, right?
> > > >=20
> > > > Is false different than 0?
> > >=20
> > > Does C guarantee that?=C2=A0 I can never remember.=C2=A0 I don't thin=
k it
> > > guarantees that a 'bool' will only be 8 bits, or am I mistaken
> > > there
> > > too?
> > >=20
> > > > Elsewhere there is an assignment to true.
> > >=20
> > > Was that in the original driver?
> > >=20
> > > If this doesn't come from the hardware, then it's fine to make
> > > the
> > > change.=C2=A0 If it does, it needs to be verified that the layout and
> > > bit
> > > values are identical.
> > >=20
> > > thanks,
> > I have compared the generated assembly code
> > before and after and I have observed the only
> > change is the comment below.
> > -# drivers/staging/rtl8723bs/core/rtw_recv.c:1361:
> > =C2=A0			pattrib->bdecrypted =3D 0;
> > +# drivers/staging/rtl8723bs/core/rtw_recv.c:1361:
> > =C2=A0			pattrib->bdecrypted =3D false;
> > There is no change in the assembly instructions.
>=20
> Showing the assembly is key, not just a comment :)
Thank you for the update. I will take this into consideration.
Erick
