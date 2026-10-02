Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBA547F760
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932718; cv=none; b=LzmLgr1g2sNGUtAkONhKtnlJTj2DSeDq0Y8uSWG1Rd/Znip9Pp4m5KOBefHvdG/X1RYahcydSRQwoZDzyUbPUnYsH6/RMrzbRU+5EWpG7addg7ci1rBAgyXEkESzBVK5iS4vigZTsMH3QqUAlo4+GDMeWR1mDmd5en53HqtytG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932718; c=relaxed/simple;
	bh=CNsKoYuKrrSYLzKvtVyS7tgc5mI2xbQRWIdL6BhWXcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P43LIYhdbbEkDA0V+cUh/YR9sjwlBhmJzushehVYj6X2AmgLdzeSH60WB+zhlVnBfOAOwb/knnbI9Sy53xGCM9uHIZ6N8zzBgh3ChSIgWWE3lIsdQ3REei7uipJNdU++5Yh7EyiLX/QgcrBHUqBDe/QyMpOpecwJ8HKA7VP7MDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsItoE6d; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsItoE6d"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b08452cafso1367020f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932715; x=1791537515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOOIVnS9Id+XkrrN4+pJgTtAUkmfSHTNwg21WiGg0zc=;
        b=hsItoE6dyN4X+myyA54rjDBPDs4pUCl72LsXIJj1JA1Bgb3Thfb/Kp9Y65nvn3u78U
         z0ife8Fu2a3zUhYcTLBi0i+nR4wkP/IxI+5HkHkH2UR9e+ZmaJmY2+wTHiGLZP+KGEk4
         d96ctVzoy3Sf/bINWmFdUcdxmn+2vBTMmOUt7tdqgolrRZBXZf6gsUWN+wlBz80BSGhq
         sAZ2J5teOMm2IL74lZ2nYVholLS3Txo6vFow5M+3jWkvn8NDWEJUcPq3tP28lPpeBCNv
         UiC0/B8oau0yq8fFLkOJfREKXtmSJmvEXebZaL4c9YGr3JYmFKRBagdtXmnOdFEd9YEX
         YXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932715; x=1791537515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOOIVnS9Id+XkrrN4+pJgTtAUkmfSHTNwg21WiGg0zc=;
        b=ufF/0F8Ws9JrXouLISi1DKXkcDlUHqU0YfSjyY1REw/1aiNO67thHPqsp/ojtMh1N9
         8WD43xU81j/DAn841tiC4s+0126hb4jMLZe0wEb3arJDmwviCAXRU5FszRkOiKI6xhQK
         AWsJcr4NcYbJaR5khANOU0CEUC5L8DLfvUBGhJQT/1cigsgtljbqNyO/nc9/QsR9mQUm
         UsFzRHs3/xJ9KEr1nT+RgDKGI4le4CC9b2gcZvx5Qe9lNCsohkP5BUD2rBv/hFh+XULp
         O3Hdqy7JCr19jzbhDmXdIa7QmBxYrZ/9eLGXQ81Av58izY6gew4CduC9GRMeHfAaX5ss
         n9NA==
X-Forwarded-Encrypted: i=1; AKwUvBzR3tMmhOFsF3/QyonLj6yXq+pzhu6CVeXxldRJB5wwgT9ZhmQHUS+3wKJOgnhJhAj2XNV/553o4cn+HBdT@lists.linux.dev
X-Gm-Message-State: AFq9FYIXSfunhnIQ8OVSM38BKeblDgxQJMoPEenFMaZCNH0YNp9tJGhz
	N8qsXAnNZgJ5hxh+6vpGaBwsE4JmSgcfP28j80OKSilVVAyPyAY/NX7h
X-Gm-Gg: AYBFou0QJA/ImSqmQKZHkSMLL8xlszPdBKVnIDjQ4GgKUNeSVEm549wO3VWocR5E109
	mosljtDf37gSdHZc0+MLEs/2XSR96nNgo5mJJ2oEzrcLOGeBD+8WL4uDd5Rk1FZG1RgoLulwDFV
	l+46Bt5AOnJovbqH7nv6EAzRMayz5yWnrC06dikCfqGVMUtreg886qNQjBwPIpVn9AkoczHI8hX
	HrKAas7VQVN4Z8KIFkPLG39X3pepg0X2kJBCwL9+LVJUdYU+BOLRNGjLBnbLnOYy3Fezwv0TlUT
	bBf8SOUECgtCBPI7nXCODuxXbWG68/8XMQ+CUVYUimH68fV/a02656F510mk7CAtvXQ5UaFmvw9
	Zh6tt3nxy+sVCFEnCTs/IRP+IFGpuFkwd0r4HE+5fLev8jlV5JhLuUo/5LadHEghaA42ci/92up
	A6Aa1lgRKpWs6MG6PsNheLTn0RDXugJ5gYCIjt3ZSqPYvjT6Wu0K4sUHtM/DrzgWojYL3OZP2JJ
	HGELeL3uWr6ZTumaLbsnFFmnXqDsywrKz++QtUvXgSBs5pU7H5RkB7GAG4=
X-Received: by 2002:a05:6000:29c3:b0:48a:f486:2f4b with SMTP id ffacd0b85a97d-48b1270b14cmr2501451f8f.19.1790932715363;
        Fri, 02 Oct 2026 02:18:35 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07a9sm4984917f8f.12.2026.10.02.02.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:34 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 02/15] media: ov8858: support 19.2 MHz clock and manual white balance
Date: Fri,  2 Oct 2026 11:18:32 +0200
Message-ID: <20261002-media-v8-p02-andy-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHp75VdeXCDBpvsom2YokbS2QbbCzrGGf_NXYdLFTq3cLeam_g@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com> <CAO7O_xjcw60io6maT2J_dPOxMcAe5k_=u6UCuo59nsd_0W+4xw@mail.gmail.com> <CAHp75VdeXCDBpvsom2YokbS2QbbCzrGGf_NXYdLFTq3cLeam_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed in v10 patch 2.

The 24 MHz constant is now:

  #define OV8858_XVCLK_FREQ_24MHZ (24000 * HZ_PER_KHZ)

I also removed the trailing comma from all four newly added register-table
terminator entries. The final patch passed the focused W=1 and sparse builds,
and its reflected B4 message has the same stable Git patch ID as the prepared
message.

With Best Regards,
Maurizio Casciano
