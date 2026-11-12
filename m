Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.231.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794484209;
	b=tarUi8irNtFukF62YqRlvW7P4IVatznAsSwVEEuV5H7H0UbYGuFZypj2oRWW4N4TtM9d
	 vmi+55NmZX8rODCQzxV75neobOYQeJlflvxtRU54OxYy/t2V+wjzlRiARaxDQ+lJVh83f
	 /GeAnAvI6sGbw/w6vtpkUm0Z2/8QhZSVQs4XiPTV9shUU3EE0Bnd9GSWXMEdVEe1/OnjN
	 Lv9lvfl8xBvK6YRt+xYeKzkXy0KH4rGJ6B7c/t3kc3y50Kj1+wLqRREIoY/ABBDX+0B7L
	 agXi9lthU8pTKpUfnH10Eee5q0UTAti9Ufx6Wi+/qUI6Yw/FC9vSqoAiSInbS7iaKBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PW0k9eDKFqfRkgSsOSdWK+l0uZcCJyw9dSbPkXAxN3s=;
	b=jM3LzGOLA/qzXndf0e+p6xEM2kaL06Y+zzXlXUt76ubw/UcTaBbBTv0C1G+wbqzzkCwm
	 F3/KCslAIMru69O5YeAoWg3JWUrV671JgvoQ4iw3GkJI+YTX0DqcEt85qmlZ2BVDlcs7Y
	 79G8Ogt2xdXWlTW6tiLqpxIYvpsANM/M0A9lQR7+aDfk9LeOOigKPbYHOcwWixCyFogDt
	 lm9ZbORD7EWh1ZdtZ1spj6buvwwpxzPdiJMTcyTFV/qxoklpt4Kd7GUbqcmElB7Oqd0Io
	 N2MS9fJbmwnmMVyBRO+mGbxQPPXtJ6QjqRH92kRIhijueSDEojq+JHYiwCA931PRhCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAOsqqgn;
	arc=fail smtp.remote-ip=74.125.231.72
Received: from mail-oa2-f8.google.com (mail-oa2-f8.google.com [74.125.231.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F8606A332
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 11:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406F8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAOsqqgn
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-4adade2ee63so906794fac.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 03:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794484208; cv=none;
        d=google.com; s=arc-20260327;
        b=Ix4ElS1MBcwKFP20rrRanpEACNoJlVv6CX59AyNS3HDvxnVW76Qru6D/txpwgfOT8c
         ypXdP6VaYl8yNKbqR+PF57mbQXltYtDKDHBqE6yPkH2cWfHE01pin7K2bHvwDCz2iou/
         igPijm8TtJZYOzY9wDHSbDq6j5m0fyum5ZnVfLl2d56WdeQvgOvcTcBza8kWvy/2FSWA
         Y6O3viy5hFajH8GYYYG0Sp5MIW6l7LQsh2v/34+k2iD/jeIjDV4bPLtq2TXnS27AlwIW
         IKE3uFDvz0XzIfbfOq5ZBsqHEUTRgbH02mQpEd3jXT0ZnQ6Wk+Hr/n65oQwAqjoUKVE9
         pvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PW0k9eDKFqfRkgSsOSdWK+l0uZcCJyw9dSbPkXAxN3s=;
        fh=bj0ts/G1C1NaPYzhGz8nWt7s43+Txy0aDgA+VIebpWM=;
        b=bw5FzdQBAX389ttTxiKLVUyi4nRUqJGCOcLVHm1HYPpqYmsxdtY/VrpnHKu4ynenSS
         tLCLohOSXL9/u1RgniKGGEhVyJB9cON4lg19kTz7F/WADr7MQbz8wTHaiIwqVAoG4vMN
         EzGH7wase7ikjKks6zespmkq+C6DyiIcDzIfFXYzEb012cqvrpgkhmEI6nLpNEbyQhyq
         126eVWvTpG8HhSUyi/RonSB2AeyhuV5yG66Kwt5Nf91M1UwqpkoTqBFG9ptKmUyxQPCN
         /XMw5EjzB2xB6yH4OiP9VjJrxDB+e0UfbIQWaSkkXHrXI6JZ8UXNrFSaHd1wc+MF3J7p
         9DuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484208; x=1795089008; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PW0k9eDKFqfRkgSsOSdWK+l0uZcCJyw9dSbPkXAxN3s=;
        b=WAOsqqgnIfggaPlUIzOvmO8Ege0rJnWi4LQhK6T4C/OkT2JNdRIUGwcYJoRvp2bFJF
         7/EnOLOudmaNHNuc/UbTPTnGXCHb5xJ6ZFB7bAjZpaJgMr58peGabkQxCAyMNFuROZAa
         VQZ9+5hWdUmo1RyCkRq7GcaxZ1X4GYsTbuISdSxTavrIZBNjYSZ5ZOeVgaEGRoyUXeMQ
         X6WW2cfWVMW3RhkVHbuHh0YQQpgL0/fvZfhx8GYaEOt23J/LyERboIU5ne57d/xADfEn
         QctSKNN2JvesswfsbWDyWDLYt3U3TkDWWwQ3btdQGW+puwO4wMUDLyLaXaMRBXqkWEIB
         d5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484208; x=1795089008;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PW0k9eDKFqfRkgSsOSdWK+l0uZcCJyw9dSbPkXAxN3s=;
        b=0jn0e/R48vHbHDxgc2htRbp/z95La7xKHxmh5k3aSD3vezC+15lGP+g72Azz1S7ISC
         J3qG7cwslat7nnaXy8qPeT0s6jD9po4rjA2RBnCiDlJVC2MxOrPK7XCPgIdYC2lSHPPC
         OOvDsX5GHw4UKKbE61U4XN8dpwa4rj0X2tCLRs9YEPlptd/QMASEBZzMYlDijTzq3KUV
         BxLY0Y94lRaj3vBSQFHY0tzQrA7EYpvCaKbPUC1WBNeTWx3FfOTkEYt3tUTut/4KAucJ
         kt7zqW4F8eVePrOXHKX+TeXDjvSDDZW47AqB8xfs4H1sbjUaHY0s09pNKIxd7udIzsJy
         dmbw==
X-Forwarded-Encrypted: i=1; AL+hErE8JDP+1DWnYLx9evr6Iyag05qVe1MtTjsHtGHRquSzMo/K46zqSuL2gJOOZqK97pb+0edCYKYAvfFT2rZt@lists.linux.dev
X-Gm-Message-State: APuU4Z/1hDbsJwg64wFs3tKYw8P6KXMBOBjB07UNCaKeijR+IWXVjW07
	IyE5Ax4XvnFWc8c2ZoTNFvO2J++Vl3c70sFhtWYiXT523PIc/amPUdk+BmqmFPztbnKHEcPLdSo
	rkXdEJ0pPtgDBdm9amiVrY9Oi04WJubE=
X-Gm-Gg: AYBFou2Vv3YwNzLC3+3G6xz/E/IOcDniHnE0pIckLvrFvbESD+vKhRJrzgH4H3VRW73
	5qWK+0eOzs2t+VywcbGL+13hAM/UN2H5lM5L5TJu+rtKHMnetuxr2OQoCCAp3GoS+5sMehEgEq3
	bGaop4hkZu7QJKYQ1K9JVWMD5MQVxN9oY9RUowwHGik1zL/pu8hS+xqG/K9bVdVPgOj2re7JiOa
	fXdH9WTYrbZwzAQVamzqgiQ+uyuxPHdzb4MfuEiEbjPOXoUMGTCpc4yTKNsVzOgqP0Ex8c7Ax/a
	j7DEFUfYPvip1NhoIU94xC8tc0OR1DWLig5vEGLpywJZ6T9Cp8gYr81gPIpevP4OSw4kpDXL00h
	Az9NoUtkQbJzj3hO/XurBLMAQvh9D6QMcD8eQeCwJFVUmOAm0DyoW3YORChgbPt2rseacgsUSLc
	bK1q8n41FqHCZ1RzxjDHaV4Mtis2qeiPtwoJckQNSfWTT001wh9JVHkiYAwfvil8o0lUejv+H/i
	ck=
X-Received: by 2002:a05:6808:250d:b0:539:dfe8:9960 with SMTP id
 5614622812f47-56b97d2052cmr4847599b6e.56.1794484208172; Thu, 12 Nov 2026
 03:50:08 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>
In-Reply-To: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 12 Nov 2026 03:49:56 -0800
X-Gm-Features: AclHuK99jfCHnUnNfvAVzgTNdsDa1C0fS3B-XZ44SaSca81MyWnGtLd2YK_PCFw
Message-ID: <CAGEkeHdBri8mbX9zctroRZeoMb=u6mYSn4xAum1x_UkyUZKRdg@mail.gmail.com>
Subject: Re: [PATCH v4] staging: fbtft: remove unused fbtft_init_dbg()
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, error27@gmail.com, 
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 8:39 AM himanshu bakshi
<himanshu.bakshi478@gmail.com> wrote:
> - Verified that fbtft_init_dbg() has no call sites in the kernel tree.

Reviewed-by: Hungyu Lin <dennylin0707@gmail.com>
