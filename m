Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A75A33689A
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813031; cv=none; b=ZgtVFHdedr541jAb3ONhqx92ajqnkBLBX5KMZPredSk0NTr1d4uotNimc3smAtr99A6d/ywZqMT1cBDqPcZ5SOOuxxM4JTiO/fp4oVjGFL3tNwNAI37lRbkn63J9rUWZAx4MuWsw2z6lMC6k/QPg5aBOBJBOSiho67VDK/865ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813031; c=relaxed/simple;
	bh=/MvG26F6r8AdWZ/UPLzCsxRajfilKgPD/xEfQajPc14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXJMxm6iANk124eleO/vaFPvyjQVIk1x0LcWQgPMCPiIcQTtJx/mLa1Hl5JfNASrCLB+N/l48xAmnSozk7TDCs2mq0iNUq05jkcRLZLI1OueD7yoSDgfXxZMapcTNFI0E1VBuECGlNmCoSIjRVEExYb24nHr5gjV3vTSKD/nZCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlvC/pDp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlvC/pDp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0046078so18150955e9.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775813028; x=1776417828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/MvG26F6r8AdWZ/UPLzCsxRajfilKgPD/xEfQajPc14=;
        b=RlvC/pDpr+rB4HN6oAyNY3NtdzsBLJSane8NuSjIue9RrMuhEmUc1foWjR5ew9vS1a
         LegN+W1XmMovRDFK3ZwSH7wvcvb2TbpRxkyBKLuLV2dwqM2/o4HDiNyKapFIgY93nJdc
         R8d/dbw8IJd5AqkZwh/ACbFG7TbpsdHZfUnqnUnPAeqwuDhhzrxhu2bZ9h1T2sDXGJkW
         nikne/6F21sHrFCYrMFrN62OMV20OYLnEeYZWsO3m5eLdb1lXzrEDxBpcSRJS4Fusleg
         zrL9n066MtsLqlvoSWwzLbP5cbKl5sm3fAEZb/F619mnh4x/ixYkc25JFz6lQkIdz2HX
         ZQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813028; x=1776417828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MvG26F6r8AdWZ/UPLzCsxRajfilKgPD/xEfQajPc14=;
        b=X+3kkQzl2bat1qSXOd/dOUmzzh7Ohp5iNb3FDXErda3HogVQ91Wg0RVNU5VN7fCbKx
         XoPLBmMJa/uhOUJI+EJpP77/3Pb4+JSMTuM+nElaG/5nCCzYdzbdzZdDiSmTGZSBJqXY
         4A/+CFVdlEWB8GMmcxTgiQXZTysdbUL2NOwCml8yFKfXaFrjiYen01MsYnrHDHm0rQrb
         f8OoR7Upy/elw78txnDLNSVBdTzRfZQc3AZLC3QUG/5BeD09lN5GzkBj+wkZvYU8+z7m
         a/DJVXqwWxxYwHc1GbUc+ARuG2dG252vCXEpYBulJWYV67V88WsJOiDu2TRaH/gjn/qD
         DRWg==
X-Forwarded-Encrypted: i=1; AJvYcCW4QxYrBDsiey79YR/X9iLe7jpeP2CIfPCIZXN5SX6AzbfiiEOWdayWWZBqJXwM2zC/lhXrwHl4LFLCOX4n@lists.linux.dev
X-Gm-Message-State: AOJu0Yym72UQYwIOdJdhOp6kXs6VEXryG2Xats5tEr7vNRuLH+RSc/0o
	D21oO87+zH2jjNE/fDSOcQlwSkUGsGCTq1MbfmzXQC08FvOqks2eI8cd
X-Gm-Gg: AeBDiesdzCGhPr79bD72JlHLaBnbDf3gXhv74pvdf+FEEn51VftunCnyMVpKxsu9iM8
	KatiuQj4zya+Z/88dbhCf8zQddfcqDmrAREv0g4NaiIF8KzR/cHN8B72L7EkTE2vMQUZg5H9FKd
	vrLUwwlTn5ay2piAMVREaeKyhQ9INubFhgjYZZHAuTVKXGQsZqv33itR0LLy5vFF2g9EVAFwsZE
	XL9O1Y30AYqKfvOgD0oI1CdehY/E5hVTLBXUKXsRpYOzWKB5xOWENHiomA8CIB1q8KEbz9zP9ee
	MZIFO7LtaSql7zwOuJkcRd52FI0dOpUXdT+t4djlaQg7GmVV0bokBfoVJSGT0wB2CeZVdsOWqeo
	idj69zMwTKvXQGMHePUaoS6hYvTLZkxcchhAcCF1crNoTGlKBljPmEPh6v0TyTsGrYv17ntdVK6
	Lf6i5SieOki6Q0q9ccH1N3BRrrbY1/sQ==
X-Received: by 2002:a05:600c:c088:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-488d67bf744mr20047265e9.4.1775813028369;
        Fri, 10 Apr 2026 02:23:48 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1c39:1fd5:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d592db30sm52202595e9.10.2026.04.10.02.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:23:47 -0700 (PDT)
Date: Fri, 10 Apr 2026 11:23:45 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mohamed El Harake <mohamedharake2006@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: avoid ACPI package count underflow in
 gmin_cfg_get_dsm
Message-ID: <adjBdeW-VJq0gHdM@gmail.com>
References: <20260409214158.3248-1-mohamedharake2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409214158.3248-1-mohamedharake2006@gmail.com>

On Fri, Apr 10, 2026 at 12:41:58AM +0300, Mohamed El Harake wrote:
> From: Mohamad El Harake <mohamedharake2006@gmail.com>
>
> gmin_cfg_get_dsm() iterates over ACPI _DSM package elements as
> key/value pairs using obj->package.count - 1 as the loop bound.
>
> If package.count is 0, the subtraction underflows and may lead
> to out-of-bounds access.
>
> Use i + 1 < obj->package.count instead.

how was this bug tested? and is there any way to reproduce this?

--
regards,
jose a. p-a
