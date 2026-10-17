Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E935AC0C
	for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792212376; cv=none; b=PbH16ReD5zB9J0uB0RDLOdJesQr0EdbNRL4+vpvaGUG2zN30mIzej0o3jkx02b8CXZ/SYvhYOYEEpVJ3YWOIzqR5kAflqjUvgk8FMBUdNRQECy7/PZQTFAqx5dkqivrRYha9AlszOJe2EV2i5ED7HiQhNE26ZfBTqk1P5nBvDAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792212376; c=relaxed/simple;
	bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2p+OSFBLg6ceDdmSexznxaZRJHZluyiV80nPYtqbqlOpok+tK5j1CwF4WMPDxTvFyBot7zgHAZ6WASp/DwRLAD5X1LPvq70i1afk81TL2F9OqNFKDt37KnDKZOXBb6XETzxrlCriMiRj4OJ+KJiMb9qy+gmV3Oe02RRkpOAIOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJkvXSfu; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJkvXSfu"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so701633eec.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 21:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792212374; x=1792817174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
        b=LJkvXSfuuSMwItt7P5AogO1/fwA9x4JKtDDp+EEjj8Z14D1HWbqYvoR61+MjTN9bvx
         EqNYm9Mzdr/hfSHs5aEpjBYcXj5TuY0dLIx8HxTedGHNAqcjpf0GCwggESd5wbCoFnQ+
         XL7rX3mE/1DtIO1rRmqkeUhkQ528pA1Wg/ZWMGDlm/+5uRpq6UoAlsvAR5HChEn5MdxQ
         +6hC+bbMKe2+0U0xXafk99IWp/4hIyyAadis/iZLUYEXMjGeXtp4Q6TPf8p1ydLncYCb
         NJ1TX4ZEQFVD52pKQSbh4ApFthmDIGzmDK0+Iy1/iiC89PG21nrKcKEoD0KaEhZxT5cT
         3uTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792212374; x=1792817174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
        b=Ao/wx4Y3LkbQNvdxwKQJEdufXvdhX3+ssQM5UkHfcaXDKAssKAIxyWtXUT/O49Z+tf
         xI/NLX7xq5s7Nbn+N38yFlsgNQbV5ug3x2KAICLRwySovsQFX6q/h5uzo1vTC13SZk1Q
         wAO7UXr0/346ute88KUfypzQfv128tzN2UztzINGG/NtzXTa4x+oqrOWaZJcmVGW8VYr
         r+kaGEN03KHLHGhkFJZkQ+F4RzQQhqqfvvxo0ITMH4v1o7V1nzZyYajQ1ub0TMa4lScR
         byDxA+khG7W8KoGIvAiXxGGpWUW99Q8rpELcPoA5ptKF828ShoCEahTrkC+6P3DoGiDH
         T1nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjJlpf2RqwetyjvZ57sfPNIMV8Wxi+jsQsDpokD/0ubGq1SB1FnRmj1lAqx0pB3Ohpq1lLGUY2ChAY/Ipr@lists.linux.dev
X-Gm-Message-State: AFq9FYJRHxVzcKfMe6znAcYNgR0WazeUcubAJU1+5Hp4YyxYTZM4psoE
	g/vEae6Uh6QXfDHHHniOXtuyTtWDY0GJeE7DX7Hvh91+Wcdg+GHD3Ch3
X-Gm-Gg: AYBFou0ICgiY7GjqHZjON5O2u17UNIhvyScwWTy1fmQxFAJHrEh9jCdTcKbA22fryRI
	wBkXoPpW68o+pVIdCuq76CaiYUkILG6rpFa3uqF9pESw0JkiHBXWLsnH8CF15CWsSR4/PE0EWt6
	m93wiIoeWFsB29Tcx5HA8wgzJgs0/3kNYCjqqgbjb0mCMYw11T3OVl5IRouTIIEJECnctwlw14g
	cWJjUeymyEB97hwSLrKgnZCEf58R2UP6817ahrjXRexmoGr+R8mIu8qm7KA4KC04FFtUtTSsfGU
	Dfii/sDvgFR37+WEPZAyUvq4c8PEvtUxS23WB3T+XZ2trXfmKI2bRhI18n2fs3s+eYN13iqSy/7
	BfM8+0ua61uAx3SAqDGIOQUvK+Pu+kL4TVi4Zh2mda4xH/6QVIm7j3HHQa0zU2Q6YrCHtQ9HQGs
	gw+qG8aV2KVv1iGcQiscR0LP0/zdVuk31EbwTYATIuihTXdS9vq+D+eGkePoOe7WIqr+5Qibx7H
	vbFYp0DsFHW9hpRDC4ov6Zy89aEmKgvwg5mE/rbq2+8EPcAZ9nO
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id 5a478bee46e88-361a2e3d3abmr2168722eec.39.1792212374109;
        Fri, 16 Oct 2026 21:46:14 -0700 (PDT)
Received: from samaritan.sole-larch.ts.net ([38.78.160.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm11170734eec.25.2026.10.16.21.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:46:13 -0700 (PDT)
From: iuseacosbtw@gmail.com
To: mohd.sohail.biz@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove comparisons to true/false in rtw_mlme_ext.c
Date: Fri, 16 Oct 2026 21:45:49 -0700
Message-ID: <20261017044612.252074-1-iuseacosbtw@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
References: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging/rtl8723bs driver is being deprecated and removed, so patches
to it might no longer be accepted. This is according to Luka Gejak, the
maintainer of the rtl8723bs driver.

I found one of his messages here:
https://lore.kernel.org/linux-staging/5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev/
