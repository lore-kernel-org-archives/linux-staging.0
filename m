Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063342BF3D7
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 19:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787511947; cv=none; b=OWp3ya94dnrLycXJdNtlWMZJxISW91ZsMMzvbFaACduj5VEaS1JAbk32z5LNjpngcX3YJl3LAcow1SpovJ8dNS7MyIPpv4TnB3JpEj074/YmPhCX0O5rmclXP+JXbg0P/LMvbRpFH8SOab9JI248o5dKSbpgDSTFx9cJdIdebnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787511947; c=relaxed/simple;
	bh=+QrO1yTq6M/3l0jSXUVbZG2yw7hxXe1Tc9a2lX5ADOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZT0esCZNQ+g/6ToLOLZOiteJ9DjtKxNqmBhqgNpp1MvlIeLBVJWzzEaUKEqJylbdgFCb6ooVk7aeZp+JyxaBMgtzVz1D96KBG6o8uRt1QKnocNdnxGh8NTLnxf3deVS9+C+i047hOqBEFLQJ0spcfXjMwInbXRbTBFicgkftWtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUFnyPoC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUFnyPoC"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b0eefa61so15490985e9.2
        for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 12:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787511944; x=1788116744; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mFZza9DmfhW1Mx4Qai7yS3KlvIbSuLRI8oUyC2mmiZc=;
        b=NUFnyPoCfzokRGWFyWxoL1nVCqzXbH/lgT3plEosucn4dglUsfdaMx4W82td1wF2OJ
         q65CMU96t85X2lC2cmPRGbZ2Xu18mV/uT2yV2Pltuw8oLKHtxPMtqyBVtWo+WNIuI48J
         E0QuE42Inco21y/1pFgnd+IDbPJOHyZN7smDRq88bGIedWJE+c1cBQ+lWr+2umAAtlbc
         34ejcrKPPqH0NfTQwyPPr1eYfAKNG0PU2D4cRGt5jUML0dkbiM+wSSmy3TE2q/KDz93M
         /dQRlbdC3RyHkNM2IlevE61YeF9TFrJTOGJhKeuTB0skUu4mc04ZgYW9KZMTN5m9wS1B
         WUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787511944; x=1788116744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFZza9DmfhW1Mx4Qai7yS3KlvIbSuLRI8oUyC2mmiZc=;
        b=rP/L4cD7cE/RZ/k03V8NlF0xTGOvidNIjzKU8RNONPYxaK6UemiBJI9kjdVq4FmJ/u
         CSqHRr84Zu0IgCdkvy/CaOziJvNUyNHvQ8s7qRb5wpmnsXVFASDox2hWYz9tN/ADDHWy
         u3rTfEmsyEDpomxMKB6eRlEpbMUMU28A7xQPoUDnoIgcsQLegtHC1os++BY6d93+Ivlz
         0+JkrhUP3USj1wbswhPSWuds6NFS3tPXa+qkotPykdxWOGyXIo1rtxgLsrzr9Epouwzp
         RNaqkqfp9XimAXDV3zwLNtWB+8JJFxHfQ8eAwJMsfSpqNuLlpvcdedKvcBDpSeuDZejd
         ThqA==
X-Forwarded-Encrypted: i=1; AHgh+RrnqlxBE9TN0Nr1SRxI88bNF4AfuhXdGKzsxi0g/UKKl8awdw3oxU/zi+dl9LggCy10UvflNWTAuadQ0v13@lists.linux.dev
X-Gm-Message-State: AFuF++mcZfNSXeNx6rlx8rq5GGbxZY7ocbAFVd262AcWlY4vU66CMti3
	X4ZIxTqvUCy9+A1Mz/Whc/UZutxaKEFwqmCdRrxyaJdM1EcDM7fa6yNg+3DW8p6AxD0rFJwj
X-Gm-Gg: AR+sD12sAlFWxLjQwQaOwtCXM4tKUJE9IshjWfugg+tVJOXXWgX2MgMpvMw7m7oIwqH
	j21B0FygOz5Cy/UNjYMakKG8HJQSFTBqgvsVZx2wSXHCNMQ8PiSxgWvCaE19+clyWK9QDVv6N2B
	sC/uOOLGmgTirpxh5u/wC1SeHifF5TOBSRdhnX/lzvV0/7Oacl8FmiL/84UOGY46J5p5IL/dhKz
	zRYX7XF7VRG7NSO9nm+XvytiesWPyOGaYL7Lec03ncgcGd+Z3hM9PJSRUN+BpVHYUXEuV3U3ns9
	MLkBT3xfMYcWrdnM89RaL8Jz1l490r7FDAWImE+JRsHE5Wmhg8SAyS8phS4bQpFPQJu1u+yESbC
	cpLG5HOVKLhCu0Cyt1QsKS1FLSxmT3+JTORju++xZO45QhHgDfvGbs9gzGXeUw1wI3YjC/x8hzB
	PMEIQPD9TmS/AP7wuRfMWDF3mt7XZhFlI979C2kLGjW9FAWv2/fzC8F6ADL5nxQuQpGrw=
X-Received: by 2002:a05:600c:46d1:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-499c19dcc4fmr139937275e9.15.1787511944289;
        Sun, 23 Aug 2026 12:05:44 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c3566e1dsm57902215e9.7.2026.08.23.12.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:05:43 -0700 (PDT)
Date: Sun, 23 Aug 2026 22:05:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix space before tab in rtw_io.h
 comment
Message-ID: <aotEhLIrCB6TtPX7@stanley.mountain>
References: <20260823-rtw-io-space-before-tab-fix-v1-1-e9113e602793.ref@yahoo.pl>
 <20260823-rtw-io-space-before-tab-fix-v1-1-e9113e602793@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823-rtw-io-space-before-tab-fix-v1-1-e9113e602793@yahoo.pl>

On Sun, Aug 23, 2026 at 06:07:50PM +0200, Tomasz Unger wrote:
> Remove a stray space before a tab in a comment.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Verified with checkpatch.pl - no new warnings introduced by this change.
> ---
>  drivers/staging/rtl8723bs/include/rtw_io.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
> index 3c99a2bc19bd..57628e4b42c0 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_io.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_io.h
> @@ -24,7 +24,7 @@ struct _io_ops {
>  
>  struct	intf_hdl {
>  	struct adapter *padapter;
> -	struct dvobj_priv *pintf_dev;/* 	pointer to &(padapter->dvobjpriv); */
> +	struct dvobj_priv *pintf_dev;/* pointer to &(padapter->dvobjpriv); */

There should be a space before the /*.  Also the parens in the comment
are unnecessary.

	struct dvobj_priv *pintf_dev; /* pointer to &padapter->dvobjpriv */

regards,
dan carpenter

