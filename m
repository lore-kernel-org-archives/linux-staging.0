Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047419067C
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771698589; cv=none; b=QyQcL5ue4BqakXLzBBHpZrvLWbviinDcCtNuw29FVMXT3ENmSZXz0vPxbMebDoDSQonINUe+iHwdCuqTs2zH9Lbvqb6KpZtvtpCnD+oWakGv3vSuF0UIvZp7J4Gle2sQgGa+1iOjJ0XE0T6tafd526EFTnCyqNj2SS0frqNJHkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771698589; c=relaxed/simple;
	bh=UHimjeM0JmgCwHl4hrqTRvgjOKBggsbtJsDK2xxVe4M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=P27zHmAyoy+sbZUrz3PVKYC65ZmyDgWH9QTgLsKcs2TXDQw1c99Z3TQRFjEnZ0eG+pYeLifF7IJzsn3mkvDWvh+3tHULlEiy9nCNGunIAFg1KnNZXa8vf5GReuIPXHqRXasto6zp+1k3/o775uoOSEGfFR3nfGjFtYSYOC4Lmck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtlBBIlu; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtlBBIlu"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64adabaafd6so2683900d50.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 10:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771698587; x=1772303387; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkE2e1AP+97jMfD00sCDfEV+FYj+Lqw7CNLspmf+I0A=;
        b=ZtlBBIluWd5fHvt4l81l4PPsFIMCF8zqTRj5r/fcB8Wchl4oC7kQGf4tpl9XEO4atC
         Ix+C52jhh7WAfh2iqmOnj4nLU21NqeiE8mGPUis40wxxMJvnDnBsIzuuWjcCL7DZeFHi
         s/MgE/h70CEEA34zgYNSVDL4lPhzqs2zebXALLuyPAXGqk+4buyv+lYUGj5IRxA2Unb5
         C9RafSS2gH8as4QFUSwFsFLLOP6ucNe28RiuQimaZu5Qqsy9fVGJboJhmKKuRTwFYMEb
         HlgWViJOtaB5ds3JY9MMqMqxUpulBYf2e/drZEDeaalgd9iBxzxfXqVooPCzio0Cqyqm
         aXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698587; x=1772303387;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xkE2e1AP+97jMfD00sCDfEV+FYj+Lqw7CNLspmf+I0A=;
        b=iBhyuuMgGLppmXyJqcBeWs6gYP4eP3DqpJ+9TJOrXpMpWgPkowXLeQfGafiGbTlfwW
         7PEMGqSxXlvUGkmNyfMPg416jBUzZ1sEpPHimiBTxaTtbzJFkIvx7ImJU5xoqYRwFaNT
         8GtElhqoU+uTZZNDi+aueTYMTvs3tjpHQLMPWSFks1lmGeCiV9M7DkTHDlD46cz+fqO7
         8eGwV41vvt4bWYod1yOrgS/Q1+vu6TNjTkmXIm8ymojvokurciXU1cchs8dp8oT9pgXE
         u1+UfE0wk9yyY0VDC4s4YJ+zrAog3ijILAvs/k1LM3a1cTjuhh/l4NGNoSEVTLeBOkx1
         +c9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEUdifJo+WYnGn/zDWwABNWAnnG9fIA04AlWx/S9sKz2dxS8+V320KhRmXXIvyFRFvPMIUfDhWc/vQtyZX@lists.linux.dev
X-Gm-Message-State: AOJu0YxXQ6udiRzYWQCwEzHg3jLttZZyRzwZQLHSytXxeLAYhs6PT50a
	PsbSNcnnYjqTYW0CzfbNwkMBzEGedDaAmKtV68fkXZmqyipAX1cqd90S
X-Gm-Gg: AZuq6aJSUKVWTnrw/wY+ELewSsC8xVeOX8Jd8zmQ+U9XQr4q+A+b7RBOzDhtg7eNMvB
	WOirdAcg8vK6v8jkyiE+3o6xTTbUodZ2j5TBLUQyMiVpuNF7sMvTWEGdZnO3nmYgGEzXflRbksV
	ENiAMlFzlE7A3FWiinDLLBYipw2jUDXcZ7WmWMlLBo5HIyKFKL6ilXCEsUfkxZqSl4STLEaYjyc
	1PC6wIxrZ4OccfcIorhRZ2rdV2LojgXPcRtTERhsKEv91Eo35o3yLyqHNNqkpsETlZdvSstJ+i9
	VDBp5wiwZcRZr2bO2XHDp3YZxtP54kvMG6eXReS9h7QRvomILlSjgGp5KfECVQUBv5EkWFC8nDi
	+07v2wYke38omg4iyywA6KeLJD3ZgDfmjZe9afPu58BtLC9Ra99LN+mKsQpGULyEalPZmZEGZ7i
	3lnacytb6UL2dj9qlNrpnRzs6oKYhmbwlG+Tfn8pSFiLGMeJRsAvVip2G1biDPx0X2iLlTnTYVn
	gZIL2gKioPGuH8fxG0l3TzuHCREt2QZ
X-Received: by 2002:a05:690e:40d:b0:64a:d5c4:dc8a with SMTP id 956f58d0204a3-64c79074590mr2454831d50.76.1771698587150;
        Sat, 21 Feb 2026 10:29:47 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c7a37c023sm1228864d50.18.2026.02.21.10.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 10:29:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 12:29:27 -0600
Message-Id: <DGKUQ5KZWYZ6.3CS4DDKXHPOGK@gmail.com>
Cc: <straube.linux@gmail.com>, <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: Replace kzalloc with kzalloc_obj
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Mariyam Shahid" <mariyam.shahid135@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CANhxO_hHUBi+Cs_mq7x0h-RVLdmujX1aDzatfap_9ExP1LCcPw@mail.gmail.com> <20260221111003.11339-1-mariyam.shahid135@gmail.com>
In-Reply-To: <20260221111003.11339-1-mariyam.shahid135@gmail.com>

On Sat Feb 21, 2026 at 5:10 AM CST, Mariyam Shahid wrote:
> Replace kzalloc() using sizeof(*ptr) with kzalloc_obj()
> to fix respective checkpatch warnings.
>
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---
^^^
No changelog.

>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

LGTM. Just include the changelog, in your v4 you can put:

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
