Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA22431E68
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 11:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785928213; cv=none; b=brpIJsN1l/yH/TYpuleoLeSrobdHP1vhqboEnDvRxz+PVI+hPZfBgmrxZplYdWYhCdYNlA54ERrbV8gKKK3m/4YLeqlUfodjkcxc41JQoVIRZsBczNsJYYtpjunITLxHrD85R1E4rwLNcbwVGKcPR5TQUC0yyZk+gu2xsLFkbCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785928213; c=relaxed/simple;
	bh=zdWIQ4XbdfNIiQOUQLO8ZRhdyOljfls9ev7Iy+S/wm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkRSGV28GCyQxpomIgEGUr9Put4i2k9MzHRtJQMWApi3m+TMU4IAP4TNdaLAfNYU0PMVy89LB6nt7wCfWPAGE88oIxPjtueBUp63PUsdGWtNMj4mDeQApKoI81hwJAhph0wN2SKPKR2EfBhRadVmiH6VOPCPlnAq8t42jR/hDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qg2/7N78; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qg2/7N78"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e347638adso897947a91.0
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 04:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785928211; x=1786533011; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1iSsiL0Omo09hV4VEUFV8jfMDXOERsw1/AgPbhwBt60=;
        b=qg2/7N78+zV57dQbgPU5cw+Y6wWGlNumYNAZadsphpeQ5VbYTDODRGLUGjdm/lOhLq
         R6r1w8XDjIzQOrwsW+dxftQL4ZDyXIjlNQtljRrWbPd65MH7qHgdkxIkHt+VCd3HtnNE
         NcunulBqC1TA/PrMLFS+ht3oYBCs5ubrGmCT6D3SJ6b07OKHlrhgBUor5tMuIHC7JzvH
         /VshbxeNF2OiiOYNIx2sdxjwkz+CqVcM6KYDGUSWZcsLKdyjZ/8/m3iZR5qINuL17KJ0
         WqEtpPYBoQOJfT67HiCPTUkm5LKo5u/ygaUJlU6DrYYDyVV7QfBH0W9qVYK51XEOq0hs
         AQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785928211; x=1786533011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1iSsiL0Omo09hV4VEUFV8jfMDXOERsw1/AgPbhwBt60=;
        b=BIJ8WiZ25tIWRRCVPBPxW53v2vEtF39PXw1wAmEo0K611qxamUl0vRWeW/h1ZcbRD8
         eWRP2GUJHNu5GJ3SUy8Urk5kY99nyf0EPzV2L49hSrrSK2vUEsY6EB07Yp6DLKyL5L7p
         x7NCbQsGPviYQm9Bgghl46YWZTcPxnQZ9HZVeOFGQ9nccAI60IUcOlUoNoxG7EtcxABL
         EiIKNs4lojQmqhq6AlI8cK6MgrJoeHi/0cljaxn0Ik0ViRjo5Mdss7mjilt3I4DiRkY6
         YREhxPTjBHqctdFpjQtNsNv8MCEGnjEbQe0WJ5Jb487Ayb0wHD+fFZLDYgewjqobCLiX
         zbvQ==
X-Gm-Message-State: AOJu0YwhimTH1TtfYYDby2jrSXnR0CbflWoBURxpMqeiENW9LhyFsi0f
	4B/NZgiOJGGQXZLZO2Cjduxq8j0Zzz1TKb+RJH5vS4GbFjOQUSve+07HgJyzcGq4IjVR03Wr
X-Gm-Gg: AR+sD10Vh6U+s5SjAWTp84Fd5VPUcbjXK5Bv3vfwWSsV+RmiQxHSSse+d8ii6j9qWkN
	P+WLqj18cSeuFMNZB3SbswRY6kb2PIDMOBds1xAin4Kw4ik3vTuZ4Gs/vRZMb1hm/zUbCOnKwTH
	ZqDAnslfAzG8sMVvIgX/cYa1D3S6j3Um1kQXJPdpEZr0o4ZjmLeQpZCzsCWpqBh8mWFQ/KnuoKj
	F/l0cpCwFE1pUW2/Oiy9FFcYmzv5KrciyTunyWsD0ZtjY0NGFjRVlAKIekHVa8ja4hkiPK8KPaL
	Ee1GhlamSueGoG91zZ+61QfkMlGaUzbpNh2f1M6s5vBQur9fPYKXqmUGLZ4BWeHWSFCeIiJZG9Z
	YF1qrrEiw1epN1A4jKLxUDg+mGxVjKUUr1Br1y/C/udhHgzqenXfkCAQPVycX6yQ28Sq/0xtFPq
	Qca5JUo6I4KQqJP+BYyhNJF7bA3nTA17NJN1NSjO6zmVHxR8IkzFb9GgMGyg==
X-Received: by 2002:a17:90b:3847:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-3903c5a7285mr5280710a91.13.1785928210913;
        Wed, 05 Aug 2026 04:10:10 -0700 (PDT)
Received: from eos ([103.89.26.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38feda512fesm4483654a91.9.2026.08.05.04.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 04:10:10 -0700 (PDT)
From: =?UTF-8?q?=E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA?= <reza1234khan1234@gmail.com>
To: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Cc: Muhammad Bilal <meatuni001@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
Date: Wed,  5 Aug 2026 17:10:00 +0600
Message-ID: <20260805111000.178888-1-reza1234khan1234@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805103344.172115-1-reza1234khan1234@gmail.com>
References: <20260805103344.172115-1-reza1234khan1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

I'm aware of Muhammad Bilal's patch
<20260728125456.32359-4-meatuni001@gmail.com> that fixes the same
function. This patch is a superset of that one:

- It fixes the OOB read of the length byte in_ie[i + 1] when advancing
  to the next IE, which Bilal's patch also addresses.

- In addition, it fixes an OOB read in the 9-byte copy path: when a
  vendor specific IE with the 00:50:f2:02 OUI has a length byte smaller
  than 7, the loop copies in_ie[i] .. in_ie[i + 8] past the end of the
  buffer. Bilal's patch does not cover this case.

If you prefer to take Bilal's minimal fix first, I can rebase this as a
follow-up covering only the copy path. Otherwise, please let me know how
you'd like to proceed.

Thanks,
イムティヤズ
