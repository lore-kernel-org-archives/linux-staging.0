Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6B312814
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434052; cv=pass; b=UNYsEWbd5YG5sctwE5UNZw5wbWB8QjcxZCoZss3LsiEFanr52+IEP5VzmLYJvgT8XdP4kqs6HOwreFgc6q01PmST0/qruDl+FPoSBGQeXk2oBc1QVy7liyDmJGdAKztnmhgFVefoLOWYFE18C3dwygM2XatUDKzy78649HukGC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434052; c=relaxed/simple;
	bh=0Pmyp4+fKGpQSRa/JRAnhA6Y6d88du6SFSR8E/Xq4Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceiLFRpJq89MjZ4CjvRWguwuuNrZ80P7oraURyVV9iNUAoZ0pmQKhiC/Q1tPAP2jQ34pU3X3LIyULBlxhCM0a6Ta/gmN19H5nDjTrw3nxVZxmJhWOsSS2IHrve2N/6xyzOSkVlQqpSCLNyZt9u+OE35JuCLWI7zaeZAg8CArVHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYlmTZXJ; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYlmTZXJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-693c51a8a19so6492881a12.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 07:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783434050; cv=none;
        d=google.com; s=arc-20260327;
        b=W/j9z5ldx0rlPyRdVHfHJaAf7NzIYbL0dch4xqifPQJX4QSNDNI6QXDOn/cBE452BL
         OPj2UIz/4NkqDdOUGhvcBhQP4C8o8xvxMeIE2DTdsf8/4zYE5j1Klegop3U0C8FHE9sK
         5yAC2S0cr1PDbfg2ZYVD1r8FffU7QsCw9eN+ehOxxRcBW7LLVi+HGz1ORcSLsBU0i/8y
         1XCL3IK7+GKYwoeELCAlJ4LT92aFPJgW3ry0l949CqWfL0YcaF9A/tOhdJ777bVrOdsk
         Ck1rov7wEF4p915omFJyK2nBfGuHuk4Ecjs3tpHD4NHso+RKctU2ogFl+6l2JHJFSdoL
         XcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iFw/uuft2ZNSb/Wju7Fc7KgMmtW46i8JZGDIIBDOgNM=;
        fh=gM0TLHthMXV3KDiKUeOtiDL88pt5dlRRSunFbAODlic=;
        b=q18+sG+i8RpC8xOkzmqGMNEH/3Egf6S+cx93ijr981DusVzush6QpDLn6KaXXRNREI
         YEFpKhxUu24E2+a5bwKKLTHsgoBLTnjLf2HeE+4n9799Y1PQ28GfxdADX2nu95Sirehp
         5mzoSAz6DOwD+DpGfSYtty42vRmEeEtT0cEfgt2GtLHpXeDY3mfc3Ff/DYgHjzZKIBBX
         2n9EQd08z3+huix82zoPrENtOsaQU4JqpzSnrSst2MGHaTUsg/2mPSQAon6RdC+j/Zst
         v1UbcYQLL0g6MqVmQNlN8qKsMEd4rbMsFHwBxZIDorNRXQBXd2gjjewpTMHc2KBbWGpH
         M8BQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783434050; x=1784038850; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFw/uuft2ZNSb/Wju7Fc7KgMmtW46i8JZGDIIBDOgNM=;
        b=RYlmTZXJhXIz6sjBWNadieDoCyc8ELBrTftvM61qFG7HfyDC9K9ehSfAkz/5ErVxVa
         IqMEIx2vlO0UvaPE2rrgW086OzT+RduR+NC06yfC1Nw0i3jX3sSQPMvOSDuPw9tlqyuh
         gYknCLqhew9DQAu0Y5vhz8fwnBAxER8uAXsGSiVIE4dj9ZhRCDCqpBD0bjJcEF0nIdnH
         PkNS31nqpa4rpaKyi85TY3SZNZNDK3ADm9FgEE2WXGjNYWZwOMBSVHlup7hWrtsdkRtf
         pTeEVo6TPDjxUONLWFEp+oqm1HcCgH+GSTWefsLDeSCjmkBgF+FnFY9M7v+0CNYRvDVg
         vWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783434050; x=1784038850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFw/uuft2ZNSb/Wju7Fc7KgMmtW46i8JZGDIIBDOgNM=;
        b=ef8eU8zKhFvpHmFIN3JDSJTAB0d9OSYNcYU4+UMmJiiAjR+Lth2MFXWeOMrNjtQRMw
         7jJFcObqmBR8LU+7+OOjuDmEKGq67sxOwogq4Nqf2KfSKt4R7j3X6UlG98D3c6gfprRo
         RjFvWIs0ALvVqebIyj4XxPsdN19GqqBq/IVx0ujxZTZggModJTP1sqW80ovE6YVrE7Wh
         mI93ST+qYS3MPczUilKypP6SF60JmC7PGxfpPjT8eLarwq/jWnLWTn5YzhdHxPGFVhbd
         NRvWLsw0FK2JGJ/LHlg4SBL50hwz/br7G10qag+vYpv9bNR55nbI6PzlRwFB3BY82EZR
         NREA==
X-Gm-Message-State: AOJu0Yw2xWu8CoohKJFaNlQqp8Cvw/zbVeN23ls+3he/P9SngwtM9WrJ
	wX1RUSFVJxSbhYCOjslrEJVEzLgJqBhw7DYXGGM3YyjnuKTRV8utuJNkSefsTu3n6sYe1KTvDks
	XVbdsbxHoSdlnpU/eFyAo9eXGJWDuAWE=
X-Gm-Gg: AfdE7ckM0H/6WmES3QKWOA0T1zHm/6JDBCUfTjpQogCmWQ2SPijsSPEreEHro09FAqf
	wPc9F3UilWB0pl2jCKQuQPUSslByyq4iyDb0l+ymuh9/h12WWAykNVQjbfkZmwNpmDTTUBHrtM0
	qLAKQCXOK8XRjG0NVMp+n2Arw+86gEp219RMmoYBicudAOsfJdLpBNVqF2NRM3JqdtpESQILItH
	UTR9I6HEcdlQyVPPG0NTy8S34/cPkmaueY9+/H7BTbzr2o4UtJiARyhdbPw/mpYscTutosmf4IV
	1/283zH1b806gzbWCoCaclhQwb7mYvnwsZ6wL0NlH5spIhzmIE5x7+X8gFHY
X-Received: by 2002:a05:6402:3229:b0:698:5f47:1d4b with SMTP id
 4fb4d7f45d1cf-69a85c0d3d7mr2863068a12.22.1783434049767; Tue, 07 Jul 2026
 07:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625202911.26782-1-mokshpanicker.7@gmail.com> <2026070712-gift-curtly-5f96@gregkh>
In-Reply-To: <2026070712-gift-curtly-5f96@gregkh>
From: Moksh Panicker <mokshpanicker.7@gmail.com>
Date: Tue, 7 Jul 2026 14:20:37 +0000
X-Gm-Features: AVVi8CeD3RwiVLji4-TTiExWVp2TyEKcBkmmhXz5DauvaGb9_i46Um4R2cQZkyg
Message-ID: <CAK0z5OkkdOcXkz_sUj521e4Om+HGGesqkoBpau8kYDDjvY8S1g@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This issue was found by code review while analyzing the OOB read
patterns fixed by Alexandru Hossu in sibling functions
(rtw_get_sec_ie, rtw_get_wapi_ie, rtw_get_wps_attr) in the same file.
The same unbounded IE iteration pattern was present in
rtw_get_wps_ie() but was not included in his series. The fix was
compile-tested against linux-next. As this is a staging driver for a
USB WiFi adapter that I do not have physical access to, runtime
testing was not possible. The fix follows the same pattern as the
accepted fixes in the sibling functions.

Thanks,
Moksh

On Tue, Jul 7, 2026 at 11:30=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jun 25, 2026 at 08:29:11PM +0000, Moksh Panicker wrote:
> > rtw_get_wps_ie() iterates over IE data from network frames without
> > validating that the IE header and payload fit within the remaining
> > buffer before reading them. Specifically:
> >
> > - in_ie[cnt + 1] is read without checking cnt + 1 < in_len
> > - memcmp(&in_ie[cnt + 2], ...) accesses cnt + 2 without bounds check
> > - in_ie[cnt + 1] is used as length without verifying payload fits
> >
> > Add bounds checks at the top of the loop body to break early if fewer
> > than 2 bytes remain for the IE header, or if the declared payload
> > extends past the end of the buffer. Also require at least 4 bytes of
> > payload before comparing the WPS OUI.
> >
> > Fixes: 554c0a3abf21 ("staging: rtl8723bs: add r8723bs driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
>
> How was this issue found?  How was it tested?
>
> thanks,
>
> greg k-h
