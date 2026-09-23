Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA9B43FD3B
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178511; cv=pass; b=tFg/HCN3k5bNZITIubUV8k1OTTfDocEofPnoxrCeH8GwddMFWncB56Y+qS+orHvp9dN9A4lpJPBA1kvzj04UxzPqnPCknf3klpGDErtj5dLqAjL/q0fiIud/NJn+z7Fmmkpq54WAn4SplgNMxEg2cE75aleSyLbRwbOzS/Ynx1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178511; c=relaxed/simple;
	bh=l2pmTaYj5bsjg/VqjbuilhgmiwEDlikpvuksfpHs4aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePKWh/pK2XVqwE+/EV4iPlV8baq4zYLAA8qf1EJDRFmdEODpDcgF25nru6VEc+3S8+b3a37YDccnHg5w6JvIKN0KUcqnCBvprJOVhFyTz8AdbdcQQ3cv/pNlgP5u6vSebEOTTcknNmF++73dCbGmN8IRFgSlmCkVz67KtbN6WoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zzq6Gd15; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzq6Gd15"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-78565b4db79so596143137.3
        for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 08:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790178508; cv=none;
        d=google.com; s=arc-20260327;
        b=knb2/Twx2Ka8SXx6ldtmb+V1V/J+eJBZrjZKwYEG+76KHmdEPFMMGNx1CF18hs5RPH
         gKK/J52onCwSxZ5Yi4keck8olwvJV/0k2bJUMF4c9vbNtsJ5/vevKsHysg3Pdj7cAx3c
         t0xLiLvAUEyOzN0UIYvAEj/Hm0Ef99kphLoM0tiMq3Blxkv2Znu2fxVhc7O1rXz9gh/D
         7zxcglzhs3f4XtmdZkqzckWuE0LfOF2Uah75//q3WYSE7uYN/4cb/NJsLtfs0iS5ypVV
         +/4eU6RQ2cdFr6O64uv/4Kq4gCHeZRR7aL2et3a0IpV0LE/KuvC4TDiMd+FZnkWYSAPA
         Ty9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4WPZ4zqm8ezSWOAuYy2kHwqmOGcyX5dZpEWb9VtYmM=;
        fh=VBjYSDJfXLtudf1wFn6Sz7UtqBM0k9NTskEE57CD2HY=;
        b=oTU09RD3VjiQZh6Ks32ieHgO+1LoLyTeIW+HZhl27NS8/r1bknFswScw2syi1Q9Qh1
         teSDPxVGh0x6F/aqprZ+Qo1AUdySG6zD9HDKJqEqLr9cCRwYxv+5mdHLRUPD/21UyIfC
         zcvcXo/yYtUAYCujxRI7IgUNsU81bDxlt/e/OUj1OZBemdauicDtEUmoCcrzgnI/1Coo
         BLQ1DHDjiBbctFhV4I613Kihu9hBhnp6bNPgwegXVgOVXED5iTxCEdbLANIlfAi9WhAd
         KtTY7zluhwCdPQqomldgkqbxWhOfFvX7zV/An3MgfCNWXwpf4qcI1ifjj06Yot0kDds2
         Sv4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790178508; x=1790783308; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4WPZ4zqm8ezSWOAuYy2kHwqmOGcyX5dZpEWb9VtYmM=;
        b=Zzq6Gd15ZAGdDq+xzzZ71LxrwfzAl4Zoj4quNYcQcjAWJKocqgUTDMxh3I+cdTzTT3
         dJ46wFQtkMXkkcS9JCZ0kpk4JgI8aXN4G/kexIB+Sxr64ifJpM14FuXUstKocUbTj0AF
         YSfYgKw1bkmwOr5pAXAL6mzLBCe2qQINclgo68CL7vnqGrg/AEjBtdlWSYCzRZ1oYNDX
         Zbpic9NA+JDPxco/dTHOhg+sEopAGCGNUs5lVYppSHWIEZWlfHBFV4PG7VSA1Vd3MuoU
         JELU5T07YLLjXj4Fx8Rc3kvp4Npe/GU3n2gZNbyLxwc8teSCNKwsvItOXZ8gfxWtHglo
         NAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178508; x=1790783308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4WPZ4zqm8ezSWOAuYy2kHwqmOGcyX5dZpEWb9VtYmM=;
        b=sxzHzNKLrIRNFjyt4VOhnsjhLy1u13rdn6I1Dyc9XoCC2bdfTAL/IZlDAExsK97xlN
         hZdjHm658lEi4yfWqJl/dpZtjuh9eMLgx/tCWILLTZl25t1vU6xg3E+G1eNsgiqWpHO3
         H9/UezSh9w6PCk5pBgfwcIIQYUoe3CegXdwhx5VhmpRz+H5fMgCokGtFNBlOMXMaBjwU
         d8eGwSopA5ZgtYIoFRpnXgEc9NIXlpdDTrWN6+46SII3cRbJNy0bZJZ7md3sDpchDQui
         NnfpvgjDjib4EHxIZt+Ypqx0fl5X3et2gfEEi2/Y3uEMOG+FhQAn7Bzp2cHIXNmZjTX6
         gBWg==
X-Forwarded-Encrypted: i=1; AKwUvByVfyUl/M6LVBuZJRHV6rhQ8y7VnknMX9xqPE4Thdm/2mUwd8mYFhhsdBsz6Q1TKUGZ0luW/loIQ5jMzZrU@lists.linux.dev
X-Gm-Message-State: AFuF++mhOsxiXPj/ccx1CHEAG+o2PJPtfEeMf/8i7Uz5VzLcg20GhiOb
	+0TxEYNICexBs3WoUiu7seVSFVxHETiizLuCj8S3dmV4lr5Xj8DuhHGvXqo9K7gYLP8dFE0DHj8
	EVm68vjc3MyWUIBvuil/8pjEuxpJKRdfuoR5K7ZE=
X-Gm-Gg: AYBFou0LQWdDo8xFtZBLt5ABUYXr++Bp3EvPWELmarmDyZ5DK4QIP9UKqcJfIhHYgH2
	4nSw4PdHNoZTs0w4F/So9brF+347dS0AJADjfMv+wXAHP7Un2mTSd8uwxALx/NY1iBzHaDp7Au9
	qb+Azd+gvB9f3XjL3i9RFPiSu7KNDSz7b05snPTaNeZBtvgaZgnzDGtf7bXd9lumjV88B2Ffq/N
	xQtXAOpE5UG+aPA3bG0UhKEXcUoYj2PGGLA/vJBBMV4glG7qrVl0ZH5Lkb45BBOpjMoG2FnAco5
	wng2bXgvkV15vQZCvuVT+ZfmtMdgczmVdwsqtCYGNpcHSWf5vHlnS8ZkBt3RWT1vuZnTE7eJO5Y
	EO2qqbQOjhVNl
X-Received: by 2002:a05:6102:5808:b0:7a0:f7cc:5045 with SMTP id
 ada2fe7eead31-7ac1ace44e2mr3005717137.9.1790178508346; Wed, 23 Sep 2026
 08:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922225501.1792665-1-inakisobera8@gmail.com> <e0bf7dfe-c03d-4fa6-abdd-ac88cab8faa8@sezginduran.net>
In-Reply-To: <e0bf7dfe-c03d-4fa6-abdd-ac88cab8faa8@sezginduran.net>
From: =?UTF-8?Q?I=C3=B1aki_Sobera_Sotomayor?= <inakisobera8@gmail.com>
Date: Wed, 23 Sep 2026 09:48:17 -0600
X-Gm-Features: AclHuK8teJhZIneAm-pS1paRCtlXiHjDfzAKz7zCRFZ5JookA8cSJaHe4mqvE2Q
Message-ID: <CAAqk8=3zK9bJV2Oejb9vTD_tKA9agcsCWnKgEEPm5tgnza8A+w@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: mark g_fbmode as const
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ahmet,

Thank you for pointing this out. You are completely right.

I mistakenly missed that g_fbmode elements are assigned in sm750.c
(lines 762, 764, 872, 876) when handling display options, so making the
array itself const breaks compilation when CONFIG_FB_SM750 is enabled.

Please disregard this patch. Apologies for the noise.

Best regards,
I=C3=B1aki Sobera Sotomayor


El mi=C3=A9, 23 sept 2026 a las 1:27, Ahmet Sezgin Duran
(<ahmet@sezginduran.net>) escribi=C3=B3:
>
> On 9/23/26 1:55 AM, I=C3=B1aki Sobera Sotomayor wrote:
> > The g_fbmode array of pointers is only used during module initializatio=
n
> > to parse display options and is never modified. Marking both the pointe=
rs
> > and the array const allows the compiler to place it in .rodata, which
> > avoids accidental modifications and cleans up a checkpatch warning.
> >
> > Signed-off-by: I=C3=B1aki Sobera Sotomayor <inakisobera8@gmail.com>
> > ---
> >   drivers/staging/sm750fb/sm750.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/=
sm750.c
> > index 8b93bfeb2..c3f391cdd 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -12,7 +12,7 @@
> >   static int g_hwcursor =3D 1;
> >   static int g_noaccel __ro_after_init;
> >   static int g_nomtrr __ro_after_init;
> > -static const char *g_fbmode[] =3D {NULL, NULL};
> > +static const char * const g_fbmode[] =3D {NULL, NULL};
> >   static const char *g_def_fbmode =3D "1024x768-32@60";
> >   static char *g_settings;
> >   static int g_dualview __ro_after_init;
>
> Did you compile this patch? While SM750 module is enabled?
>
> Regards,
> Ahmet Sezgin Duran
