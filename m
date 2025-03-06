Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E951F95C
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 00:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741221164; cv=none; b=L3EfSMDG04/QDNzb9zJESlf13UesKtTe/gOGwmA9zWl1ij0AI4vLXg7nIXaLecw4xGtMP5qL+Z557eqlnDsZZTEI9Dnehun4Lc8zoDlmB/OWamYfC3kdw/8f1EL8NAByP3Vkt2HXPyFARtnu9xz3DDemvK9/MrAx9Ny1SxmHip8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741221164; c=relaxed/simple;
	bh=f5/msq66A8dGExPJS5orgs8AKsYIe/Lcr2NDLfzR7A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGXBDC2UF6ywIArkuSRvt7GWV1/cUBpLPp2hwwG+6zVKn50wD8pNuLl+amKxlZO0fy2uSRQjXMEk4eufG/U1+easmHjymHq9gWAjJVrQ2B4ZnkIPWS6sL40rFIUPvQnGS7FzbSENrntkKeyTOdySLQ4Vu0qyHwdw0Kgf5dk0E1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6oOFmGR; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6oOFmGR"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e89a2501a0so1361736d6.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 16:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741221161; x=1741825961; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbniOkrcE/iLVnL8rQsYyL/qvVYTkKklM91CTqrRJBI=;
        b=m6oOFmGRoBooMgyYLoHrSAE96ikDKzkzSOk9eQGre1yfjmQClfQZQx0d4J9JXqM++y
         GacthYEKnGBno4inDRFvzWTlP1VoGfUO1HuYB5j7UC/mBHuEhw1FMi5UnWtCPWPThwiM
         hbmIOG+nTiZdLCW4UANmAKngnbuOiR7RLcMjF9mWkUD/ssViJ78p6fpa86xl9cqfvkn1
         ziXNeqM8kLm8YHMMf7TPvdHof4VAt++bvT0zK4T/s2iUV9W3DeTswWPtiiSG3h8ykrFs
         N81TLXq5asMfd7cTtzLAWgsg8PI6mXTzYtPyTcx2Anx/i2AqsNtstVB26RSEat2dvlnL
         1kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741221161; x=1741825961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbniOkrcE/iLVnL8rQsYyL/qvVYTkKklM91CTqrRJBI=;
        b=GZw9CNjbAU2DXZ0S2gWhkwtkDD9ewrn4Kl9ClM6ILN/YjConnfHWG8ky/uvHe81OZJ
         mKli9ov0vlFulOz721mF/TNx/ZwHYeAKXyG537BbR6O04AIq+0ehUXLLZPOjTjzpzklQ
         Owuw6D3svzsYPQM+1B1qPAI1/RB27bj4Hc6aS448eHuv6dsEbGaHOBuqUT6KVbXuT313
         f5NEDJen7dMnRJ25eC/XQK1j0ihgBkOsXhEuohLCjZ3aSCBLPDuoZOzTCldTiIuXsqUl
         AIhM0LNTzq0/W2m5bl7YwjwkHFT3LXo9AA8H+WZxLVbNaNjgZGGTL9gI3w0RRTXydNTQ
         utXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmdEx5WBPHTT51YT+6DMBVTe5INI4EgVdrUcEPSMY1/a7CMW2Dv1ZN4rRXZqKGeCIyrcOwqDXWu7ZqoxtA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/m5UjKIQbFMMeTUO0YSclK53yH7lEaRpuJerdsj9IAC3aeK2z
	k9kI/nhH684fFtRkz8pFr4uNuXtWfdgEVoAbjIirkDAG2wApfKyglCrf4uxv6alPeEdWUIrxysr
	cj5uUeJRVssvLzC5bOW1G1Qn2guk=
X-Gm-Gg: ASbGncs8qrClH91W1RQNokmTa+g4AZOloOySfuyxrf+j3cbkYBf/jKjjBN1IDQL6Cof
	ex//SS1K4k/w2P4DwOBizsd/W3lwsm5fSShWfG64mhRM8vQeXKqO4rlM5eFa/S/c/ok3ugrsRZg
	dbUWkMWz8Ig7Psl5IwwNV/J0zZJQ==
X-Google-Smtp-Source: AGHT+IG+AhTOU/hFmUj2Gkpld0BqtJ/4yuByg5APV8R/JeUdRUJkWdIIvsJDj978xbhdoWG645LFlNqS3HrGShS/6Y0=
X-Received: by 2002:a05:6214:2b09:b0:6e6:6535:17dd with SMTP id
 6a1803df08f44-6e8e6d13ef2mr91605216d6.7.1741221160908; Wed, 05 Mar 2025
 16:32:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303235930.68731-1-danascape@gmail.com> <20250304143918.733d6cca@jic23-huawei>
In-Reply-To: <20250304143918.733d6cca@jic23-huawei>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 6 Mar 2025 13:32:28 +1300
X-Gm-Features: AQ5f1JosxNJs8S75DECePZKWETpL2y5LjB4cLtk5HNNr9lPQYzI9s5_-kDJ6Ibo
Message-ID: <CAGsJ_4zGOvEK-NE1DBtk5jQZCfPp0vtjOb2pWskmhAAn_y93eQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: iio: accel: add binding documentation for ADIS16203
To: Jonathan Cameron <jic23@kernel.org>, Saalim Quadri <danascape@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 3:39=E2=80=AFAM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Tue,  4 Mar 2025 05:29:30 +0530
> Saalim Quadri <danascape@gmail.com> wrote:
>
> > This patch add device tree binding documentation for ADIS16203.
> >
> > Signed-off-by: Saalim Quadri <danascape@gmail.com>
> > ---
> > Changes:
> > V1 - V2: change compatible property from enum to const
> >
> >  .../bindings/iio/accel/adi,adis16203.yaml     | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adi=
s16203.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16203.=
yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
> > new file mode 100644
> > index 000000000000..64370f13e1dc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/accel/adi,adis16203.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices ADIS16203 Programmable 360 Degrees Inclinometer
> > +
> > +maintainers:
> > +  - Barry Song <21cnbao@gmail.com>
> I think you'll be dropping this patch anyway, but just a quick not that
> it isn't good to volunteer people.  Barry hasn't worked on these
> devices for quite a long time now so seems unlikely he agreed to this.

Hi Saalim, if you're sending a v2, feel free to nominate yourself or anyone
interested as the maintainer. Apologies, but I probably won=E2=80=99t have =
time to
handle this :-)

>
> Jonathan

Thanks
Barry
