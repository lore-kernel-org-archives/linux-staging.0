Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF792135B4
	for <linux-staging@lists.linux.dev>; Mon,  3 Mar 2025 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741025245; cv=none; b=EOPxpOuHwalU3EgBGKX8tdWgnP2st6aToeRJMkFh5V91yySfMlVU2Ls02hK2rYDlT4U+zNOthTtC0dEZd41W/3rqGimSMjYl1QHNZHVsdbFO52EHyphH7BGwtnC9WVHS1zy6EFpsp4U/4NS0PnAxKZK7m5c82pZfDv10SMy3zvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741025245; c=relaxed/simple;
	bh=bXCU4NzMCxXhDEY/l+uqvwrVqfn0ib2oqzKftnBQaMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j7/A1Fj9PHjsdvULHivhLPvyrlHQRVbXOcwifAMKxqpZIdFyKgoCQZ9pZVE3YgHzr/3Y//a2akWJWpsGHvlSnI9NLV0K5RK4TIP6Y0PwSS0zqCLKdrz1YzgOe5yUhKV3imOS3Dx2sW0j341kpvVY8H86eifhvksRUagWfNap8Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRbLs0/C; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRbLs0/C"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22349dc31bcso83458995ad.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Mar 2025 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741025243; x=1741630043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXCU4NzMCxXhDEY/l+uqvwrVqfn0ib2oqzKftnBQaMQ=;
        b=MRbLs0/CcUkG8mXElq87l5Xga4akW+g5XfH5DhfakYhj2eFprQG12spwIWgbkpkcSs
         WEmAi/MGzUlo9tn1ggwh9QUPVAnyS6haXGw2wyQrAd27RtLNNcqyF2Yd0rwCBRVwM2P2
         XohBg8/yKe4Qn3evn6i1E3dfBnPQl9n6QFYq24DFycfwhQqB7ebfyARb9KoJd26GNTvM
         13KNtJRHgcqbwgC7K0Eg8AKdP6KM+8TYrxXzrCLaP/9rc4DSah6+0TCv9D1kJC3gS/OM
         MkGrE5qjQYh0Z9ONkCpnVCKTRv0xFZL9jL8HVycrN4dl6QA0IxJvizn2Elp3O4/tdv8e
         uxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741025243; x=1741630043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXCU4NzMCxXhDEY/l+uqvwrVqfn0ib2oqzKftnBQaMQ=;
        b=RMHmnkehUvR91QF+g7Q+2ENl48/gTYWsnWUHF/37xeG7nwm5e845aeybh+gvjwSe9n
         JXcfn2bMleAsDDq1JktOtlXn4H9pau5pENFsBA6pw9JwMmVZu+CniDqGS0E5zRKcmLdX
         S5EjW1De8uyGZrZjUZVfJgZ8Z0fHVS5UihCKn85736voAMNWyWlJsxj2oditjX7/ss1X
         T5ujvqphGxKGMn2oOiezHkLhC/NeV/TXG1FH+ezAPE97R9n+aokfpe0uLsl50pM1D4kA
         gD6C/N1X9B8qA+Q+EYGaWpp01TgM136ZmhDO/m91O2fRTkJn0LKvZui7L/ZZ4KJ6Q7fE
         uTog==
X-Forwarded-Encrypted: i=1; AJvYcCUfKMDhYZvRGAVJE9OjcB+CG/fU623HkKn3NRGiR/x8IJGe8tJwv4NLRH7r4/Qo/RLNJuvjZERgjmhA15PX@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz4dm6OlRNj6rNwodsEPjPeheW9VPOIeiVueNVBvJ/XXt/EL/I
	0cOYCLMJg1xCaJNqjUimLpc6oHO+wqNCexB+zQzyPf1CNw4g7QDGEwFUKw==
X-Gm-Gg: ASbGnctrvRUYpJFJT58M7OUYdQpYz5M1UPUiBekDxTy4LehjlCrpZjps4467yj4j9wg
	94hQVHzKjuRP8WSAbdC3Z59VhXkbrry7JjAs2jKeYNagxk2KAlk5LpobWqwtYU0fPMlB/tXRKfn
	Q+xBvMFinVRUJvWutF6idGL3i382+nTAvysbBmOGyfx9KU/9v/cQDHrASPfde5JlA2K+VRcrOhW
	pPrUwJKtMrdHeymW6VX1aCj05vpJCou5BTZ57ir7rc9u3bPSKihhpRjafOqv79hKRgkt8mDSTwn
	cgJb1tmX8QtiRwx76wmoVgC/AvcmDKBnJ8lJn5ErNObHB7Huy5/HS/HUCBiEMV7Hsyjg
X-Google-Smtp-Source: AGHT+IEoXyqJu3mPpaYJ67JbiWewUJKm0tJa4OQ5m16xsFToWnwkVzTIefbURvOB46dYpKI8rulCgQ==
X-Received: by 2002:a05:6a20:1591:b0:1f0:e36e:f58b with SMTP id adf61e73a8af0-1f2f4d2250dmr27131962637.24.1741025243002;
        Mon, 03 Mar 2025 10:07:23 -0800 (PST)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:7b03:1e42:d492:fb71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dec3dfasm8452216a12.59.2025.03.03.10.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 10:07:22 -0800 (PST)
From: Saalim Quadri <danascape@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Michael.Hennerich@analog.com,
	danascape@gmail.com,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: iio: ad5933: Fix CamelCase naming
Date: Mon,  3 Mar 2025 23:37:18 +0530
Message-Id: <20250303180718.15707-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025030301-niece-evacuate-0f05@gregkh>
References: <2025030301-niece-evacuate-0f05@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am so sorry for such a silly mistake,
will try to read before sending patches from now on :/

Yours Sincerely,
Saalim Quadri
