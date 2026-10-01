Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837913909BF
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865696; cv=none; b=J44NjmntmCVe3zig50XScyxwaEAUDcyJA0V0uibz+tPV3+b0KcJG83HSumRIdjoghZlIAAUnMEbecuvqDRMrWfbz/l6tHH7o4qwMhb2wWWoSFG1g/IFlTWfkNL8zBVRgfa/+9Yue2SYEn3F34rvmLA6tUfxIyq2vjVoX+ycn+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865696; c=relaxed/simple;
	bh=xdtLk3dDtunMm0rlgxzVmxPE5FWLT6DAQ2rvMMAwY2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVh4plqQvP80VDlra+LK66w8iWMElHM3HmRWswqPPSdWcjnuqxyKmoh8X5XmOv9jGT4J+DmDtFkjHCH60RcZBZNgUeHDgXZPc6/tqBGjS5ET2pMWnHqTN7T9oe9+41BfUaRRRs4KXhdxE3O01qaT8MK7SoKEjcUZl+yb3QNHGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcEbVhOV; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcEbVhOV"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e028ed54dso414952266b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 07:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865690; x=1791470490; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GLkmS6P/05hnOdDp0Ez1dkg/qbTAZZjwunW0NtpHx9k=;
        b=mcEbVhOV19GScsqUahYzpM8WbngWwwy/T1eJiC8SNQ5GCNarwHQikmw/W2sPlvdUIw
         m7PcneTKeQYN9Jt67x/iJGwTUQVQPROXgfUHF7eWJJZQ/oIJCgKhab89+WM/mN0rNkun
         5RXblu/s9RPNneIO+e8SZjAVsL37LT+JaKiB9juKm1cjOJpgP+Duf/ZE94fU+AJazU0Q
         TsyCHFD/kpFzLqo65NPWwlpCoQ8DqeUXPYxN2E3GK98db983ianhgWtwkG7ipMXFLZ5x
         7tYALTNrPTROVcDEQ897ohQYoX0NNHfux0MaeC3HzgKSlB927Ga3QW9Le6pGe6znqWdG
         dH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865690; x=1791470490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLkmS6P/05hnOdDp0Ez1dkg/qbTAZZjwunW0NtpHx9k=;
        b=vJ61ar6EL1A8Jv7P5TpUc/kZn2+SDJm9ZMsWt1MVJGavIvgqALqavcmUez9xG82Rwg
         ZoCQHy8Pg3KR3J3oNLS7mDfXJRWmTLUS6EYmW6si+IHlW7NIBqhNNgvPqhNw4npAdMIo
         tRpkc3rrp80UciS330yfM4zb0Ys0iBA/xn1MNR1eQtULKfIXAVz1aGTa7JEeL3WHX4li
         fxTidSQ7DuypuHrxvNUJyTroWi5eKec/DVnKwZmO/2GEOMlv9xetpEtSdeWTmTweH3UJ
         yfuQEiPdn/k9QRwz8urx1dk7XC12mQXTeTXE86Z6JRKMUeac3Mqh0Wkb0+gSVy0jyNz+
         mNpQ==
X-Forwarded-Encrypted: i=1; AKwUvByodSzDkiMctQ7WdEt1bK9yD/M6P+e+dq4MjVGnGEnK5VreOCMmOhb57YnK3i5fa8CtxzYNIGHazkQ+tU4A@lists.linux.dev
X-Gm-Message-State: AFq9FYIAFLO9JYRnOcpydjs/0toYiN6ExHAi2PeYXx9AzYJAmKSGld+a
	bQaz7UD2tomSkNTjhxho5Hcbp+W/ThIgerXdVcKpldyy5NrPBe2hgNO5
X-Gm-Gg: AYBFou1ErT3NjUOHZ9dCSyV9Kah6Kq1c98YMtnqiymxZvAnrT1V+s36YZ+E2xq9ufRi
	GlTCqX7UR3LfOA3CxbRdEL85ys/67ZOIaXKcefzwVReJ1jlgGnbYYsfHNTss5alRFFV2x+VuDOd
	GHhP4OB0IcCxznvA3THteq0SVrccjJueF+oUjmzPdTxbMq7WOACYzvU6XfnLEusnZ6ybpN9cym5
	PnzJhduFSN/9xwxCRpLDKYQNM6rdr0jyRLxeZEjyrnX7v2xioZ49ffRLHU8daLvBOIqXmM+rMWt
	0VtEl6QvAm47cBXVYN++aExdndpjhy6lhegG2Nsxc9pYR+S3cqW0oOR6PgoBd+Kq/BNI0TaHkLV
	2sZf2UTYm5SKnhkbiM3DwhsNJI/xU+cK6U1HU7VYN1fCT+Qf02rUr/nVti9H29q+lcAzm00lCZu
	+QUCjSvPduOePWCSJyfmVgr5klVGBkoltqqiY53pywxAw7VuhzE+3bdcO+8ZbSLYOmBzY=
X-Received: by 2002:a17:906:dc8c:b0:c29:f5d8:9c7b with SMTP id a640c23a62f3a-c2e23d28f30mr404197366b.42.1790865689919;
        Thu, 01 Oct 2026 07:41:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dc70a2sm173052766b.64.2026.10.01.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:41:29 -0700 (PDT)
Date: Thu, 1 Oct 2026 17:41:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: return bool from
 check_pending_xmitbuf
Message-ID: <ar5xFfULgNEwWeQM@stanley.mountain>
References: <20261001140640.107536-1-matheus.aalmeida@inf.ufrgs.br>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001140640.107536-1-matheus.aalmeida@inf.ufrgs.br>

On Thu, Oct 01, 2026 at 11:06:40AM -0300, Matheus Alves de Almeida wrote:
> check_pending_xmitbuf() returns only true or false. Use bool as its
> return type to accurately describe the function's behavior and
> propagate the return type through one of the call chains.
> 
> Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
> ---
> v2: Add missing "staging: " prefix to commit message.
> v3: Change one of the call chains to also return bool.
> v4:
>     - rtw_transmit_thread(): rename err -> xmit_status and remove
>       unnescessary initialization.
>     - check_pending_xmitbuf(): rename ret -> xmitbuf_pending and remove
>       unnescessary if statement.
>     - rtl8723bs_xmit_buf_handler(): remove queue_pending and directly
>       check the value returned by check_pending_xmitbuf() instead.
> 
>  drivers/staging/rtl8723bs/core/rtw_xmit.c        | 16 +++++++---------
>  drivers/staging/rtl8723bs/hal/hal_intf.c         |  2 +-
>  drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c   |  8 +++-----
>  drivers/staging/rtl8723bs/include/hal_intf.h     |  2 +-
>  .../staging/rtl8723bs/include/rtl8723b_xmit.h    |  2 +-
>  drivers/staging/rtl8723bs/include/rtw_xmit.h     |  2 +-
>  6 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 57b3690bc48af..513a4934ab599 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -2463,37 +2463,35 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
>  	return pxmitbuf;
>  }
>  
> -signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
> +bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv)

Ideally boolean functions would have a name that indicates what
the return means.  For example, if (has_pending()) is clear.
if (check_pending()) is less clear.

regards,
dan carpenter

