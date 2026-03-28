Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F237D239E7D
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774720048; cv=none; b=quVChuMOMXyR4T5LFEaZ2UYtyqiGLrg5GXDpmmTZMMGsGi5L7XyfH5W8Sf7bl/sOxvUANxPVhErv+I43rPtbvIdpPa5qovbZD9Bbwgo6p6/1WuoE/JArI+FkP9P7Zw5cqFH16cJrEUlHPeOnmFpVab5Zq07qgj7nViMMg9IFqdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774720048; c=relaxed/simple;
	bh=rIZbsesVc+iaqwMCwemksOjIcmx6/Md7GKgKyl92coQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmXET95325Ob/ZX33phCLEiUaC1c9J8IQmNC2Y5/6EmfspwR6wbekX4JJ9BtfQvRwrxHv2LX+FXnfV0m5/2wnHRpJPFPH3FAp9g2GWf5c81Ioe8EkkY+00ZjlO6eOfeI7VdMdgM7WwTYltTLzRXjkLQRVTqQpo+ovXrDP09yLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qa6BMO2z; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qa6BMO2z"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35c06831dd3so2931794a91.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774720046; x=1775324846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GicS4u0uTJrzhgI2U3/6yA3+5EnlNX/UM5h+UEdgc68=;
        b=Qa6BMO2zHlQiIqz5F3GqcltYoLqaenYcR1Mb3sGN1tFa4MlR74oMX/ULcBlkQ86ZNv
         92sEq0f6CLmYxNV0N2Jraf93XHLNxIyJsrxgsWsO8Am8qp+Zd5hwuXuuA/+In3N2hYFG
         bAw3Ax1GzptdqqY3M6nJQ4JNn51pId2DSUPTqBh8toEe2c8YG62rzwqnB7a7CDK/YRR4
         NY908y5O19vcuVdhifyBrTHc56p2DObPR3l/P4ZRbt+uF3jQCo9k2KMnQniiCyWG8TvA
         5um6UtBVTZCjcH2zEn8HVSCdFSPAQrCHTRmj1cCL3ojUr0Rfe32oiDbU8Yi6EDIjKZM4
         PCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774720046; x=1775324846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GicS4u0uTJrzhgI2U3/6yA3+5EnlNX/UM5h+UEdgc68=;
        b=HodBrm5Mwz5Rhk+XYFqSbligm+p440lJaE2xQUeaiPeRA/WG+85QpY78FiUuFV66jh
         CsihID+BGGRB0DPOS8vpTKi46VLwm1LC2ugIorrUJ20Jww/snH5z17q5p3iGeAhfEOlq
         SeT6QghFBFAMHR4nzpCunNSoRJ4b1My58IYEs92U7ge+gAthNQYX28V8YSIOxXTy5iVW
         L+DlaSJPNHE+YzbExmU39PdVmEym+oDttnoZRqlxrQsq+wkJP6ZeVs8B3Wozpr9dWbIV
         onui6lQpSDmMa44WhCxDprZC0aybK5ENVXZvhpzRxPGfiNyvShF/ihLlVeFzkw7+YFbh
         aicQ==
X-Forwarded-Encrypted: i=1; AJvYcCULJJGTzJAOno3duyAmFBNyPj46MHxlbbhtJmPL8a6KQ47lnzvZyYXfQJHZny4UnR6ACtRJWTL7Ga/iWKVf@lists.linux.dev
X-Gm-Message-State: AOJu0Yye46OLeERXnPrJJCtVlVtytESImoOvH6bDNRaqCUR7h1zSPqwD
	ou619LbWPI+QqRK+jdYKv6qeAIpMf1pATjWOPZ0Ascj6rahGEFBwvz4i
X-Gm-Gg: ATEYQzw+l/eA7auKABC+zleqRQHoAn/8wloSJ22xmBInpsjTaAiTOREf+DgzSZQhKX7
	xeWvn58OOAqLStI16ikDvxmDV/pcDp/UJgHtaihQ27bLyP4/TkgCvY/EbRkLANL7wmJezn9eg0f
	11FHJtA+2ZyU4kiGrtc/kDR1SPzJFbYzBYspX5VLbwTijk7VegM3ZT3Hc9YxYHF4kBv0iVgbL5w
	F1xwGHzgRy2l5qnmCt2tE5hg3MnqJ7rkdLshGTqhsve9vqaz9fdGHZM+IwNZT8WdgEmXps6zc5k
	x73L13v8TitGGCts1YA6kLBEjR7O2hnQrinV/YVK4iU3VLDWsFR9gVIAuNCYkyqqJ/OLu/es58F
	OhaartcaXo98Fs1ALnoP5p4ybxsIYcpDGTVCgCOrf+BfQMQBm0Wj66+kIQknfNmALJ/njvUo7hF
	UTCKt59OSS3bKfH+ntnuUyLUs=
X-Received: by 2002:a17:90b:1e4f:b0:35b:e593:b1d7 with SMTP id 98e67ed59e1d1-35c3000dbc0mr6313800a91.12.1774720046219;
        Sat, 28 Mar 2026 10:47:26 -0700 (PDT)
Received: from inspiron ([111.125.240.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507d739sm2559019a91.11.2026.03.28.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:47:25 -0700 (PDT)
Date: Sat, 28 Mar 2026 23:17:16 +0530
From: Prithvi <activprithvi@gmail.com>
To: andriy.shevchenko@linux.intel.com, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, weibu@redadmin.org,
	knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com, lukagejak5@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <20260328174716.rna2qykokwkojzpt@inspiron>
References: <20260323162901.121947-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323162901.121947-1-activprithvi@gmail.com>

Hello all,

Thank you very much for taking time to review this patch.

I understand, that this patch may be considered to be majorly mechanical
changes, but still, the scope of the patch as well as the changes
involved make testing important for this patch.

I agree that, in case of unavailability of hardware for testing, I should
have mentioned it and used the RFT tag for the patch since v1. I
apologize for missing this detail & understand that compile-time testing
can't be sufficient here with all the changes introduced by this patch
and also the concern of the possibility of regressions getting introduced.

Going forward, I will be meticulous about clearly disclosing the testing 
status of the patch and if I am not able to test a patch, I will be sure 
to add RFT tag since v1 of the patch itself.

Lastly, I wanted to kindly ask if it will be alright to send a v3 patch 
with the RFT tag, incorporating the changes discussed in this thread?

Thank you,
Prithvi
