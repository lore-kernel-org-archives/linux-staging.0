Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779217;
	b=AdRxoItQI9KGy7xnAHbYHOswSjYIYnrHhx37AdX4Zvn1/ZCrlvMC3zpJdZ02kyCUCkDH
	 /83+fuuRbQC7jQzV3r1CW5eivufALnY4Yi8WYitlab5lDeqrYAjH61VZTqBBrKNZPBE4F
	 ERxHQVx40j+GnuwdwD65uzln36Yuk9ao2UU/JNdA5H0v7gpib4smx3Yvl3YhWB1X+7IOM
	 lzG0QHy6Mob2AhF8bGqqqRBAjO/0m4KECsDRvlREor6a+Jzxj0cQadAOBV1AVHcVbApkn
	 BUAbbP4v+q98zFjV40XWITupPvGlfO5N4qbnN3buDufipkOqT93lPq5DojBm9gzYnxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3J5U2FAeFLLXR6CG2lJiwfFE52kTArm5g7+TkN7ZkP4=;
	b=kv6QIFpSRtr00GzF89TpMemfj1KJV0WLwtyuAOYt9XC3mNAwkfab8PKtqGC7WgSr+LX/
	 p2FoJ/To57q+Jl59g3QIgzdLVIw9pgB46+fnF0AQ1yaiwXOUsN5WruftZH1tqDuOfQD+P
	 07HWQpFVVyEs5ZBbSmtl7OblArHsq2RzBmCXTh/9AsQzkiggnPQVkfsnBevLpgb9DRISs
	 st4+tItMV7ZPqYHg1lL8DRr+4QsJTzVYiav32kESEhyprP/12HghqxKt0Lfo2geKBRh5v
	 p6djmTnacYWTIVhqIv4JFfyFxJP8Rq3ra9+Zo2X6iDrWGbT337zlTp2BLdKvvkLKpVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AG/+l2HD";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CED606A328
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 08:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89CED606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AG/+l2HD
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48fbe12cfdcso199695f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 00:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793779215; x=1794384015; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3J5U2FAeFLLXR6CG2lJiwfFE52kTArm5g7+TkN7ZkP4=;
        b=AG/+l2HDwypxub5LDzUF67dhgAkf2S4VOVliF56DZtSzXjnv+YY86o7cIIbhB9fkHP
         WaRHaZEMMDZqhfO/hLVzj0iD7TOH8Th+pqFwbK2x+xzv0AVsHRXF+yPlBqsLiAuicgWe
         IYMtH9fAM8Dcw9IlBwGw3B4tfHhPw0vzPncanoZ6okbfCrKFSGjWXKmAvkBSICMz+e9/
         Mv/NCGpm2arp+o6KstwmfrtHtu7TBF3G5p1En6gndRa4pRyTzXLu7Tf6pOBjEvM6JNOS
         tYWP4ubqCZ5ahihcBFnbFAWICUcC9+8Xu8i9SY6UoMGrd7vCd09qveaRj3F9yCwZoHXO
         uscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779215; x=1794384015;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3J5U2FAeFLLXR6CG2lJiwfFE52kTArm5g7+TkN7ZkP4=;
        b=rZWWzn42XDPQdapKJ1V/Bl/YzIKLPUIWUzpzIXrPyeGLhfUx/fnunxNReT7lEWmH6r
         /02BpJKiwMo8oIXVNKabnY9/VU9xmk/EHxqWNChZ3aQJUs+F/TGW7/FKLeTHIpCzPt0b
         voP8/cyhRMxoR7KMjkb0U6LVOtg4phL1Qzn84B4P4IK0jvbj0yHU8KOHN69PNYDjnOPM
         RPfIq+i8X2/DF4+Wkz7sVOVjXLB7DZxD1CQem0A/LS+OrIngQzP/3ZPPsJ3jLt2+Iyqk
         lG+pCNqr1k4aRMZvZcAnLjV1pKv2P7s3gFwNLNBjtMRthbCSpxgFMQRz54GBayBL61UX
         cGQA==
X-Forwarded-Encrypted: i=1; AKwUvByXZ1fjO+0B5Zzo9DfwgnTIjzBCrkFlAy8G2qP04Brt2qqNqyIi0uo3hxh7uLJooBPnALuKl0iu81G41CnM@lists.linux.dev
X-Gm-Message-State: APuU4Z9nuiu0sKyC+gti5icJkMmj1a+w56g7zC2YTRMKeHOUSM93Wgq2
	BhwRB6tT8bEhNPVlhll8xT86u3oaY9lgPKt217sKp4emZCkt3TMicVP/
X-Gm-Gg: AYBFou0zj9BJdIKx9ILER1H63CthkCMsRuUCnC6R7popMVaf8ze729Y7OSH8Mivveeg
	iEDpzjjAFLwe0K7fZF+8QsMNxMPbO6rNKAHasJpfqtvz6rGVOYz3Kam00dHAvxeeyS0nEf89l6C
	XrfXBfOQAKOK3mmBjXy2vq6wJ9axbtmdd9Mi4f5vSWPdvLQHlEcagQO5wo+WMsz1CKa+H+6t857
	PYgI8NKkcK+QT5Zju8PqL0zzgeQ5MxFki++xo4/0xMsa52VcFEJijyRM7GC6oYJVFoWmvBY8Qa7
	nNsg8+lAq2kcZ+KjU5DskXx+NPZc7O5zX8ArpdWof3MAb584Ln1IOveH89oeEs5NfRnXW8U7dc4
	8DWbj4lE6xrqBGEb9qOSF1nS+hsE1DUllNdIx0EnEwiukJgNA1JAeffUZS0kmB7GB9RfcJxhp1t
	Ohd4KXlEdfez1exa5Bi7F0qefOCFujrVscSlOwCzqemf81eeRAF6PmzV3N8v63Z/GuS2pkF9mvj
	eUVdpAVeKQeduJ9800yhnGEldmb2Z0TJIo9XlHCestNxB5q1CqnHVkGZoZjZoi8v4Wr29b5L+Nd
	/XqXesKfwjqxmr9sp9LAgnX/oFvUIzwjjfbZCZ0QtR37BROrA8LlWXMO1WUeGwjI7rBTKetLUSw
	WfYhKsGpt+9bMz0CtJXi3IjsaYa0mq98wqiWIUtMxTwjILNIv3XonPrQjE4yGXSDuoC/+gJTbSa
	0NM9HPx1i/4FZ74WjWxjFlI2vHdBrmVzcsYDHqMyN5xtWQrdKYnwpNVZpETM+Z8MYn+hCpjxRjB
	Z6yhvhw04BomXpPZlztW1k=
X-Received: by 2002:a5d:5f89:0:b0:490:2033:1477 with SMTP id ffacd0b85a97d-49020331482mr1365594f8f.56.1793779212966;
        Wed, 04 Nov 2026 00:00:12 -0800 (PST)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm2588704f8f.6.2026.11.04.00.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:00:12 -0800 (PST)
Date: Wed, 4 Nov 2026 09:00:08 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Maria Sheikh <mariasheikh812@gmail.com>
Cc: outreachy@lists.linux.dev, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, jic23@kernel.org, dlechner@baylibre.com,
 andy@kernel.org, gregkh@linuxfoundation.org, linux@analog.com,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: addac: adt7316: return 0 in
 _adt7316_store_enabled
Message-ID: <20261104090008.00002b25@gmail.com>
In-Reply-To: <20261104041237.7978-1-mariasheikh812@gmail.com>
References: <20261104041237.7978-1-mariasheikh812@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  4 Nov 2026 09:10:45 +0500
Maria Sheikh <mariasheikh812@gmail.com> wrote:

> _adt7316_store_enabled() writes the config register and returns -EIO if
> the write fails. When execution reaches the final "return ret;", the
> write has succeeded, so ret is always 0. Return 0 directly to make the
> success path obvious.
> 
> Found with cppcheck (identicalConditionAfterEarlyExit). All callers
> either check for a negative return value or pass it through, so
> behavior does not change.
> 
> Compile-tested with W=1. The disassembly of adt7316.o is identical
> before and after this change.

I'd move the testing info below the ---, as it's only compile tested.
No need to resend however, this can be fixed up when applying.

Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts
