Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E26D31714F
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772472986; cv=none; b=PeJkzekWwEveVcC0m9bboaKLWyl9ob4MFvOl3otLKIjQGWgt3/IiaC2MPC2iIv+8yXeDuKv0yD9ehgJirSIDplCCLObg1oZNk3xSE+LxVOauQzJewyupzjbx8RS87VTGyReag9aaH30JxRRcREvx1+clYXpbKVmsqzrMZuCBznE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772472986; c=relaxed/simple;
	bh=skGMAbJKRHHHLl30eZa03YInRfUNVLCVOXgTdEvCyfg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sFaPN86RU17q1zpDL/h34bfAKmhL76Qy4pt09cCz8G1nKytIemG8v20sFMuOZ984zFij8lo5RX0trZ6MY+Y/ceJGQQX10qSkhx/0mQJDQBig6LySUQi0bAcHJdDPDSSkNy2UDG35Gf9FhuiDv+ykKpihdMH+Do0+rF3lC/0XUX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEdJp52c; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEdJp52c"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79800183233so63534227b3.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 09:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772472984; x=1773077784; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feYbKOI//oBwEug1JCV7UWWmWnUuYR3clwKM66yi2G8=;
        b=ZEdJp52cF2ZUVfVKCZkOBJD+mPn1GZPbbTqDGWGdDVUVQOQL3FinKx9gJWRzlSlUIL
         pSrLQswkYhhsmvdC2llZmNPJ4v9K+qsetMq6uQ3ZytwzunYs4EQM6/76I/ppF6i7tKg0
         ebx456jJCbwn/7lz1vbIjOJLyHA+uvVJ9SpIL97cR3vq6IAIIynCU9jqBeyuWgm9Ocdz
         jFUpWcB96knyr9WLXqcq6NKFJrYE373UpLYJgV36sVWNnsbOl4SZ4IJrpELLkF0Mr+Pr
         iLYgmkPJltfjXXxofX19Ai4X+leiFhc2QkrNjVebWvfVXKZIKFi6cWLPctbJyrUeabxv
         nNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472984; x=1773077784;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=feYbKOI//oBwEug1JCV7UWWmWnUuYR3clwKM66yi2G8=;
        b=LYaJXNZ5I8wHf6hF6rjoMpE1Z3ppAWCUzskqFgBA+kkjk5Rv8q09Nl0iGKScQmMRuM
         09pOOY/b9OxyljiuR4ux32kXOOu7hds6el8kl8fWsU4ylaHMDByahkS9dbgBK2ucRGEn
         5faM/RUIy31Lit+u/wBt+/sBFugqKKGmYoWUyW8bvW9KhkICXVbMpkEG+PD3AKpQ4F1W
         nCiHChuRatmPKyYPJ3vPt3FFLQYgyl8RUTP0xMpu5BPT5KcgXhPcEpqccUtyXiqYmdFZ
         bMZmaxMk8SB1cpbnnVQiHc6tzkjyVNChuRgAhhh5g13ovX2uEljhC0gAx6zmZmYPKRUU
         tLLA==
X-Forwarded-Encrypted: i=1; AJvYcCXRPfIEtjOv+OZ4lmgo3hU6H84zYeOQyq12UmAIWwiqjiXMYj9P/X/ebS30C377PkVEQdLheCnGMKvfwXVR@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh1QTXy5nGT9X70UcoFCpD4nsO8xlHJaMy/X35LvrHWPVuiN1Z
	e4xLH+XUNGi38e7pXuxsmE/MYAtWwYUSKVV7y/g6eOP9dl9hv8xzRlib
X-Gm-Gg: ATEYQzwTaoH5WWtEYL0gox30j7W0nEu5AaXcr4B1c9W9VhYuqDVW6MuseXhPtK29XGz
	BuYwMI536fJRXOC9UbeXa8ZmQ2Q3FBajeWx5xMxVJ10hLZThGvI7o5RZFO614vHLJ6b3iOo54UA
	hFcG0MmuTaPI0K1lcZtyRI9vCRxPDi/nDni+bpX2XwiIPR3KYknLJDfyMeBUJ6xjiMSDcFOBGTN
	mXBF+iVw8xGmnEdYgiNuPTXfHSI/yk90T9vIeYA5TlDsQNG3Lpyz4+oMRprNRwfuEEDPt1U15tD
	ZhBnyNEXeddHzjzrRVVewHAxxHYIrLij8vca0npEzAOhwLfSckprlr1JeE+jq+99nGKA8AdLeQ2
	FBfTqSGIuFvRNpF8tNPj16IkhrjzOSYk0sh4xzjfn7+02JW++Qk5zOln3emlnqcZRmudZXgVcEm
	fhY7tL0LfaAYpx65OIExsgHJ6eS2ynkAUZnv2tzHUaQ/903Cw42CLMceyx8ZEbfM1/e5vy9Mkiy
	JTnnzsD781CwfzRKs8/hl1xTollDKam
X-Received: by 2002:a05:690c:c4f9:b0:796:4486:b7d0 with SMTP id 00721157ae682-79885975879mr100762687b3.4.1772472984025;
        Mon, 02 Mar 2026 09:36:24 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876bfa92asm52890527b3.25.2026.03.02.09.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:36:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 11:36:05 -0600
Message-Id: <DGSH8799DP54.G74XNY2RDBPM@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dan Carpenter"
 <dan.carpenter@linaro.org>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Abraham Samuel Adekunle"
 <abrahamadekunle50@gmail.com>, "Artur Stupa" <arthur.stupa@gmail.com>,
 "Rodrigo Gobbi" <rodrigo.gobbi.7@gmail.com>, "Navaneeth K"
 <knavaneeth786@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix operator spacing in
 rtw_ieee80211.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302115501.31596-2-azpijr@gmail.com>
In-Reply-To: <20260302115501.31596-2-azpijr@gmail.com>

On Mon Mar 2, 2026 at 5:54 AM CST, Jose A. Perez de Azpillaga wrote:
> Add missing spaces around binary and ternary operators to improve
> readability. Also adjust line wrapping and indentation to align
> continuations consistently.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    | 89 ++++++++++---------
>  1 file changed, 48 insertions(+), 41 deletions(-)

This has already been fixed in staging-next. Please use that branch when
submitting patches to staging.

Thanks,

ET
