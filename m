Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2BE35D5FD
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040434; cv=pass; b=fVFIXY0Af/dGMIutmSsEhzn8D7JN+D3yX/mICEo9PW2iK2lJPNYiVD36u9/x96/xgGPrXGhK9LYxvPErJxZBufUbs02E5zFYnkJxwXIZOTJzO6aFX8Gw7C7x6rmCUJVB7sncaACx50OK0ekbwYfbUwu/I8kTjytm1gCWMz4RMGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040434; c=relaxed/simple;
	bh=R8NG/Wuu+Op3VZXePLBqlrWldy9I6+cld98n2gMPYCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sevdhAqR0ZWwYdgc32V7G7LSzzwALg7mwCkyJmUjOpSUPkI0Eo4VP9A+kswbMacC60fxXP4SB6IW2fBBdaOEAy4Rq3DbsigxPsBIMU/Ql/N6JpebmhAFB9W0lqNMbvPtTXrrZjDcIYdBvznoIakFQlDWOlCTzgill5azQB6uS3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6Ozx8+W; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6Ozx8+W"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a09d981507so31642995ad.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 05:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770040433; cv=none;
        d=google.com; s=arc-20240605;
        b=eTBKJTnEdTSl4T7e6UvEpsrfrdkYxXDn0NbpHtUDAd2BSGArfVo6OZLNBjimlIQT3R
         9Ht2v0mg+r4HPtSdbee2o9Dk3dhgqRypY5hWBhtqPs1Ry/3D+XvyTafAhIGlwHv+6xWt
         D9AImOhdH95j7/3KtaU8y5SRIT6Q191PneEY7ZxWMI0ZN2RmI0l2KU/MJvyM1oE5+pOQ
         6XRuvZk1OBzrD1J0ipK90o6/ojAs+JJFVM6hmzGIutIujLOMSsHPnc5aq3y/AJNb2Ruf
         8iAFXXLH1HV6Md5gKFwKQJeUDK9UAQXs9vwEqYvks8S9NgOCdSsC8KdzLRWlgU/rg5d1
         vQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R8NG/Wuu+Op3VZXePLBqlrWldy9I6+cld98n2gMPYCk=;
        fh=V3qItFAuv8pj0s8FBAk7npd2en5SXNL1QvrDgYJQl8E=;
        b=Yg0sgiy7MuzB6xFoLhSOsJxujRKvcxBJWLsq+hvvtBlOLI8wmlpyhfqstdSardY4eQ
         T8n0YNquirLGup9bPLbVRum3am34A5isNxcNYca+eAQ9ETBr5+U6sJLU2xoFTeFiBS7B
         Tuxx98mN336q9QUVJD9gIS0+fKn/bb/R1y3eSZXq4f5sAObqehvGO5uSpyqhRPcviJkS
         svv3+nqAy/Ak39kM+/O1sr87hGQMOxnYseNPxay0nBZZnbQvI+BBxQXRRO2H9j1E/TPk
         +25jnnXvYfijc9I/hapMyhioURfpE8X3OqCIfMTqP8Q1js9d+XudoW8RQrJvQ4fmtsCj
         CC+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040433; x=1770645233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8NG/Wuu+Op3VZXePLBqlrWldy9I6+cld98n2gMPYCk=;
        b=A6Ozx8+W3W22IYacDMZw54yx8I5ASAirP6Mptm+XI6loy0sC7kDDAvAB4RF+oKz5+4
         oWyJosyQUsWLAMjYBDdmGpMQGCIuWaK2akUc6ohKh+RWc14R0v4G8CNXybfBoo627+T2
         lbSq1yIXwrIYwLQ487UmMsad8gWAlCwS1n1LK2b3Ms6Ql6ebqvEmlPbZBMdfz9oE0QPj
         zzgidY1izH93ADshQMwl1IrEN+Qi+0zYGwKtQW7FsGneRfh0ObdSLULF8ARHQOhs/wLd
         2nHCTFhKVlOEDyeUlqlro/ZMlEs6BKc6PX+84p02rC9iXMdNWXSwAidvVNREh431akrO
         vfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040433; x=1770645233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8NG/Wuu+Op3VZXePLBqlrWldy9I6+cld98n2gMPYCk=;
        b=WMr5sMuAkjx6fKU2QW84O2ENrBK8+uTRdtWn9rzvcJ81q6tXwLMewwp24jM/1S0jMj
         3hygfESaGBFuBGEsw8fa8IPHnuNIsVjB4YZfGWDD8g9XkdJ9LSO8sDvaBwlYsteKWE7F
         OTXrg2T07fBWv+fs4FIwMJ2sa8GAL3wPNQa0i7rjjiUYPYLHeO+RrfC1lCKyNMOrn1dV
         9N4UZaeKJYb8i6dzVSRwzIYgc7F8Dxee/DEOqdZJoou2H0+4sjSZdbjBD1FQK/Y82FkL
         2P6sKGyxEQmGyrn7yqRl0zM1LFv2MO5mvORvqaEX/UXkNgWCevx0vzZQpiPeecxASpV6
         jeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFm8ZLloL85fwxsXQKH8wUVUWHGDtNjAGSg5uL8iIRGVbQIHH555SVFHrUcCUuK+ITYw+p+nsth9+v46QY@lists.linux.dev
X-Gm-Message-State: AOJu0YxrP8nwy2rvtDXe+eFKB+Mw0ve8NOTcBlpe95eZC2t8JFZYF1Pk
	cTxCR4jfCl/zNKB4/WIEKVFYVKxnd1bKltbJeJkVmo4FLOGtEwCfKpWHTA8EgfPrBOgbwOtzorz
	4QH2tHEhzGVUr88t6JpIXKUUm8uzSOi0=
X-Gm-Gg: AZuq6aJKfCWy3n3HRuQi1NjL3ZlmVMg2gDBnc/Zn/KP2Rfztuygvhtdmb9E1qDcVmr5
	9HT+AF6zrYQWtT82rSHZzcIk0mSebiJzaXGA8R75/zlm0Wf70GAy5INkwvnFDD2MEWjSV81Qzq2
	RJ+sclxO2aL3uWL0hEMSIeAdjIr9UaWuVprmS0wHW20LjroovjxrZKesNQ/InQmlVKR0xNfWi0P
	oFOOco+ogEV3kcpiAAEZM//xfBcW4mKLLdY2XNIgBa/SmLkojADzaxg05F0ZkpptBkLHnwdKy64
	MpD5i4EELMqf2kX+612xxJEtlJHttEviTWDxxN2zHrYnYfaQPt8OxF71JtBC
X-Received: by 2002:a17:902:ebc1:b0:2a3:e7d3:810b with SMTP id
 d9443c01a7336-2a8bd439309mr149834125ad.12.1770040433008; Mon, 02 Feb 2026
 05:53:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202122317.13821-1-gustavopiazdasilva2102@gmail.com>
 <20260202122317.13821-3-gustavopiazdasilva2102@gmail.com> <2026020220-attitude-unnerve-21ff@gregkh>
 <CABpvFwKsBqstoiyriN6Vcx4D2Mszd1w=F6YvLRHiLK=jaYZNpQ@mail.gmail.com>
In-Reply-To: <CABpvFwKsBqstoiyriN6Vcx4D2Mszd1w=F6YvLRHiLK=jaYZNpQ@mail.gmail.com>
From: Gustavo Piaz <gustavopiazdasilva2102@gmail.com>
Date: Mon, 2 Feb 2026 10:53:41 -0300
X-Gm-Features: AZwV_Qhjes1ZbAitbGI5A6YWen03CSrlYy8LyNBLugz0X3wyPluRwxraEnLFV8k
Message-ID: <CABpvFwJGC-kzToB2=WU016juxa+rnayXdp_KspCcW-UXJ=veRw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] staging: axis-fifo: refactor device tree parsing
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@linaro.org, ovidiu.panait.oss@gmail.com, 
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Our emails crossed paths. I had just sent v5 to fix a missing newline
pointed out by Dan Carpenter when your review arrived.

Since v5 still contains the helper function you asked to remove,
please ignore it.

I will prepare and send v6 shortly to address your feedback: I'll
remove the helper function and the dev_err() calls, and fix the
missing separator line.

Regarding the hardware: No, I don't have it. I am build-testing only.

Regards,
Gustavo


Gustavo Piaz <gustavopiazdasilva2102@gmail.com> escreveu (segunda,
2/02/2026 =C3=A0(s) 10:49):
>>
>>
>> Hi Greg,
>>
>> Our emails crossed paths. I had just sent v5 to fix a missing newline po=
inted out by Dan Carpenter when your review arrived.
>>
>> Since v5 still contains the helper function you asked to remove, please =
ignore it.
>>
>> I will prepare and send v6 shortly to address your feedback: I'll remove=
 the helper function and the dev_err() calls, and fix the missing separator=
 line.
>>
>> Regarding the hardware: No, I don't have it. I am build-testing only.
>>
>> Regards,
>> Gustavo
