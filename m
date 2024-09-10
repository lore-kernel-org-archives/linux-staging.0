Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7792C172773
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947814; cv=none; b=okDhvnbpzbX9cdYiYaUEtKqaWzQwosdUZ37sh0/0+QfWcJ+YCvXVpPxQSCkwjhYhbYSJq+TugMCM+CoeqijxktOLginPHQJgbMmiHfsowOuazgYZ20P2Kh0ntVLQfE0gM7FrdSO//MTdB8YE89cjgnWRP0bJ1OcTtNwT/JoRGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947814; c=relaxed/simple;
	bh=ES4IlmV1I8qJ0umpHm9D3Om6YbnfFnqjgqdFRo+/ds8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iu/0/cnwRG2PHnoEmPX8taklAEFs7x1DIPWzliSucQ2uwkRbAXPcGIrX4NRZxFiDu49t2Qbn2ii6bhq4/cbsp606v99OVaOMEB2Mp+N1/5cv663CsBXFflKbIsAomGawv15ObCaB1qQh+1HUSKLU5mARB3IaTyX43XeOH7TfYOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9qW1ezp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9qW1ezp"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c25f01879fso396651a12.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947811; x=1726552611; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kTuEPCsEvs5kLo9QXLzwPbMasTm4z0Tp5r0GXCVgC5w=;
        b=b9qW1ezpkGndKiodmDk1I0zmkSN4mvokDQ8LAgAw8UqNHj+YtCyv71g+X9N50dUaXx
         1yZB1T3/Zp1i++HN8SxTS2cGlOCHADsyJlif1o6pjVXUOaRaLCMT6um9lHXdTUzo7PUQ
         iE+15VdXmYjkscR4enbqXx7nfns2fDl7KOcB5f2hS3TkJ2JNANjui5QiSQy4VqUCUseb
         /4EG7M2+NQXAD2A6Q8KHsSmV2k/8URTEL29JUsN9hojg4mu9XqcD771OCnEqfWGSvSDD
         WmtrHJvNoRUflIZaeYhO8VWfo2DCikh+iDfQyt3szF55pVpqDVkeosh3yp/O/hJbiEAc
         IVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947811; x=1726552611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTuEPCsEvs5kLo9QXLzwPbMasTm4z0Tp5r0GXCVgC5w=;
        b=JnFkiYzYhj3YrCZAV5QQgw4m06mFRQubaHsv1YS4Svwz/LCUtNPd++w2xQED3yuemV
         Gk1etc2j1nLpOtavQcSXQzvV5VnpN93lV4xAllDFRvpvYqxum2vxJC4sOYqH1fDmilLp
         pImha1sMj9pONmDLB1lB9wlpH9bmOjgGp034dPRsvHTK72Y3jR3CCY9S/JEA1vYS8wGx
         bctR1aq61rprKYBLIyHyxCZNsSF0aamg16bBc17S05+dMLE3jSno/LERDskG0uNpBPlV
         db0sC1p2AH7Z+THaiUXOtlBgsE4blCm+6wb/V1e6jVsDxTTXNwQG1TLkwmTpA9VxkFVD
         4epg==
X-Forwarded-Encrypted: i=1; AJvYcCWiItzsLPkUuQuBxgRhRnzK3HoTd77euf9ppukD/m2bJyj50F/XVCM9juehMbpH+aLHEdKA0J5ShmxTPvJ5@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1KPPWRkuNiUMKS5jXv8o67BHjk7oaztdbcsmI/8ZPfcI9dgSN
	git5gdczSFKLwrd3+f7gKUioQpMYLUk1H16kDDENaaUBGY8PAOrP
X-Google-Smtp-Source: AGHT+IEd1VeuG+3jd8pYxy3zXrLRd9/TYTG51IqxtY9M54Ar+hVZU8DUNEVXhmTzAFlKoegFm+dXAA==
X-Received: by 2002:a05:6402:2747:b0:5c3:c254:fcbf with SMTP id 4fb4d7f45d1cf-5c3dc785e76mr10741639a12.4.1725947810386;
        Mon, 09 Sep 2024 22:56:50 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd76efbsm3822547a12.67.2024.09.09.22.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:56:50 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:56:48 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] staging: rtl8723bs: Remove unused function
 rxmem_to_recvframe
Message-ID: <1016603607501abe08334f9577728dd3c4209572.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused function rxmem_to_recvframe and its comment.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index c93594f75436..18dd1464e0c2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -444,16 +444,6 @@ static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int s
 
 }
 
-static inline union recv_frame *rxmem_to_recvframe(u8 *rxmem)
-{
-	/* due to the design of 2048 bytes alignment of recv_frame, we can reference the union recv_frame */
-	/* from any given member of recv_frame. */
-	/*  rxmem indicates the any member/address in recv_frame */
-
-	return (union recv_frame *)(((SIZE_PTR)rxmem >> RXFRAME_ALIGN) << RXFRAME_ALIGN);
-
-}
-
 static inline signed int get_recvframe_len(union recv_frame *precvframe)
 {
 	return precvframe->u.hdr.len;
-- 
2.46.0

