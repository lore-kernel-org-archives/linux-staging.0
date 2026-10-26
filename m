Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793006909;
	b=Pej0/pJUJCfyKtsH2QRJGISwR/ew+re1j5Fde/K+C84wt73Q56MIW0z/ZlQHTtuB5ZPV
	 rOZNeyrIGS6ylp4Jceyyaz50T/W+3VFfmxbtpeiKYdzMSEdrjFlw3RE6OLR2v4jZjwOrF
	 KiZ6wuOvWbvdTgCuTAYBiCeyMUzs8GC+JwGQh0HGGSXttYHMyxYG5lLmpLu37ovz29JR4
	 EoTS5/TB76aY938P1uk6wPnwyWo16PWXc/1WSkvWJUjB/IThPajtuM94D84fLrOvPSVFk
	 R9kUZvZYm+yZYGvhkXYU1fArNyT9R+MTiWRLGJqfA5k5j+baUq8yMlPSq49Nz01pyTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F1xftn2ZvPwDxNIeM5ddTo25mlnOFwkbcYBiWLFaU5c=;
	b=Pj/iTcDUYFFe1JgB/GwERexi5oECnOsPiQ9UyBwMNhEXYk57Tm1r+Cf4yeEHkvmvhiA2
	 PgheZxRoFzm76xhPgjtTBM8pfv60zx65ER04SddrgkX7TeuQJrMF+YSLeuo0z6LOf2aaX
	 778JAHwiHDZx7ZI3b1l+fD1JHp7q4EMG3u9FuG0U7/HD375roZmW1Wp3XKQICNxNP2w/+
	 QVS3/L8e18LIY1RivObAwpn2vtj/UoPyEyv8MWESqNkFxIoJi/rZ6q+J7HA6aOOEwE0QO
	 lQ9qQTMuet7ZLW9IEQms4gE5zXkmTJ2CIbgX2t1DwgChNyQMDAY7pMeyQ0V+6Br2XSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e0wbpfcw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053DF606A31A
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 053DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e0wbpfcw
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843ea301d60so2065995a34.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 02:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793006908; cv=none;
        d=google.com; s=arc-20260327;
        b=RSQdsYjyr+TXucM826HoO2cRNYoXtFgIbLqYThurwIueKguQYahP3l17rfZt6emPoH
         M7/mNTJozSyeOwKxfLGwdhDAEWAtPZl2apH1ydV3hAvYZQ0RgjDmRuL5kyZ3t92RHedl
         hBVqlfNzrtB5NijrOGdsiWmpo8edNPEIrxIS0y+pq8r2SYfQCrTBQjJqe9oucsFyrRXu
         1hhaAAnFAsx9aJCNc6bNAX47gOJnBiV/1JyULowH42ByEt085bomvi9nU0eJqf/bI3ha
         geypIYt7+79/u4j7xoXwaOEVePTPT/CO0R5hk7wGzf152l5hUq7WrZDi3wV9P3/QMiV/
         +UXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F1xftn2ZvPwDxNIeM5ddTo25mlnOFwkbcYBiWLFaU5c=;
        fh=acFpVLqpiEksDu18NgabhfU0Es1pxLglJrH8UrpCtpU=;
        b=RzgLXYHTQVrrgcdJjKNpZSzr/qyNCWifNhdza9n9bZDvuGDsP3z2qgrGmvi9tpFM1y
         MZAgwoZcszdX5/OQInxmEw+4yop4C+ml4nWL1l4Rx6gAEl/Lxw8GmHj4lYKqZRzegVi1
         Q4QzW+FrS0QBrmkanz0tD1Joqe/n3Fq0gWDmagLbq26g1tTgr1Xx4XZRC5mDIkqfDH3B
         LXFiWqurt1auEPOF7gDZdzbVW/FOOTWENAkmMdnIfNmBi6EQ+8eSfXdmUf4ZsK7Yrfdx
         qZvA8iYCXMHdtmuDAEMm8mkfKSNGNBpT83KWcEgAxhjVLTeopQzLVvzp8pJLj6HopVtR
         5HaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006908; x=1793611708; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F1xftn2ZvPwDxNIeM5ddTo25mlnOFwkbcYBiWLFaU5c=;
        b=e0wbpfcwBAflywLGVPk3Hc4ZaU/sSP36e6uojTKg+JuAhYDouOZmHhBsPqK5iR07qo
         73kplhI8kxXkU87A37Yp5MmMUwLbRMCL3duM98MndoZG/HfWkEOpswP3C76wR5BGEG7g
         SSmqjs/Dr4pOfr4C6QEorHB5vAikZtZ0xGQFSG8ng/U/X+Ys9IehWf+m6t9S01Zo17gR
         tHvwb55zxOJIcwALXp5XADHraMzmhQOvN9O/OMPMWiYr1L6dKiZCVIZz1ZPsPXa9Uwgr
         yOeNxiMWZj4V0WJQYKlSx2pTmRLo9MVJEeBXjrjpC1WTpDaOKMkVQ5zlRF/NMIASR+/b
         NfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006908; x=1793611708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1xftn2ZvPwDxNIeM5ddTo25mlnOFwkbcYBiWLFaU5c=;
        b=hVl+3B7KrDGiRaM4mjV2vXCLu9NFkUMcFx4LOSS+u+CvsX1NP1oWd+SSYxAUTqg8dr
         QWbFRnYNdXODn2p/fapobZZXtzM2PKhExbrecJQyWNYfU/0+PLB04rizXNR+htEUBS0f
         BZr8u+79L9tZ7gMSl7JYAmgqON3LReSZ+jpHxAobXNW1dT+044LRtLLL+Gmi6ABg4neh
         b5mgg1QHwalsP42yinwgKVTFJmmj35w1FlXz5EyS+gthYY23/UcpfbFPv0WEBb5i7Ly6
         TpY9XmbpVahD30m6LGHP1GMRYtrr3KtSlRbdO2MTGngJj38++hZMdIP3gJFUUQnY2Ndz
         jOfg==
X-Forwarded-Encrypted: i=1; AKwUvByIqNIvdxeIZCaJtNWckTrukrZ3fGWEh/hKgR58PLAwAe2sDwTXiAtvDAFhWksNd1dRefpbB+iAsrFMPFuF@lists.linux.dev
X-Gm-Message-State: AFq9FYLxJhrqm4nQ3uli4zT8nNvVszsVamqJM6CC3CXtkFithnJc9TBA
	vDC8q+iWBjA/x+dGp6GvYkFWHMKnRyZ8+BVcLMwCKCvTS8oJb7hdnpVfDbbDLENd6BBbPqn+EmC
	wEB1UMVO0nHtVkwk9W2kM2z1NYTskRmk=
X-Gm-Gg: AYBFou2P78aCtGX+P5HBv3OzT/xI5hvaQrutHjKjQB0cSMrXYNCOtaIqaNo95RyGEbs
	9Bqa+pr/efNXcfjg89/ulSBxqhVeruzB7SssquPpPwBK4TZrVTidbmq0a9Nvh75KIFoL+hds2RA
	UPjkcfpcC6+Sqgk6wQs6F0qAZSuRLNoSH6+0tBDMMAv119gdDF/9RFkPg67WIJhb8Hc3RPq9pmM
	Wp+C/e2SnwInGCowU4PeoCF1sFhPlOuG7clOX1hdBrAJnR0IQSqunP0G36gXvsxcd+mg7OYVbzT
	laSAyx/ONUTU6Qbm2IgNtSJ7tY3GcFP0zhV8XHlfyA/Wsny0aipjG0/+3++XOxGOV05Xa+fwWB9
	XBiWiEOVEmtOoVnOKs0u/yB3UJcVV9AAQLJ4fg9vwYXJO+hKruSQ69KxEoB4tBHR3tQH0Nv4=
X-Received: by 2002:a05:6820:a502:10b0:6f5:467a:aedb with SMTP id
 006d021491bc7-70ba0b235acmr2055206eaf.6.1793006908009; Mon, 26 Oct 2026
 02:28:28 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026044523.18516-1-himanshu.bakshi478@gmail.com> <at8bT7NCQb9XvGoS@ashevche-desk.local>
In-Reply-To: <at8bT7NCQb9XvGoS@ashevche-desk.local>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 14:58:15 +0530
X-Gm-Features: AclHuK-u4NA6gcabskiGpw2QnFryhGCL2JKlsnkWAJ3_x92psReB-EPZC8UQQiw
Message-ID: <CAGLmz9LqD50zU-BGhaVQagJWTtGiEZ3ucDxbSVSbnd5_=6Y_dw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Where is the changelog?
> Why do you think this patch is anyhow useful (based on the previous discu=
ssion
> and your observations)?

Based on the discussion with Dan Carpenter (error27@gmail.com)
It was decided that since this macro is not being used throughout
the whole kernel, the macro itself be deleted since it has the
replacement being used.
