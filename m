Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1121CAA78
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 09:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378241; cv=pass; b=ei0011XpjGu4PPrR92+/nxj/MhPKWUMr/+wxklEHuWqkRNuatfQF2nvu1piZeKdO+ZUpOMH2flGakqQsBD4i+omYJj9WsJXB44WCvD3Nd88uMCme0QUB9qfkf6hnG7SpGP2DbCPAuyE7gk2CeY6sSBZs3YvuQUSIOjwRUg4XI8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378241; c=relaxed/simple;
	bh=k+JtXVe2DiLhrJFE1fbf6myOq+FczHlLlM19E6OsARE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISwZ9YyzuSbqaR4JAWaAn8qYNkgteVUltBu91bq2p08SIhrwyyP54J3v+CFHQtag99F4JEIDAmnDsj008NVvIyNsGPUkc58lp+J491ELodIOORQY2Xu3X49fbc0BHbC5K6XvFknEv5Ldih9J9vqiJHW7zbPKzjoiHXrjmX3y8z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDD29CW0; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDD29CW0"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8894560c89so588813a12.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 02:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782378240; cv=none;
        d=google.com; s=arc-20260327;
        b=KG9rpXjN7GlIigjH7cwLa0bwfPPq90kVWUANaioqspDknlR0uxrCCaa3ES400ZECnU
         EbG75DDxK7lmenoK6pD5A0ZPd9ZVlqpDNU3OwP4F4eEHqWQqStaHvUREx5CMUvhHhSwB
         OBB6Ua1R2K5kNEalt5zlOCsWz5hs0ND0ZS0AN2g1O6uf2vbEbOETFUnwQziNP+4672vE
         4kRo9mJjNSPAftBsQa2sAcvRbxPt1CTI/Y2qSgWByCG/TPmQxnj0/nWAZiURSm+JTEZv
         MYk9DS56IAxDh7B9DgOJ6jQKLO4Ev4BHR35jEGcQSxQoTP1YgO46rRGtNFx9xcJfLMzv
         uMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2s2sz76O+Yw6Ynt/ts8/PPSCfN34FF1Pj3n3Rz2cL5c=;
        fh=UyKw9KKEHx/t3fb6VaVPBo2FN6zL3FGoMfcbVrxzp9Q=;
        b=BqWym0PRS8EyRlSFRmycJRDq0wLPk4JzeCNMY1sjh4M9R2EIjMjVRc80dI/JwSBGtf
         IYppTmm/miFQ2nSR80bJxJbI3KeXAi4qc01G5gCpDDGxjLD5wAVg9R/Vvmz6KSQckOGW
         VzV7jDltzKrdHJ6BbdZDrOLpj7SCKoK6hLF3n1mdJn40z3RZWPBw93uEs9DHocMqle4F
         FbEcEYzQshRTtYa3rl8w9PG1fUXNPo97QQr9p6AjtN6ELt484kPiIbEB5ijITDx6TxLk
         7pnkTw0x3oCWj9CgG83KTjynkgXh/klwUA9jRpjJyhgeiqGgR1oXEq1AMmp2Bby1eHIp
         UQEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378240; x=1782983040; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2s2sz76O+Yw6Ynt/ts8/PPSCfN34FF1Pj3n3Rz2cL5c=;
        b=XDD29CW0roztuAyTHT8iC4S+LX23t0+0N6XJDrJKxp9lNb32jSnSgr/IlUgJSKsDEk
         wzrXhBEe8WedasjGSSmN4+xKmuy1nOMynhYeZtZT7dJJxXdNqismCsqAY6S6VpP1sQZk
         p0WMH6j9xGIt0cYev1JvE6KRRg+zHGm8P6Vm62SnIdrm4lU1Ccj/KH1c16iQ+pMQdSgL
         S4zcnjuz5lnBVkrh0e6LBV8dkM51NRg8nwjLdkodRfcQPufoGLI+eSd3VMKkSG4cejc0
         8QWQgcEIo/y/eCHJPa9k8LB1HO62FuGtpOWXf39sBkgyUd97TYzM83afGelrH4HK7C03
         Hqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378240; x=1782983040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s2sz76O+Yw6Ynt/ts8/PPSCfN34FF1Pj3n3Rz2cL5c=;
        b=b0PpJjW5v6OeLUr2DNsuPisUFO04Dv76lvpBsxqQwiuVUN7iC6JwqOTitZpG7bggvr
         Z8GgkF/+qsgknQOQyrJzWSekq9yMQbNrUo1i1yylMLaduuPnDxVpIoc16CeKp2f90iTh
         cCKBNVDvBUFUUrg2UOQDrXjNQxuhvTYugDK7ViguqCWH/4eQEgiymzibEP5a9GHjra8g
         K4+h0Mi6Q5XmL6Upky6mNBvVT7fmrEXiL6nDFo7xvqroEZoJUti9I1smbq2MzhCDfOA1
         yxs+qRWBz/stcb//+jjxVfE613Lwm+mQGTrNwN5xvm1h3sQqKVXNKRViEjmIV/9zs50A
         DjLg==
X-Forwarded-Encrypted: i=1; AFNElJ+kSWF94idTGtaP02M7//Tee6Z3IULgpEOZ6Epb15QanDntnJMQ9GyswBFcEh5aHd2eWPHhH0twTUQeSm8B@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0I3auJrcr7igm4eKd5XD0zOhg36Wn4OCKzQvXE8ojBiItNJZk
	FTdiu9d2bK+eq29yMBuIBY2Aseos6D9Ueg4mo74PBAuP1+/YYlnwEaYF89WeMlPTMAJ6Lhoz7l7
	8u9rfeovgCvrzzL1KnyA0YkJORDknCsE=
X-Gm-Gg: AfdE7ckq40acXOzo26NsdMbTyS4raRSUXKFqZJy80UgoBWOJNduIEBt+Ka8Y0xlYF4f
	gxhe9EqzBHGAlebT8jF4NAoTNqlejQPdMXxKvZCyD+GkDLunBdyajZGJFkALPhd55TuvTQXnz4b
	YBE3w93Az2BBJcjlEdc5PyqLpti098x2kXImzdfyw0guBD8yQqFQn4+oZNP2MtAkzR6EB2rh9um
	U9tdmQKirvqCdUgJlA1Md3awCVOaVZNV3nuh5dp0HUwwGYHXzteLlboPXtLIzJhqwGJbhqOWMI=
X-Received: by 2002:a05:6a21:3994:b0:3b4:8818:fd34 with SMTP id
 adf61e73a8af0-3bd4ae0fae1mr2051656637.25.1782378239883; Thu, 25 Jun 2026
 02:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625071348.132880-1-suryasaimadhu369@gmail.com> <f5be5a78-a649-447c-8145-b32a530194c2@sezginduran.net>
In-Reply-To: <f5be5a78-a649-447c-8145-b32a530194c2@sezginduran.net>
From: Sai Madhu <suryasaimadhu369@gmail.com>
Date: Thu, 25 Jun 2026 14:33:48 +0530
X-Gm-Features: AVVi8Cc53RXuWK3UWJw0EbLd9833JD4VvuGzf-QBSWTw5okmWM0R3ck_QE3pMms
Message-ID: <CAB0uMAezsY1huYMfbkknzYTfdV5bwm+c=BKP2sDydbXMKg8V+w@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: fix const pointer declaration
To: ahmet@sezginduran.net
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ahmet,

Thank you for the review.

I compiled the patch with CONFIG_FB_SM750 enabled and it fails
with the following errors:

sm750.c:773: error: assignment of read-only location 'g_fbmode[index]'
sm750.c:775: error: assignment of read-only location 'g_fbmode[index]'
sm750.c:884: error: assignment of read-only location 'g_fbmode[0]'
sm750.c:888: error: assignment of read-only location 'g_fbmode[1]'

The array elements are assigned at runtime in lynxfb_set_fbinfo()
and sm750fb_setup(), so making them const is incorrect.
The checkpatch warning is a false positive in this case.

I will drop this patch.

Regards,
suryasaimadhu

On Thu, 25 Jun 2026 at 12:58, Ahmet Sezgin Duran <ahmet@sezginduran.net> wrote:
>
> On 6/25/26 10:13 AM, suryasaimadhu wrote:
> > Make g_fbmode a constant pointer array by adding const qualifier
> > after the asterisk, as recommended by checkpatch.
> >
> > Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> > ---
> >   drivers/staging/sm750fb/sm750.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> > index 89c811e08..8f533f3b1 100644
> > --- a/drivers/staging/sm750fb/sm750.c
> > +++ b/drivers/staging/sm750fb/sm750.c
> > @@ -21,7 +21,7 @@
> >   static int g_hwcursor = 1;
> >   static int g_noaccel __ro_after_init;
> >   static int g_nomtrr __ro_after_init;
> > -static const char *g_fbmode[] = {NULL, NULL};
> > +static const char * const g_fbmode[] = {NULL, NULL};
> >   static const char *g_def_fbmode = "1024x768-32@60";
> >   static char *g_settings;
> >   static int g_dualview __ro_after_init;
>
> Did you compile this patch while sm750fb module is enabled?
>
> Regards,
> Ahmet Sezgin Duran
