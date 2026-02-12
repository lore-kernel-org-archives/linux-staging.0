Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F863446C7
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915420; cv=none; b=nsDJqJcalZ+g+uu4DZf02yDJryDB06g/Pr8a76hQjBGsA5czIOEN9MDaUFpNkkMqsU/dLSkP1j1lrVJEogxjnGszaiS9dQ5QoPcLhPhS00rcZ7DW8UfcfhtuTxKu9QlX5vjqyR/7y5K9Y2g6++pSMQaKQjU4ep7tG2mX7kpmcuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915420; c=relaxed/simple;
	bh=TBGxlL3rQjYqXS2GauuRl3cvQxCRHjLxLD8FYuV+Z18=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=bhUlQzGUAQO89rQsALc0ye8fOrynhtqMXU5k8Q79rIVhDna179IC3qvQzBZoc3TdErw+cd1V10+/0SdCq+I3CtXQwRgkJQqkU5dM0PqGe2/aX1s1k6dQwFt5jUoUI4M+k9Wl26p7V5wb+GubqiLsVDgdOV2bZ4ZwP33zVXoyxjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFJ1CJ/v; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFJ1CJ/v"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-794911acb04so1322527b3.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 08:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770915419; x=1771520219; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhvWSmlq1jaluuahw6hXMjg/F13vc0wDlSXrDWQUJWk=;
        b=fFJ1CJ/vRuVop8ukpVIwRjPcEaWQ1p0R4nNOLDDXcHELrgJnb/Vv/k1gvuCssrHa2c
         g6+VyZYJ7kQ81cj37owfBJ1Jaln3lhoU0PSKUUIgAxorx6s2aHzZVN+o3nhqZyU6twnz
         Ucy/Xi/+1zYexfJvVkBPJOniOjjPbo3O3qD4MpHrkSooJ9tNfBbjeFM6AWTGcJdY73v9
         mDXyi5A/YVVeSM0a2V47FnvILJUdxOePrfXGHrW5GUN/6FJgdjoBUsNg4nIsMx9Zg/aA
         m2e1bgXYzYCO1T8inWC3VaBTHwM2XLiGrGh5AbkxbIRGvEb4LRkbebnFGH2TyRp+X9hB
         ggrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770915419; x=1771520219;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhvWSmlq1jaluuahw6hXMjg/F13vc0wDlSXrDWQUJWk=;
        b=AQ3wgqqaqcJotZJ7e+KpPjoKOLH+igfN+gsVwHaYyxMxX93Ilr7NOcB4FYn7iO0K5h
         5NxQVRwJ31ND04CCdp9Z//s/7S8wv+WPCdZh1eB1M5LUNf89OOmAMD5xPXI4zY/lNwuN
         V6dmeSKTwCp7B2X2CZ5Sa2sSThPMPb4gPCXqyzvBINLLcaIsLEdn8tmBnVJ1SIrnVB1Z
         pf+tj1UYf97ujrvWD3Rg9NhTJuozKmekw1chsUKY8LLKAjLu3pMwBZI6TRLo7TydrO/J
         LHZoo3fT2R39+NgLfOUa9FQKXrCAGbJlMnW4871FdMGyHx0kvTpKK4cQ+psg/2Fk+PJT
         5CCA==
X-Gm-Message-State: AOJu0YyJOk/dmOoZvbrz5CoIVQPRcVTe9rcCwiOtHUm9IAgbcYPUx+Al
	G5WmzpVQxPuu79tAfIMDsjgUGKCJIoJqGbVGsj1Di+uTrE8CKe0wW8qYqousv6irhLg=
X-Gm-Gg: AZuq6aIFrkLV6ILg3wZEqwulsTVzCIVhtdMK4513Nxs6Vg1iOmLNXBzM3VS1DS3damP
	l1NgLPQ/jwkT0vIxAX/JTHAg3pmx7FcsEflAOC5C7C/8jCm69FhGAAdVnTfVJvoIGcOd4sCPTFS
	9DkZLKnUiyaQPor6miUbx/46kxyZvnAzuA2rkCC20yR8fyeFbZd14C7IgvlMudCaZRei5stxvCY
	0ad08Mf4FnzMhdfYMyLl2Nd0e/UTVFTDdtfsdHrxIRM8PezPCfdXr+Bt27ndasGN1ZUUXSvr0Rx
	Gqv2WDNzUGDWqPT5exq/f55MArd+F1n0f+q7MJqLupHWbkz3OpaE30KCzO7ckrO3+6qIcIHOtvi
	Ve8nnE+bDPsaVAgq9U5JbBxKEPpm19SHltgVidkrNQoFjNkkLCMgrrgijaH1AeDr+5Am4zcdycK
	/wBuKeZeduOnBviXrd5EHi/CwWfd3BlWaJvrx3Pe7FGmRTDGpkk/ugSkBntYO4iZrkRhgSk5rGi
	iLXt9jeYLy+zQjmJVuCUcxW7OOukT62
X-Received: by 2002:a05:690c:46ca:b0:794:ee65:6ab8 with SMTP id 00721157ae682-797376853c6mr43659767b3.62.1770915418691;
        Thu, 12 Feb 2026 08:56:58 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c23e26esm49730947b3.33.2026.02.12.08.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 08:56:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 10:56:43 -0600
Message-Id: <DGD5494WXLZU.15P1D5MQ1RCGO@gmail.com>
Subject: Re: [PATCH 1/3] staging: rtl8723bs: remove unnecessary parentheses
 in rtw_io.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Sarah Gershuni" <sarah556726@gmail.com>, <gregkh@linuxfoundation.org>,
 <dan.carpenter@linaro.org>, <arthur.stupa@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260212082358.3403-1-sarah556726@gmail.com>
 <20260212082358.3403-2-sarah556726@gmail.com>
In-Reply-To: <20260212082358.3403-2-sarah556726@gmail.com>

On Thu Feb 12, 2026 at 2:23 AM CST, Sarah Gershuni wrote:
> Remove redundant parentheses around structure member
> address expressions reported by checkpatch.pl:
>
>   CHECK: Unnecessary parentheses around pio_priv->intf
>
> Seven instances were updated.
>
> Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
> ---

This has already been fixed in staging-next. Please use that branch when
submitting patches to staging.

Thanks,

ET
