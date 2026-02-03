Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6A83921F3
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106210; cv=pass; b=D2fbqsvcR9fB/+rkM1+eCzoB/hyKcAtT4stHaHoRUS6az/Z/mPwJVXMvFLDrHP4EX+ufUSOyY5tepU6llxFBVq+hBGw5dTThS5rYHrDUiu9XhEEO2RWW2NJ4ZQN2lTO76xI75uSDLe+gN2Zbri7nU8sfoGZmcYdHOA/fo9WUhhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106210; c=relaxed/simple;
	bh=C9oP7tPg9I44enh/U345pZTUlbCHj6gHPrMjsAmLrs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPmvcrT5/JR7W1vSDy6D3ZMMnyJwoE0p4jMhbCSU0F63VPWHIPbd2bx9UlUH/8xwbUS2ZR1c0rKLgGKkq3IA2QHsdYgIlxyxRYFa5bq5tV0X6AzcM9M/2I4GNlztpUG/PCd93CaeITQOMCmxBmzxONB6wJBNkuMX6BEHfpE2Jb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAkEkck0; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAkEkck0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65807298140so8965917a12.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 00:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770106208; cv=none;
        d=google.com; s=arc-20240605;
        b=RgWkT8Pcl7gICFArhKLuRbWOaRzfdYADCWgDjvCHKUMJ8c3x3Mh1dk+iWw1ji4yj6j
         CnWjDtgrEXYnyF4gVgnbT1bP732xqRQLybTvv6FG6cGMqdM+bCnRk5AWF+HbRGgjg2Ej
         C2dty+k8hGSi1PwS5MxMsu6UDh+Mcegcf4NSV/kn5vPE0HjTTrW6Y2J9CnyI3KEneznZ
         eH+b56x4T1Kgzw5VIA3+8M3p/+FNziASx/7x4tseMkvJey7rpJZccbhJvjEYaWxMKbcg
         eZPfUxZ6UKnjrh5J54TtTuu9jbqdC1PVE6ZMAkfdy8T7SBUhsiuomERJWAnS4XhURwd6
         oGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C9oP7tPg9I44enh/U345pZTUlbCHj6gHPrMjsAmLrs0=;
        fh=ndfCF4Y5bCmgadohk2nt04OYRzNMsxI83eEaBHPWMuA=;
        b=RJB+6319bBTV6bh07a03o9i5pYrasD2tG/s7QjeSOzEYsyZWnKhD2qH94PMXXxZ40F
         PRId0tvQ4wJ7GbtuFS+EV2sUZNUx77hgFDsOhlHXpmxVcux4kzK40FhS8IrDnu22scq1
         AX3qEbIFDoAV773ffBq4mvkvoqlkde0k4ACsONwEOOjMFLMajrtT06OZ+iQH24MWbhI2
         j1KuHWb0wxwZaC1aL63vXtOCMbyCs/mzi3BG3tu6EZsuqTkrWlSVEzdXGoluD/FZHKMC
         ZDyYkx36JuYwWP/HZ1lu0frmoBlROcSpC6b+2OqFF3HAXCLeQacOU/l9snW1ow7iX8r4
         pwwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770106208; x=1770711008; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9oP7tPg9I44enh/U345pZTUlbCHj6gHPrMjsAmLrs0=;
        b=dAkEkck0YPROpFr9cRQBakonri3rkVKISnm/yksNqMgunjRW9Gr/ZyBUi29yDOm54V
         iQfFFnMzBZuqzuKZKyKa/rMJibMkiFZfusMeUXyMiTRjZTEmaptziRtyQlWaBPN3/0+E
         XGxDk3+9oowI2vfqlo5Q6DMtgB5VBIAQWL74xUhrB7NMyY12Wg55f5yxDf/mPbSdEMgt
         JsLmY+Sbd3irPWQeke4cfUqKcIIoQ7nD6JT5cX+Cb5UhmUyB3w6JPeb/FOk2wvTzsjuj
         m50GpI92pClc+pQGwVIyFYNhYddFfAgc2PNQ9Ibf/C8VM5i4QCUSlesrcwINRKIY+XC7
         Fs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770106208; x=1770711008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C9oP7tPg9I44enh/U345pZTUlbCHj6gHPrMjsAmLrs0=;
        b=Pbj1tHJnxozw1JIImgLLi40DiGFSXHEFPaVp90it1Ty/xHgDCOneTg2GVM3S9GSSZr
         WmnZm9Wy3lUuicrw3zfAb2+hK0gpT48a5bX8eWIqouCkeudu8UfZvliumrFP5/FfrNzq
         LN/KLUYghRl1fmJgclmKLkOd3fuTGqDFowxGsp0XeBqMRvzwB6bSEqOpxy/PuzwbzdUz
         fFG7WUrwT0NIl0HrQ+W83xFblrZdq9JNiJR4E35SJr+sLbK+qM3QmTlPv4Yi3+ZqN7yN
         6K6C9OTW6HuYDx6W/+l2hhbdcszebaf+SWCLv43uDd1AEsLRtnZbGT6/SRi5PtR/SMcG
         5AuA==
X-Forwarded-Encrypted: i=1; AJvYcCWapX+SmyH/7Y2yeUjVOarInxIRy+Kv1JuFe5b2TcBB7b+RRIpVg8Uw0kBzkjFX9gd3GvTvXI56A0+ObCM1@lists.linux.dev
X-Gm-Message-State: AOJu0YwCX65EPMVpwdiWuNtFnYP1Kefj4jTlQjgCtKlyfba0okxGjsaR
	W+k+tjPei3izgQ5mWcYRSVHZ/wzggkO7fajDqxILmbPmCZbyWIocXEs7b6Zs45bBzVLS1wQ/PJL
	aEbldxJJ8VipQ3WcYo4FrdOARGMKaFwc=
X-Gm-Gg: AZuq6aKQcgu08RT2q1ZWUUocXC/VNwj6rdqCwO++Pxm6aGuMA3Fqk+6GxBW86pBaqRj
	I8PCDTzcVegKc/2c8WdihAmLDy54O5BJaqnNkgkbfXhYaKi9y4wUVgy8zRypww5ftdMAJaMN8No
	dzQgEJN3aeJJ+45Mvr/q0USMhHVwd+CCRgYbAd81Br2mAPMlmm67/ItEJlPZ5ODbexPTzl+3p6b
	tjZwHtZ1YLDWGKYHfi1ZWZ4QQiUjD3rSd47KA7lqHNaIEuxOTdUN8Gt0Zlal/NSMmC78ZfvjYtw
	urqHCyNYiOrkEyVROqvHndvK7amagu/b2yQcA484OBvQI+3yW6Cqfz6sIl62jmZgLDbEh2o=
X-Received: by 2002:a17:907:3e1a:b0:b87:7485:b4a8 with SMTP id
 a640c23a62f3a-b8dff23aab3mr875762966b.0.1770106207428; Tue, 03 Feb 2026
 00:10:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260201142415.83595-1-adarshdas950@gmail.com>
In-Reply-To: <20260201142415.83595-1-adarshdas950@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Feb 2026 10:09:30 +0200
X-Gm-Features: AZwV_Qi7KIuPVGFKEQFffVN80tTc7L4AIU-pda6qyT2vJMRAJByFXlXjPX44igc
Message-ID: <CAHp75VcP+h0U8+zBsbaZJN=K7kH_Rqszm8MiBm+NNkzVDMfvsQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove functions doing ftrace
 like logging
To: Adarsh Das <adarshdas950@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 4:24=E2=80=AFPM Adarsh Das <adarshdas950@gmail.com> =
wrote:
>
> Remove ia_css_debug_dtrace() calls which only log function entry.
> ftrace should be used instead.

LGTM,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
