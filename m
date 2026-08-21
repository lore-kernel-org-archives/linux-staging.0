Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCFE3AA4F1
	for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 20:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345641; cv=none; b=dfrTgG4ormsfp+mLFy1wIZmLEH3XDV/BC4AunYerFqHS9g+Rgi1AhlVsVJt30wZwrjQ3l/UVu1JjEGQ0YqLaBsUoPJbtgRDGjBWI9e1qwO8PHPNLezHCBvdZ/RyrB1dNo7e3TydUq9BdgzupbtK21XpONRP43cw5gUvT/o0tCaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345641; c=relaxed/simple;
	bh=gwGR5P/wPJadpoIZc/58/Hx7++PsDwXoa5PnmMzpgAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLHQy6Q6/oSmP3zGNCHRuZ2iGJih1lfTHKVHNyBl3iu/6ck3c3HDkN71OFuy1v/XB0ReEJvG8sJm+zIrSnQo02DQ/I9Tf/AlgBX3eTf9ZAsl8ei/m/nbYOiNWj3DWFvJa+LCt+QtlsTSYj1Q4bY6tjB8X9yvNcs4dPcPPW+Kq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFEPA4yE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFEPA4yE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49954b88fffso12507015e9.0
        for <linux-staging@lists.linux.dev>; Fri, 21 Aug 2026 13:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787345636; x=1787950436; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AHy6QNmeSnh9146Xv0VjFDiALvnInlM5eLCi0r12Lnc=;
        b=WFEPA4yEtPCux763nSyebAwHoVwfms52d4CmU8Orq59gNOCC0Ln3hAaEuzUe2bHWIm
         A1/w9Mjs/eGLRxVWzttFLzCREyId8DsWqEDmQ99eRRGNLk+MWiya75kHdjymaGb5sBtM
         Hr93kkwx6WyOfvyMI/5bDU2ilSvdFUTkCa3bzHpMd66pgDE4iAUP3T3Dl96XuW64YQTc
         Ij4Vcszjtou0+RYjEUztrrqtUNGCy9u+mNfEJ79kRzsSIH9/Np0qpKYUGXeqteQ9luWn
         lwQkPv8RVXVNHozgQqm4C3RKnRm/C/jubQysux1gtzMZWLPtezH4oXsKhcyGMQMC0o0G
         j/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787345636; x=1787950436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHy6QNmeSnh9146Xv0VjFDiALvnInlM5eLCi0r12Lnc=;
        b=rJXymsy0n5dQoGTpr7rIRr/6e/JXyJisBx7WeEYBIJft3fTyI7L1iOM3ywmFyNH7iR
         yH24mAvDZVa94+W4bs6HUJ/e0ZjgHZQpUH0lljXa5wVPdHjg7/g6TuYjf5qcEgLkcTMG
         RWCrBjFZfpbUCSE/I4GPAWWx34xkl7eEzuG1e92UwBfS+Xs2HONadnfWGtTS1FN6aI4L
         IJ9ZF+Z2Ip99+gfqoxeG0oSAgAql9kEAEtE8L/eBhYeBPz1sCRdQE8JSQJ3jfoRPecs9
         r0BU0MXdC6I3R8Vdf6P/1w0Zo+gZN8w6q9OblekZR5h76TlJ3eswCJeCVEmX5h5lwXR+
         WM6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpK48na0Z8smMIiy8F9y9OSwGim76nmv/sUQNNAGywU2PsyU3yrMpODEF4uumsa9OWmiSk773Rnw28YEXm9@lists.linux.dev
X-Gm-Message-State: AFuF++lN70OQ6j8Q+r4orYFsXiiWtqulvzRD/mFJm7rSHbwaNsLqydBV
	73B3VTLJ6rCNq3PzzA5CXrLiPyfwwQ1LtVuZH2KVJuN2qvMQwxRkVCyZ
X-Gm-Gg: AR+sD10FGMpZJFXMtgJDJSu9lR33Xzfi/hdPCbZpWINt7nQqARqZnnTfL8ukk58ZOFP
	2meNyWet3WQmOsKLzJg8m6P6/aXzw4rTK8xkifcMWNmROdmrgKrfKS8tPirMMnWFRHNcbj6PS9F
	0Y7VHj+6hRwcC++m8nR8IcU1+7LFU4HqQptIwwjS5lbcd83tEFwUaJf20/U3sM8r942z7tL8E6X
	IrlOMz1kED94USVToTksdU9K2B3j/mEv3SDJ19N1SGj4COtqo2xIW4tWjAp5S8KcE2EruN8YYCK
	jM7yVGbURomCBqN55V3X3neIggP+mW3RepT4QUAffyPQoJBGP7QArf3E8bn/XL6XexZuVkEFoqJ
	3a+heYhsU9XvxP12BlFn96NHCmAQIome8iwMcWmMEaSKWuhRoMiiTBU0Wb8rDzIe8oRqsSxzXhL
	Y5ZqYRzz+4R2+JLw7XzwSuxCRcX6ViIuYV1TzMYSgYNY0eEcVGUiBvb8+D
X-Received: by 2002:a05:600c:a01:b0:499:795a:c5fc with SMTP id 5b1f17b1804b1-499c19bd3d7mr11744495e9.7.1787345636011;
        Fri, 21 Aug 2026 13:53:56 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ba31efadsm36328525e9.3.2026.08.21.13.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 13:53:54 -0700 (PDT)
Date: Fri, 21 Aug 2026 23:53:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: modify misleading comment
Message-ID: <aoi63mXmusBP-Wy3@stanley.mountain>
References: <20260821195823.87471-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821195823.87471-1-omer.e.idrissi@gmail.com>

On Fri, Aug 21, 2026 at 09:58:23PM +0200, Omer El Idrissi wrote:
> The comment suggests that rtw_unregister_cmd_alive is called
> by the ISR, while it's called by function rtw_cmd_thread which runs in
> the kernel thread context.
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index b9f8cf1014ed..a4831dc145eb 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -891,7 +891,7 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
>  }
>  
>  /*
> - * Caller: ISR
> + * Caller: not ISR

The original comment is obviously wrong, and that's bad.  But is "not ISR"
useful?  Probably we might as well just delete the comment.  It's not
like people don't have ctags.

regards,
dan carpenter


