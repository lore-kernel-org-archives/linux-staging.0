Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2EA1DF273
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 05:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771910572; cv=none; b=Jwasjf89BZG+PYMcHrXJDsNEOA2JxWq0PaDMgTVnq1jhNOQxmIpHW17sMDzM+IiTHX3BuXY1I1NydRgJdT9FxS1OkuW0LNk3G/EjKf9G7EWWjnVAkjQHCuy8zE6C5ZcXrgkADaq7E/DnMVnq8xFrX/qbMBxRSE1/nIa9SV8lEew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771910572; c=relaxed/simple;
	bh=7iQGxQeF03eY6hWgaldcv763WbOhVEcaXl+yDZsGv3k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oSuu9xi2PXJOv5QgrEfUqcKyWpO+UYH+owTLipZROyyt3tXWNVErzfvMfnjckrxkTTpCCu/96h5VS49R5t4s8KNSwF8kZ1AepkK5Ku10+dkmwqha4j7RvAbNnzJo2KCCtWKZSmP/BDUcwrxokAYAYHH6kkn9TsNosv0ol/vqlYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJzJemTq; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJzJemTq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79802e2c989so45798487b3.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 21:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771910571; x=1772515371; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZezN4kiYQzReFfkad+GmwHeyf4B2e/JBpQOAcJCCZA=;
        b=TJzJemTqaqH0eITjsRWRAvf4kzU+gSXGDMfGlYIfMRu2IvFccec7LWMvYOiTuH7OwE
         GW0p0p0S6K3et3P2b2n6TUZisvsqXw7mM14Dt/kRC6RM5G1K+bDPzlzE8Exgq1qDWy4+
         Ir1YT1u8CBAFnk8XSpRb+kNG+otARcLbYzmMwsNUVx9QWYSPG0icoaGJxv9r85JJWT0y
         Y0VIgoBA7eIUfrBAg4WXCQvYSCOiuUJNNbaDyMxHUbXeujEO9U1RKZPBL9Ch1TgaKQ7K
         JxYHtzlPfTosVag9NFjqx8uADk1GpH/uiZiNmzgmNP4dZH5Na0XPvBxNFFTeyp4GF7Dc
         H7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771910571; x=1772515371;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZezN4kiYQzReFfkad+GmwHeyf4B2e/JBpQOAcJCCZA=;
        b=DkglW5gGfSFhmIyHzaoEkNqGe5k0Ka6JxS11j4j7hUmAePKy6+dRUdAo0lViNPc0Hl
         2oFV4Ex7y7NaY0KgN9pcjWGczH2jrLUAN1RFvzfZMsE7w+tsCUAbwiHDBOt1wkin3Gxh
         +Dx2OojLqAqOhdkxM5NG6cXbuXW1Aj9c0YlQlWrB7ONR8/dt71HAaSV8dPjiehs5okSs
         WFR7MTkF1sOK9hxwl+CeYDhw6r6GQkjjo/ljqqLARjplPLY+Gx/BJEyQHDlwsLaeNL29
         0ZIghYWjUc5TLI6hw+XmScXUeU3TrZLYvKqyRC25VvX8ZUcEVRQ8Wfu2Sjrcd7pimpcp
         930Q==
X-Gm-Message-State: AOJu0YyhrMX8U7AsvUVIPRmG+YxD/teXNqg8jR0VodfPb5AnvSEsJ7qG
	yinriBaYac+ey8iGMb3jo+CvCeRGmlW+wdIxHqDFzECkepd2YNZDGCldYaOQsEKxXzk=
X-Gm-Gg: ATEYQzweRMGuD3jZp5UVB85eZH2x6ILo6fGbQWPBGycIb8PFUjzTk7iJBN+TCSuFWJJ
	Ayg2YIaVCWhMul9l6DURn4kchMxOaZYJiYKDbRlfBW9VoodcU49lyPQcfnZGcze7eceidev07x0
	E8Do8f1S1sNKPsczDtB0ap1DzPjwhd0hO0BciHKj+Ho7YgLL6v7ck8Ow6XWcU1ViTspPsEvy/Pv
	IabQAaD4v9dqthN0jewlthUQpvsdmeYpQyNL5g+YnWcZKKTAaQSzvAToSWA4r2OUtgx9vrMDF+3
	1gj1O57guwV2iY19UaD1HCdL92W+yQ1Puq+z+/8gqZQ0Cqq1K2vYEqTG9hzxgcFlS5kS9Hy61KX
	72CLkA4LRvsyYSDDDPvf7jmqKyZCN+Y42gm+LyBT14/l+CadAsDqa2QkQRdGCRbB2Fo2A/tCeEG
	OyJ5SXOWMMwZzo2eAX4WD5ciAuPrGIBZFLq2LzRsqNpJy+lifPi7qLSfeV3NFQLwlHYQHiY1cay
	Wn2aaedzOWjNbCY8+f13HVoDk3zm6XO
X-Received: by 2002:a05:690c:c50a:b0:798:599d:fded with SMTP id 00721157ae682-798599e01fbmr13907467b3.35.1771910570642;
        Mon, 23 Feb 2026 21:22:50 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982dc09ef9sm41068687b3.22.2026.02.23.21.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:22:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:22:31 -0600
Message-Id: <DGMXV9ZVYDDV.230YMBG87WWDZ@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] staging: rtl8723bs: fix spelling mistakes in
 rtw_wlan_util.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <tomasz.unger@yahoo.pl>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260223200006.145296-1-tomasz.unger.ref@yahoo.pl>
 <20260223200006.145296-1-tomasz.unger@yahoo.pl>
In-Reply-To: <20260223200006.145296-1-tomasz.unger@yahoo.pl>

On Mon Feb 23, 2026 at 2:00 PM CST, tomasz.unger wrote:
> From: Tomasz Unger <tomasz.unger@yahoo.pl>
>
> Fix spelling mistakes in comments found by codespell:
>  - alloction =3D> allocation
>  - overwirte =3D> overwrite
>  - indx =3D> index
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
