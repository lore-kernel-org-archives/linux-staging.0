Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F4219A8D
	for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737721498; cv=none; b=GlCczTxqEpxL/ZA5sL7aiLB8BygG27MNq+zclRIPkm4Kp/WikHRV6ccVnvlVOQ9vPcwHqynIvKV1iFVE4fOHVJ9BKI6SczMrJPxYB0H+7CSMKOPkuFMrpsokhszQcVf459ugEl4PkkEJol771cAr0sMCvPT5pZGvoefvRjoZU0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737721498; c=relaxed/simple;
	bh=Ez2SUlRyvGQWFaRonAO1AfYboy0jbqyl3K6PdJMFs6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdQllXZeqXGSKCEm0QRPrdoEPvGG3f+jVbXhlhFigojI5p6wMxH63ggPzoJWC9bPlqPL7KdR05kl4yCZ0NFhdR2T93kySN27UOquUqMtpPi9ujgBRSddUKGnO07bv0HfFx6cblvJhTcndSHELNSqs1bUL6ad4z78vp8g6zkTAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbuWGKkb; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbuWGKkb"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dc052246e3so4346221a12.2
        for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 04:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737721495; x=1738326295; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ez2SUlRyvGQWFaRonAO1AfYboy0jbqyl3K6PdJMFs6o=;
        b=mbuWGKkbG6CwzPe8EtprcplE0mxDClAntRfVeueB56GUkSju9VKC/EPT6+/SqidHyx
         ns4y1+AtUewbKRGnRyu4+nU/CeZK5ewI59Sqh/j1ZsufkU+fgz+vLn2CcVKo+L3GxP1w
         20/GO5YZEeeX45KDQlU1Nm+sTau+/Wp8iB3WUrwEQVDrARF2hvG+9e+MTssc9FFY6YFE
         F1t9OJ2rdYsErvGoRMzATzXBV7ekGBXWFidO8lPqnQzgwQpWnc8zPPB1T+BU0XxLQpzh
         tnI/Oty72UMlo3fMi+RRUxtSsqkJ7SzezbwWL16Wp1LVXQJdH9dUGizbBCJMZHzMRrK9
         LllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737721495; x=1738326295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ez2SUlRyvGQWFaRonAO1AfYboy0jbqyl3K6PdJMFs6o=;
        b=LjmUYPuNNnbfACO1x70h2x3U1T9u6fGaRrQVXLFPpA57LJCeZeg3FMw4MygZXiymNH
         ehmwP3dk2sK6hT6nZsMvH4cjU4LL/mFnjMMXRRtx/cVEjIxAZHAwCMY0rgDupxJzG5Bb
         mtt8V+bUOyM2YWEQfvAXtNtUuRv78SK37DddrYRFllcLBJNbHc+gNjRWrcwxVxW27jG9
         KxIfulY6UAMqw1hkTkUrciV20tnCd0mbO26yiSltkYsNWPP72BbumHRAcCPqvLA+dr8N
         gUdtRhaW165Ilw/ZoAkhuFKw3VxkLogi3HM4UqO4Sv6qcCSPlq28WTlKY7EXLAGAhvTQ
         5P5A==
X-Forwarded-Encrypted: i=1; AJvYcCWQvoyrK/EGQhlW2KG/OF+9tx5ZYLhrI6KWTkdEtrAstqtHeTqeJf3zYNgewNef4qvnfYdzdens3FOy19oH@lists.linux.dev
X-Gm-Message-State: AOJu0YzNS8faSvEeGXBbbQx/xJ0Q2XtDYX2nqpFQa3xbBlqvahP4Jbhm
	PMHiH+PYvrS6DYZdGe7h41YEqLsNbsMK9EsrnsY33iGDkszl5jJcd6PwSt0Avr1YsnXgI2HTN3g
	/7M5ns8tGHFf3DcfTM0Xc27x2BSQ=
X-Gm-Gg: ASbGncvaqZy3sw8y9/BmWxilOUvkABLtQFq5E7GHJc39VYB/nk7pI4dcO3gh+1WYDTw
	dvAHG7LhLF4tyLZFX8RN+o+vRrvFQCZOBdqUIxbBmPm4mSgWHwxzouVhi7iIviA==
X-Google-Smtp-Source: AGHT+IH7FFyODV+v1X7zscNsvWrVSCtN2/X2KIAW2/2W40Xjumsu+sIF0BJPdjbE/jACAI/w07aysYDlAo3xtMe9ywY=
X-Received: by 2002:a17:907:7f17:b0:ab2:b5f1:5698 with SMTP id
 a640c23a62f3a-ab38b44e10emr3083236166b.38.1737721494768; Fri, 24 Jan 2025
 04:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
In-Reply-To: <78C4C3F9E650FD04+20250124034402.540943-1-wangyuli@uniontech.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 24 Jan 2025 14:24:18 +0200
X-Gm-Features: AWEUYZksS6rM_MVX07XY5v4VK89J11NA6n6GtHKDlIW8nNRKM6w2dUUbBkcDiqo
Message-ID: <CAHp75VcQupMnxkaObctgBAqZsbyJbDjYueE3rsSOLUM256vomQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: i2c: Remove unused macro definitions
To: WangYuli <wangyuli@uniontech.com>
Cc: hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	zhanjun@uniontech.com, guanwentao@uniontech.com, chenlinxuan@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 5:45=E2=80=AFAM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> Delete obsolete macro definitions that are no longer in use in
> mt9m114.h to improve code readability and maintainability.

It looks okay, but as far as I know this driver needs a lot of work
and some of those macros actually may be needed. Do you have a full
roadmap of making this driver to be in shape?

--=20
With Best Regards,
Andy Shevchenko
