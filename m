Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9B8632A
	for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 18:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771092694; cv=none; b=oc+nfU2aleeKoXDtbNElHidx6fWk+b35Lk48fSC0DsxingV8N4VJtGd8mQm0pdeZdC1jqh8+fPamQcRU9rL1zanhwYZHOXz+QpFvEPEFpVVdvhVsS1meBiQ7YrKFsBKM3CcxaHpcSmNZkg3iySbMjHFcoB2OQAjkGS2ZZv4yW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771092694; c=relaxed/simple;
	bh=cBprNbFduyuWnBaG88RBy2CzH8WoX/r8qzhvV6taw0Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BI2oHZaywoZORvpUF6AR+gj3tLh1CNv/3c44IhQ0UxB7ir4uO7KvGlpsdXUeoWbQszaTG89birKn3AT3RwA1VzdgQwdlv3SIaf21B9uspkDzBDeFbPhBk0CLNE94aVA7KJiQZf7cnmawfh23A2O33IZdWr8s43JuEQn9dfGjlw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/tQwD7R; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/tQwD7R"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7927b1620ddso25132497b3.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Feb 2026 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771092693; x=1771697493; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AqC4T8I4TRyAiQywv9Srt5kgyXwwrOPruyhKy6p1aE=;
        b=d/tQwD7RyzYGU6k9ySqj1NISx4wJNimcFzARkNN2Pej2VD3UCM+LS1olxzu6r6zL7e
         tQFqnaWBk1LfJK46WqsuMNgd3nj3XrqCKMdJGm0n8rJNfp5NwHs+uwt4MW48gGronNCl
         1c6LYTMZIW7P2YRfwu40BLZ4QRIF5cP00gDsw+unSk0wFseTRb1L3M7xQQfvxRvmZFaG
         VcsF5P2dtFe8hiZKglFLw9i58wKe7pzoidtwOlCxtveRLaoMvG1TKph0XmUZ2hm1AjQ0
         jjaDWc7cD024DgOk2JH6gLQa+Y6x7+t4PA00+EbRHT2Q38KXDHF0XmALljmnGmrNFZzr
         67Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771092693; x=1771697493;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AqC4T8I4TRyAiQywv9Srt5kgyXwwrOPruyhKy6p1aE=;
        b=sEeBVaQurLemDYxOXjjtr3hYzs2pGwmOnJpJgRb/UiAf4NkF+6nYbTg1jpdTxSFLy+
         Bx7r/83eVJnZElrMR4elbfscWuE4eCi4E8wIMlxVCFa2Elqs/vlc58hWeJCn/cE5Z3b9
         lRap1nxBX5iGrqxqdfaE3urhrmM34DrqopAm7C8B0kJWiuRBQRzhj3iFPA/NSUjVw4MW
         ISwXlsHauny9Zr5RR9+n7TXguaFWmVwf8HhX98e9aklaR2Z275jy1WfYl5OKa2NKeCcK
         /6L2SVDjHml5ErNIhy1cUO1hXcbb4AyfBlY8vC9gBBTGG0lIOg3B9WNDGQM+15saacSy
         etiA==
X-Gm-Message-State: AOJu0YwrXVxCz1mrqWtGSjPdo/rQEjWCLVL281+CjIu0Kf7IsDCNqdoG
	tGmsIzyIozhJjiHuPAcIiElhAM5tDD8isoyTpmJuBvMu4eTZcJdXZQ+d
X-Gm-Gg: AZuq6aJq8Tb7fgiSrKWmg9FClGCrcqEPCnDdePCu2XnIPNaZbYX4hRjTybgfupaGZdW
	jZi27716oDTHYgud+++uS2lxCElnRlpbp6FpG1qQOOhYmBM1MFNVBEfETbqEkpboJpCwQVwnPr5
	DRNQoC+sjjuGqOC03WdqszCaEAd9KWFdTh9mD4WQW9dkihtwRdB5fKCzvzmK6FAmP9bWb7w64Z0
	pN6jwQBWex+64MerK3TeX+FbgRTrEYmi7LlV10SBb0TfAYjaViXYN/zJx8Y9WWNsb+uIXOJM0VC
	Xli8e2dmDDVXW1pEM1a5WQiRQQcxsyouulgc8noj/apc5+WgJ6m9/yl0f75z2jalDMN+FVpB3db
	hUbqRdeiZHTeCftCLaBTgL8WzkY1uO2eP8qPmOkqJtYG7gKSsCqAmfHuys4MIzg1Av19jxWtBUF
	G1zlBt/3NuEOLQdGqhNes0QqISE7q67Vii7AAwDb5yKF2jf9X4WCL9VJ9h6LjQ3k/EjNosl3FuQ
	LfK4c/IZyodSIp50sA895lTKtQY6r3XiBlF3+mTkdaaJiBiw48=
X-Received: by 2002:a05:690c:968d:b0:796:26e4:ab70 with SMTP id 00721157ae682-797aa80a175mr31013557b3.7.1771092692632;
        Sat, 14 Feb 2026 10:11:32 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c267b98sm85740167b3.49.2026.02.14.10.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 10:11:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 12:11:16 -0600
Message-Id: <DGEVYFG99X27.1U7FPTF3YE7V6@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <s9430939@naver.com>, <architanant5@gmail.com>,
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ofek Almog" <ofekalm100@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260214173139.49094-1-ofekalm100@gmail.com>
In-Reply-To: <20260214173139.49094-1-ofekalm100@gmail.com>

On Sat Feb 14, 2026 at 11:31 AM CST, Ofek Almog wrote:
> This patch replaces msleep(10) with usleep_range(10000, 11000) to provide
> more precise delay handling while allowing the timer subsystem to coalesc=
e
> timers efficiently.
>
> Signed-off-by: Ofek Almog <ofekalm100@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/r=
tl8723bs/core/rtw_cmd.c
> index b2e7f479f72b..3f5b3ca2066d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
>  {
>  	_cancel_workitem_sync(&pevtpriv->c2h_wk);
>  	while (pevtpriv->c2h_wk_alive)
> -		msleep(10);
> +		usleep_range(10000, 11000);
> =20
>  	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
>  		void *c2h =3D rtw_cbuf_pop(pevtpriv->c2h_queue);

Shouldn't we be using fsleep() now instead of replacing msleep() with
usleep_range() when the time is sub 20ms?

I feel like I read Andy Shevchenko mention this elsewhere.

Thanks,

ET
