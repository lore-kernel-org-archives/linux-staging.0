Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C9340DA6
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 18:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561198; cv=pass; b=sUVTO64mKxHuy2tEJ5AI7iXf0Hk+PV4RZ85CK4q8ho6sxov68s/LGrKqBOK6LcvMP0MU8mhfqggDWwLfcXfKsTPCYv1jKRXN/U2mcNgHg7bs0rrJzyyJsJJ1EQfNAvO1e0Z+nV3wbAtw7gyaCrx7QwI4E1j3nUsHwBvx4U0A33U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561198; c=relaxed/simple;
	bh=5YpsLrQd66mt/oElMkbWRCNsoeN3vBlsEy3jrovT8is=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hfnVHMn4xiQcnJayhEkKmjU/zjmqGMrAtS4nJxyPqdQ7yi5uagW7C9GOHqHr3NqywJmaenE2p0lW73vmHLztGcrdukRQOpKeHPbSO2EQ+V8ocvYyUU1MsUhZxfersp0ePT/1Ow8pPhkYkyCQu4BjyeW5KkECW3V269aAeW9OG0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkkNf6E5; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkkNf6E5"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c166aef4f02so79623766b.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 11:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786561195; cv=none;
        d=google.com; s=arc-20260327;
        b=axcADENpA3TboZoZHy0OynuD5Pr9RGQue0Efv/BlAYMoBE1xvDCUH7uSGu6/BwGht+
         WZsRVWWZiRz+P43svo28ziT/UtvrTk/FMTb9pagczpaAhpXwdoV1w8Jakszrl42CoVmy
         XTbiCca71wep45axj5Hx3iN9OT7muClnRww3q3+naaCDJdzmrH05RYR/U0W4358ZQ0z3
         Gortu5j2rpMJP7dcUUwiBurAU5QlprrwWcSrsZar2nCjP9cW4vO1yG4CchYZUcUVYxDT
         cst0+Imyd2SkZzRsv1J9Aq5NqvNJnd7OHph1950WysZqNFmg4FltAuEd0d96W7rS+0pE
         beQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5YpsLrQd66mt/oElMkbWRCNsoeN3vBlsEy3jrovT8is=;
        fh=gksecBabw8k2FahPkq/8LaWKXe8N7iUuSy6UjmCd6YI=;
        b=ooNS464ki3X3ihEStsvHWBif/AWZCRlreTuZuYtnK47/MqrxeMV19CVbUH4skXuwIZ
         q29EZkJ6js+L0n5/zXX6sm6l8+IWttfzEdpP+xKO+kZE2XLDIg+yjEpJxQVFrvwJORuh
         8GqMD/G1C2FndSDN5eE6lYfXzTN99q6OjRYyBoahCXJxEdD+XnQN7gbOUkejbvkB/rfm
         hR0J4QuBg4GP2WwMr/sylmG4Y3kB3fUTka8QkpOzUZNIR4XfTEMIxLIcRusMkBkZkh3k
         WD+TptxZVwglQPCOQyIFmJbxUUEVSZT5FBlxnDN67JkOusuPZywukLrVz9X6TwHY0IM/
         NHcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786561195; x=1787165995; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5YpsLrQd66mt/oElMkbWRCNsoeN3vBlsEy3jrovT8is=;
        b=lkkNf6E5Uzog0eHBmQcOafHvIYmxR3BAIuobjLeTZX9QsIM9TxwCvgkbPRogRskzi0
         sjnWqE0pi4Q9woxTgkiQtyHgMgJTPCWELwK8fekXn3SiVVEhoZiCOG4VWvOXs2LBwcC/
         5lv59R1ibfPCRa4kgcyTGvbXChXbnAGCN0bXozyQ5BAfqSvMHisbml8/rvq7j136aoOs
         MWm4mqImEXu1rXG5nU6619d8XUj7EsOXRU7+poOhRETBAIDSd9qsArbLRWqJwD2JFCIQ
         bSNZn/79AxVt67ZMnoeJ4s0SGAa1PTVAIV1h40VRjtt8feZHahLM/byYH2ClzGiOG8mY
         eACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786561195; x=1787165995;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5YpsLrQd66mt/oElMkbWRCNsoeN3vBlsEy3jrovT8is=;
        b=guLiZcItJJLy8D9nZN3gAIP5mm3Fe3ocKj60PGFdXTK6vZuP48JyI8fGTVPJijJxVn
         W9hvAwqskggc064AWimq3hd9is4gMG4HpC3VvIyF0FdNa1zWLIl4/CK5B5SDhsy4V1io
         wTijafljyU9AJPX54wS30uM1MzaWHXihrbzQtbOcdKkMPC6uK7p8On0HTK7bWQ33vkv/
         uZqORNpSD1qPGlfAyk9Np+RAbeCayVrsrILB5OidTKzOD1XdoVh2t9pf0tfMgY//6I85
         ECNhAkLAfcXm/toZHSeqjDNjQz55xcoA0+8gufh9y9aRLqT+9Luo5/wNJSL9aT5M+7UX
         BIhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcYMkLik+j30EcagRSm52zuRFuuaDWjqgfy4ouNNyPfI0lnbWO3566DcX48jnrJB4brrNdpM9KGP62cRx+@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbq5jtuLwwMajNzvmCDzX/fIYcphHkhD3sQfY8T8yptJDo3c37
	C8tFaJwZP+sajjGuyCVPFb4V1F8DUAaSAOhySNbFaCPhGEYDod0Tr9t5HHpcQQrbZvrGg9NfegJ
	dSRV9uFG0eQ4+Fg+R1dLWLjIVQKEwPiI=
X-Gm-Gg: AR+sD13ri0MMkV5FqR29LWNOt2o+yYHQ9o5mhFN3a243V7/jFVbbPfnzGKEEQ03CRTS
	Z9Odr2JzF/T6rplTOwD5Z4DDFVEoTGNMzmWlNWRE26uvjgu/DVFuuMn1Vn9U3MOK0XcXHZRbu1v
	ejInpJEAbEf+aFpFA3h1Wl60T0Lg2dwQ4GEpEAz5iKh6C90Mio9FCjjJnqpw9o7jhGK4XJ75IMe
	vORJ33gkb5a4ye+YF/51K5y3RhhFbGxCMocWVjFF9vE3Y8NWckBuJeMwIa8jtZh5Lz1MdEAC+wd
	qV5pQXQnGJ6uK2x1WzqF6MCk7q1HN2yILkEe7PeE+OP+
X-Received: by 2002:a17:907:608f:b0:c12:1651:17b2 with SMTP id
 a640c23a62f3a-c2108e5bfb5mr20737566b.9.1786561194813; Wed, 12 Aug 2026
 11:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shehryar Ahmad <shehryar.amd@gmail.com>
Date: Wed, 12 Aug 2026 23:59:43 +0500
X-Gm-Features: AUfX_mxI720OVCqWCabncilafTVACGGIMPo2NOHI0XObuFT7-5YQDH77NnxYQqk
Message-ID: <CAHR+CoTo3yX=1-pfnkxu_UM2jXx0Fi8j6ZU6T-vRR4Pgb95mJw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Move adis16203 inclinometer driver out of staging
To: nothingchang@mirrorstack.ai
Cc: Michael.Hennerich@analog.com, andy@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlechner@baylibre.com, gregkh@linuxfoundation.org, 
	jic23@kernel.org, krzk+dt@kernel.org, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, nuno.sa@analog.com, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sheng Kun,

Is this series still being worked on?

Thanks,
Shehryar
