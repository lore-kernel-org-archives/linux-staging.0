Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498FD370D70
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773610584; cv=none; b=sFiZ7nmnkMij6b/WLt/yJLoGfop/lvxMSKZmlDeSYdBGeuQOG8q5mhqaK/1GaXH6rszXMirNpE3zWpskOwp5ALSkMqTHuM8ZUKfYgUeaKKlBlzHdBONG+qoXCPn6uFOJb4vMnrAWrcPWdBKjWrLPU4JYihP/XJBgf/D5ub5uUdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773610584; c=relaxed/simple;
	bh=kXRfqT68qZGulaiSJSbzKPkSGjBgNmbvE8WonQAUAa4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BkDH/dQXLUpX72qkycVKpHqNEQ0bNpMbjRv9UGAHyeONb76DTiHWdW+H17ift7z11rBdHe5GrHrfQ52WlIEsWEYjqqVNnm+jdsUGPLRkf9abWHip43JndDb6ifoNciQDR/HWKbCk2ZjJ2EHf7fwGdA17PIM234EHDjW45g+GBRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhCy1ttE; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhCy1ttE"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79a51edef1fso1568657b3.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 14:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773610582; x=1774215382; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2Bq+5FEE7iFPrtOxsOCAb6k7KUXWiu5PqPdfBRrFhI=;
        b=HhCy1ttE/IBTLW7edM2KNignDhoxcp9JobMb70MYxYp5PCTj2TtYTir5T5tEbi3Y6s
         MMDvQ9zbsNVq1gtZyBCxk1bXwp8Wn8cadE571eHGqyB1QPI1cZFp68Kbm1lg5e+mSfU4
         pJwDspuqqbYupAn6Cbi5XQ2EVDGh5HvrAXfew+oyGwKZW0YkIJ/EJW8f+B27RvZA18lD
         P5zNpg14q5MPCxZEAhWAWwg5JbWo7V9xHKyHnlRl0JngKleTky2u81hOeI5lPoQERpAI
         +DZfnhtqyQnjleZZ+0kZn/geX8sLT87Xu0NHL4k39O7WSNqnXHqeQvE2L/QMRWgtyVeJ
         EfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773610582; x=1774215382;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2Bq+5FEE7iFPrtOxsOCAb6k7KUXWiu5PqPdfBRrFhI=;
        b=U7x8J0uAEKhj6PpGT4NfaGpwkhJTJ9iyyH3KvAzos/1vrWtscLVP3zaewb91LTf72V
         YifjQj+UZ01addWiCFjAzmVj9bwkkFWf31aApkUue1COCHqnGsuR1+WBDnhxtdXSMsnU
         HOHuJ8T5egsAPmSGGGVEIgl0IAUxYgHTpU04/sauWrG58oAfOVcm5TIYSioc7Z0qUeLx
         aWo0Jsqj71t8g3RbPrwOR0Qt/cv8eRkK2IMgusw5PlKuiALE5v/Ym0HShZzzBPl+lcLT
         QTcLAA7tsQX9GAqXXHZFAEoHOpnN7ss0WKVhRqtfiZDgv81/g4QUtUu748Of8xDmPOwj
         uAbA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0NqRHSBi2MJQPk9QuFwcxcfsKkKOjySoep8fEHNuvDP0EMkQZWXxBT50Wgc4qPipNu/IyuNl81i8VFGZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwO0w1LoJY30ForWbFFVDmT44S0Im+lr9O7SJMsFhWxW2o0N5aS
	k/kzuKLCLI7wq6tydh2l2S6T81I7vXmRw1MItZiRvavTeau6qhCG3bOK
X-Gm-Gg: ATEYQzzPjUIqo666Sgo7ilp89rxTb8FZNAItWLCMZvxgasLoiOBPyeQDqqVJdfK5bGC
	diDE1NRp9Ypr1bm1J5BdVPHyDG9+YMFj1qPx7pwEwg/fA6cWvvSWOffFScn8JHPB3LM/Lg4w90G
	wj49HMGZHpAWmpxBZOyumwvMv1VPWrv6zUMZ/gjysmpR16/WSwFqdTn9iNYtWt4HmJwuk9KhT+y
	xsXaAKVlRb0533sBD3Bsbis8Fqf/8Xm1XkclZYuw1dUeP6gWRKZGCwiU2VnGKupfGfbA3hPNkFK
	E/1LafwV/chpfdD5WdudfUwZ9rzWp7Od+b5xX2LzPkovVhTjU42a365rwvx9SDIHEt7mhy+5TzB
	O3lWtw12LxK2EfG/Q//MLBqtiiWJ3nfJXgaWUhi3V9ra2aNXIQidu7mh8h8S1USEOKh5fyvLdXa
	YvsKf08bc8ubZ3bJvGlJw0MAq/ioX0SCMKUk0usUpyhF5pT8rDTzYfXO8QHBZ1Y2T6DlGBegSgV
	F8UAWf1VMtrWRuwGDDfQ7EkR3GWqliNMhkNMKxCyI8=
X-Received: by 2002:a05:690c:c4fa:b0:79a:3be7:81a8 with SMTP id 00721157ae682-79a3be7b453mr41739997b3.6.1773610582304;
        Sun, 15 Mar 2026 14:36:22 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917e1df14sm77283697b3.17.2026.03.15.14.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 14:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 16:36:01 -0500
Message-Id: <DH3OGZTSXMY1.1D225FT4I6MGM@gmail.com>
Cc: "Minu Jin" <s9430939@naver.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Oarora Etimis" <OaroraEtimis@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Use kmemdup() to replace kzalloc()
 followed by memcpy()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oarora Etimis" <oaroraetimis@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260315194738.154324-1-OaroraEtimis@gmail.com>
In-Reply-To: <20260315194738.154324-1-OaroraEtimis@gmail.com>

On Sun Mar 15, 2026 at 2:47 PM CDT, Oarora Etimis wrote:
> The kzalloc() function allocates memory and zero-initializes it.
> However, in rtw_cfg80211_set_wpa_ie(), the allocated buffer is
> immediately overwritten by memcpy(). This makes the zero-initialization
> completely unnecessary, wasting CPU cycles.
>
> Use kmemdup() to simplify the code, eliminate the redundant memcpy(),
> and remove the unnecessary zeroing overhead.
>
> Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
> ---

This doesn't apply to staging-next.

> =20
> -	memcpy(buf, pie, ielen);
> -
>  	if (ielen < RSN_HEADER_LEN) {
> -		ret  =3D -1;
> +		ret =3D -1;
>  		goto exit;
>  	}
> =20

Also, this is a stray change. Keep one logical change per patch.

Thanks,

ET
