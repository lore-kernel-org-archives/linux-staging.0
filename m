Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549AE206971
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729088405; cv=none; b=kFLEGBfOzkFpfpfz6XTFjKRo9+9/Rqyd1dmhs6hft37pbzi2AlxH2lBjCU9DWzroSMKmT/ii00VqD9nwbhTZnf+kmGrd992izfu0o7jClqoYs/EUTNIL/Pl276W1yb61+U2epZMxfV5hSjrjOepi8SsyLBK41tDP7JPym2B0JbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729088405; c=relaxed/simple;
	bh=pJUkxQtwyw746nk67DanPGVIfzvUtiNSIx6NJeAjoGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=on9ktNDBpko45gOAFpBroQaAMORgNrMMrHaMewO0TNP1+9hnpd3+zPfxuLke2f83RuM+GFDyDTdc1YwyopnnMp+foREEMAybSYsjzI5ZFqfAnLmuF/fyLQ5XqtuDNVbf2ef2OL0pzspTc0zcvcSKb/5YK2xqF5reZgAOsvBVbH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jkh636R0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jkh636R0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c9552d02e6so6449111a12.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 07:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729088402; x=1729693202; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6YX0eX++W7tAw6O3U3cWC8A1iR7EUNPF7MLoOd5k00=;
        b=Jkh636R0v2KIeB3vH6+DuY3l0RD89Qo+d7pDMrS9kFqVpET/AdXFsb3yVcOeBpKhqW
         rDgztQcxShDKiLqCotx0ZDCi/M4xvnpw2C4GklHB77KfLbPKrCWbj7bheK62f/y9PZLB
         qH3N7IGRdzT9u3FLR272+x2BnGnlZl5cdEy//KuyeNaCZGIRhWD0WiGRKU6j/CtUZXTK
         uhUYcnAVHoeUPNN4Da3Xe4nfJITvy5pdlvCFIPREb+fSJu1ubyRfez+1qIqmhG4oN8U6
         D0YITpSfImkDNPtY3VbR3HTifnak7nVkKPgCV4A+TFexk0YAFeigh0X/3vrrkm5efXpP
         FRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729088402; x=1729693202;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l6YX0eX++W7tAw6O3U3cWC8A1iR7EUNPF7MLoOd5k00=;
        b=Filaa7BP8ZQ0CsR+qwwLllIsDco3c9zECTf/t9Ia/lxcw5vPL/KCBZTnHPPX8Z3cJ3
         Al2y+jLOYnimVK3qjJzBvS/2c1O9usJ+lKLwla0jYM+lh49YGIKUDgcyY58LIQu7nCNu
         2cmyLaOOmhJuGWvMIUPxjRLHINzqhcYOmNFQJZ6jtItqtKhaRRyZg3b9Cnlqbp6wbkfq
         vEL6P9R0EPGwxNfC9q43iIPDYlBnBAdsB0WIhnyofB85XMhSj75ktHvAGRFRAtHiAXcd
         NTQ5jNGIHsQ1CoTTUSGKpbyKiL3Nf21Kdfw9VIRxDPxN//QxP7OHGFa9ylJk+suzqhoJ
         pOsA==
X-Forwarded-Encrypted: i=1; AJvYcCUUeol4Y/yqrnJFXovQurSnmO+PobJxli91cqv8Xn63bm+lsAmhgrbjiFCKpLYw/A6jlmltTbrqYgHfsM7L@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7/R3BQDqqto6d+A4at0ObGHllq7cheGIE41eUSCkyvbPLTn+X
	eTWvgYD1yXHzX9jRUtYWVTxUaG5eDfev1hbHVtq3Veqiof46zMEAAzGYXAshjc8=
X-Google-Smtp-Source: AGHT+IHZn1ughsOxXkjsi52tYdi0Vt+QgnG0sILlX8vmnAbEOr3JjvX4QEzTCq1ABBvJX69sd1x70g==
X-Received: by 2002:a05:6402:5c9:b0:5c9:58a0:240a with SMTP id 4fb4d7f45d1cf-5c9950b9252mr3065086a12.14.1729088401552;
        Wed, 16 Oct 2024 07:20:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4d6297sm1769537a12.15.2024.10.16.07.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:20:00 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:19:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: other staging/gpib bugs completed
Message-ID: <912561b9-e446-42e8-8922-9e8952355c79@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Keep up the good work, Everest.  Here are some other bugs you could fix if you
want.

drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381 agilent_82357a_attach() warn: inconsistent returns '&agilent_82357a_hotplug_lock'.
drivers/staging/gpib/common/gpib_os.c:889 board_type_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/staging/gpib/common/iblib.c:242 ibonline() warn: assigning IS_ERR()
drivers/staging/gpib/common/iblib.c:505 ibsad() warn: AAA no lower bound on 'addr' rl='s32min-30'
drivers/staging/gpib/eastwood/fluke_gpib.c:592 fluke_dma_read() error: NULL dereference inside function 'dma_unmap_single_attrs((0), bus_address, length, 2, 0)()'. '0' '(0)' 17 9
drivers/staging/gpib/eastwood/fluke_gpib.c:592 fluke_dma_read() error: NULL dereference inside function (pos=17)
drivers/staging/gpib/eastwood/fluke_gpib.c:949 fluke_init() warn: was hexadecimal intended '10'
(perhaps intentional?  Just leave it if so.)
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:837 ni_usb_write() warn: inconsistent returns '&ni_priv->addressed_transfer_lock'.
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:1103 ni_usb_request_system_control() error: uninitialized symbol 'ibsta'.
(this last bug is tricky to spot.)

regards,
dan carpenter


