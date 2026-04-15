Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D23E346FAA
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 13:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261028; cv=none; b=haVVn2x7T6Bacf5Qr7FwWueX9Htm8L/GgmErhFUXfK8qdMbVCLo4o82/EiufdUvl4W3GZ7BYh5f81IPahhtfMe0OqGby6o0TVvPVZyZxVqmvXk2b6jiz+J4PXzWEUnXbS/wfqGY6LOav4t9ZvTDWEZcQV829cIl/rfLM0kVngys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261028; c=relaxed/simple;
	bh=eVNrw32cdCvsLSD61G9JKcU5GmtqCrVfszu08tUS68k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDCtZEZ64+LIIKvEEahAfVFyLGXE/O8Cqcob/U7y6xZCGc0pZxaY2s1oXMvobwotC7q5/x0TIe2g7uOTI+99eyqJ0V2IxugNlF1NlCvbzu15q55TDtlRG/ZwIOYiOfjX1OzJ0j8cOqH3bWVLD5hfTiuBBT+NJsb8AOSl7tzDO94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDu+zvH+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDu+zvH+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so49164185e9.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776261026; x=1776865826; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g79BUYEA9YLVd9gvOkb8IdbY0UtoN0HAYMseG9etvGg=;
        b=kDu+zvH+LcZUkTS/RZD5APK3h/US/cCNJ6iSLG0l1O03ehp7CmomdGz9KwHB8AUwLu
         yNAIJgm6yloP4gHaka2UjOU9BNEs9Ket7n0lIau8P69kLaFFevp1gxrrKRQlyiO55WPG
         WjfyPJwXt6mPrbwbJG2G+DvpSIcv8y71FlA1fQMqeYS1fEA3VWNLdB7sQyx7IOww2aHX
         D1M9t0hWNZ1TuEaW8jswJWWtnonwhsgG+7gPu+TChUpE72XpTXCFj6EdebWhRVxyrvVT
         tErCW5bE9c5VELGtTMucZXZelYdtQiNYvBmFbOXNVaJyhqgDVOQcpDEDUfUwwbGGVkoQ
         QAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776261026; x=1776865826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g79BUYEA9YLVd9gvOkb8IdbY0UtoN0HAYMseG9etvGg=;
        b=dsCysFkOL8nQ5A45mE+ZVBH0SmaKthM/Aq6DEmk3U7OBcnWvfjIJPRqT/woba4mJdq
         ZHg5C3Nvzb7BlwVZ7Zg4auBuEiKdfM0P3x8xevYgVoQFuwxASq61+xZCebJrlLsV8LrM
         nd6BemOpQZwOuNAISqFr+XBKoBgPsxVCGWafIQB8R5hIDi0QLT0WPaR45/fLHiO2DiuP
         dhZDaO2jGui1SwkaQEfTRU0HKoDF44VmACG9ZqZjVNlerVDNdvoT/wJ39B5n9HACqTgR
         yZSkdG06oc2avtEB+pBDe8p9WFQwI5enos8SGTzeEqBLHc3jkCbimY8llF77fBJwanlZ
         uflg==
X-Forwarded-Encrypted: i=1; AFNElJ+NsuOjDZNRdxYLsKaduvyZvMi+hij/+p6a8EIt6P21a7kB8mX1+3WqZti4URaquzau494BYoIwtbcj+x5k@lists.linux.dev
X-Gm-Message-State: AOJu0YzSOSDLGtUG30KkInqbQ0zN0JGxcd9ahcYcxAP+cxoZ7vBjrG5o
	KfuX44skJdaj1JALUBH/gC3HsqN7AmMIa1UYXBwNjL+DE2x0npBpAqzTjvcH2kZQijw=
X-Gm-Gg: AeBDietcEpE/CFdh0eZi/pMrfD7jowdg2TF6M7OLY2wPNa1+5IcXW4Lo3nbFejf5Q41
	6oxDpwczUai1EePlXwm0HoeHx9txE0Cjgqg2JLxE65dcJM+eHYGbrztL9wrgItP++Fy8d5offu/
	JRwJrlbBNyyiEBno2HvKW1hPhzWRWY8642BtLtGDH6RXGsFr5HX8CEUbF9ujiTSFj0nmcjYWpDK
	veBZme0mIyzg7QeIb+qZ32ZTt7wQ4+MlRjkuNz+rdqu5WI/Ndc9zXyT0A1j2iCMBmwjXZg5pefB
	eYYrmX/3e+QtIE6Tqj8V4fO8cVjOzZi4vU0m7wxCA7hXsix8T5LrQeGDOuzVTZQasMSd+XRfshf
	SM8FwSI1z4WBbjykmBxjYMnvTgqHtMwSpfDUxft7cWSBtjlLLDv+FgLkV7c9lqhmueiADCzdPZU
	apInWGkwee9hkg8Ybp0wFjBIKa3J05SA==
X-Received: by 2002:a05:600c:8591:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488d6abe9e4mr219085585e9.26.1776261025568;
        Wed, 15 Apr 2026 06:50:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0ec6d2dsm20410085e9.30.2026.04.15.06.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:50:24 -0700 (PDT)
Date: Wed, 15 Apr 2026 16:50:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: luka.gejak@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix remote heap info disclosure
 and OOB reads
Message-ID: <ad-Xnciuuz6wqAVq@stanley.mountain>
References: <20260415133726.23515-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415133726.23515-1-luka.gejak@linux.dev>

On Wed, Apr 15, 2026 at 03:37:26PM +0200, luka.gejak@linux.dev wrote:
> From: Luka Gejak <luka.gejak@linux.dev>
> 
> When building an association request frame, the driver iterates over
> the ies received from the ap. In three places, the driver trusts the
> attacker-controlled pIE->length without validating that it meets the
> minimum expected size for the respective ie.
> 
> For WLAN_EID_HT_CAPABILITY, this causes an oob read of adjacent heap
> memory which is then transmitted over the air (remote heap information
> disclosure). For WLAN_EID_VENDOR_SPECIFIC, it causes two separate oob
> reads: one when checking the 4-byte oui, and another when copying the
> 14-byte wps ie.
> 
> Fix these issues by adding explicit length checks and returning a
> failure if the length is insufficient. For HT_CAPABILITY, also clamp
> the length passed to rtw_set_ie() to the struct size.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> ---
> Changes in v3:
> - Switched to fail-fast handling for malformed IEs in issue_assocreq().
> - Fixed HT capability path to use structure-sized output length in rtw_set_ie().
> - Updated commit message to reflect all oob read cases.
> 
> Changes in v2:
> - Refactored rtw_set_ie() alignment to follow "open parenthesis" style.
> - Allowed the line length to exceed 100 characters for better readability as requested by Greg KH.
> 
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 5f00fe282d1b..3d44bc36532d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -2929,6 +2929,9 @@ void issue_assocreq(struct adapter *padapter)
>  
>  		switch (pIE->element_id) {
>  		case WLAN_EID_VENDOR_SPECIFIC:
> +			if (pIE->length < 4)
> +				goto exit;

Oh huh.  I was more thinking about an upper bound, but yeah we need a
both.  Anyway, what should the upper bound be?

regards,
dan carpenter

