Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0AC21ADB7;
	Fri, 27 Jun 2025 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751007562; cv=none; b=SgmpOB5XpyQJHP2xMTBtf7fQ/EBpKIwJzcaUK1Snf5SrEZTdk2h4FVU2fBMSvrZZz1XajRVOwU2HtgUz5g4IlwfdmBWa3HPRMXvVuyWssuBY1fnh6TIcKN5fZmJUgF5MYjC7L2ZRRJKbfVM2vs8M3PoNhWER0an85cTVuidKS2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751007562; c=relaxed/simple;
	bh=WdWVEfpJgxRMWzUF0VMsgV/Wr9vf2FxeqiqykC9OATQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5H7wL7sPqH01dw0i0C/1Q1PxnXCYH0+QTn5LbbNSF6z+rvDrhhQl7cYaMEbtWpo9vvo2MVsGpJdWHelWACH6v49674JuhzOxJkq1/rhGhSXFsaCGkH9mXMaAW11hzPVeFHOZvRUFcP7jiLkTjU+Y3Fi3kneXBM/7D4gWMmuXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFvUoDdk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFvUoDdk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so3555732a12.0;
        Thu, 26 Jun 2025 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751007559; x=1751612359; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlXypzUn9k5HtMzPQR4dnvaBprfSwN8h+TU/oblYn18=;
        b=NFvUoDdkJVQt6BTCKWEmlauyXoSGZoN7T2mIL0GcAbiKvBOEFc7vATCPmAmytMApaR
         p1c+wrcezEraBrQ0uq6WxYnJRZWsDpjf3kpYTZz4azDfBtxb/N7jRaUonieyz9E+Dfjz
         vmybde2tpFb1PMZ+MJ48Up1qtVq4KMloWAaUihsiD3/HCW/EFQhymMM9/qIOczAzETZg
         HO32y/dHwMhFR1vfV62vzdnQAr2O17JgBbf3BzeVTSvjz24KDbgXyJ+4lmkKNqMmaltY
         Ic4oByj88XHuMHKrp9Zxw/9HVNjKZcJXWLKjleRBVMVlDfmBFN7a6WdBcCMh+Lhmq6We
         XmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007559; x=1751612359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlXypzUn9k5HtMzPQR4dnvaBprfSwN8h+TU/oblYn18=;
        b=EbBnXP09y6wpPt6TN8VTAedpu8SZ+5JOPShHrkAYZ4SPZiylirCQrNK8uW+4qjOcCh
         Yu84wYjV1fyhH1ygJaCVg7lJujExIuUNmFsL8su0CZHBe8uDRj1r3/4+ow1N4MdC2Rgg
         JMNrV4AZsktAv+CFumA6xfE2a4WKTaASP4cuF4DsEByVDgX3dQFlriQ5ixslWKnODfLy
         +HFCuUDNTHHDFDj/Up9/t8A0yYMqepMi4R5efPqYRW8PhseBRQhE3paJRBsceGMsTseK
         CdAYPsXx5BZG2OLnPX4IcWMDenEGXhE5z/PXkoZ4mKocaGijsS5++sPcjMMyaUt5adI3
         L2cg==
X-Forwarded-Encrypted: i=1; AJvYcCVl1WXyGsLQvY+ourqEIcy8AZKU3nLoxWvt/hGUHlFUdvJZS3aIqI9qSLV81rSAHDTKKt426R4Su0JaVUO1qzhsfmaODA==@lists.linux.dev, AJvYcCX5X6mrLDTtZ6rLusvVrFrX5JR58OQe3wbHP/1tdjag/VA9BlgfAC45aZiqN5Tl01bVbTIvIIcU70nep2QvGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPPHQFCgo3+skkzWuWE7hQkS5R5KeZQeEd28nufaAMduM7i1Xl
	ScfYClgcvrsU2h0P7+PgZckVDqm7gKvNiP7KD0NSIVSgiQb5pzrj9xGw2y3aqMVM3AeERAkyV3u
	WomavBATR86NBIiz3qNHFLIxqejGeSBg=
X-Gm-Gg: ASbGncu6lsLIYr9sJe3ciacxeved3RjVcQy9KfgLcJyiWrW19CV2PG6c2taxz1Ewx9P
	e+rWnxwJpy08mKRN/DeKK97uOm6AeemeJzko1LxXN0uIdIFkscnEL3SPNsBGvbrD/kXc17+Sy+J
	NrPBjlcJ21q51g5y4ouoJgU9JGQKJvafbyBHVeasLiYQ7HMQ==
X-Google-Smtp-Source: AGHT+IEmWbRtk76xsYUG7tUxzQkRkJ1wrXitDqF+1SHZis5RQWtxqj7D4XE70D3ATd2L8od2NXySpP+GMSxtY+FbAJM=
X-Received: by 2002:a17:907:c15:b0:ad8:9c97:c2eb with SMTP id
 a640c23a62f3a-ae34fd88214mr167722766b.19.1751007559028; Thu, 26 Jun 2025
 23:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
 <fdaedc62-2beb-4f18-9e4f-f60ef35e1b38@suswa.mountain> <CAGn2d8ND8Gm8E=CwyNbejmOeuqwk32zNCV-EW-k_N6GTOn7aZw@mail.gmail.com>
In-Reply-To: <CAGn2d8ND8Gm8E=CwyNbejmOeuqwk32zNCV-EW-k_N6GTOn7aZw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Jun 2025 09:58:42 +0300
X-Gm-Features: Ac12FXx-PMWf0TVMwD4Ez26sP2r6fcj0O18xN9CPdd3xTV4ObZol-SVTCmOY_30
Message-ID: <CAHp75VfQ9geeSOjSq8GoBuk_8ZrrCrkgpLxn1nXWgHU0dLnavg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 9:39=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
> On Fri, Jun 27, 2025 at 12:32=E2=80=AFAM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:

...

> > The other things we discussed can be done separately.  It's also fine
> > to never do them.  I'm not your boss.  ;)
> >
> I think I will continue working on it. I'm very excited to contribute
> to something as big as this .

This driver is a rabbit hole. You've been warned! :-)

--=20
With Best Regards,
Andy Shevchenko
