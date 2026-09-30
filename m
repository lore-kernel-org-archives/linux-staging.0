Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757A643801F
	for <linux-staging@lists.linux.dev>; Wed, 30 Sep 2026 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751869; cv=none; b=hQ26ADKwYEID9iV87uYhh5wi0XfB0gf/q0ER6l5wQmXjTUuE9h/ZzeW0WBWW/jl7nArKUL3BLXQmC5aPImwnCScB+SvpFbgP1qNjdBAR9BEVVqHN8cJj6ILWY0Tvj1y/Wwm79k1YoAixcA/81/sLOQG2F7sDtzVtKIClrTH4dbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751869; c=relaxed/simple;
	bh=yFAS9/v1M5fbag8LFxiryNj/dstnuUqvUFxvrR3AwQU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLpgJYRVIOI8Shpn3XvWVnsdVFxLsAwr3SUXuSMxDj2KJ+kE260uuafaCEkDUHMogyJQ+gyjxDxKEhtozqswuJMeO+RwfoEKSDxHgLsttgYBXsV5rPrfEL5YrDm1wltyaNA+g4VEuIfwxjPnbhLYDY1x9bE04I+ghfFBw11ljc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g90JV3Lk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g90JV3Lk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso20410605e9.3
        for <linux-staging@lists.linux.dev>; Wed, 30 Sep 2026 00:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751861; x=1791356661; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fnSRLEDUbCFQeuJzEmlR0hd67GUctSzHNjgJH5Lw/K8=;
        b=g90JV3LknizqUcDvGwYIwjAbQq7bnrrPDBV7RDYGeAczoRKZaDOhMXlq35P3rJua0r
         Wt4xQVhCa8WO6G/UXpFWq9wNcyrXOg30QTGuL+Op6fIZo4J1SfE7yO5OzxxjnaoUgIik
         K9OsedpkCz2Z7xscdhaIqUGTa/aklNlWD1jfK7t/ZRqaAn62jMvLXhBhAgbs0qc6NP5R
         +6QSr6F/fBOiaLBOL6DhFoqOTubK0LAk7KElNgyCg14TdyPMq1nx0uWxFyT5zS2zCjM2
         EID0FCFQcHWxy3MJaH/H0UblEP8KdQunNdla1fqqS+/bD+JCwMUoz+r5rQuoirj43HWU
         JnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751861; x=1791356661;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnSRLEDUbCFQeuJzEmlR0hd67GUctSzHNjgJH5Lw/K8=;
        b=rpZ7aG0fMmlwMFOrdhLqS7mYZB6d3QApauEQMt+WYuOfKjRi5CX02j3F4H4obSwC1X
         1aHgE0vjiKi/Z/oPKqwnEuh8sPBvdU2jlfSKdrQrwHqf3VzDuhJo5aFRN0Xvhl6EaLUF
         voB+mvJvuX7CAh5R2n33DPzi7VFDrjcfRbbVNiLqWuBwg0hPSvWGrUQCh6UJ0N8eVoI3
         QwHKE/lu49qQIoAysNuqsH7OAQnGTCcksSEdrDG7XgW0wdbAhCGN2LuKoG1JD5179Ksa
         AUIhyPcpBL6W+qj9iNFABKOXo5l2CpScot4T1fyjI9x34QgigzyBf/etNLrsv7KI+m6b
         1L2w==
X-Forwarded-Encrypted: i=1; AKwUvBz2FWsDjh3ZDCtfffturMgr7pPT06djG1j2z7C3rhrno0T22DQFw1FNJUweQvUPzQhiW455/KyqzKWFqLEn@lists.linux.dev
X-Gm-Message-State: AFuF++lBy26P9is2VX0eSSeb/5Ihmwicf0SziAQl3bOuMcrbtjcrCSy3
	Aw+HXlESINi+MUvRqU8xOHjKAsl0EnWZ9jlikJzYH2FXn5LRAPD3PJex
X-Gm-Gg: AYBFou0YSfK+8v7igAUwZ8SzNPtHSKNxw0ogkq5GBXcNoazXHK3BVt8kJZiBT9OZNc+
	qAC8uF/pYKc2cNvN+RULR3DGU7htfaJVpNdtYPc2x4guQ3Tufd3vKRR/vkVyhflyrXVmlsHyb/Z
	1kAPoyamfrLlb0fZEAtAImoq9AH5HekAToPD6pOJ/QvvVLsMRd/PgzgV6RQ0sTbs+NSZeeLSl77
	gja6E/IlziziHo68Nxx5fMHsF62P9sg6qN4luL/iCkn8BCEgQwpeAyN0PZs6HpKDPYJmnax51oo
	7Ht83HmyF55NVF6JG/wVfEh5UyJMXddciRXWtFFr5LBK0wkUXIU5x9zC7gi1HNWj8Kfw/L/iU6w
	SiP7ta3HnLD1p+Krno+/RobU9OrB/mvooBrIsmkJy9VWBO6+M4Oyf0b4Mr73FhBL7sp/DII1HYU
	VeqhT3rYV54ONswMhy4icsG66mYMeyNYg5dIZEs2MZ8xRP5nkQOy3u/iGPcCDSPkJJ74aE+deA6
	0PH/NcWde/FUJdR3CiWkfwstU/p3L5MpCyJKnRmetS4jZsWlRQy1vMS685QfsR/BdExxJ0XRpX0
	CRazUIR0aGRLdjQkWW6EWb8Ddu+6JCUuOtb2K3y1yDR7z+dgHyVAyRbm/eaR9+LRC/xhopv+Tis
	GguM5UZ5DT9dbR1s1FIrZBOqcGWSzuIb/zdra4m/wLBgGxiRRQiLp+nuO6vdgFcCdH9DyhR+P9I
	j/9BWv
X-Received: by 2002:a05:600c:5391:b0:4a0:1559:bafd with SMTP id 5b1f17b1804b1-4a01aff068emr5650595e9.8.1790751860600;
        Wed, 30 Sep 2026 00:04:20 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949a5esm1515980f8f.4.2026.09.30.00.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:04:20 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:04:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, error27@gmail.com,
 narcisaanamaria12@gmail.com
Subject: Re: [PATCH 3/3] staging: iio: accel: adis16203: clean up register
 definitions and drop redundant comments
Message-ID: <20260930090419.000073f9@gmail.com>
In-Reply-To: <20260929184900.39515-4-abdelnasserhussein11@gmail.com>
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
	<20260929184900.39515-4-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 21:49:00 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> Drop redundant, single-line comments above register macros that provide
> no additional value.
> 
> Vertically align the macro values with tabs to improve readability and
> conform to standard kernel coding style.
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---

This seems okay, at least the macros are named exactly like the registers
in the datasheet... but I wonder what the others think about this.

-- 
Kind regards,
Joshua Crofts
