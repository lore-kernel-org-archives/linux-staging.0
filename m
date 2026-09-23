Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28C531615
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191154; cv=pass; b=d4F79qvu4qeMwGP77itasxA3IbsdzJg+mXQ/AbTJ9gGEb5tE/w0CVQLk2/Fzbn1OSIcvZfIABJmtfpq57Xiulai1GLlYFGd/38wwJn/UGm/QsVowyd7whktytJrrxJsgQaRggHWHvivbKqrXyxfNl/sjZzKMOnKpQ988AeQhydY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191154; c=relaxed/simple;
	bh=REliDhaH9+1Oq7CbV+dKfmJpG98JSKZR8x6JKNYcStU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqj8MpF/050pjGc5tUanDyMY30uxfU2bl9x/jRNOVrKfB9iEGGSw9+gflBTmPHmrGB4Q5zsY/2a2PkVcLwGZ9XsrSM4zKQ4Q4ZpulyI3v7HsgIB1QZTcQGINd0FlY4BtSv6WhtR87qRxW2IMMAVsJVvQ/0SyBZ7mrgspcT6+eTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5iXkCUO; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5iXkCUO"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff16c0e6so10477181fa.0
        for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 12:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790191151; cv=none;
        d=google.com; s=arc-20260327;
        b=P+Lq1wPJs2iekYEpuqnUEYiOHWn5dmggNuTo8IJtSus+TRIrs4mL7AHd3pkExCymx6
         DZVAeUyWb7cs3ZhH98CXivpGrb0kE3Rfe2hvYbgpVUIW+toMBbwyCV4o8Z4rgDh5C5NZ
         wnQ6MVXBybYV9Fc4IL+j55ZED2HHBiEYviZn8P6CBG/0r0ivThgwx1hIIczWUQ7vzVQa
         Fgsm3QxL+9zTqbrLOllZwJ4vrfd111Lo4KP1UH5If1rjlsM+S6+VCWLpbrcYotnrFMEs
         0j6h9WELMw+5q7R3FG4DCzbW2sgie+Xb4On//9z5NlIPjdEa96FKdW7Ipbz2OgvabTve
         8+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=73WOzeiX39morD6/5z/QgMfS5LWgdgnhu2L7icH2rx4=;
        fh=TPiwU7fouvO84XHnLG190RnxT7qGzMKfMLcS1h1SeNM=;
        b=ahpKrxa1+AoXPJjmy4FuWxfqbrv5OPN9OXkRPe7P5IPrFfcdCesHYb2mRffVw6Wyuj
         ijlkKFYH/hmZ/eW6ubCEA7GAtI61Bo6GnW+leE5T+3G0W8ElUuUvIcDHLkfJJnHlVoo+
         MnPyg6r7co4Q14+k6WMAjVlFokfq3qkUx7i+schZqUsbwsg5BVrBxNkp9d7VOEdeb5DB
         l/6Qt/u/52u0ObPQ5x3lWwzc1a14FjRPor210N7KjcKPiAxhxYOeXXwLtOOdEXBb5589
         x/k98qkEJINLGg12qZOxj0rwFRXrV08QtbpDE/QkcHXsxBlEMBjUeEpWhPLAue+wNR2c
         Tcbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790191151; x=1790795951; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73WOzeiX39morD6/5z/QgMfS5LWgdgnhu2L7icH2rx4=;
        b=e5iXkCUO4E0j5p54vhHUkdWx5PmY0XLgHWajP6BBV7ohhpLjNP+IN/MNk3noD13ejp
         2V5SQkSuSNHYWZBpYefq3HyBg4mA9mYS8fdVw3dbCGPHZUnpYRlAlS6i0Xsw/hQrXVuy
         paY9Fma2+RVfTBSn1JsTqKJm33rYWELiQwWprdOtA8eIJi+KcKYqLOEvoag9TSANwdTy
         VnYFSj1y44M52y0pb6gbipzczO/6K9jPF6lVjKyJwheu0bDOstjOepdGOXqtJUaZtuo9
         EgsdFFut6lq9zqg1aHZ+UnFNG3b2+3pu+nyB2Nea2vkD7ax+GbnWQ3rQZqtVZFMyPWTC
         HnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191151; x=1790795951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73WOzeiX39morD6/5z/QgMfS5LWgdgnhu2L7icH2rx4=;
        b=hphYTgEKXjYCBIs3iq1nZ0ieJDEdmLGWRoa3XPaJvISP2B8Fta/BTdZUrQDPUGve1F
         QsqO59jo9qvDElOqNRGxv8w45J7kbG+uhvsoQS9V36LC9aYpV4bV0NJtgLWmuViQziZx
         gH49dkos/aYZqkJQ4ccSxxplHGxibxoe4Sel32GcR+0xHZSLC2kDY3eTYbFcfgKobq12
         xyvt28b1bZvtZQmnNw5ektV10VJFplIE1pk95hS3E/YjRGY2PmMqY+8eEVTk2h8Qb5is
         8fZBdBqa2I2cvsn5ous9KD3aqHnX58UBKFdDWBnLvBlSrR8agwIHqcN2EAuSiriW2XLD
         Qh7A==
X-Forwarded-Encrypted: i=1; AKwUvBwhUGUKMs/mtSVgKgaTCUCB0eaXvlw33NvfpP533mi3DeTCTaX14EAVeZEN11t/0QN218o3JYrCbvS5WxiR@lists.linux.dev
X-Gm-Message-State: AFuF++lj69s2IkL4iaT2tA6+OD0NrjhCadIItKDkydvhcEpRV4HD2G2a
	P5pg8x2KOkQaAmvBOE6QKDFjHtV7kwTyJylnDNwFDKwUG8w8jB7VZed8XSIF9Umc0jed7u6Bg6a
	8mVPuZVFiH37rRdnNoWdmjWc1bLsQWTA=
X-Gm-Gg: AYBFou0u/wysHqKWkjyWhUhlN0ZoL8eJ49LgtyCR2X4gF8qSDlHPB4h5QRARrY2Bygu
	qrkScqMus9kLLFo9OiTTvfl31sGeVI+53nzvU+lO1cMoidA2QozLppX67qBIX3N0uhIZXTe+94F
	+584sWhNnw/h71pg58dXfozWnB3fRNJgWIEGW8mA65QTDpbwb4YYsF3kTWcOJsi2mX829tn21pp
	gozmtH7mWIyEI2cDJq11dvzJu+LH18spA8GfYBHepU7hpPt0esEdwCfw5dj0iMjo8dTwc4go66I
	rm2kedWbn7y94Rh+dqys/8tPIpMpEYonwV6r0G3+WlB0yHnYYKx2rl117GAtEikfC8WAPtYEv99
	y
X-Received: by 2002:a05:651c:15c5:10b0:3a6:32a5:efb0 with SMTP id
 38308e7fff4ca-3a63c427924mr207641fa.28.1790191150200; Wed, 23 Sep 2026
 12:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922193653.16086-1-vladan.kalaba@gmail.com> <f6fc1427-f771-4709-8153-f9814254a50d@sezginduran.net>
In-Reply-To: <f6fc1427-f771-4709-8153-f9814254a50d@sezginduran.net>
From: Vladan Kalaba <vladan.kalaba@gmail.com>
Date: Wed, 23 Sep 2026 22:18:58 +0300
X-Gm-Features: AclHuK8cg8iU0N6lQ8j6fa9jUz41AkITQWJyDQNLWNfRC_PbGhUmbmDrR6aOYiU
Message-ID: <CAMfJq187r9dLgwnncT1zmCmwYYFiY0kNg102=L4wmfzuw=12gg@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: fix const pointer declaration in sm750.c
To: Ahmet Sezgin Duran <ahmet@sezginduran.net>
Cc: gregkh@linuxfoundation.org, sudipm.mukherjee@gmail.com, 
	teddy.wang@siliconmotion.com, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:28=E2=80=AFAM Ahmet Sezgin Duran
<ahmet@sezginduran.net> wrote:
>
> On 9/22/26 10:36 PM, Vladan Kalaba wrote:
> > Fix static const char * declaration for g_fbmode[] to static const
> > char * const as reported by checkpatch to cohere to Linux kernel
> > coding standards.
> >
> > Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
> > ---
> >   drivers/staging/sm750fb/sm750.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/=
sm750.c
> > index 1ea3dd8b8f28..79d0221cdeae 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -12,7 +12,7 @@
> >   static int g_hwcursor =3D 1;
> >   static int g_noaccel __ro_after_init;
> >   static int g_nomtrr __ro_after_init;
> > -static const char *g_fbmode[] =3D {NULL, NULL};
> > +static const char * const g_fbmode[] =3D {NULL, NULL};
> >   static const char * const g_def_fbmode =3D "1024x768-32@60";
> >   static char *g_settings;
> >   static int g_dualview __ro_after_init;
>
> Did you compile this patch? While SM750 module is enabled?
>
> Regards,
> Ahmet Sezgin Duran
Hi Ahmet,
My make defconfig didn't compile in SM750, my bad sorry.
Will double check that in the future.

Sincerely,
Vladan
