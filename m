Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43520328
	for <linux-staging@lists.linux.dev>; Thu, 30 Jan 2025 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738232562; cv=none; b=JfaKQHmtixJLyD9WV/mdPkyfbsE3zFFF2kQaQt5mF/gSWglzZCC1T69mlGCslugfWrHx4F8VSmXFaS281mQCAb/uq6h0LgMwEyyEasxSOEY9zgxJsXbpgWUQcQoU78XtyAIXfjd+HR0maC5txYLacUV2sEAT1wRlXlNJA8M2LeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738232562; c=relaxed/simple;
	bh=B4+bp2b1ViozWo8E/9w0GJxuWnjNWQF/PE+csQWrg+E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bCg1gTHKm2Q1ozD22+Of63lACg0NN95F9+ctJFS8qol94O9QWVEt7QiMRKudb14blgOc1YE2/Tjwve97CmFmBrsBH40FNnFAmUwS2vj0vZ+9qryW0XRR4rR8rzyNrlt/+nShfRZPB6b51dX22yL7Osfj9ZbLhcrY9q9ofx6rMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/Z5QCyA; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/Z5QCyA"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so131346066b.3
        for <linux-staging@lists.linux.dev>; Thu, 30 Jan 2025 02:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738232559; x=1738837359; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4+bp2b1ViozWo8E/9w0GJxuWnjNWQF/PE+csQWrg+E=;
        b=b/Z5QCyAYG7d+YeZrfEuKGwM75RaeCwg7quXaBS/6Qn7RWMZyUQrAQsBErowWqJxiD
         UdeKLaxuZHxVTqFWynfpQZsBy1JDi3HW8ecVJEYl0EX2JwB4f3Nc28tGyIt2qI0N+4Lt
         2wfGQ0eMmrc8X/yIUMaI9mTfC+9ucZcerpxBLS801nI7is4FCbif5qJbs95+fHWtWafL
         1G6qWVDQYA+e0FBRkeyWloITXVcJo5b7LO3dZoLzTUehsC8HHcMY165QXdQPkBIxw0I4
         Vyg77f4xfqIwH2UeJJzQTJwlY6CW0HK5Ic3EtyCLbZMeAHm9+rmiTs9JnkpBhz3M+Gv1
         Jrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738232559; x=1738837359;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4+bp2b1ViozWo8E/9w0GJxuWnjNWQF/PE+csQWrg+E=;
        b=A2W3Wz4QInK22Cl1fnh/6VCVEAYC5NvzL9b4DRsFckQQEzS9SvOT6qfOLJNREnXh4x
         MYxrJ+e43LsPfkkTqHZb9BFkVs4a1FjUDYYyep5UfXH/fL+Syxg/ES81g36xOMbsxqP+
         /+tHwXA8oGs6mBIdxgpISNm+b0eQ0XG272ZDxO0FSQXIbzUJwMSeHswZpoKYd2+31wU1
         Wmb9hWgzO1ayNmdToVWhISOJ2GLEsTqVV6PK9M/0Y+boMfGwpdCALukiPqaPL0tjwAZU
         /w/RLyacpxmsdocuNEfZLmJ/xuv/DjOAYKV8nvTKQul4mwZJSTiK32udgsXwyRR3cRxI
         y71w==
X-Forwarded-Encrypted: i=1; AJvYcCVBI+xfgGrYKiw2NyHfnH4EIF72EaUCeI7pvBAw2rV0H93fro8Rnu+Jz7Uk/r9QlFhD29WVlRfIy/qFDrpU@lists.linux.dev
X-Gm-Message-State: AOJu0YyYCwDCvNuUw4tkc1x3h5uLOH15mh3WhAHWfNZun1IQnqjj2mOL
	BjFwe0H1Hx/T4PqIUm/r6HN3T3XG1QWCYL3EvZprQHl6asXWeZhH
X-Gm-Gg: ASbGncsH/4Pn/ksKW12qzitTeK08bho30pw/vH827ruO6FODSeugO0hb9RIdIjjS+Xi
	qHX1IQIjU7pui2mDQzylR2lommk1IAW70RtbMOD4sdKa9OnGqWFYfWzyaqZ+rwLB97pjDeOosU+
	FM8rqgDpGCbV8TqYjxv1rsRjJvor/1e25ulWeWl1uB3yPg5CtUNKoi+F7WuMY0EHfid19/d4juk
	2pNqyM8V0kP3lEWLFkQ4Frv0MBs3HNIfKG+c9OyQUw1HJmKOnxQ0F4FOValJz6+BS+c0EbIAt1C
	kkpAvhab4R0soUzrVdg72MD95Pp5WfHXzeNm9o4HZ73PUtPyEd2JNHUeWoE3kWL5BnMdeo61
X-Google-Smtp-Source: AGHT+IH6fi2JsJCdV1ZJxiNR7fFgOilQuJF8BsN86Z3dOweQ3P5ERklBaSx+eh4geAQyzNLMc51j1Q==
X-Received: by 2002:a17:907:9704:b0:aae:bd4c:2683 with SMTP id a640c23a62f3a-ab6cfe12da4mr678404366b.49.1738232558971;
        Thu, 30 Jan 2025 02:22:38 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7ffasm96854766b.7.2025.01.30.02.22.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:22:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <bd5abd7f1e29853729c1c9b57b62e2e4a9524e6d.camel@ndufresne.ca>
Date: Thu, 30 Jan 2025 11:22:26 +0100
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <171D4C9F-AA88-4DC5-87F2-142D642ECACE@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <3333233.eAoTOS8U2s@bagend> <5969581.LvFx2qVVIh@arisu>
 <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
 <bd5abd7f1e29853729c1c9b57b62e2e4a9524e6d.camel@ndufresne.ca>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> Wiadomo=C5=9B=C4=87 napisana przez Nicolas Dufresne =
<nicolas@ndufresne.ca> w dniu 29 sty 2025, o godz. 17:20:
>=20
> Hi Piotr,
>=20
> Le mercredi 29 janvier 2025 =C3=A0 15:48 +0100, Piotr Oniszczuk a =
=C3=A9crit :
>>=20
>=20
> As for most codec, when working with larger group of developpers, its =
better to
> start with getting the ITU conformance tests passing. Once we reach an =
excellant
> score then we can start looking at specific streams. The benefit is =
that ITU
> conformance can be run with fluster which removes a lot of possible =
human
> errors.
>=20

Ah indeed.
ITU conformance approach is for sure best one.

By asking for way/tool to analyse of playing/failing samples I was just =
curious: is there any pattern here (e.g. specific encoding mode; etc).
I assumed - it there is - this might be good pointer in narrowing =
decoder code which needs fixing.=20


