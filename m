Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F053A544C
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428806; cv=none; b=pUxuJJD9v8odU2oW0ioO2wlWx7bz19ztQUfmcsDo8cpPIVfPHOGiu0beUvEzgI0o2tb8ac0sgcp4m6w/57Ldc9uUGs9joUKnWNYAQsS55niIfXVXQ8ISgjBNSZILNGLu3ScJRgf9pwbQT1ygPcKJGiXqz8TrS06WtlXeVa0qtFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428806; c=relaxed/simple;
	bh=Xmv8mBKPsyMDrUEDHu80zKbnU3gJGwWlB1MFkTuVAdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K93+nRYNT8/bljmNPe9W/ipeeNV8TqjvStdFsBJZX1xLZr3my09tPOWewph3baYtID6iSmx9F/E2wak6OV0+mBGWSMigQCG6s5NYCGgDq56B/7iWdpswDafA630pwlR6x6ImADOKj2IZxSC49Mb9YWHorgL+51gqsgzDubYmaUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nljf06y+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nljf06y+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903fd19957so7895395e9.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 22:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779428803; x=1780033603; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31ue1Zh9pFxr8D8zxe79RAZgaCD+VgqlmuwvC7B7MSE=;
        b=nljf06y+yU1bPBJLmpOsEbj6iADsVjCM81t49YBHnZZzKKW+CfEBwjTJsxCTNE7I24
         woNIGdtKelJd6uA2TjF0VJLFwtE/0HHjGfL479wIMjEQQmn1Ms80t/DR0V1zvFqBopqx
         x1Bo2GtmCbndw0tgB7XXbip6qrFh+jqSnsEx2nwfNn2EeLOyfaOCPddcxkW7WtfZsK8D
         qBxEFFkBm0XX3P3L5fKGUoMlamSk/RYvQonJb5Slh6lALeFuRSvx+EAtcxgUbatCg1Yp
         i/ZGaEPElK7vpDKwUwuOkp4sVAyF8Ko4rEJiwBqxujTGYFI5YXn76JV+pSskJVAfx5SK
         DQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428803; x=1780033603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31ue1Zh9pFxr8D8zxe79RAZgaCD+VgqlmuwvC7B7MSE=;
        b=OBlcoMYmjggjfRijBteXeg5xFisBGnJEWAwuCW0tc9bW3bFDsENKDCS28uv3Z8nquO
         2JaSya9EqYc+Tp0XmLVfurwEWUbAzXIY+yqFVrBEk/6w+N0NFpW+1/lSJ2ShBmEcB2Da
         OQZq/bQ3sXfXryIcqcQDZI3qe5HjTJB8sm/iRR19iXGPUFwKUhKYODTz5Py3ac9hZzoN
         ViEiuBf0+elDMQo0UR+LiReXC03zqYIVQu8g5HTJ47U7GNJQdtyeXQfgxhgjqxBIAhDF
         SPHUqo51PW554NEuqLBdZ7ksg7ZrXFKI7hMswNRN6TXpO17EveGY0NZpDYPI5Bp6CRTv
         t09A==
X-Forwarded-Encrypted: i=1; AFNElJ9Iq+/zsmqOQJIo+tfpjbnyxlG6OGUZamvycvp7ewLLp/iO9kuqyqqYWU+Dod555y6NisxTWvdzSdUMSChT@lists.linux.dev
X-Gm-Message-State: AOJu0YwTPQVCBEt8bbOYfar6gG379cdt6NMqVLy0TXTZBgwWVvo174My
	pl45pUAtxsV+PEqCJQSE7iuTrrS6rvwIKbriHvR07C9CbbOC8U1gKwk8yad/ug==
X-Gm-Gg: Acq92OFBNuMi1+ZOh9bNMab+q69nDs7l5SmSiIWFoIkw3eqiVLa2gBFC72hLo0NRIRt
	q7OKHwNEUBnhx5okIAA7AVkpWAfU3Zss8ibDns05jCE2PifANTsTcsfE+8ILzrvs2WLk8858Li0
	fp5nZkickDzd9Ie1OyVt0KxsvF/7X9A4HXHN0YgiVGTD4UFRqBKNORWTVPeQPMUMws34Eal39A1
	BQELNPge2zDyiflhpawifYC4Xd6qF9aWPLQAcADhFLPQJ2W6Wil0Nr1GWud4MbywNls7xLFMk9X
	mp41UfP8hIhP7U3gIHW6q4KHrIceDaWTc/zr+DM55yeMCc8ae8Hd7hYGAxD5aMawX68tjbu3cFh
	DvD58Mi9/BLfDH52R8a/2hCdHL+9PBr2rQ8h483KpZRSDmuV/nbjjSGSRvQJ1lVNkB0VhoihgQq
	YD2J63Qab5hSUQDL6+N0g2mz3ya6HCnLxaQQ==
X-Received: by 2002:a05:600c:4510:b0:48f:d5d7:df63 with SMTP id 5b1f17b1804b1-490428dfd36mr22647375e9.27.1779428803527;
        Thu, 21 May 2026 22:46:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490417a2814sm10130675e9.6.2026.05.21.22.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:46:43 -0700 (PDT)
Date: Fri, 22 May 2026 08:46:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: omkarbhor4011@gmail.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix operator spacing
Message-ID: <ag_twH7irw4loz2v@stanley.mountain>
References: <20260522053854.188893-1-omkarbhor4011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522053854.188893-1-omkarbhor4011@gmail.com>

On Fri, May 22, 2026 at 11:08:54AM +0530, omkarbhor4011@gmail.com wrote:
> @@ -1888,7 +1888,7 @@ void rtl8723b_fill_fake_txdesc(
>  	if (IsPsPoll) {
>  		SET_TX_DESC_NAV_USE_HDR_8723B(pDesc, 1);
>  	} else {
> -		SET_TX_DESC_HWSEQ_EN_8723B(pDesc, 1); /*  Hw set sequence number */
> +		SET_TX_DESC_HWSEQ_EN_8723B(pDesc, 1);

Why delete the comment?

regards,
dan carpenter

>  		SET_TX_DESC_HWSEQ_SEL_8723B(pDesc, 0);
>  	}

