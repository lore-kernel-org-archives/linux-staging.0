Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E227A12F
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779613324; cv=none; b=UHGfRX5mGg82Xr7HtcxavJTEz3X2yFXcqR1VHF02Qx37of7rlnGTe/Rgt21RpCm7cpuLBFPudWuSx3fMxhjRP2Hguo0dNhlzIB19qhvn7AmSlyo9RQ6wLEjcightzGfiJWMS2/clwsezNkmEOUFzmgTuA+g3nkKKcdUmOf11B0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779613324; c=relaxed/simple;
	bh=XpmqTSKn4SE7H4aiwk5ge9wIcy9v5B/qodQ9lQ/Bdy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdWb3cxQUCPFBdnlFn+/px9h2+hxrmz30to4ilULL0Ljz0wfl/SY/FG6WknV9CyZhtBA23KCjsjz+XGtjZgJFfYMmdjNQde9aovEfb75ofEnfbCqIH9C5G79aavzaPhtI6AOYPACiz99EqYPmmVfrzkg6oOHoe7OiffN5bKuJu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wmq3id+u; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wmq3id+u"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-444826c16ffso7551812f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779613321; x=1780218121; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=79VYtp3xlOTLAZB8oXTGrHDe77f4X17yzGPXltP1tik=;
        b=Wmq3id+u1It3raOPhvFOwiqVcSNfnqV0vWOH6HBrBcS5ZtY6GVPoc79ZE6OdsARGBe
         vXQWqZwhOU8b93aby+QIsgsphhXC+XQvCEIEYHqzr3XkIGp7QIuoinQtTN4PCpldzQ0V
         v59KnN40azUQD0wVlR+Z8uH9yjzAgGWJ954Gqwrk3cw+7YDMfuttRUeupK15Szf/Cii0
         Tih1Hltk/zm8owbAcIRGcuhdec0m7Tm7mtId7ZTL3FOMIh3riXKEkLEH+83emXL9HwPO
         ZWD7c5yhlFLcyd0K4V+b2JTtN2BKDlsKqAR+ebDavP+tJuqXwE1cM52+lsR4GNBTzT52
         mCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779613321; x=1780218121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79VYtp3xlOTLAZB8oXTGrHDe77f4X17yzGPXltP1tik=;
        b=S8ItO67l2PqT3SFAUAySRF2yp/VcgRyPi36qUeuYiCcebMtZ4cAV2kZwAbAjtsHWtL
         sd0XlXXdVILNE82eHQYvMWH7uv6jsJqI78gjFuK7A7y0YvKcpDHh2QYKs8SyX36tRZYu
         cGP6t+2NobBZ6AxbYjsO01p81mbjy6SdiNWXR8L8nDCU0H39OyIpy+DUx3ot/p81pu1z
         PVFi/p3+tbHzyWPoeEs6n1bNBA3j+mtqqOFyAfFE3qhRt66oklBjQwdn1wDy8U6615tl
         yrcpFPPvipvCL+Tw6InuR+obcqKGIdCiyIgjZnXZ866C8vvaIXEI9qyQWmCdmyRR4w9j
         xGtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8e6jI12mHJo2pmZDnWCF1REXEchUZQIHGgN+5UAhFWuuR0SupiAT4CthpK6agGcckFf9ttOFbmHygVq7Xb@lists.linux.dev
X-Gm-Message-State: AOJu0YxEqGBCvj/rC+LqgZY2/5WCzaQhu9gBbfNIrK5t37GJreZMIE0Z
	L7q/aDUVP5/AF5z4Sztpzts2+SHC7P4uIQke5d5O3KtiY9ASMHnkQBA+OVaG0A==
X-Gm-Gg: Acq92OHJUbv/a5wXapavyFwrsCX55gD5J+7xs703/sPVWrwiaj2yw8KG7jmWRbBEsDb
	B2YgYqMr22mFFZcvtnfJQRSbLQhewCNdaHMnARtGnKlDz2uyM0MQ6qmxAL3CsyXx76ptYpJMunw
	JqJnJ+JYX9O6+n35wxUhpBhXyqS17XzvEH22DeJu26Rgjn452SlLYjNi5NYvK/MYmL066P10Sdg
	Xgm4AFbxYMeheH89XwCwpffObq1Uth5noETJI1FQxVhUiV9YMGEfkZFNP83OFpb5jUBBFWT8Rn9
	o9O+fsTxgZRw9YxYvygKfwEzEtNWfCFDoidEV4H1TP9Jt1ERWzoIHS+birLdb5SMyFH7x4KMz4S
	iZI1EBsF2FC5eTKHgII37RV5aXrMFNf2i/XsaVBSadOz1zZXNt6AeQUQnpevT8U0mwDGbEVuTWm
	zOuSFqnRc9x9Cynf7TJC7Kk44=
X-Received: by 2002:a5d:5f92:0:b0:446:189c:ac4e with SMTP id ffacd0b85a97d-45eb38c36f3mr17598181f8f.34.1779613320890;
        Sun, 24 May 2026 02:02:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb9asm19631236f8f.27.2026.05.24.02.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 02:01:59 -0700 (PDT)
Date: Sun, 24 May 2026 12:01:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: artur.ugnivenko@gmx.de
Cc: gregkh@linuxfoundation.org, ahmet@sezginduran.net,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v7 3/3] staging: rtl8723bs: fix lines ending in
 parentheses in hal/sdio_halinit.c
Message-ID: <ahK-hNFBJSp2NOhz@stanley.mountain>
References: <20260522132001.4771-1-artur.ugnivenko@gmx.de>
 <20260522142700.23335-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522142700.23335-1-artur.ugnivenko@gmx.de>

On Fri, May 22, 2026 at 04:27:00PM +0200, artur.ugnivenko@gmx.de wrote:
> From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> 
> Fix checkpatch warnings on lines that end in patentheses in
> hal/sdio_halinit.c.
> 
> In _InitNormalChipRegPriority specifically pack all of the
> queues into a struct, to pass that as one argument instead of
> six individual values, so that those lines can be shortened and
> not end in parentheses.
> 
> Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
> ---

This is a grab bag of changes.
The new code is CamelCase.
I'm not sure it's really nicer than the old code.

regards,
dan carpenter

