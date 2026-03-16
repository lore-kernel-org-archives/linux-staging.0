Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24ED1EFF8D
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700029; cv=none; b=qxoX9LcNIABsi58ayvnTC4/9BXOhKvn6JlCnZD4itCB6GqNS7EP88LkWQpRBZMcwXJes9pWyH92UhjUHfTjQpecpqXK7+G6O4w7ERD+inzCPhuWfX2xB/uDkynwWbT8yS/x3H0KCV7e+70qMM4G1av18JjNH45Nhe9kEITnJF04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700029; c=relaxed/simple;
	bh=jBZmhUNlR1riuyc6gZVRgUoB8mRPDHdt6UlCO8EACCY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rk2enFmeOUTSBcSmQS5dv0P4hIjSlcpETqa8i+/r6YK4SFBTLkoHghHXNPDhjp42tMhay11rU2T7CANl+WIl2tTBVTJwH4fiB8AX5IJZ8PRsPaemH3JptfoLDD5CXsK/KXq7tU9PlpMglJ+PXY0ygF3pHWp+U6Mx8LEUYN59AA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncKjGtoQ; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncKjGtoQ"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c9707fc11so3631000d50.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773700028; x=1774304828; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7QBXKMJPlEyHjnfjvFJZVoF7egncVTdmwMHU1kbkE8=;
        b=ncKjGtoQI+X/GalQfPDR7Pm/A965s2kV1QUsHCZ5fR0MZ9W0wVxAAzisPIGA+ktiku
         lF/qaKjvwG+ClGeyoxvcNjB+4NB9EGP6XkTvyhGlt/+Dpim9cw93limq5wVZDfElDRvy
         vy+dueoV5e6CHio98KgOPV1Z6u4HIoKDeL64rlHRUC8k+/UIJxCnJKJTc+dCnZ5Tmrki
         HjrkpLOm2yLZ+02qUAkcsgzhooNTCQ3zXm9ig7PVZ1Gx9iAr7s/f3aO+Ie7wyOLmYhB2
         +fxdueVFE2bNHiP0K4dQG+QdSn+7NU9TljQRsRNSrZtyOSkhqHKnyqauiHHk6mMYi5Ko
         fsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700028; x=1774304828;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7QBXKMJPlEyHjnfjvFJZVoF7egncVTdmwMHU1kbkE8=;
        b=NAHFE/TesHgVgCCyvZgDzUpZjhi3V3/K67IcmtR3hAFzBOkCYeWPd1lk1xpgBpEe1i
         bND//azcdsMAehyPqk+oAF5qXNKiuqsC05AuYHk13h48mt2279Fn99GncQw2oW51ZDmS
         V1d0DqC4XMbh58sEEpzP6LpV5VIcS9dc0wtJA7R5Gg+9ydBhxS6g6h/gAcP/fgMxVcFa
         UYbsy69es4fVAwPMkfmXZl5UVVxKJ7mLK733Yo7o2DXCkMIvLEBlR2eUTcWFXtqkvBpk
         TgPV6PEP6Fta6CndphNk/1JTYFJHxoI1aJheQiTQuklMfv35JsySTcQ7/3ENbAYimRBM
         i/8g==
X-Forwarded-Encrypted: i=1; AJvYcCV2nQyTAbZ9qEX9Bmsju8H//1P4fdeNGXZblizY03gf5ba+uRSySmMaZQM44txvW/vvS908r300wNiwrh1i@lists.linux.dev
X-Gm-Message-State: AOJu0YzS5hOOXKDAmpwnmB5oELh4XWvRZuVYiJjbME/dPLBZ8zUS2AU2
	lyPZkyBdWiwS1dg20YeAuD+z8mWK66ajyG+wbbUaBRLjm7wCzqFBPHLg
X-Gm-Gg: ATEYQzyPnQdAITpfxuLGiGQI0r0V/5vJLK7guPY9Dr0WKZJSfBiAjOYcYCkRIpdrDpl
	VmCIs8VsMVVfSQs6p6OaHM2UpFSEC0EmMS5ijEhMRlokW28h9oaHvX5bNqYrtWtHA+SAzVhLSEA
	Y4IFzIHdcqT9zi/684WLBvRfVwoE+RriTb1wcZzrD1/eQmSc4+hCh+MhSaRsPpAXnru4GjlAUfn
	Kj03j+WLOC2OaCBOUsvfGhRhwf+6jf4YiCwbxUZIeKmqpui7ntAM4Zus1IrGsfyGe7el2ofevcN
	l/WCAoXJnkwNqY8onV4Pf/LFOFZXEqb3rTTg3/lHzk5ZSrYMbKVrUNPyYaDVuUGw21SiXtkGR7/
	Kgv3pNOHFvw0vKgs2kXnuBMIThK9YpDWhCTxQMHDXvC85B7iFn1db8aZiQqCYzatLTtCvsfkWEl
	iVvwEwwc3AMKK+Xf+23vA5M07RwzVWf0faKA7I4oSm1q/9qo7lyaskyfaWCkMpxDXp4czs8qwCB
	fKXKhHGWredFCAJVNSkvh5+CIJVwfG5
X-Received: by 2002:a05:690e:44a3:b0:649:b2cd:eb7d with SMTP id 956f58d0204a3-64e630ae9eemr10408251d50.68.1773700027765;
        Mon, 16 Mar 2026 15:27:07 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a5411dsm6388301d50.9.2026.03.16.15.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 15:27:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 17:26:46 -0500
Message-Id: <DH4K6E4V7UNG.13JD41LI1U7MO@gmail.com>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unused global efuse
 variables
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marcos Andrade" <marcosandrade95963@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260316220435.2249-1-marcosandrade95963@gmail.com>
In-Reply-To: <20260316220435.2249-1-marcosandrade95963@gmail.com>

On Mon Mar 16, 2026 at 5:04 PM CDT, Marcos Andrade wrote:
> Remove several global efuse variables from rtw_efuse.c and their
> corresponding extern declarations in rtw_efuse.h.
>
> These variables (fakeEfuseBank, BTEfuseUsedBytes, etc.) are completely
> unused legacy code. The driver currently maintains the efuse state
> properly within the 'efuse_hal' structure, which is encapsulated
> inside 'hal_com_data'.
>
> The removal of this dead code cleans up the global namespace and
> resolves multiple checkpatch.pl warnings regarding CamelCase naming
> conventions. Verified by compilation that no functional code references
> these variables.
>
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
> Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
> Changes in v2:
>  - Collected Reviewed-by tag from Ethan Tidmore.

You don't have to do this. Normally you only do this would a reivewer
gives you specifc instructions to do and then you can add their RB tag
with their approval.

Thanks,

ET
