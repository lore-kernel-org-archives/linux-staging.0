Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF731125B2
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924394; cv=none; b=KqEH86xS7/NVDc02VfKoP8riEkxfbLX/6HIviir0zZKPas0TztDj2/8wITeq1Fsf9Xl1W1CWcCaKQx8+zgsAiVsd3e07sIVo6dl6YPOHJnp8Te2v1PLq23IfIiOhQ0kftK3qHqvVXVSdZKOM9+2cymv7Es/S17DvwZH0uYOUO6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924394; c=relaxed/simple;
	bh=4VsJGYB1khL+bEjHRCcfatL2q9eXJP+N5l6uJg4pMaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtlBdI0dZ59kpQtE+fx9QenWIve26klBN9pfmLAwhv7xAVVKtdfNiHJ284u3S8VRdD1x5naFXFtuUlL5ONZY6a8nhJuTUocAvQJLCNFfxY0Ayeszzy9FfWk8S2HmvqkN8Q6HoUWknOydx6Bm8ribZ564FqVI+TijDKhkqObO2+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vp3fUMKt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vp3fUMKt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fb439299so5241825e9.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 05:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773924390; x=1774529190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jrdVngQux1zt6cpTj5rJVFELPvPZPMx5dul8K9hvfKQ=;
        b=vp3fUMKtFJlzg5+/jpjrvZlpFI/tm1LH7i6XWjgGRWkHTykEraprgqRZyCVmuLkKsa
         ZwOCCS+mo2fpejtui1LoR2J5UizkLN64rZT9JfhSWt2fmOqr/q2bKD2dSWVdcVCV5GxK
         2QmVfCwSzFjisJQYGrDCzjGMz3WvJQasqlvgeAtyjeSsg3Amapn59yQeAR3XyNUbE+8T
         Sbutf6YKFiSX+3EH1F6WT70BidiVhaCgULVr9hnLS2GlXvKeIiO9t2zdyyHm5fpRiiYL
         tHVR5vNKEcHExZ9e/WC+uEv8tlllFyfCkw9kS4ZfBGYnbsvnivO7IWPj+0OwZ/9foEiA
         UyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924390; x=1774529190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrdVngQux1zt6cpTj5rJVFELPvPZPMx5dul8K9hvfKQ=;
        b=jygf23o9AU8onZGuJZy/EY5+J/UQh7tjPtkvQl42FULxeNREkj8f1XoXAVrFQyT0DA
         GtkMteBVlmNUsSYebmzeFGVXAvjJjM1O7PbwoIMCRy1YbRdh/8XdBMt7afpdH0WJd1H1
         PUA1V0eJt6r/X/nyExbHhsECC4SIrxpYI5JPE/jhnrHanbVZ7xd2O/j2vdMUg6mub9GM
         6uHWsLTceXHcfrjeLkb82RhN7H3Ebv6/9WrHVW4gvxwsaYlHUEztnlz6y+w5lXHPXRcG
         psG2a3epNywCzPDKGWSZl0KA8RTl/qC4B3RBILxZkrLu+kKqIeuR0YxOv2X1MNDngbbZ
         Nbwg==
X-Forwarded-Encrypted: i=1; AJvYcCWZzTJBqM/8idCq+8idqnPOrPQGZbae2rSIX5SSmCMhg43aosI2/n3QEbsgM+mLNpac9DiJHuzHDJpZs4rd@lists.linux.dev
X-Gm-Message-State: AOJu0YxbJH+quhLNUXJVgit3r59TVSpzFGE0PYiPsbVzCZlHxv0kGoMf
	pRX4J/hyoSwZs0Oq5B30FQP76+VAtvMgFPVccCjg5D8BieTLr/hq3vceFSh7QSHuuug=
X-Gm-Gg: ATEYQzxQb7pQE64VKtweMcRXE5gpNv5YEYtzdz0RIZNxe6BLMWjk+ywhHeoBP6x7mUn
	PN5eu+OoBfjKShWULkEg1l7c1o6OVndL2SzIkjNWE32SbShFjjH98JI6XIOm7HVM6UlHw8py+MC
	dTPqKXMJI2dYQDwsh1PpOCgNHhU1O4Z3XWi4I1sJzwRNJ2PTwJpp1+jjQF5GgzXrB/vWvQFnC3i
	jyDA+6ywf8SjaAE3a3RR4SoTPrhDe9Wrkz07yGM3NxuSjEsDRZkNwWlObH99rijnyTMJQuAi0yK
	05hE5914eC5bOXAuK3UTCOPy7AGNvk80zcHa6bsuGGzW15WJm4H6ajpCeWueBzCUHDBuqR12+kU
	b9GjDlTSWGNUgQscek7+VuGtOOOB4bhvOtIkE2NRDCJL5Or6cUFPDvhBgep2LLAMS/Qi1DaEAH8
	0wCHMddVtAoNb0EbkrXi+j3hDWI2w=
X-Received: by 2002:a05:600c:4712:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-486f442922fmr112465505e9.11.1773924390109;
        Thu, 19 Mar 2026 05:46:30 -0700 (PDT)
Received: from localhost ([41.210.147.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f5e23874sm74124645e9.6.2026.03.19.05.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:46:29 -0700 (PDT)
Date: Thu, 19 Mar 2026 15:46:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lin YuChen <starpt.official@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: rtl8723bs: refactor rtw_aes_decrypt()
Message-ID: <abvwIQh0CHTp4wNJ@stanley.mountain>
References: <abus4pKF0ykt6nhj@stanley.mountain>
 <20260319120737.29692-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319120737.29692-1-starpt.official@gmail.com>

On Thu, Mar 19, 2026 at 08:07:35PM +0800, Lin YuChen wrote:
> This series refactors rtw_aes_decrypt() to improve code readability by
> reducing nesting levels through the use of guard clauses.
> 
> Changes in v3:
>  - Follow Dan Carpenter's suggestion to use direct returns (e.g., return
>    _SUCCESS or _FAIL) instead of "goto exit" for the newly introduced
>    guard clauses.
>  - Revert unrelated line-breaking and formatting changes to ensure the
>    patch remains focused strictly on the refactoring of indentation
>    levels, as advised by Dan.

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

You don't have to do this if you don't want, but unrelated to your
patch but the last two bytes of &le_tmp64 in rtw_BIP_verify() should
be initialized.  Just set it to zero at the start of the function.
Otherwise it's an uninitialized variable.

drivers/staging/rtl8723bs/core/rtw_security.c:1308 rtw_BIP_verify() warn: not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)

regards,
dan carpenter

