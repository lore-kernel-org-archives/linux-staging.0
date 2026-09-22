Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736365349CB
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072592; cv=none; b=d7VCSgee8Tf2j4JqFnpkz+e4Kz86nmNfIfmfi+5mZRq243lSkZ1ybD2oWypCfrdIApuJY10Gv5qTL4bXCzBPWX7VLt3pEa/rznO5p2PzNw6GjX+F6pNwYK7NEJGldS8PPWo6yhDzj4kUAnXFJw1G0bsiW6ERzEeKYfCZn91fqwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072592; c=relaxed/simple;
	bh=q/ZtJSAeXkKY8cNGSGgRsE9cZAfPexEkd7ZIvSgC8ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jsx04sted4Um0SaIsZaHnP+brU1xb3H+83AqTYnPHxj5bWXhbCxzkhhbUTJptJB05Scvtkl7mff+E+57Pb+jRyKDbiTdNI2G7hn2NRN03FFmbZx1zpk/VpCayTANWUMkpBnuNPXU+f4okJ0L8YAoeRyvpMDdWz8rck+2fF0TmTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hk0yKQQ4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk0yKQQ4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so23098685e9.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 03:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072584; x=1790677384; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wznDZnYyXxoiahFqDu0EcYXg1rerGnqVJ/o+12P92BU=;
        b=hk0yKQQ4IlTQVkrbxdNzW3755imhTRlD8FkxtPEUP2IZ1wyYzX2KQs2N17kciCrdAC
         L0m2yjwWNvtpWCC5GLac1VkD4AHz93g6FhsphT2SaBxKcpN5DyycT/GkzujRExjhbwtG
         Xxn1BUlemb/VK+WbnOs0BHdvzXI6EM0pBzz8yfbI+wQb0wSmJrih1HNbTWONXs4OVG2w
         mOZ+4ZCLWtYlGL1xqLpTJPhogJhayLsvqRMgI41yQ6hBTj0tSTCKyag1gbfBlX6jqOOd
         EYs/6Dx2RrAhuaJymG9ppzhMz1DdA+ZM+3Et0Ibme3t9kAVwTr1meqongDpVrdy4v3sr
         CALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072584; x=1790677384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wznDZnYyXxoiahFqDu0EcYXg1rerGnqVJ/o+12P92BU=;
        b=CjnKB/g7YsKIkstr+o1yVYLR2MVuCtizVaCMmHqNlxKAhEtbbeAyqOxiBZ2EiBI6nw
         myw1YhgX5+7+4Yo/649+GLkWYym7K7JcEEmT5L5sJoUSd9/PGdvROkqgvH9p6ZONMllT
         dj30yX8xPpxUSlGhY1pG3odxvaNYycgLcHeBHSSYpvXFc08AQWiiA29Wa54JzYvbzbWv
         Yl9naHrPEBZadUbb1GnyvIjrXh13mrfbUdMieo6GBp4e1jJQQJ+rbDfD1vZfVQvnIwJR
         WelDEVHC99voRaxIHEAh1hFxs6FRj2KuLnMIsOKKsMfrFVaFIvh8w82hPfGhfyhbMUU7
         +WFA==
X-Forwarded-Encrypted: i=1; AKwUvBzcFcA1wBm/dfsebnOQe5aVxwdTOhEKEHiy/TZsPO2EEMVZ521eLN7TIav9Us3bu1rrR/sZVS9D1mXdeplP@lists.linux.dev
X-Gm-Message-State: AFuF++nDD2r/eH/J8m3utarzPfKfC6U3EINLVHS3ZuB9DOBCM8yGdim/
	gMbcIHQCQWHk+suIr+oazrdpwV36pPuIEFQCWAsmvcISZ1OBOTjHB9pL
X-Gm-Gg: AYBFou1zfDLjJ1PCPynGDQQ9PTLB5GuvsI+NzoR9zISEtmHDYlrVapHTDjII3z9mCj+
	b/KTYuQzwcy73mSIBNvSBkyINwjnE9j9WcgsYAXqetVqykP0K21loNUiKIIx/eRBVlktNN1s/3D
	AY47nCLs8m+afgzzrM/5jnelEIc4EARm6RWdQccM8ESu6cGPV8+u5/FxxdHc73Hu0Wg+gmwuTMK
	Rqfe0crNeIfCTdTOXziAUH2qdfZ+outlDTjW4u5K6Re9X0yNRtRfsG2KO2cuYXDzv1Pguofo2iz
	/8i9PRnTq40sjbGhZmdC0p+YuKx0PBsgslWTUA/GLlMwmmmCFn3xVigBjyY1xnbwKu1Za7Se0C2
	vGuhJa8BRk58wsEQA+Wpz9JfsrPtFLZEK4TrKLOsdWbVx7LepJjBTDMmWAcYO0m8GIMOOnR0W3O
	DhM7ksP5ZTnNyRIBzNlfB4D3EI/2F2kHSr0C4wtMnjgDzjgEQ1lNpNV6MRSlzfIlBkpzk=
X-Received: by 2002:a05:600c:1da8:b0:49f:dc71:e609 with SMTP id 5b1f17b1804b1-49fdc71e72cmr8878355e9.20.1790072583857;
        Tue, 22 Sep 2026 03:23:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa4e47csm81291145e9.1.2026.09.22.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:23:03 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:22:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <arJXA7q5a40jcASB@stanley.mountain>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
 <20260921165527.1379-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921165527.1379-1-itsadi2409@gmail.com>

On Mon, Sep 21, 2026 at 04:55:27PM +0000, Adi Prasan wrote:
> The buffer bound check in rtw_cfg80211_inform_bss() only verifies
> that bssinf_len (ie_length + header size) does not exceed
> MAX_BSSINFO_LEN (1000 bytes), but network.ies[] is only MAX_IE_SZ
> (768) bytes. This allows ie_length values up to ~976 bytes to pass
> the check while a subsequent memcpy() from network.ies still reads
> only 768 valid bytes, and other paths that write to network.ies
> consistently cap ie_length to MAX_IE_SZ.
> 
> Add an explicit check against MAX_IE_SZ so the bound matches the
> actual size of network.ies.
> 
> Signed-off-by: Adi Prasan <itsadi2409@gmail.com>
> Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")

Really do some more checking to see if we can use a more sensible
limit instead of MAX_BSSINFO_LEN.  Also try figure out where
pnetwork->network.ie_length is set and verify that it can be out
out bounds.

regards,
dan carpenter

