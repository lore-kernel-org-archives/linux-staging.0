Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FBC4CDDC3
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832084; cv=pass; b=YIv+KAb4cgVcuL3VGYRLMzYEPYDeapmx1kihfz0BySl0KsnYYk/C7t7v+tJKgReODxgkpk9lge9rfSV12xYL3+//T2+Wt5rud5dnDNBvxBmuXrsl9rg5K55fQXuWOxMZNzaRSpCvWpOCy+eJQGZha9Hd24rzAeOfqbUa6a1B9hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832084; c=relaxed/simple;
	bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gihhO6AHIxm0oPVPl/kjK8zwqoUmK9IEklmVok58+92EJazEHQUCELEpbFCYYhlTS8D2OJ89gzBEUXM9/fAf6g0bObo4Fjxu88XxIC0MJJL7lw1mn/Q2/oKkIBaiTR2GBVvFIdHjDCLNnG8+A2gBB6gm/dXTJIytqFFh4o8uRkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRV7K3Gu; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRV7K3Gu"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so23042731fa.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 12:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791832080; cv=none;
        d=google.com; s=arc-20260327;
        b=Hc6HAT3lH72IhdYmhVD69iFzF+BemxluGz9Z/SUAM6rW7hcaWKfzYRsNXNgN0JFj0W
         BCPCNxfyKDTl7tQUmEzOZu05QS/rUoaTvYZ68/i+DkIk1Lz+YzmakjrXiHtE69mbTkip
         NwQTDF00qTMS5epQzPn4X/9qGxAPoJlA06QibmamwoQVXHhEtglfif58SUaWsT0KK6If
         stu7z2O7sJ/wJlYNICuLwrSb90nqOV5PMGzSepnZuDDtxqE7tTTNiTX7g4Byu5FL3TMs
         uqcqFZNUJxAhd+QNi31MnOtoHlXla8URHgLH3DnSfe43liucJFj4V22pEotY5tg8cYpT
         E5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
        fh=ELhYvvwxPKWiNktseF1rUIuM4xePjo6nm7mHEj1PO9w=;
        b=sOqxtti3aO+JoNuM3T25T4rw29apYz8rYVnPt8I/xO0HsUSlkj3abC7wvkq/W1NDeP
         aO+Z74ANa7nAR3/F1LRzaa9pshAhoJvOBJ+cUJqyoRxCXGbrsIxFtLhPQ+8C05lJCpJP
         rwxaepo/10ZEYaoK15YC1vkpU81VGEaCQlW39yUTLYKU/oZWP14xgKTwOtMV1Mc3kcuL
         63ny1MPObSgc/uJqgFFwQLXLfyhpFiY+F+GDUm2QnE43dE3wwRfe7C0wpkt1tnxqDgKm
         efYauL4fXttm2jTOy1I4tnAcP4lS8rlZqEA2LOgEYakDfcJGCk7qe+ZwaXwMjpvhbSmx
         gMBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791832080; x=1792436880; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
        b=SRV7K3GuVNgArOq5zKtPfnZxs45DU3mDV7CMUG6Fd4nBENWA4gpQ+Qzt6zyB/czEz3
         HecA1dnKP4cFZoGp7eht0eob+fSYPgYkS3jX63HMPVAOTFqWmMPSD3mgjPD3O4DgUHAm
         CxT8UPiEzJWNREkU2kAIZr691rRoaeiPraKV7sYqV6OHjuWOfVRHIa1GHcEPQu8n2+Z1
         /qYTN40i9Nd0XNA07OOGhSTwbQ5fNip5fR6oH1P0vx+0kA9N6fKzO/KkpnKwdaxTnNxV
         cMc4s9KvgVX9ZFt3kA0PtZ01gKWTvEkrXwjv4oan8P9QIfW8yEdgMsXlSlUD8QKkHzNU
         eQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832080; x=1792436880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcSrQZk3qlt7pRiEDZiw/H6EM8LqgO2WNUy5cYNkEFo=;
        b=hqnGcbuHwJ0xqrUDamZHegxVqPonKEyWcCFYk1lmxL0TsLa0s7Vr4NJd/oXI3rvDIF
         +69wFElzkmTpr8MgCLf702z2UgJQaWf+Y+aoxZJwharRoHLhdOGwyMGAfqUHpJ3LSF++
         FpgmzzLkNg4PQtI138Zdeyiv3nzhnlbMkEzt1kQdb9RiVWN6QbQGmHBl/ZfF8LO85v0E
         WxG51OGXHXt3fGPgd3rSd50PDs7XeLGUcX6am4hjfXb1UwjVk/zapH45lDWQSQHje5uD
         395GWSkNu3ctQ0f30lxAfXKlUHyflT2is2gzkR5C8593yVDN/6XNpOnB2X/HPn+s+Nr+
         1uvA==
X-Forwarded-Encrypted: i=1; AKwUvBxAjtBK/9evYmy95XMUaMo6QgQU+pFSlLnwKG/pDwCefOE7QExHbcYtE2nkM76iCIQjD329U82o3P+vsACf@lists.linux.dev
X-Gm-Message-State: AFq9FYKM0QiTryGDanu70Tb3dFo/xKuZQOFt7zZ1vFjB8xa8UtpoISzv
	Oj4z1zkdEA3twQy2PMhoY2mBBmim8xF2VpUh4U5TenMBob0JpuNroAAAqxf+pJHDGFU4ECWwbrM
	m/V1aMH2g4845ghX3ntsFoAEOsFTCjBw=
X-Gm-Gg: AYBFou0QXA1vP6DWZQ1Gh/nxkP7FodEJ80i3KNQgRYu6CMWAp2p3g5yQkM/cRXFNEp0
	Cuu4MnryxfyWJQbsKuQKi3S6g4up3CgMwAqNTsRTo2w62KR+M4x3q7zDLfJPiQrkW9ZrMeNXwPG
	HmzRPgS+9v5uP0xNUppnz5CrINkCXjE/7JWkVIIrryx4L588YKYlfx+zYF38D6uWczcDAivu1fG
	FOElJ+vbBfVrhxDvY65EqDOA37uvZNcqcbaN+/Im04mb4Nbky9F3XCa20k5wsEUE5xM7gf+v2OB
	bZ4BQxW+mbNee3D0EWkdrj1WVoDN2RIGDQOLqaH5ThuwKO9+GlZ6+kyDBRPs6fjYYgxWYdsA1jG
	4xrGV+tElL4jdr5WJuH1o1NYNSdi3b4unsIPgp5FS9QeOAEUvjSGFqtOkZIZ/gGvJ+SFbvlYMlc
	2W4r0uGFU7j+QhqGXKBxOZ0Zq7mvMriFobqyEYH2e05LJy/eiX0G4=
X-Received: by 2002:a2e:be0d:0:b0:3a9:d756:bfed with SMTP id
 38308e7fff4ca-3a9d756c4a4mr13154101fa.10.1791832080463; Mon, 12 Oct 2026
 12:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com>
In-Reply-To: <20261012161322.930099-1-johnsingleton@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 22:07:23 +0300
X-Gm-Features: AclHuK8iM1Olv3dEWQjQsTVTum34F4zSHmBcCl-HukPLYcMHj5uyNgbV89OICy4
Message-ID: <CAHp75VdvH7T9qLE1e5w2PL+mkNS+ArAC_1E6uQgAE_XvRToiaw@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: media: atomisp: Make pmic_name array const
To: johnsingleton@google.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Add const to pmic_name[] as advised by checkpatch to ensure the
> pointer itself remains unmodified. The array is read and never
> modified, so this change safe.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
