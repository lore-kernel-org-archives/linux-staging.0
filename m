Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AEA32A3E5
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776524118; cv=none; b=bZi0waXVjTReT1lbuG22Rrr43oQWbLPZaWq8PQosxRw/g+aeAhVHOLwyTpFTPLyDnRBJVsk6wanyhUMiVKLXPO9zlrHIS0AQ7mFvETn09Kcyip7cXZaRlygwIO88KscGzrU/ti60XvB7roV8ldCZURdiSnBSmCArV6R1IqNd8WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776524118; c=relaxed/simple;
	bh=bwy8dcso4GjqW+vH/gHLOAFMKDProsWggCfpiZwSK90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8qp8agpS5jbh2MNTPKhrxEB0XgacaqRqEpVI6NH4k//Mdc5zsLIT5k5ynVoTUcue2JJdE+Xhu4AVzC/KiTJhoYhDVskE3s3A+alBXPzG5IPX8o1zF46z+ZGUBNdZrf05/SU0tTulMmc63nJVxHb951BU6tb4cGbKajxALD0fvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6nuqvFw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6nuqvFw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so10428275e9.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776524116; x=1777128916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ohVPZ4YjTwemU1YLhcK998ayf74B+HEeQBs83FoZEM8=;
        b=Y6nuqvFwVVedWA3Bf+GiCYvYfkLv59o4y1dtOq1RP/cK7W4R/pm8+alWSNJfU6GeS1
         1KQuyzFmIhmHy6jQfOmEPxzOR2fgkaJvZuPNIoiJta4m59fp9vmYyKfyPet703DZbQHv
         eCtpCjKfjtBHmEGNEZ/yaR1jKb9qpYSiwTuSwWWWljy1VT3zq4JjOFxdbAWsWwybLe5z
         vceKe/vv+di1F8EnZPS5TQiPLqFXRuFMhWpTxNAWBSpNW91rSR/d4pwa2S9KtqOXN4qS
         nSqaQbhxSl1Yq9zd1IInCGTUnU4IggahxeW4NLTLnLFPyuavjkauNy69TdvqOMP/NAeB
         idKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776524116; x=1777128916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohVPZ4YjTwemU1YLhcK998ayf74B+HEeQBs83FoZEM8=;
        b=LFBdDXgbXx6KjfbFqfYERvVeLEx4wBQdqJAYt9VdmNxltZCFAx+NMi1OS7wXHm9fSc
         +uieC4/oOFvyuTB7pfUEQb/n04sqZ3A00IFRd3tbPOBaUFV2egihrv/6QQQk/9KZvQNB
         3rYD3yRCChFj4ofr6kdyFbGMrOJZ5T1Wn0C2ZmFwj5N6T2W8rCgAjuT49MFBdXZNZYzA
         i+7RQKp8z+1mvRuUBJsr0sXr6JXQvDrXTigWfgroC8PVU0CGpNRyb2b3MLOpvMGkMoqV
         wV41s1t8UCCozMOpk8iZ9lxBaO2LS97yZHgiER+6X4mbxSMsNwL7nCgMGIL5HNO3CJQy
         g45Q==
X-Forwarded-Encrypted: i=1; AFNElJ8AzqcqfZaPnKwF+PpDQ24J7IMVj94f5lfM13BWjdUH0gvPrcK1XVJBRKHCJMxx9by2sFLbquI76jmfBz2Z@lists.linux.dev
X-Gm-Message-State: AOJu0YymjZfc9dWx1GdOFDCiMuX6e9rGtsfKLtMOYL+sOHWwaIYXXO84
	AqCaHYfo7t2XzP2pVG8Yt2qXyjM0ppZjxkVXQ7UBRR5bPAAyIfltnKj+
X-Gm-Gg: AeBDietitNloE812fjw7ft3ar+q49hjub+zomRRhYE+4/R3Y0RGJlOVNJWyI4dpifha
	oJMcWFDJlhxwslVSc7MUn3VgcyshJ+9FxJBu/zECBcrGiBQaogQZjoOFKDqhbwc47BDEfFqjzQL
	9eapsEMNoj4zbnsEiCLeo7jlLpWVoZ2jD1ugdr6uDiQ2JVtX2Q0loHblKQOisR6LAF18SpR16vb
	b/XjCoj7clj8nipJEZ5Imyd4ujz4ayrhP1KUnYroa58Jfqv08YRvP3Lpm1qc9iK86JApZh+wcK7
	n7f3Bk60psOc4LZd+CP4c4ojwm+h0aUrEE1r/ojaPYuCWA5a8f9m7qWYGPpkfe9J/SAiZCnaH6B
	ihYHIuYP1D7HVkisFuW6W+w+CkhWG+8t0h9ZsHPGwh+YSWlciKLQbjMqFCzAtuSrifPQtY96kU5
	P8mJirWyKwgPrldKvHFAZwrWg0JrQchQ==
X-Received: by 2002:a05:600c:c04a:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-488fb750840mr73962705e9.11.1776524115625;
        Sat, 18 Apr 2026 07:55:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb754f15sm43693535e9.9.2026.04.18.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 07:55:14 -0700 (PDT)
Date: Sat, 18 Apr 2026 17:55:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuma Ochi <ochiyuma.ochi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] staging: rtl8723bs: Remove boolean comparisons
Message-ID: <aeObTxN4LGwjJRFx@stanley.mountain>
References: <20260418144916.361744-1-ochiyuma.ochi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418144916.361744-1-ochiyuma.ochi@gmail.com>

On Sat, Apr 18, 2026 at 10:49:16PM +0800, Yuma Ochi wrote:
> @@ -1950,8 +1950,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
>  
>  			/* indicate this recv_frame */
>  			if (!pattrib->amsdu) {
> -				if ((padapter->bDriverStopped == false) &&
> -				    (padapter->bSurpriseRemoved == false))
> +				if ((!padapter->bDriverStopped) &&
> +				    (!padapter->bSurpriseRemoved))

Originally the parentheses were not a problem, but now there are too many.
Same thing in other places as well.

>  					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
>  
>  			} else if (pattrib->amsdu == 1) {

regards,
dan carpenter

