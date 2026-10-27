Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079534;
	b=Zgkdssbud30L8uUKMcUs+DnnK/ohin8xaX/AQowy71ugEi54QuwWGA5kkgzf2hCWdhjL
	 r3eAyPwl1hciUJLUm1dyXkj9aQko2LYJdKRkYGVgAjmfxNHc6AhSKEzvnyq65l+NG1C9n
	 nGLOY+K0i5PTqgXCANNfzdpTf38BPIv5jqbQTy6P19o/D8syVJtNuEmtoVGYaSZTNbRx9
	 qi8UjfvuzmNnE1E1D19602UsI9ToDPD9zPl+ehbQeP7t/G/eN991pxaK4S5CaKU/IZ+WB
	 /pFB80R1penHIH/eCoyOhogjgzfW2htemngNhCVJOLrb+oK6EcYQbrNLPppARytI8qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EeCv2zoswoi1cyVuV3aMhSAQS6klpYnNlB3thV2Q9FE=;
	b=THMF/KtNl3oplDMD7YUk6gmqZ00vtqrzo5EJIIZd+nP6s49Ps4FSHSBVEOoMjL12DaWT
	 l0a6Ee6zYfvDx/UvyVZy8h/pxTQo25+xuOSYWmlLWsH0mnPf/tbQtMtbvgFENZ0xUUCK9
	 h0LUYVmhFNWhavkCQ6pMbu3nTn8kUnQ8XAkjRMwYOu+FEd64QhZG+gM4gV4eNkeiCCKKV
	 2kTy1r0Qb+P4z/hixziZ75UwBlZZMurK19F9zOKR0ODPcUFxc4JeBaCqIhw23K+uPBwhf
	 bmg/RvQSO8wEVp52qRW5cP3cnYaoK6oBGMRgFG20PMJtyvGUf0gJx0GgVQDpY5hDRaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TZFHGyom;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD52606A31A
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 05:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD52606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TZFHGyom
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so3401805e9.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 22:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793079527; x=1793684327; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EeCv2zoswoi1cyVuV3aMhSAQS6klpYnNlB3thV2Q9FE=;
        b=TZFHGyomEJz9FhV32EnqbZPMipqa4A+VyyJ/FBFsr0FyfYhG+jx5FpyC6TIRJbn9pS
         xGLT3ASY9/r+YLyinuuFWy+ZQYE9R+FCy0GrT1UTL/CqFPzcclhyz30+FNm2v5Ob1OcX
         neKF9Cllt0/qGXQZIsnZCFgZ96sSk1MP3GnTJiW2y12/6DM8Q+h4gPYmfIsg9sBce9UI
         w9GtIon8jSOAKDCLSLmITSa6BOUmozgZs8TyBQ7sbWclCog5EvQW2tzfQeoReUk+T5TK
         +oFtw7kpJhomA7JY8KFR44Cp3TCPFnubbFynqhD/Vjy8R3X8GwPydas8KWBoswshRICP
         LkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079527; x=1793684327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EeCv2zoswoi1cyVuV3aMhSAQS6klpYnNlB3thV2Q9FE=;
        b=lnrTN9KDYbkjyQ4htA42L8RjQFN4P+2MUtGhERy3Y9GtoPosTRngSAGxQXeUH/JFuQ
         O2F5OfrBikvmdoTRzI3icZcOArRqOagfcxz712aEtwIruZNdjJCILd6lBQIXWmuG9cL4
         1Yzye6jufe3rSC6tfYId+P+h89Jnag38gDgCT6AEnzoBuquNwz4YQ7btz0iZTtN0HXe7
         C+Cw5KAqE5Bkq9Sdwdi1ycht3IePXvp86yWmxaHGT6IaHEk0En1jxGTR+Zaumr9JC7IN
         WbKOtIVLSm+2OO5xshgPxMbyeL2hN4aGWNLKdgaYvvA7P/12DHzkmT06UIrJv5xfBhMZ
         //EA==
X-Forwarded-Encrypted: i=1; AKwUvByX9m1TNg7776N1hpv56suH+zaJLoG6vqU4AOWLRrkHeY6QI7NU3sy6ZTi2yICKgJKoCa4chLz1YlQeSwwO@lists.linux.dev
X-Gm-Message-State: AFq9FYKqwo+b9Pf6T70qHh9Ral31gYGDxhmJEAcWfz+6B3uj7OGKkXYm
	4sZDWaqrScUkVWyq1cFo1nbzAxgn3y2BbkFtlkcry8n6oimmnOMYLjw7
X-Gm-Gg: AYBFou2aS8oaIu5PqaBd8gNDAniLWh0nEnwnf0y9X9JpJ/E2LD/UUN5ju2Kzfl1Nq2Y
	BlxKg5AfhapGY7zh4P7CbkjyggVkwUN+Kr5vlHv8cfTgqWdGncn0hS4bryP/goR4CrGgH/i9cCo
	CXmKBcR57ye7g2m2KC2ShZERiMUvH/vCjEZ8+pp9Br5UPVCX/T/0mtdB+plEa1zE9vyYglLuZD5
	fmJE+HJ5brq074XxrmcdtPTww2CEusiuzM8ES5OMy+ZJaUukeBOdEaFkybs6sKl5Ts6m0wghBUa
	Dw5jLgESLGl4yYiDE1FNaOB5+Pvt5nieOqoWFUD9kXXd0pTr0POqAjqwae9s+VulG96IhcepmkR
	vSbZI2yGdtE9Zf5uU+O+Ue4RUXB/9hEDSoJXr8ZbZ/vBGcz9n2WlF/N1+5TZ7OqMSr/R+XeqXgt
	W4B1CJ1XIoLjNe2c/AmOSKrqjgK9+UOdyJtkbv6acqoyD5VArfOLezniciX29m2tphU/08yBfj/
	qLBEUmU2yoHAP6kVAsMxSknR7lSvekSJCy5pnsLoYn5/IaLnYLn
X-Received: by 2002:a05:600d:849a:20b0:49e:795e:ba89 with SMTP id 5b1f17b1804b1-4a7c3856e2fmr26530125e9.6.1793079526864;
        Mon, 26 Oct 2026 22:38:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm20057407f8f.6.2026.10.26.22.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:38:46 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:38:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: dan.carpenter@oracle.com, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fix memory leak in
 atomisp_alloc_dis_coef_buf
Message-ID: <auA44kPevsJUudhR@stanley.mountain>
References: <20261027001940.20565-1-sifat.yt.2.0c@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027001940.20565-1-sifat.yt.2.0c@gmail.com>

On Tue, Oct 27, 2026 at 12:19:40AM +0000, Abdullah Mohammd Sifat wrote:
> Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate
> 
> fails to prevent a memory leak in the error path.
> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>

The commit message says it is a bug but there is no Fixes tag.

However, it is not a bug because the memory is freed in the caller.

regards,
dan carpenter

