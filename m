Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710712;
	b=1ZAqnRusxJjLRHD7UTpMnBOHNLivX788wOkV5+kHipVz6v/FJsFeaIjDGEMiEFP/EnPF
	 Na2UxMzzX8caLuU5d4JtiP+pEKpsylwmMFHgSBnDaH2/O1AjO7y6VNKCcKPUsE9e01ndB
	 u7FjnUZ6zv4/0zKThtbk2LhRfbA/l1jrbiWR+NkJuewFaQONtu0GgopOlkmsZ+Qoy1glb
	 3ymCntGX71BJpiBEOBNcFtal2VEE1SoR01Wc5gCiOVjnFMVzfRlKlFquCBjEkir886sJt
	 7mtBIgVnIvLeJWwNJhVxlveCmoOnoAZcaB/bfTDeK8jpIQ950358YPG/AlweMTfJ/iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=13BR70RLyJfPpHnpQCP+Zr7de3wwxMOidYdoAlvzUic=;
	b=yosI5x2ANZSo4/jyJoWY7PtE6xi5exhzVcb21YKqLaHz11A9YMJ3Y4F65E7NMMtnLcmo
	 SfyjUYyKtJpMh5t8xhfvoRd2+8YFX7/QPTof8H28SSMkmwpDOQB/7SnHMxCS0vBPDqE/4
	 6603mV8UcTodheYj95SjPDJ9KTdSr9ovPg7qkhNKVg4Im6ee5fxQahmk0rMmfnAMZAOX4
	 Ad6Mhaz1nTCWWlaYfC/T9Yh5QVglWlaCFJDwscV8o5flSCkDMn8SgjBNJT4hqyFcH2GcH
	 dE0YpxUJmT50nTWpTxwuTtR1+ul3FmJH1qk/4h33f4i1lV8VYX82wrISShz50UMKWhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dxlg+a+7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86028606A326
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 12:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86028606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dxlg+a+7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so25420655e9.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710710; x=1794315510; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=13BR70RLyJfPpHnpQCP+Zr7de3wwxMOidYdoAlvzUic=;
        b=Dxlg+a+7rXqnKTLuIx9KPbBnj+Fps+h5N/kfb/SC9ezBxEuWJqMrE6lzxQM11MUlbL
         JJlQ4z9i+/GHKHBSSExnRdKaEiuf7qCOsg3LQ0MxHXIgnjzT/tcN1tlW3OZww1ZBTmM0
         1iaRyC1rLMo18nznxPmC2LLWpQiuyP1qvabuNL2msaWuMdlyGT9bKE7pCKRsyjnD8pbM
         ab6oH/dcQLWynQnUGvkJKaKgEHB6rvZ8uFzsLOB2tsGW2pL3nPLsEUcF/eBPvsanX1Xq
         qqW20IdzUXtUL/K/8PWDN30ObTjU8o1JLYnD+CVFzcUTTGckwb4rygJrH1X4lQ/4QolK
         cZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710710; x=1794315510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13BR70RLyJfPpHnpQCP+Zr7de3wwxMOidYdoAlvzUic=;
        b=p0WeYphTOCqqkFG4qILDoUtHc4XUxZTSpO44r7oD3PTrF0YiZSP16udbpGRsCyJrjj
         XSEKE6FCzSLeK5ykKcMeboGEgi9aIa4Z7cb04PFPPohRzTuNtzduKSt9ug7XtVxMcqt6
         HAxvwg2L3lj2GrGGzZlQsNgNQN+Vq/PD7sPiCOD3BMTEZTXvQkUwfmac1BKlYAVR8oR0
         4i3bhQAlshSarOTRzrgE481roloFVuiUWDbUAV4U5LcmedcTxzzj31GPaKGzemCdlwfr
         4TyiLgEfuiWmONRmvAJu2CfUhaiTS1wDjrrBEbVf7gEj3ScwhskV5fNM46z4b4gw5z2d
         y8DA==
X-Forwarded-Encrypted: i=1; AKwUvBxg7pjWPLlR50D71lSY45kJO+jHh8dcy+2eHLXMgUbi+Ge8ilpciJEFkoGhn/8OXNQnpy0NrodpVZYxfg/2@lists.linux.dev
X-Gm-Message-State: APuU4Z8Vi9mS8vJt5IlfOsAMJ3+aAs334zITfCdzVzCUFaXUmRb6P5r5
	r1iH6lgpqo61cszo0Es86ub3qdEalwKnVAfm6oarQci4Ior6umRnnWYq
X-Gm-Gg: AYBFou1peWwt/PxgbpCl3x9JHjL2L/3TRHkI1PFB8c4tQIoMQm7XgBjLed+WV8SECs5
	MXh0UV44gMyY3xe+luFu1i8WbNrIe0ZZnyVgJ7RFbXjBGBiN4iAzpT5TWXFBq7iNSKYWJ8w6455
	i9MqjkVOPljbIVrwkGdQUIq97KvE4mb2+PxEJOjaYR+k6H/eiUPb+M909O4p4fCuO0WEbdrbrN7
	JQwj2be7PG708zhMwsrzodxzqqaDsKsMXM4XbdLRbDHPFULZNjgz/7Blf1QuRdK/zHmdcL7c7Ri
	stYABm+zO2kfGxJrsH7c08KbcSJu8HyucVtXihazU8YSeyOTfnd/geV6HrTLIfSU98CW5lnL2wq
	My2um5tmHRvOtLCH19DHs1ecwTlwPyz1+63cHoXIz5PKsEyPW9SuS/SJq6uZMK65Ra9vWOfkQ6d
	4KnPijnBOiP8EHdp3q93C36XWAI96T0tP/mEe4lGXgVnowxi7o+O2wXzWUJAKVk8umS4C87fhAA
	Iyh1RWBv1KsoYEEIVNriZQdE+p8YyV+J3gyApApFte+DHu70gZeYyDxHFAwzbYr/6mHp7GAvV4x
	LdDgVGgFMz4iFlssNDlhRLMfUgGC4kEpp3NwZx0JKF1X67AEbyuPeIvEwBfUD6MvthjZr2P7461
	kCpd7CtjuwT+d7MwEUfgoAlge6viyBXZef3wXbjrUNJUSi6q9T5NaG9OWY9xR4emMsw==
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr296749285e9.26.1793710709724;
        Tue, 03 Nov 2026 04:58:29 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm223581045e9.0.2026.11.03.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:58:28 -0800 (PST)
Date: Tue, 3 Nov 2026 15:58:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Raushan Kumar <mitramaurya80@gmail.com>,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: reject short _DSM packages
Message-ID: <aunacczneVpPd3mM@stanley.mountain>
References: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>

On Tue, Nov 03, 2026 at 07:41:21PM +0800, Kang Chen wrote:
> gmin_get_config_dsm_var() walks the package returned by the atomisp
> _DSM function, but it does not reject packages with fewer than two
> elements.  count is unsigned, so an empty package makes count - 1
> evaluate to UINT_MAX and the loop walks far past the end of the
> elements array, reading unrelated memory.
> 
> Require at least two elements before scanning the key/value pairs.
> 
> Fixes: 387041cda44e ("media: atomisp: improve sensor detection code to use _DSM table")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
> ---

Surely, the infromation from ACPI is trusted?

regards,
dan carpenter

