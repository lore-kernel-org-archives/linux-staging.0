Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF5A38DC5A
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950020; cv=none; b=mTZf/3N5cixaJddul7vQ9Mcu4x/qAdVJ99lSHH8v0rCJb8OWOB0flEWUkNctuAhuCPZ2uKLAdH2leCvPJ3WAIaa2OQNDeTdobjGen9W9+Cbx/qmKfYbrQF5Drrur0cLJjsZVo0N9DyAoU3HNlWg9TaaKEI/auVbDu94TVZU7XRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950020; c=relaxed/simple;
	bh=VGQSpi5t+n8Mt4QhsO/UraLILbcQvvyxj8bAoHzLclA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uO0YodF5a4D8KM28lRoTdGnBbUsnfk5HvgCeudjYVQYFKc4t51SZ+GqZEEh9kq9wKiZmnqgrtyHupNQ7g3QaS5Fdf3ecQScvvUJkUem9Iz4t5CpTn9vxE1LIJbhNoGP1fnTjZ4Vpw4BDzgt37eTNj4VEYy9DgrCtN0x2qoqD9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlKvwo2s; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlKvwo2s"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd04f7f2so6026047c88.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790950018; x=1791554818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGQSpi5t+n8Mt4QhsO/UraLILbcQvvyxj8bAoHzLclA=;
        b=QlKvwo2shwCrC2gbUdXVxINFM5vuX7aPFtYwx1ag+0L2v0COjmVtVbhj4Tl63ADvRC
         v5C0Ba1QhcDGqCfTT8oPGbFYO4zitcd/gu1LaLFQLPd73JugOWgkhkemboc2hUzF/GbN
         fgc7IZKJXN5xH5qcoCIyjM0pNYTpqt1JdYyPBGgTHZWVwcIzZPI/63NbZDoLl8Eyq1h2
         hbuLZRuhaSfvnN+5/DMzFyuwbkAWedGoJQODUW9/+e7j+z1GCPfomdm7+Pq22BVD0KST
         MOILIo7PhRzWdCV00MG7Q3jap8MnH/3MygdU6GlZylXV79kDgjJ4+nSecaJ6vD2H+Q7j
         Mw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950018; x=1791554818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGQSpi5t+n8Mt4QhsO/UraLILbcQvvyxj8bAoHzLclA=;
        b=x2/RntEoC2MrDEGRHVpl5oiW9kozJbdYT1+G+A6WNwNkq+PGdw8c/9vD9Fm08IB+Ey
         qFF3cLHEJfzhUY08IvkiF8HjZD/TeH2eEbBobgMa4rYnAqCCoZ5twpL4+sZgAYVxZOPJ
         noLdNvhwPUv7UM7pNX7EI6oLA21M2OHvoKGm2qZAyYaRh1SneJtJwEqd2uLJONiQTFRr
         78hIs1cvHeFY/UkC9f+hEYkCyaFQZkH+ddV4NPvTLTihtmKCcjBepS+3JegJO+kil67J
         wXmcHMeiNGd9SeyPd2GETnxVX1nK5z2oUszWFPttx0sBrAlVZQ0WPIa2LryRcAi0ZZAR
         nXXg==
X-Forwarded-Encrypted: i=1; AKwUvBwRpndZBklN6djYvjirYbICiArpe5jeDfxgN5KSCbzv4iq8GWV1EcC2+17b3ggQq+3yELErGdN59X6bzaFK@lists.linux.dev
X-Gm-Message-State: AFuF++mc+hyldzsdhfLXivwZBUMujPHTdKNmaYcBpNXTQf1hBcCg8kkN
	G74OZP/gD1Ea2I1vLwaV+OTrOmXXZjsIfGo8oadzGV9+jJCVOg9orMCL
X-Gm-Gg: AYBFou1GWP273lNW76Mr/5GMo/vqJZbSP/odZaSfWGPmgb8VoFQTPQJ9bfoUG8erf7j
	fXdujqlUSQJBTJ97sv9nyMUXLMMZ7o+NpDSAlhJXojT6gHfhCCbZNsvLetlh0ZVu+wfgmkc5YGD
	pYlL2+MJBN1RCLJMEBTjRjwquctPr/bA2arhmr6Ua+kbSkGixQgWLFf2iiH6qsDZVbbkJDiI83d
	tPa7trmIPU9Yq72fXZ4cIvWYcDTCBxRQY4wtvdSoCj6tY70mTC5A39lTXREcunDjvKkqPAwbu8a
	50NiQ5Rzzzou7CuhacrLLdYx9eRugvIFejeH2qGnIuoVP1NtbXkzCbOnV+eBEKsyDbHrTppTgB4
	GQ0dpn5rFY+MTZksFWQEwqBlMkQr2dWw7XOkWybclbsxGiAylodkSp3fJBhnlCo1g/qbf+pOriZ
	8c5gUX8D2+GhuNgjsYn1yeHDvFQ471MDMpj5qJhPEUAIrshp6nLwWeZVwSekdWf733Iy0tTwQ=
X-Received: by 2002:a05:701b:465f:20b0:14f:505d:804 with SMTP id a92af1059eb24-14f58fd349dmr2820198c88.2.1790950017614;
        Fri, 02 Oct 2026 07:06:57 -0700 (PDT)
Received: from adi.. ([122.171.22.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f410725e2sm5951901c88.0.2026.10.02.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:06:57 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Fri,  2 Oct 2026 14:06:52 +0000
Message-ID: <20261002140652.3229-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ar9cUQd-NEJozKxg@stanley.mountain>
References: <ar9cUQd-NEJozKxg@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026, Dan Carpenter wrote:
> Why not use MAX_IE_SZ as the limit?

Makes sense, done in v3 - dropped the bssinf_len/MAX_BSSINFO_LEN
check entirely and check ie_length against MAX_IE_SZ directly, which
is the actual size of network.ies. Removed bssinf_len too since
nothing else used it.

Adi
