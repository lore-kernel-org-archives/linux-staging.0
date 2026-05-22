Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBBA405840
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 16:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779468823; cv=none; b=SKRxxvdYQO+CjBmpRrEbMX0qAm3JyfNvG09yy9r0xQuOfTvvTwq12KJhOGMXYQD61z4pcB8S9yJmFXUhXzk5RflXAg7oVDmm6nIsbpA/T6J+Finnhkw9qq8J5epYaB/1ygHscEXa9tJfBEo8mndlZN3WXwr4Q6T1pMBBygGeZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779468823; c=relaxed/simple;
	bh=VWJ9Idadm4+jshuuUwRXM1Kg/HW/bmekNdMMFzCiI9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3REY3PzoLaz8K0EUT0qKcnmSrF+NCyBAnd/EqtH1hpDZpDBjQKheXSbEfnsttG9CXFM6u3ffo4xORKIO3g2bN+iJ1SgDIEFgRj+4Yp1o9E4E69fM6DyZKPql7ljgEif0/9PBKs2ysVEnhc16/WWXghnq08q9uq8DKSJg0xZU3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dt3rWbc1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dt3rWbc1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso57322625e9.1
        for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 09:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779468810; x=1780073610; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq+P3P3mi/H9G5spkcSx54yFdnNmNWNrYL54/tktC0Y=;
        b=dt3rWbc1KA1522EzBPQP/1allv6igGRQHuHI2/VgD30/N3PgILZFiUrwEBEAgFpLYL
         oowhEn0mJ2lJB7awJ3Z13+h5goKL4a8WpzLKjoSLlGnNFHL0J1PusVIU7fztk6Ilg6T3
         s+ggIrmbZ/4+bWq/qP6M92sXQatdojEuVkHMLLsTC47RDR8dMNFFd25KlryLjlh3hch5
         mXT6IJGVcBPtyTVGVs0ncdB36WL8v3znLPBzLc6w/4ph6Xq72uklYghUHVuvNvO8RdHo
         IcvwZFcRHyE+M8ZoHTTq8gR2Z3xrHAR5SoXji14AqPMoaVT3+EOP30qLMp9umWF1qJOu
         aMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779468810; x=1780073610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vq+P3P3mi/H9G5spkcSx54yFdnNmNWNrYL54/tktC0Y=;
        b=f+D3OTrmepPG38CvGA6oufjapa3iHdT6uaMdu/GH/LtxW9YFmcl5Kft2J4S9s6drml
         RAcYjLg76OYED3S7c3//Q9BLzJEhob4VRUr3XRp+HrgPAYJbXuQ5ZZajz+T75rES9mbi
         zYja/h7Tt5BsAb0OSVAU5i2QyWRhezNE2+diso+ci17B1gUKf0QAtyJor3kvyWwlWimU
         8jQUE0rzoJLWQjT9GDJJi0GsUqoU6S6b0Rf4dkAwadJz4oLKBaPcD5u7oA/LlVysEtjv
         al6K75/QvI9AycPukeKEobVD8JwfnYjZPNUOUPhBwKgBwGWjkUTTf7PcVQlmAsI8AvOw
         NGgg==
X-Forwarded-Encrypted: i=1; AFNElJ9pjR1daJH+CdIMh36gOjGamV/wc+YNIq0uNsScRU8ijIMQEBBmSntMqLSoWCq52g8YTZMYU6qqu/1ca1vv@lists.linux.dev
X-Gm-Message-State: AOJu0YwFQiOq9DCmiTUjh6eVn/mW6q6qNxzA2FqIUiZZ+C6YLWJ6tHqK
	Nyk1TnBu9CX4Kawe41AtEKL1xtC+9jPZ4l7+1aZy2CscZZaUbpQzMTwh
X-Gm-Gg: Acq92OERAFsIrOk/goDSYDkhxzIUO66w83Xp6hUTgZKP0v2CFHOGeMcZNC/5wxj58/E
	x0FINNlojJMZLWgwto/bDJHKVcQi58manpoqMdmp4swzyd9wE2vSB0fyqRRR6tKAk674SJy6GF2
	kIpCzlIuBm7/qkpvsRMV6+3Bj66rPeP/jwMo1fDGcHaMAOgEsogIJRI5gXQk39BKg/xPYft1dgC
	Oj/xG/GqZbR5icR5LN5Zx6tdFCd7kJ+7iU3XkxN0VDrXgjcW2QfzRT59R2rlOG4TXNeFF4W0RCO
	/dJ1hNAGmQmRf+CZ4LibLxzTlsv/mjLtjVN8F0RiJePQ2L1seQK9pSu8ggxodj3Pn2zqPGyAoCD
	1vjRv1518Vqwfxlt1aovnRbVAhVdUIAdCCCsTzNcDGAHs4kGKAUlUAq+WthFnyk/ih0cmTs77fL
	DS1Z1+gWohlhDxMJm24l+inLBQunaeMrJ9AA==
X-Received: by 2002:a05:600c:3112:b0:490:40ee:d561 with SMTP id 5b1f17b1804b1-49042487e14mr62180405e9.7.1779468810200;
        Fri, 22 May 2026 09:53:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454db285sm46997875e9.5.2026.05.22.09.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:53:29 -0700 (PDT)
Date: Fri, 22 May 2026 19:53:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] staging: cleanup of sdio_intf.c
Message-ID: <ahCKBve6EirfIW1s@stanley.mountain>
References: <20260522114317.189368-4-manuelebner@mailbox.org>
 <ahBT3r8ob5Zbq_Fc@stanley.mountain>
 <9eafd3db22791e0bdba31c866a802a31e6f1a012.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eafd3db22791e0bdba31c866a802a31e6f1a012.camel@mailbox.org>

On Fri, May 22, 2026 at 05:33:53PM +0200, Manuel Ebner wrote:
> On Fri, 2026-05-22 at 16:02 +0300, Dan Carpenter wrote:
> > On Fri, May 22, 2026 at 01:43:20PM +0200, Manuel Ebner wrote:
> > > did i overdo the split up?
> > > 
> > 
> > The split is fine.  The subsystem prefix needs to be improved.
> 
> Is it wireless? If it isn't how can I find the subsystems for my patches.
> 

git log --oneline drivers/staging/rtl8723bs/os_dep/sdio_intf.c

Use what everyone else uses:
Subject: staging: rtl8723bs: cleanup of sdio_intf.c

regards,
dan carpenter

