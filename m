Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793010002;
	b=tzZc9C0G8gmSrhp12GfM+PrhHNGxhDw+XZVflLdu3Sd20a4/i6fCT3fJSN5QsaqhhcO4
	 nSWUOKWEZ9jE/Lk8cU6L/9hhmzezOSQGP7na7c03fS+iU4qCoOfaTgsrlQ+VzH8rq2j9H
	 VTVOyUlcOx2aHqdNQwNKnW5BXl2vt4cY0YSsmqtDuwWxHSq8U1E4//QYd95KqtHfJmDLe
	 3yipnvJ896YGNMd/6pI5ZJpIxsSXYLztayB3HD0D7EzR9RQeXty2X+vXB6dUtB6KlcJ3J
	 bRjnr/WsWNTcHy5F9VyAX9IXRIgF3YG8vSPjW4I04Q9qWfdNlS9sNZI3tErGl03gvHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fbJOoGCOLIQzP8MPpKpAlj4vz5dI1YiHPW1SWmOARzw=;
	b=TQ3H6czY84NVPRO+Nb1Gx7Di4HyAD1Ga8QViQFcKN6NbYE+b144Q4RMnbYn1wAhtpwnz
	 7FUSIXnFC/189PQUrW3TPYPztUY99qza1bev050sQpCnOtzK6kQWL3Wx0hIkRRswMCQwu
	 20iSRbMJKIiy65xNHpDGH/ciOf9uR58/4M9CvGjp84QgOL4yMhNDvgJ0uqSVTR9dcqaE+
	 eZh2VpM40CD99uduhqo71lEnymv8B824sx1hDINO2LmHaNBnzwaIEqcNsFndwnyEHpzs8
	 1eA1XK7Da43hD4pF49tl8OVI4iYFr3Erk+2FejFsAS3H1rpQ32EidPp5LbPZ0S3mkrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sMRI1XSp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10C8606A31F
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 10:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10C8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sMRI1XSp
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-703be215729so1210481eaf.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 03:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010001; cv=none;
        d=google.com; s=arc-20260327;
        b=YBsV5tYsFlJaYqGKxQA3kEqtDW/EBoGzzgkKVvRFhgcIq3b+ZZaZDttGg+JO0kv5bl
         a2gnroh9z0EUBL+xA1cF/4pKCBYldkkRWR8kdezdatDT2RXGBSCD6j6+gMC8+TFdL15S
         CDVWP4jaaG+Jo00+BagcRX+kRlFrVB30WgCAUXQMA7HroufPyNA3Gj7YleS47wV/p+pi
         yMDDKC1UqBY99FMmOZV3CXwqfuVe9WOcgVCa64HVRS+ENqLkLrgQg5KvemE3yvDTEpau
         YTLb2IovPF6myzosR74wM6HdPVqpcH9HuRMivGSfMukuD/9d7UE8NuiCp1atPjXwFCxK
         V/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fbJOoGCOLIQzP8MPpKpAlj4vz5dI1YiHPW1SWmOARzw=;
        fh=IkL1mfDisTalXTUioQaoo1/j/jlMWaR2vAsgBXCA69A=;
        b=NWFyUs6UY4E+1V35PR6HkyilwG/Z8JSAmYWZkMmL6ZI6BQFvFsMJ46W0w1p07zLeHX
         /ItkaNL7DZWaNR4lJK7ynkbd4yMyD2m79R46O8ybrYdoTOX1DoqSO2ty391jg3JGs7lA
         PnwNBVjPUK/TjAx19u8icjqwVuuPfn7FoHW/VB69VfFhQNNPZ2bUtSWTK/4ZHpIykh23
         g/wCSWZOb7SESM9t2d8g1JLqF+8dZkGhMeFGyyF2HpaWpMzo73Zz3YImMC3gLFDAjstD
         g8JaEKmjwqwqIpKcyKBzOTYLoLDN2w6Cn8I+6SRBM8p23proPKmSGBZ3LGFE2KmY5bki
         eTjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010001; x=1793614801; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fbJOoGCOLIQzP8MPpKpAlj4vz5dI1YiHPW1SWmOARzw=;
        b=sMRI1XSp9kawZofyXhP0qHSF/VpWwfwZHCHzuegraVzIx5OAqx6qgW/AWGTqNlCjYk
         1+KcG60brEd2r7Qtp5Q0v81mzUR937OrR0PKQwgJ8wW/MGmYBFaS6yyTlB1JGxxBLxGK
         oHnFBbh3/Ay0xe5MlnYYBeTjgNGbt9uuOiGl+lGYmI55X/HFBE8xRfaxWsvoZExcNNrj
         AshtS5q8QP47KMPtrE6bV8RHY++QPGSGa1EKQ4mSyJ6KDKg08UY2PjZPxcalmaOzwIPD
         Oz20P4IqY7WRFIgE0KlYSSMH1YeKS9qQjAoIjHh+Kf18MeE9XMmO0uDD0MX9xiA5LHew
         Hamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010001; x=1793614801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbJOoGCOLIQzP8MPpKpAlj4vz5dI1YiHPW1SWmOARzw=;
        b=zEWnFKNwWlntUGMxVrBGdfKeAsyXoAC0lv6L3It0BlJAx8rZizRLbN6IBM5tg4VAjn
         41x7yQb3Ftx6dCBioV5oOFXIujWsHZT1PMuKlwLOBV/0aJ2Z1AG0akV2S3u2KNhhX3ML
         wFwrQ5jvRTEl0sOCgvks9ksN7WHhXPTpiv6LLzuaCdgIIgzfL3mebrDOiv2TF/tC6MQP
         11ouloA7J1zJjNFNpkDfQ+J9sjYVHx4sMWnzQGC7BwBYqps2qJTmDidNz6BsxJGDKcTv
         M+rinI3ltfBZIDPVljedX9NOz1TsGGHdVn/RkwmQDsTPHTXrBm9V6bqQDJ+9BiuPxwmn
         BsIg==
X-Forwarded-Encrypted: i=1; AKwUvByTXq334qBURdIpPMRDfGKQhm7mYXQaD6LLwPx1O7kWxqPoWlGpZLyruIMBB35KcYB5DXr+/Pr55MbTs9MZ@lists.linux.dev
X-Gm-Message-State: AFq9FYLLtUA5AwVSqJDYoUk2rTYEEnXOhSnaDrF4Ha/kgtXccXTuODG7
	tK6F0C+ACoj1cROhZG7TdzwOKKR0BLixnWDdLVla7JsYmPWcfoR0UjDQWTLHJXZDPhINjzUxehz
	uwJ//x0ns+uJAyalgtXb5LsUIiMdlzXY=
X-Gm-Gg: AYBFou2hNVfR7mK9Opc28DSq9uDtFHI9SBgYynTquhjjoj4+ldFijR96E+bub+nX2yV
	pbtT9AUsJzGWsBUNqfZkpNDNzXJSCLf6cBdrYV14WD3tvCbfKTbLw5ORqGvfHRySQooIi3cbeh5
	T4X8Q0BVcyjpTSMGoV2VXLOLoEjlg0gvMVQD0TMx0bLU0J20Fgm2xWYN/XSfIUf0Orp5OeVMmV3
	XF+F0BKtBWvcSbffMNrdVRbhBKZftx7a3pJUodTsJ8QKEqR1YemzI2BJqo/hyBpBP1vlGkEJeP7
	OmJZrgjixpIHOVRCMBG32d6n2HkD+DUoczP3+hHYYBOwBq5dRcJOhZBT1JCIiDAQmJCawjGlp1c
	16+fCXRhf2+u9V6CLyTEn58jDDlF7r4/pTm6ZycGMhUUDxtuZuywcjpwDTyB4HfChMx/CF6k=
X-Received: by 2002:a05:6820:1391:b0:6dd:25a3:94dd with SMTP id
 006d021491bc7-70ba0e5707fmr3311431eaf.41.1793010000474; Mon, 26 Oct 2026
 03:20:00 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com> <at8h0ignZd8srvBi@ashevche-desk.local>
In-Reply-To: <at8h0ignZd8srvBi@ashevche-desk.local>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 15:49:49 +0530
X-Gm-Features: AclHuK_R5q_T7vpDB0YLNH0Ux2MdD6xxwDnqBRfktX82gSMvkXVTnMhZtHYzD28
Message-ID: <CAGLmz9+y5fXCf2-XFrFHfqAws5eODP4pSSro96R8vmt_aUQGMg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com, 
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 3:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> You must learn to provide a changelog!
> What has been changed? Why (whose request was that)?

Hi Andy,

Thanks for clarifying. I have sent the v3 patch and
added what you requested.

Thanks and regards,
Himanshu Bakshi
