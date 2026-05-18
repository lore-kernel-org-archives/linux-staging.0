Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3AB388E4B
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 05:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081218; cv=none; b=VL97xB1R70qdNWWT3D1GO/6WfEcCuT07t6WbZVBkWDTueMR7tTY26kndlOLP0XjnjinttiPTH+g4QzOgbkDyDsxmbYcotxz44ywnzpknnb3vCcl2TeErDJ4GySP8m5vCW7sxyOdPtRq+gZo7OzD8HhLtbpwhhXTMXQ11TMC5lYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081218; c=relaxed/simple;
	bh=GqjBZ8uGa03HsL36vIBoDQe6jTYyAZAV0Tj7OywodgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biBNYz1ttOQn+zBT8/ImmdeEugdtGC2gRGR2mPeU/zmOicLFRfyQKt1Y/QvAOosUL6hGNKRCUEYWDkJ/ENlgGzQNMKfExPQ87GfozLz0D97dZzAnGh1hsEd9v6te94EzVK9+6AwTtQRr/yNEQeNckUltoPK833img1+aTAXt5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sx7MnHnt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sx7MnHnt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so26286455e9.2
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779081216; x=1779686016; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJcCSpAK6jMXVEX+cHABEikIfeZWnXFELGjYBKXW7qM=;
        b=sx7MnHntLiy8gIU8CrdwD1fl/4bvatGJJDTvapFVA8r4ZyYjIzLmYq6GZrGnCCm0o5
         3pkCUn91Q7hXDdci6tf0R6zvCzF9uaVLeaQuS9E/DcRS55uAJPOGzW/yxIhXPOQa5voG
         gUQ3eQ7qmvlvhbvDxNwZYNFluAK4CFKp2htAh1MsT1OB3FCEJyp+JxQlEvB1f25J2Cha
         dUUCDOkJQ0L0PFQ0Jvq3bSNWWdKiHJTHJaXCH9LKdpT5TRWIqIaS/zrHk+DITL0NeIGR
         OdhPA6JD5YiqqVWkuceSJjDiRMyOeVKL3Bs5R3fr750nqj8dLpO9Ao2+S4HHXVdB8I9M
         OXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779081216; x=1779686016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJcCSpAK6jMXVEX+cHABEikIfeZWnXFELGjYBKXW7qM=;
        b=GFrhgQAuqm3ykFGWRRBdpP6upznNjClGGmpu5A9MCji7NDmefxNqrbgmOaWunaLNgm
         2YLr/4MYRJZzdwGalQBolIAJZc2Kf1FVfCQ6LhlK2++1MBLemVaQAyD8HNLOIb5TNLJy
         s2+kT/LcfnUXQOH1uGxyDv3mKYO4jcaI2g9Za2peQjLiFC46utyUBtrYJAxOSX+/RCgY
         8KV0RFwzvj3Km+tporG4yDme9R6MS5bVwdRmLMqorBbbiGOQwI8nigY0nvspcoXwbh+6
         Yv5bQDJlVvuSLG74VCT3i4IIJHz31QKA2u/VPwg2AnE3X82c8dwEYs1T54rewSaM82Nb
         st7w==
X-Forwarded-Encrypted: i=1; AFNElJ88ONMnjns0UO3vP0gsEuBlq82uhZJBTE0KStp5lxziLfrMpUeYItMWA8ruJqQyt7vuBnDUrvmk/Ro/svYP@lists.linux.dev
X-Gm-Message-State: AOJu0YzbbvPJN8c+lShU70dxIB6f1YEqCuMo+OqMzXiS2Rh96KwGCT2I
	XCEA79BO8mE+nqlUTJCIjG9Go0IVibr7KteO+x7wgvkCfersLX6owQUL
X-Gm-Gg: Acq92OETrmAnYPbFP1IT4+EbFveAsoIsId9L+Qbnn1y81onOQiIDiPMSp5eqqMyr64y
	hu5/CR5MpbPvUaKhpejt/qD3P/OlUfxegqsvHvAtumhxVtTtb/HymHHyTHoD5Vgtu7BPCPK+2cQ
	krVd1c74FwqjqKbHL6hLOPjiQ09YLGklBfQnWxplgM6HZzdN2Tn6ZcpDJwChv5Qe+bzHTTNyVFh
	SlCCPUbm/B5X8gKcbmj0AbiUecKi55BYCkCt4GUwgOucJxrpF3J8QOwcSl0f1zgOQ1e1mnnZY7p
	rW2n7LqUSxuYE454kAy6jcTt9OphKWWr/4VSF7Yv9P8u3juKtHyn4lrA4qZokkebn+B5eZ9NxDh
	t6Ob3pFujeX+3AkvUEz1nKvdeFxJj/MJlKhUxEYbTqiJzALWu1MHx1dyFRY5WvnSHTEEyXbhOgE
	of6asvoNejHhiDCS4EKnk=
X-Received: by 2002:a05:600c:2ad3:b0:490:f32:3a07 with SMTP id 5b1f17b1804b1-4900f323a11mr17226545e9.30.1779081215917;
        Sun, 17 May 2026 22:13:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ffed68baesm47866055e9.0.2026.05.17.22.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:13:35 -0700 (PDT)
Date: Mon, 18 May 2026 08:13:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove READ_AND_CONFIG_MP macro
Message-ID: <agqf_ERxaJ6les6m@stanley.mountain>
References: <20260517072802.71149-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517072802.71149-1-straube.linux@gmail.com>

On Sun, May 17, 2026 at 09:28:02AM +0200, Michael Straube wrote:
> Remove the READ_AND_CONFIG_MP macro from odm_HWConfig.c and call the
> ODM_ReadAndConfig_MP_* functions directly to reduce code complexity and
> improve readability.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

