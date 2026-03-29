Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881532E5B2D
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776118; cv=none; b=isWKJMA2E8KdrWVh+TmY6F3QZXqpMmvJs6OguN7IJ2TePfuAtRzlwt/ujVWrbmHnCvlSWC5z8yZaA1hzFmBKP+78OP88LBYbSyEv6AUhQ+boui60kp5nq3WBSq1z08NDyeiW2Ae2O3ZH5T6R4g34Qnr1bgcXh7HF3ukkKLzx6CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776118; c=relaxed/simple;
	bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=enG9A0Vbj208ETWjQ6ODv08i7p/kxoSvZocya/cwmb4jUmMVYM5UdZY9ceIe8LztrcPHawxbpVgexzcOWg+IiIso7neKbBld+L1QShFqtP7SbLVxZ4h/wcwHTqD/4KSJWJenrMCL/TIXaWmAPmi7WX8MqXODl7FuLl1PHZvtcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJp/nGxq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJp/nGxq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so1774569f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774776116; x=1775380916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
        b=DJp/nGxqpRuGi7I5HBOalEGl1WrIuEriyt3AeqP9NBWSPtT6M8u8HCwzC730/YRX7L
         8TMd8KLIvIDgRNc7bBGwRh4PsHiJ/KnNKNab6+Op6HxP8ASw6o8Vl6BGuIf3iCgRUcLe
         lWcvYA7oKqtayR+tax2MMPw99AFYZjlOUgwvMMxDDUQ8HI+unPyqkH3z/x9br8EZ6AwQ
         jYW7uFpzMh4cQxcXkN7DaZ0PfghLht5GMC1Dgk6i0O0jg67+jyzAzv4LP/YKLqv1TcsS
         6CdJy49X4lltGfIlyp4196fTzamSpKje3pIob/oSn2NHZq1bcOJw40tIm8bqNFfxo6EU
         bzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774776116; x=1775380916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
        b=iuOYjbGKk/3CbzvCENlLxWywhIlUXa0AaEMotlEnyHej0TFPtK/2wCWiccQmJHByua
         X+GSLxh7B+F8k0LKmBXpdcFlTJo6ipCe6mkPGpL5nQZxse3JYYx2dMiLGQcdzi1qwVGf
         f/mbB1k9UXYo1KnyAfGMz2XCT6iPHEdBmdx2evO06TFyE4RcRz21MVmeqnNTUHMrBHF3
         +2YQdRUAGFFD1kauDamz3K1aYyqUAZAaDrabJT752bEeCNFSLQ4MuOI4B9TuyDpgapY3
         EsRnI7f0QxME8yx7uyw/U4zTvdMV12uLomtX/3NQ+ZABCuF2+sQ+W7xSpphsbukAdQPE
         sbTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY1qwN66MYnb/tgOPheapHeo0dPybzM8117ykrHeJF+mEb4zXr4Lw6S6WrNFQ9RwWZI5eX2/n/gts5WZly@lists.linux.dev
X-Gm-Message-State: AOJu0YxrPUCRclYNsUfnvYYYs1ve/yfdDwxUA8erLSIcbsoFGgDfN4jc
	oUr/s2wxwtEalPI6Wys4zvncfHypola/XA8+Cd9MSWhw+hlkQwzzVYMl
X-Gm-Gg: ATEYQzxhmEvyyggTbsc8Fc85pL+R1dTreLUI8lyg7hYqJ5+MNxX5q5VdtsZcQ/pQUAN
	jJbV7JZz0pQJxglWW07HG8RJWzt0ASUUW/ZkWWQVAo9J+VnaZkoc1kR1myec3HGwqCsxBaebcrB
	wESZq+mtKomHOvTaYXaXTlsuYTDb18kLJeckg1AF7cL9+HVh8aC9AeRLJ9gLt0Tw1wQI6N6Jpke
	bAqt4dz4UQD0GVQw7nGG5ApMRBhxutcbYlSweTvf/1DRljfA8rpO2ViDCd4oS6c8TduWa1BeDlT
	r0aKgFgdWE3o9AmWDqW94n7ljyBvIjPqrfVSAcpFMddG0f8XVNPWNqKYUe7BriOfJgfEY1YCcAL
	+fo+skT9I4fduoTGkDCKVVUj5uAkVT+msBkYT5gDNH+b1fc0n+dPMOB4wrDifXyLuINIg08I2lo
	4303AIsNg+HfhZZRzfKSF114Urj9g9peaNWAQssHHGRiwMq/vQmyKhPCOGO8g8fbQDnBGN+aYc/
	WU2qKhHql6oXxulwg==
X-Received: by 2002:a05:6000:24ca:b0:43b:60f7:2282 with SMTP id ffacd0b85a97d-43b9ea4ae28mr14838629f8f.28.1774776115668;
        Sun, 29 Mar 2026 02:21:55 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm9945848f8f.9.2026.03.29.02.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:21:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, nicolas.dufresne@collabora.com,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Date: Sun, 29 Mar 2026 11:21:53 +0200
Message-ID: <2823210.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Das je P=
engpeng Hou napisal(a):
> Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> stateless slice control and later uses their indices to look up
> decode->dpb[] in _cedrus_write_ref_list().
>=20
> Rejecting such controls in cedrus_try_ctrl() would break existing
> userspace, since stateless H.264 reference lists may legitimately carry
> out-of-range indices for missing references. Instead, guard the actual
> DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
> V4L2_H264_NUM_DPB_ENTRIES array.
>=20
> This keeps the fix local to the driver use site and avoids out-of-bounds
> reads from malformed or unsupported reference list entries.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


