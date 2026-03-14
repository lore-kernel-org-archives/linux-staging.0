Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879E349AF9
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773522553; cv=none; b=BK3xPTcmwECJ0s3yRfQDeApbhrzu+WMONkBeZKXN1xVJZ04NIanKdfDhKX5BGBFe6WctID4k05Tw770r1RlZQSAwuvsMnyE9moNfXSE+D61MkwcnJwD/+ilIB7kKPn1WOtxnnKvV+FREvb3DIDd1QZXihY88uCNzflzoHlyDP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773522553; c=relaxed/simple;
	bh=JMX2SwgugjNBS224Gqr/Jeeh7bpxwAXFWy6qPgTTu8U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AB0biQpd1OnE+rr+jXEaBqlWL7rkwKfvu0qDfYSBhpte/ndaisMPAP0Z1ZtlikOOL5xQcY/Uc2B/USoXVmyCkm6NQ0PfR2qsVDauzOLjGwrS38WyJcuDvLOAurcnriPryj9gQmwj1Aj9XstTVcYroL8UR27dDJ4kmDq+ZqmGpAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtkAbgDp; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtkAbgDp"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-799001d73bdso24951957b3.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773522549; x=1774127349; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMX2SwgugjNBS224Gqr/Jeeh7bpxwAXFWy6qPgTTu8U=;
        b=NtkAbgDpao5xlGxrqApAzVBWEm0K7xFyZJjTDxN6fUaNt/OKUMOmeyV4mwuSuyCvUP
         MqeeAha/0uKGsLH2n74pqja+7iWXUzvmmaiXw4UzeliCqJlDEArdA77ltaayKxBJhbCr
         baJMXEzAwAkZJsAQ8/19cx9x4Us93uJFrK752go/JhfAjCEIIFWf8j682kspMx7D5HYY
         WAY07xNEfoOgEF63C7tNpLyEzgYooGGslOWBzRbkKE8lIyEL9F5Jn3t4DkFxVsy5UugJ
         aR5XsA1o1AxXzwPrSmY1+vKmncO2UD6duRY+2nywPnov9LN1J2/MUvGCDkLig4dp81hu
         siEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773522549; x=1774127349;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JMX2SwgugjNBS224Gqr/Jeeh7bpxwAXFWy6qPgTTu8U=;
        b=bUY7FGSC48YkjqdEM1ddGWJ9umyK6vfpOPNQN8nlZtL/3Crci+MSnZilNOryFnvzPJ
         BQU4JDNJxrMt/q6ypKBGK/2Dz8UWeIcvgsVeLa+S86hLRkOQ3dBb21D42GDq/DHHHWaG
         N1tdYS7fS2qaRW0/SeU2HYbXOacLTT5gY3O/Y9Tv3vByJ0LgtOZnTRfO24kWGQEUfESh
         PC7lLp8g/NsAdKGh5LwAsEM+KJVbSIOAhvhliJenSiUyBTMpUWzKoQ2dOQEoMRpnWKIa
         aeywLWqUC6XdoJaRHFLtiR5ERIpNmkpOVUImDBOLX7FX3epmMRVQlXZQKFkyJXzJVg2s
         Jsdw==
X-Gm-Message-State: AOJu0Yy7v+l/RioMpHI0owszVekVqWlJyzqpPGtMu4ZHHceYbh+pjNgG
	QiRamRmGMBRIP7mCukd1Sdz5AVP8do129bIQdNa8GazkyvIuZlQX0BD1
X-Gm-Gg: ATEYQzwcDWlGbrQSZVgIIRxN9EBt9twvhckx4yacG1l6YZaBlRghSFbmLrH11lreIvj
	DAqCW6BrDSlOdavC1E6a6PV6lpkYR5Is1n3QM5hjw1Ae4NszoM+8MJeEMqVPCrzTZf6EPPWAnBw
	sVSwl3kuo6qGo3f0kr93kdsoLf9EtkCP91uaViVRLkPxgty0aOF5PF21a8tGL6ftQyBu4vxiQz8
	iNXGCmYScff/a4kDGKnBMeWNNOSrvhObE9foR7pRsTH6AjxcSMEzOUdYGEBAOYA3M8cUMXGrajd
	exIVrNYzKm21KwIm2Uaa43eedx5phIbQIJXraIgJp5fK9n+9qvfNs8Q1wCp+erGsL1DK0Plh9Uj
	HUyWuuGUDliry7UGaMWrze5nTyZR0ps/vrJ7FNSRfex+RgZXbUiG0s50btc8oy9+jK8FM9vdk8t
	OVIWyzh+y2cBR6Me2uoW2I85Pg2CvE0SrPVKFdRQRUpu7jZx9DKjo1sOXXZPLvLpPGWXBkG65iz
	HrRXoFbPlJ+npj/wxuqQKbuaUYj/4+6LCTHFqdXd5GVzDOsF/zqXrY4YgJjGCKSHdU=
X-Received: by 2002:a05:690c:e3e5:b0:794:c969:6fff with SMTP id 00721157ae682-79a1c20c147mr82331617b3.57.1773522549371;
        Sat, 14 Mar 2026 14:09:09 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00:f174:ec69:bc86:8883])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f0a0ebsm64849277b3.37.2026.03.14.14.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 14:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 16:09:08 -0500
Message-Id: <DH2T9V4M7IVC.1DIWQ0I5WRYMV@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: replace kmalloc + memcpy with
 kmemdup in ioctl_cfg80211.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260314-rtl8723bs-kmemdup-v1-1-8280a436f20c.ref@yahoo.pl>
 <20260314-rtl8723bs-kmemdup-v1-1-8280a436f20c@yahoo.pl>
In-Reply-To: <20260314-rtl8723bs-kmemdup-v1-1-8280a436f20c@yahoo.pl>

On Sat Mar 14, 2026 at 4:11 AM CDT, Tomasz Unger wrote:
> Replace kmalloc() followed by memcpy() with kmemdup() which combines
> both operations into a single call, making the code cleaner and more
> readable. The zeroing done by kzalloc() is unnecessary here as the
> entire buffer is immediately overwritten by memcpy().
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

This doesn't apply to staging-next.

Thanks,

ET
