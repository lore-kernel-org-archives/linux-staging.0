Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B1410D19
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801434; cv=none; b=L5N8Vmq6ZdGdSL4WRIur+/pwnlAAC86/5jdvEF+2i+lwp3MEhiOxHMfBXiskU4jkonM94H/1XRxPRGwJeCkzpvVdlw7sunml39GGP8rwpxKynxe+4dmcIkY3wxBMXyFsUHXA8Ilo3kodAENkJ+Orhg++FrIqq3gjxSptWVdFPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801434; c=relaxed/simple;
	bh=yItB58k8BFtqh2Q5pQjupFSfMUetmTfeicNvjsKB1j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgPjo0+Ksoz9IK3zCSsQ04HG4BBxhdlFnxWq3ViBWCpr9JJk3QH+462AiV1Lqr/0x7kdYOip2VmZJH5lz00EPVMNkfc8impw7Hm+Q+WjVbp98SIj7IOhWx258v8qrySfjizVAqXRNanxrpvQLCVdzuOGxY2JhajODJHWlZgA2l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4SWF8s/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4SWF8s/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-472326ca506so316812f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784801431; x=1785406231; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jpc/Xl7lBNJNdoEZz5gUFmHlWajy28tsF9ky0//+6w0=;
        b=n4SWF8s/mWti3p+QrFZxjD7YELtc4am1ijQ+p+7NmjbTlYi71Y48MoWhjsUZiJrUUg
         sb33fzace+tYsVswU4/1jvR0XRHNp8LggM3I4cMtd8v5JRCPnI7lYVzSoO0OJtcjWayx
         ZqYug22YHj/dXcjBilQ6r1JNJQeyUbtS/DpyboUpAUM4NkGCsNZx8LGAzXKGXFfFyvqr
         HVmg9RGYdzgdyBhdrXZuFOZHgWGLKoudhbnkTUaNOukud17f6bA75e4h0TilbLPy3BFk
         YFQYvwlu8H5C1STjE82Gq3+A6zjd8R16qPvZm9jAZxYyi7wuIa4cfEzwzMgMyI0HySbA
         ASOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801431; x=1785406231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpc/Xl7lBNJNdoEZz5gUFmHlWajy28tsF9ky0//+6w0=;
        b=BLAIAxEmeF2JaeiLrWzyWE/180dGQNMTrtKJJ3VGr3/9P0FrfEVRiuwu0kQErzcCUF
         yQqU/smK9uWi1f0oXm+drLKG/kzm4WLjXyZPfW6PTexdzdsKXVpDUz5/tzjPvoEdsuFt
         exkQuPGjfjVOAf+PuzFINBFaFj9+wkHu/eHOLbVNV2WehJc6HTS/4BggWQua7M8WfYWY
         mAMzqVAt9inhRDcPu4tf1UMFb6odEg080qr6Ae/dMB1W4gPGgl0O7/J7NPXGN5eMJ1nM
         E0cBE2HXPTfTWhz0ATFnnbNvZwAld31QkSfpga7b8GdU21fDYYIk7Y6O8RDj/bZc2r2W
         4McA==
X-Forwarded-Encrypted: i=1; AHgh+RrQIAxvxMgscc9+og6VehcD3UzwXl96XVlLR0oZbhnC6Q8jAhdxwfG1rjnVUBDlcXRXcvnqwU3lbw96h59l@lists.linux.dev
X-Gm-Message-State: AOJu0YzK29AqhwI7dQIWU5kCo7QNWjsM4nf/gU6v5Jhl+VXtd62zCjpp
	F6zkP2U9TognGjtu+q/Zu0aRu77gITCrBlTi9F+/TkouGFMi79Lme7ko
X-Gm-Gg: AR+sD12tNmX71Hal6wEu0ED8O+ymCOq+A5XcVOwbSp9Mf1zY3otTi6ZVPkpi8FqIwCk
	bONMA9uFSsyXIve9c1c80ozqy0vobARdcoN0r+7QI6rv8STyzyVtoDkUFAwe1WwZM5zGt6mSzy9
	bo6rG5zWVdF7ydY3aKezA7WWqo1Xr4AR8rAdA10Lf9G5eQJADFSop2Ej9b3zr9BuZD7IA7MfWJm
	w4K9pPLzRJOax+dvY6loJQC6ViocJS8kEPgkMBjMMkCa3RwC49q2OA1hqk1YwBD4jRbG0MyM7X9
	79mntr3w/LEPB5RAuIlRMjUFNWncGB02ZPmbLRmq29KIQCIeIlg9nu0cpHGogso71Vi7ulxpi9g
	IaVX3WMZ1cSmKz2wme/eVrjIwkAmXxWoWJca8OM0RvcLhKM5mkJF/AbaUzx1mI4lEDvAG8+YcUw
	==
X-Received: by 2002:a05:6000:2302:b0:476:8a:5 with SMTP id ffacd0b85a97d-47f8d755530mr2890703f8f.34.1784801430971;
        Thu, 23 Jul 2026 03:10:30 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm13544887f8f.5.2026.07.23.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:10:30 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:29:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: ColtenOuO <jun930436@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Jennifer Guo <guojy.bj@gmail.com>, Minu Jin <s9430939@naver.com>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary else after
 break/return
Message-ID: <amHQ9nTvkU6cAg_N@stanley.mountain>
References: <20260721160236.80963-1-jun930436@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721160236.80963-1-jun930436@gmail.com>

On Tue, Jul 21, 2026 at 04:02:32PM +0000, ColtenOuO wrote:
> checkpatch.pl flags an else clause following a branch that already
> returns, in enqueue_reorder_recvframe(). Restructure the if/else-if/else
> chain into sequential checks to remove the redundant else, with no
> change in behavior.
> 
> Signed-off-by: ColtenOuO <jun930436@gmail.com>

That's not the name you use to sign legal documents.

But really, the original code is fine, just ignore tools when they are
wrong.

regards,
dan carpenter

