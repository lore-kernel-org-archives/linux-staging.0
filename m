Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5B63A9850
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 05:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784267507; cv=none; b=Uai40mrkuaAXLgbRv+TqqJYjdNwHEqK0bBs1cJUyfo6bGsAjXTUUnZxU8bjLbHCLaard4GJ8ekWutwRJncGZtGGn14v/2hx5na2j/0K/q0yYTNZHFe/dZZXxOIwWmEum5IH5ezdXge8cs4T1l4jzRiIgCxZ8RYX5RthChsgIYRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784267507; c=relaxed/simple;
	bh=1EFfARZqTYougMDxqJVwrAAU6s5k6TPIb1KJJancNeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEe9wpJMqlghDw5Y9TKQZXGK50bTZSV2WYMag38XMy7H+5o4XAU3tCaTFbNLgG4MFqt7M9h2i+ml7MyfmOQ2ihQPEtHw66Tem+diqnbV82HqpUPDLdmFXHfdl6/yn47ODZH1xXrSJ1xP5Iq4nOcHNqgHaAVT/+bUTOEAa+fQL4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHlg6+49; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHlg6+49"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9ecd7216cso2093477a34.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 22:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784267501; x=1784872301; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7GNJ2VsT/H/OoPywtw6dAhOceHxaw517jB295gP2NHc=;
        b=QHlg6+49XUrt66HQubrfWzHqZegw6wS7aJ4NveG43cgiRIQULZ3Ls3b5TQc4fgV6aH
         u7CcIBX47LfwM/FccoPeShcCSOrY+/OdFLvfA7vg6FiRuiWvwwtSFnDETXVXTGctR/mk
         xzRmfopL0xl8ZgU69LmIJhWYfRuFqSycI4ntU2um6z6fsNaTDpQ3DjrmMc55ciMhK7x+
         MKGNNrwvu0saKcXNrCWBMIcceYlcSwjpRPRRJtcEOmZNY3GkMtF++iQ2Lz1SekkOmRU1
         3lMZ/Fgtj+lxZnDONVl0E4nRjjdwbvW10H3JX7FdIo6y3M3X0Zkp0oWusvBbTlMFJbLo
         DTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784267501; x=1784872301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7GNJ2VsT/H/OoPywtw6dAhOceHxaw517jB295gP2NHc=;
        b=BwsXUtru3E4bXsGvzrMwnWgYuPdKT04wcS0QE8aXM/gvFLvFg/wUynVxVSkEQwu24g
         lHAJthGARhP3KTYn97pQ8ntxnJ6caYi7+aI708KfKJ+FQCeCKRY4WdgU9AqwSaJ1iNo9
         QCoGmCoWMSMFJqSSXS6dXHvMxmVMfvs80OexSbQXDpr1YN0Ie68Zsi6Dg5oLis/mb+VR
         FxkeyMcYkT8SKSDK2Asb+LonJgBzIMLPJOY+vn08K/nFHr7lz0vdpfbr5qajHxaLcaeG
         Wd6uFtPOCpR12f5MSmqaK/mb0J7iyxSasUq85WxQYSTymPG4wewgz4bUMbvlR2LiJdze
         Ux0g==
X-Forwarded-Encrypted: i=1; AHgh+RpJsTCDJYAM9rrJ6l4eojtiKUqoUus1hMQgOBUon21bgq+gqJCXTTy24LXNsWuKYH7ZJCnIU6/Q/Hl7Yy1P@lists.linux.dev
X-Gm-Message-State: AOJu0YwuIaOF1kJwO8KvMcLGgLm3jPhA3WbHmX2cD4vXxHTI6h0ETF7U
	hioR8Xzbhx8oeAKSSjYqaeSAttwt2DXkHvjYni75uUadygjwhxu6eTCu
X-Gm-Gg: AfdE7cnr4HyRF9x9BTdWSfznOGg5CiaVRconlZbkJxddVJg4zgIvGS3l9i/yaJPYnb0
	0hnCIhzX43isjcwuVcOsK/3zlEvnrxOYtTz5FhrggL2kSaodEGrbfwYXuoM1vSmtf3DKkXFbwQE
	A+4U3h7swAt33wW3wyOHpCSXQcDnkYcUPEQz3cLs1IvhiurvUFAVHYTNwjsf9sb24etGHxphkso
	11v7woVwsGkAw509uuppMlGrZClt2HhrDR56/BYQyrf7HxGvhXwy2tLE3KTh6eWcbKJrrg9LDIW
	XQNX5BFbm8il6c5bQ6AyBUlVd78tvJTpik+DJrjc4M+2V/DJTKYKLcCcYw9jhPIw1ddlLXwIuM3
	oHXcUVM0QmlZJIo296PSaIGNve0q66P5lXI+MK8Juc7WUdSw4JredwcPMF3tYEYV8ZKUFyw==
X-Received: by 2002:a05:6808:308c:b0:4a4:c12:46f6 with SMTP id 5614622812f47-4a4d01f55ebmr585102b6e.2.1784267501599;
        Thu, 16 Jul 2026 22:51:41 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cb035csm167035b6e.11.2026.07.16.22.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:51:39 -0700 (PDT)
Date: Fri, 17 Jul 2026 08:51:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v3] staging: media: meson: vdec: propagate devm_clk_get()
 errors
Message-ID: <alnC5GH7m84F-tnk@stanley.mountain>
References: <20260717030559.167-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717030559.167-1-alfievarghese22@gmail.com>

On Fri, Jul 17, 2026 at 08:35:58AM +0530, Alfie Varghese wrote:
> vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
> This masks the actual error code returned by the clock framework, such
> as -ENOENT when a clock is not registered or -ENOMEM on allocation
> failure.
> 
> Return PTR_ERR() instead to propagate the real error to the caller.
> 
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

There is supposed to be a note here under the --- cut off line which
says what changed.  Did you resend just to add my Reviewed-by line?

No need for that.

regards,
dan carpenter

