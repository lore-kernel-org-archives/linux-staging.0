Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792996320;
	b=m9VXoA0fa3sB8p45dFFtytBtspgNcBapBJA/ZiFyIYfJcJLtTCWEugPx1Z9bPkYWvmFc
	 t73xzmQJIKkrQRFgXaKOgk1XFLmgoWSrcZIOmJMXW9oLe69abwOzfAl7ZPs+oP1SHM+qP
	 D7E0cQE6ZKJpT9epZC1UF/3Gq/DI0xooWWGgvkAiOCac5OyqpxEc3UfSU8n3rk3lOJKDp
	 bHcg/33FcQgibk0q6g1UNb177iX/lYBKEF78kLLX3LV3jyqW8nO5H5RlpJwIZ/FasSi4t
	 ndLjuhZEtQBfF+wTqgPUYD2B1+w4hmqNNUYA6Tl0mGCYdVsKxp3EPwgtJJXGpwFAFpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GqcxNtiAZfNQOpaRDoKT3/3Dst2nVYU7A0CmkDZXaHQ=;
	b=zia8nvZ9Tgc+7lpiUg45VYXukGY1bAyVr3VWbFxZUvkMoTL9BsBeg4ZFGlDfjLSoFpIq
	 d1g1WYTmYt4hdNS9rysJvAyhk1kyFT71PUJ0px4j04tmVRE/lIQMe99YBXy3cozvdPN/5
	 q0ZCIxhV6hM7mMCbUEpcDCei0fVS48Db1QTaFg1B8JEemfMp0p02kY82S4LJ5JOmlHS0t
	 43LQxm7YiUXE32U2O6PRY55FF1dz/7dR6DjiNDGqnAJ7rsT7K8koZ8eBk0RlNQyKv5sJ2
	 6Bw6/l+21GGaQo0EDu7IWXtNoauWRZjt8L59eqV5VQG2/v1YzMhCHktJIIjaVx2y5Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cwoZb3VE;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4A6606A31B
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 06:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4A6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cwoZb3VE
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so9271025e9.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 23:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792996319; x=1793601119; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GqcxNtiAZfNQOpaRDoKT3/3Dst2nVYU7A0CmkDZXaHQ=;
        b=cwoZb3VE0pT9rMGiC4+TqeTfA59dViHq9Ia9a/dc5iEHmPNKlWYZHwTmpxPcgQlhxq
         mfWPlS9uA92pmKZjcr0DEA9HK5JJiBxCnOisTctEBowdz4MkEU76W8xBOgX0d6nUVh/U
         jDfclyLanID2obJcNHmlmGE/EIQz6cFWxv9yhilhnWgo5D2sVGLMyqVqvUhPbmM3twmI
         cFxNMDC20Aq0afN4likpU+Ry9+n0/yKQBKovdSHs4bVtQF6q8Ll06NzcTgp3ISyVgA6b
         fXBogQFeMb02HClM38KnwkrGHtJYIvk90IqP05Lkt7Vj3xyVNhszpr0X3tBmXinyl1G4
         7DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792996319; x=1793601119;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqcxNtiAZfNQOpaRDoKT3/3Dst2nVYU7A0CmkDZXaHQ=;
        b=DmdRTg10svX1nTqJRkvZpyQSeREiFzCuM0UoNAYs+Mnl9nzPepMpOzgzIKeP8sUo1o
         CPKj0b85XxucippdxDq/3Vn+/YaWZiSfxhFZQXG8GCv5Evpsy6cBD+OLH5JGbItVLJv9
         dE5Ghv8DN7TcKA7Hu1JhvmvLFxQDNQvQmGRHZ4ZkXRAra4azjVVTyirfJiMnx1moE1Gp
         N/TXHQPgGuRLEg5dyp8YhUfwu+2Ku+Zj+mbzj6DdJUWnVcrXGMrbV+Ew11Iswb0GVTbp
         jwICUyJ0vBttEQWfPItP4/Xmlr8CoSlGBerswK4nlaFCdYkBUH2lCiFI9IuOOYfiPoOV
         s7HQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnYQdYcJOv7acBeKkjbBLLJhOLjhpWz27aSoDGKTbRyjhins1fG5RnTBiDr5Z2ubWMoP5GPpOGfRFzUxqB@lists.linux.dev
X-Gm-Message-State: AFq9FYJR+oG4Qbxhi8wuo/oZ8MwnZxaw09OpLdVFRIZxHXDPKb4lBPuh
	yFRae6TXO9tbcoaBDQV9XoZqYyNOz8xdCeJABs+7bJl8kTvjE5yoqNsm
X-Gm-Gg: AYBFou2pKrVrVacWC8R0zzX9KDppwJbyoIQ6VtM8Ww9tBhmupaFDLFHGVG3PDnyU5Fx
	P2KI3HeDlZVRhyA/rzhCweBUHfXF6zgDGpC2PV4BFJJj2GCYRhs2QhJ4MVB5/fCX6SuD1rP0XzD
	C99B5sT2+9q/h6Za8v/Epo1GOs7wW8yvOMg+7VQEjo9Lhc8YW7qCAK7O4hotAXrcttHJdd6E1+u
	Geu+Igh3TVfjPojV+SFslN7Rrj/S5vMrkD2by860+0xCA90wA0QnkS3/N6VfmapLaeFacPDLSzY
	grzDhkOaoTeR36gFpm+9kZUhF883uJy0rfTDpBvLhdONhoz+S6J7wTB/E0zIXwEK6kP/w4NSyfM
	xdmSqIOkepjJR9lSMfNhtraTmhyF0acSKa1wvgTlFBRVv5Vp65hSXBU+c8GTskHwmIA8MeXmIKq
	z5oNoG/1fgu8LSJkk3WO1ameM/Y220jJ74Y1rpt3vfoHJW2GfNpFLuLQKANAebrsGdarcvHHyN6
	Kmb9Pcq71+h1EM7ZPSN6hgkFLzBs3lduWfXUf7+KoB+NISrxp3eLg==
X-Received: by 2002:a05:600c:474a:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a35acb9afamr106677375e9.33.1792996318690;
        Sun, 25 Oct 2026 23:31:58 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a58a293sm170484255e9.12.2026.10.25.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:31:58 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:31:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Fix line length warning
Message-ID: <at7z2oubp02WQb1h@stanley.mountain>
References: <20261025164003.143864-1-himanshu.bakshi478@gmail.com>
 <at7pu4hldDTgZtXy@stanley.mountain>
 <CAGLmz9JaXM8s4BHQ2Cn5QQdBZpzDXmHyb-GQ_jXtj4Rz6SJOJQ@mail.gmail.com>
 <at7s7We7bxdmmmSM@stanley.mountain>
 <CAGLmz9+R5Wsd3i+7kLZXL-KP2bqdEmNUJTSKtZph_NSP92Jung@mail.gmail.com>
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
In-Reply-To: <CAGLmz9+R5Wsd3i+7kLZXL-KP2bqdEmNUJTSKtZph_NSP92Jung@mail.gmail.com>

On Mon, Oct 26, 2026 at 11:46:48AM +0530, Himanshu Bakshi wrote:
> Hi Dan and Andy,
> 
> I have not found any call site for fbtft_init_dbg and just assumed
> that it might be useful later on as the driver develops. If you are
> considering removal of the macro, please let me know, I can send
> over a separate removal patch of the same.

Yes.  Please do.

(also no top posting)

regards,
dan carpenter

