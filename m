Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117D179BD;
	Tue, 22 Apr 2025 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338572; cv=none; b=bdVTU27Vl9PSwilgByIqZTDjrqlN3cjiEEuM9DZexzTsY9AXv9P9k5Grk5Cn+YcZhFyhfFM3v0mgLYit1TSKq4L1+B72v2TH7Uk1dxY0Af8xsnkhe9pCeOneVUisRDKYORgql39wIhF1StfBiyTw20YHlZjWMllAH2EcEouHsq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338572; c=relaxed/simple;
	bh=AopIbP35eGEgwicypHA8bN0HUp8CeM1DV5674wfHfxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRfZSLMtHmP6s3+ODAjnpCS2MMGUx7NYt2SXPHm1VpCQXbG7wJJOLMjDq1pDrOzL58PXiCtJLZ79OKcgcB5xVYRMSrv20yiEnmcfEyT1yMnC5Aac+nmLZe56CI1E6XH0cAnoyDonjExm3n7kJ6sz5TtT3ccgkxq28Lhe3M/gWYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvmziNAx; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvmziNAx"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4766631a6a4so58537881cf.2;
        Tue, 22 Apr 2025 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745338570; x=1745943370; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFrBh3nLbpLrS3oZ1YSe8c9ey0iYWQVPOn6Mdnaex9Q=;
        b=JvmziNAx1pHXNoI3KpwBR2z9SfiGg8MMMd/ohB/npCDKmYt8nCpDfEUZHPd4RUbIVQ
         wMgcwgA3Oki1zaKBBKe81PxDGUcsKutkJzGLwKUKXTHmn7kwFdJNKcas+4wdqzN1EFPV
         dcsTletjnOuwPyQnfxS9MZWqtOowU+AYTe2MjBVU/MNN9UBa14zo7hxQn5nAQND2BTfk
         eUfUXq6vom15WSoeTHKPiFm3nTTxlwtWp0SxHZ0RDy7QIub4RTAeldVjm2p6YdoJJBXK
         NcokyYuQaifOVkO8rbwCpRj7IqN4Fg0/SV4748edC9PHRPMd1A4pLbekoqRkdgUsB5AI
         Ghbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338570; x=1745943370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFrBh3nLbpLrS3oZ1YSe8c9ey0iYWQVPOn6Mdnaex9Q=;
        b=HyCuoX3ZPvHEi9mfr1G2+qu9kpM6259Z+4l1t8WAWSl20kxpP0B31azcWkx6pH19qU
         bEkNGzbnSxE8kuqMwL6CMXYRJ2cuNPhTkNL/q2NnThFVQiEPHpVNqKPk/GkxeaORlnA7
         3lBX7qanwZhFUpxfzPeowRHSjE/YWQVIGe7ByK8bWwSALLu/qJ8tpUaKy2pYcxUSLyc6
         048+nrSHSR0jofGLw/WGBTc8Qryo2FEXd+7hGo+JmfrjXDSYqU974r3sVWeADEe9rFTn
         x2sjv+CPub6gUDkEQVwqWk4PstCid/zsaCSd+WQ8fTZcsTJX7SoCjYMCo5g5NjVbllRW
         XiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh5aNndxESPPizF1/TITrEAlTNTmYnzWX5tyyhHmdQdamOYooQxGow2j2PxlXq/vdWKy0EffkBK0mkXg7Hfw==@lists.linux.dev, AJvYcCUpwQDvyT93tAYn5lF9tx6KK7l0BRd/zhV6DnNdgFLTuqZRodQ5e+5NY9TeSmeHo5ubN5zXv61FREGWUWx81gCCPXZbig==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZmWBzH81OEtB/VBLgbriaHrE6nl6Tsh/KodEbLRo+YeV3l7tu
	19ZUwYI+fzI24grXyGoYoC2lN4526rgAcBEsHCWNK84CWldx/VXPZsAa9glBcC5edp3+2h4ue8n
	c4YhM2Mi0LXU/QL5NTEwaS5kqiZNvxt5C4yI=
X-Gm-Gg: ASbGnctYTf6lfE+B1XMtZyihxT+nGu9fPUV90DbooelBF5tJMW49u3e5A/hKkpMRamE
	vpky2M2NU0vULytxQXwsw9YculkAdUDe7hgkCueiRpoCKlcGw8OkU2wLwVqwKYQEVP2h1c2auxJ
	RBGIRtygVTSTOS8VtMDbNEVDkqGk59mdExQ0k2uGiaVd3eN/98PlwJWg==
X-Google-Smtp-Source: AGHT+IEIZQux+2VZKZBiPdCzgiFdjJWt6dz9/yhL5Bl8TAYiGGo+j4WrDdwYDO8XMzu/v1izVhNnYybHv2SPXUyoYH8=
X-Received: by 2002:a05:622a:40f:b0:47a:e6fa:9127 with SMTP id
 d75a77b69052e-47aec3e2a70mr226351681cf.23.1745338569997; Tue, 22 Apr 2025
 09:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420175419.889544-1-gshahrouzi@gmail.com> <72fd8919-8413-45f4-94fe-277719192536@stanley.mountain>
In-Reply-To: <72fd8919-8413-45f4-94fe-277719192536@stanley.mountain>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 22 Apr 2025 12:15:58 -0400
X-Gm-Features: ATxdqUGx_cgIWLZbKoGp4ssu-0SjrT6ROY7nG2s39_luaQeuquqvHOmIbiJ4zas
Message-ID: <CAKUZ0zJLAvi_zerjB_xmtjJs1TzLxY9-grLRGxZHN8n5qtDR3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fix and refactor output disable logic
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 6:09=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sun, Apr 20, 2025 at 01:54:16PM -0400, Gabriel Shahrouzi wrote:
> > Patch 1 includes the initial fix.
> >
> > Patch 2 refactors the code to use the out_altvoltage_powerdown ABI.
> >
> > Patch 3 adds small improvements by minimizing the size of types and
> > doing a redundancy check.
> >
> > Not sure whether to include a read function for powerdown as well since
> > all the other attributes only had write permissions. I can also do this
> > for the other attributes to help modernize the driver.
> >
> > Changes in v3:
> >       - Include version log in cover letter.
>
> Please don't resend patches the same day.  Give us a chance to review
> it otherwise it gets split across multiple threads.
Noted, thanks.
>
> regards,
> dan carpenter
>
