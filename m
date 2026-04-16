Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC22744F
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 16:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776357374; cv=none; b=KvztqOBMPFyx/31v0mopFB9xrKCLlrTWjJNGUkYAn/rsktdg5ANHK3M/U7bCvjJSxSE1/D0ykhZfxW8/XBlFhx4E0a8f0mJHCMIgCblA1U8WmjeHmgjBeODF9v8d/YF6KKrDYQw/B29V5lZOe2lYrH5Pxg/cvRKAhUz70ie7HhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776357374; c=relaxed/simple;
	bh=WJYVQTQOX5tRnf0OyJLQ5jgx6iHDqjgS2DHyFfvjgVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoeSTKUUskc+I446Fk/bYIWCW+orMzDhyziG+3DTYa/gG6WmQ6S1MuAOxLbrVbtBq56y4qMLB5DRLaTqQQ+gz8utonRJR63nIXiDOoU67BqFHPKl735mRhzpxCo40JHbsuEM8k5uUsNrmdY9LUB3oBd3HIpXURU5T+hGPcgVOP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBXN5/Mg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBXN5/Mg"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so5856264f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776357371; x=1776962171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vQQ9E6o3BV373q2JNSi8afwSKSRwz/rYWGVsBEc8BuM=;
        b=YBXN5/MgLhGyxNsNEepnDv2tpfRB8vGfb5J5+BhMFrBL0cgibHy8SewETsJMoHuhLW
         dhagDZarjgyE3ZuJlaBeFBQ1hCUDb3EifsP4hdhh801P5GOHI4qQaMPKL4u890ioBlO/
         EVcftIf9UuqYIJRahx25+JNBo+sfHzcBHlMoNyAUV4k7oynQO1xW8cdb9pICEdnVOQ2k
         TkE5bDjReZTTlS3ilGEnCdKJdHf6NKOKVr4ghE9PQ5SzF2YoHuosl9poenG5a4Amdltn
         +Gk2H/zLAyqEO2/H3T4s7y03gbA429kPu0aZIEPsR+DGRW0cBTFMyHpLtOeTmtPu8rP4
         3VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776357371; x=1776962171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQQ9E6o3BV373q2JNSi8afwSKSRwz/rYWGVsBEc8BuM=;
        b=mqeoFjRxgf7VUqG0BqC9IBDq+EhE7/QtLbKzvruC2q+0u1+AHdWwDJ+3tfPWGsrruD
         esSqc3vMYt5nbHBl/I/tjs1VHKWdxJTFxHfjJHo4apxgnFaLFWPp8Tf2rgrQOYrdP5vc
         nytxBsDyAtwVbQ1CE/qj1xd/RsdbsTxfuD4K/R4p98ImXmIBdfjeF9kXjx23p11bO0KF
         JEBIATl1gnqqKIXodxswwNXSMqf1SCOxd3oufhMVkZjkHIjRqQTCbp6YdmiLIWXB3eLK
         IX8DnVWHwXDO9xFRsM4bZBMCZtwCdFkQ2hzSwl0uG/kY1lIotalcxg8BKzi8o7mlBeDr
         nbOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PoqjxPYTo2HoaD3wBzLViP16EtRty8e+RWMq7ZQAfAf3M+8jwOek1eCkEnntbKTU8lAQ73JTSXUQlL/WS@lists.linux.dev
X-Gm-Message-State: AOJu0YyjgorI0fEjZ/nDv/pTmopGXuvjiSAgbo9UF1lGqCXSWcvPlao1
	SZNJ+loEedf7XTbkXYGErpaAHM9yFNmrWOT7Ae/0kpSW58m1e2/lj7Wf
X-Gm-Gg: AeBDievhBlttT7nykzMfBAViAArHYxGVXKCFGA19SIZRpUTKDw/4b0Duo4Ww86O0YQq
	xAzgnc9JMbF5+rNkgKCHS9+PbYJ3tDWO/na+/SYYmzNUqYwxa9O4DNkFtPGFKCCCHcDDQTpmXAr
	JLCkyg+oCXqL3U/GjV2CwZlQTrqjItyBCaryv1l/FjwvPRbmAA3GYi+UL7+XMgz0iccaCOoKqc5
	CCGIqxP5czXg5theXusZe4BbUtisBvp8ZoSVJY6j9Wc1+2+UVV+QVJ8GSVB3XI71Ck22CrWe8ld
	ZMFPhH6uLmkW3mSQYPUPQO/iq5TC6DUuyZIIYgW84gvLPkMvWJhjt7v91YVfg2alckgFJ1jAVPE
	7oPnME6uiG/kCwg7w7ETKanzY+TJxHRjPTWKEkLelAcnQh8dnc50W9BEEeu3npvOd/sr5At+pjW
	qQXniUm1h33cD2GV0IlNc=
X-Received: by 2002:a05:6000:24c1:b0:43d:7d6f:f529 with SMTP id ffacd0b85a97d-43fe149a3e5mr94932f8f.31.1776357370724;
        Thu, 16 Apr 2026 09:36:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d6d3sm15189739f8f.8.2026.04.16.09.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 09:36:10 -0700 (PDT)
Date: Thu, 16 Apr 2026 19:36:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Delene Tchio Romuald <delenetchior1@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	luka.gejak@linux.dev, hansg@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 3/5] staging: rtl8723bs: fix out-of-bounds read in
 portctrl()
Message-ID: <aeEP9qSuokAzDa5r@stanley.mountain>
References: <20260415185501.440492-1-delenetchior1@gmail.com>
 <20260415185501.440492-4-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415185501.440492-4-delenetchior1@gmail.com>

On Wed, Apr 15, 2026 at 07:54:59PM +0100, Delene Tchio Romuald wrote:
> In portctrl(), when 802.1X port control is enabled and a non-EAPOL
> frame is received, the ether_type is read from the LLC header
> without verifying that the frame actually contains enough bytes to
> hold the MAC header, IV and the LLC header plus two bytes of
> ether_type. For sufficiently short frames, the memcpy() that loads
> be_tmp reads past the end of the receive buffer.
> 
> An attacker within WiFi radio range can exploit this by sending a
> crafted short frame. No authentication is required.
> 
> Validate the frame length before dereferencing the LLC header; drop
> the frame if it is too short.
> 
> Found by reviewing length validation in the receive path.
> Not tested on hardware.
> 
> Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
> ---
> v4: add Fixes: tag and Cc: stable (Dan Carpenter); carry Luka Gejak's
>     Reviewed-by.
> v3: rebased on staging-next; sent as numbered series with proper
>     Cc from get_maintainer.pl.
> v2: rebased on staging-next (v1 was based on v7.0-rc6 and did not
>     apply).
> 
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 28 +++++++++++++++--------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 00b69571bbb83..c0a1c2ab710ee 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -539,17 +539,25 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
>  
>  			prtnframe = precv_frame;
>  
> -			/* get ether_type */
> -			ptr = ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADER_LENGTH;
> -			memcpy(&be_tmp, ptr, 2);
> -			ether_type = ntohs(be_tmp);
> -
> -			if (ether_type == eapol_type)
> -				prtnframe = precv_frame;
> -			else {
> -				/* free this frame */
> -				rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
> +			/* Ensure frame has LLC header and ether_type */
> +			if (pfhdr->len < pattrib->hdrlen +
> +			    pattrib->iv_len + LLC_HEADER_LENGTH + 2) {
> +				rtw_free_recvframe(precv_frame,
> +						   &adapter->recvpriv.free_recv_queue);
>  				prtnframe = NULL;

I feel like it's sort of weird to write this as a pfhdr->len < condition.
I feel like the untrusted part of the condition is the pattrib->hdrlen
stuff and normally you would put the untrusted parts on the left.  I
kind of see what you're saying that the packet is too small, but to me
I see it as the hdrlen is too big...  But, also since you found the bug
then you get to choose the style on this, so do which ever way you feel
is best.

It would be better if instead of setting "prtnframe = NULL;" here,
you just did "return NULL;" instead.  You've followed the pattern of
the existing code, but the rule is that if the function has a 100 lines
of bad style code, you should add 1 line of good style even if it's
inconsistent.

It makes the code slightly better and it makes the diff a lot smaller
and clearer.

regards,
dan carpenter

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508df..9cedca1bd83a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -531,6 +531,13 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 			/* only accept EAPOL frame */
 
 			prtnframe = precv_frame;
+			/* Ensure frame has LLC header and ether_type */
+			if (pfhdr->len < pattrib->hdrlen +
+			    pattrib->iv_len + LLC_HEADER_LENGTH + 2) {
+				rtw_free_recvframe(precv_frame,
+						   &adapter->recvpriv.free_recv_queue);
+				return NULL;
+			}
 
 			/* get ether_type */
 			ptr = ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADER_LENGTH;

