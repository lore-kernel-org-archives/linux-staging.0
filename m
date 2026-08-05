Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1F2F549F
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 18:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955667; cv=none; b=AW9bNKIg0sI0vB8lh+uCUxRepNt9znjhDLHo/32xa9UbjYENDbjzpmFAmAu7Lhh30wUOrnIvVVU8DqeyYUPzgYfSD5LmDxc4M0/OICpz20yS1s61p1+aw22b8XmsaWI44f381PjXrpyIIPQtplV6GtVhBa6SW9367Y3q1cH4WxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955667; c=relaxed/simple;
	bh=NG7f/qAA6Uh8RCcaOyRLi9D2MucClZZol9uollnJMNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=axYZfH6a6rGprGazcOKKaQrMKfLRqZul8xyKGmn1rs2Fg3Zs7O3yyqE6yL6ilGw07b3XghumaanS1/hNFpm1yef/63UOne9uH99/ODU0GOPLmsx/Agw9BZYAH7YxRfzZsKnDXhbxdKSML/Ce9/TldtKNu7eqjt1zZVBPrCH4Fz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UO8Tiztn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UO8Tiztn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8484f229529so1215505b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 11:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785955666; x=1786560466; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NG7f/qAA6Uh8RCcaOyRLi9D2MucClZZol9uollnJMNs=;
        b=UO8Tiztn7cLigu38BDy3Zh4pdItl/4h30Pyir9hxT+VqTtGpbHNsxww20ue+Vn/Dk/
         47oWkLCZ/yjs0gnSoaYvvzVbJ78OKA1cKkG5nsYTdzQZKAki9crS+/81T9/EXNktLUrG
         uwqGLA47hDfx6TZuKGJd/TuEEWxlKviHSu41gk9vT9xx6OtN8D4VaiwEZvL4cvLZsC5e
         UCtMsZqdYP5UW7ByJlBgHVVCuhZGMrsRV728DgAH3Hpq0z6yaZguDGgOXB7pmVlpLejN
         b/vgiSAG3+jJvJUj2bHIJ53x9pvsMEVnwpsofUuY/T/SygeFo/Yez3+paO0tKdb7xDDv
         F1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955666; x=1786560466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NG7f/qAA6Uh8RCcaOyRLi9D2MucClZZol9uollnJMNs=;
        b=fyt9mCuys7k1+Bx+RdQ2vR6AlMAGyh4+2ILXA/nIHL/h0EJJpPKQ161AGtUzKOi0kf
         4jV44CvAfXvu5n861T8XzrvPEvMX6Di+6wfdH7EpJ5MDNa8VFdf23p37Ae+AC/73CEN0
         T6b5vwR2BQ4wcepDuPK/HySISRwk1tX7PVxG8bheYCEOGqDROZjVhPsAuR5e4/ProNi6
         q0qYqk8OJpy6aDJ59DvB+iRmhJKRJKt3/Sjbl33Uz6q5LjrE0MWrBvy69QT7R0XIpKPa
         G8AF3sC5imSu5h6qRpGe0dSK5PbcPpzqn2iZQOF5z9lF9z1HQuw5mQGueKoV4v1Ke3PY
         kf0Q==
X-Gm-Message-State: AOJu0YzgN+5gAoXryUOvaevVU52ihc864XlRAin9fVXoqeIWY17vXojW
	ulf3fqW1r6mJlSkR7ilUs6Ms9TywB1k1TqwMyu+IQuWYkI27fUh15/4RJAqOQz9BKThP2SJq
X-Gm-Gg: AR+sD11KxLik6tCQV+3kV9fWzMKxkJbxgm4TbZaVtiW8WWjQ3Dn88FRdXTCrQvuveIX
	Tiw2w6JJNzmuE79TeLbgYrqH/OuwZ4YCDXz1XeGai9AzATfg0nDq/GTt5C1saeVqSBHqUCGYtuH
	VKe6Yx+QouUPAAGTli5sg/8z4fs2lclDIjllz87LitrNI5GIRy9+2qPGtVkHebA/63urlM7qGBE
	o1TWXc4zUT8dugyMVaxlct3VaKRqdqkIOf3k1b+pqlOnxBk3Y4qr8CMWMDYZkOxcmllhzeFNWSd
	RV5jFkAeFiRmhBSLjKNzbYxVBJBH5fKVcexfBS3TNQPtKrpyOixjfQTGLNCMQd+ny+g0nA2SCAJ
	6fooNnKulzN8Ce2dOh3hEuV33WJKc0S+HcxY31LiAeMrHlmmOGs753YiZ39uwU4/Qjzo/cGfQR5
	DK+8FDzqxI70ogapLCEF5qh1JlMOBmrilhfYgmwzhUpnbBzpMZsQb5y6yEKg==
X-Received: by 2002:a05:6a00:2441:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84f2e1520admr9616473b3a.37.1785955665827;
        Wed, 05 Aug 2026 11:47:45 -0700 (PDT)
Received: from eos ([103.89.26.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e2c3e6esm1326627b3a.9.2026.08.05.11.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:47:45 -0700 (PDT)
From: =?UTF-8?q?=E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA?= <reza1234khan1234@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
Date: Thu,  6 Aug 2026 00:47:41 +0600
Message-ID: <20260805184741.50891-1-reza1234khan1234@gmail.com>
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

Hi Greg,

Thank you for the review.

I do not have rtl8723bs hardware available, so I cannot provide the
real-hardware testing you asked for. Please drop this patch.

Thanks,
イムティヤズ
