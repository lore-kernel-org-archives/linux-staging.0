Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22612AE69
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850799; cv=none; b=IrO1LuphTQWxkPYrrMOgncW7QNDwSMzEUGqvA7U3yi5ou5KgBuhWFYnSVRi0rb0XPzDwS2PAkydHi9VgnCCW9P83NBfPwoH46P69POBov0h9WSDNBNUfHOSH+xob46rITdxkeV+/W/gVEhnowC4DzjgSnIR6fHV5VBq/JcIaHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850799; c=relaxed/simple;
	bh=YAS5+GUEHwVduH4rwHd/rC19Nkw92l+oej3IXK4AgY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryrEiQPwRV3WR1MCq4+eexUmiQyq1RRUmKt3tVFqNCJvO0WZkdwKlhErf+PWm44wggXnKABdfEReZGyJD8+r8l5TVMUMZME47m0zYHU/W2jv5MM9PdX0+FkPzyieM8McA++yJ37gYWDNy7JJ49JWbhwJGUBRwWgc1U8LIRhb+48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=kZBOFLgF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="kZBOFLgF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2260c91576aso1907205ad.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850797; x=1745455597; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TeLoQ/UYs1n3T3DVaNgpAsmgWZp6GaYK+MwPlSRGTSw=;
        b=kZBOFLgFn0TxX/z/p/3MdZIOXboFim8y5IkXlB3Lthy2R8dXeoIxOfZSKFC08HECqU
         tr85xExR6P8frTYh27Dx4x8MKhdrp/dfgnUmuhCY+hI87qiN8L5Re9yhV0rcRjqzRA7V
         AtX/1m5CpypByZ0K2sZRG9coXeFoaqDkcxwGrZ//IeEcRMt53S7T7A8Wd/XgIu4szmVA
         zwTmLHE5yacTu/LJCM3cBpNdSUPzeAWtZjEegmnJQ6KqiLlfhOVTdFDXnmScFEkQesDx
         1UQKIU2zzGh9ltGG3KrMNWL6EZn3LYk23O8w+2bvYcnZxxsQK86Z3+0eMIshSrb4s2KV
         pDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850797; x=1745455597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeLoQ/UYs1n3T3DVaNgpAsmgWZp6GaYK+MwPlSRGTSw=;
        b=sKAB6DG7JxbCvS85ZLT6vbwF9Jym+pr5d++fXVtVVQxl22G7MLpIYT7Xy9AoIQzs66
         afBAkfwri3+yF/NtMSFyeHnY0Mlc5dRrN+PZoc7M3BehZo3x3ghrTNMM4wndTOPD5KwY
         u4xdDanGNEYjwFa72dUAwoJ9kSt6FiQf+PtJdNBaBqPhPfthwqg+1R4bx7YxwTeWBnhW
         WVaT2enjHge6Cqn+OD40h5P4HFSsqB1hVYUxSDzE9ed/YkBPTWWJKNYGPA5RiUNr5kLU
         qnpx5bIhR7Yts05TawMPW7Wq5dT2K8gO2rTRYdT+fispA9naim60/iLABSZQjh7BM1TV
         0RSA==
X-Forwarded-Encrypted: i=1; AJvYcCWmmAeA7+G5+8n1Q8bfXYRR7tCyF35THHMhyW2tkoVGxlSD/Vbf7eAa+id2UcB3MELzigmkRvPtzgJWHCYT@lists.linux.dev
X-Gm-Message-State: AOJu0YxdWr0vBmSQUqbrfh+dSyPAfBYeLKH/2C4cHX/0r5WLJSMMROIG
	DidmsmOiNSSBM2Q3xsVH9ASRJ/J446R5mvFMWkzwBtusfIcZL+kdrJMGhJMTWQ==
X-Gm-Gg: ASbGncuiyND11dggVX1hTl8OBru+hxwCf0n4+sliHn1FFoFyCEcgPw6i9I0jlqAZKOQ
	Vb8v865CLpvbb/64wGBUf3eU5rIGtwOnxNU061urPjYwN0p6k5A9FEMFAhdEEnC1DzKUmnEBHhY
	FnZFLpSuBTIfRH7YOTXPR8OPLjUZjrL8rSCSbOLVXkWdyr+3z7TyiqKZQTfRwmBiitdgpUX0yfl
	Tw5llmrFXNY4/x7+qmlmqp8wEE7YNMonCEi6vl9vw+vvCRvEiGyE7ZAZZMVNRgQ7NrvDUUO6TZS
	NX4nc8fcvEEpcZAiL/SgDSosHr0xCyMY9HYyn7UuP+wI2SUCbshkKSoBAZLqpNVex0URl5oQyqv
	UxTbEfg==
X-Google-Smtp-Source: AGHT+IG9OH3j12WASxNXpwelI1Q9a4h/4hUcpL+nlXZsuQbgJp92YodXxQVfhtEwvmGAfZZzvCB9ZA==
X-Received: by 2002:a17:903:2c9:b0:223:6657:5001 with SMTP id d9443c01a7336-22c3596b92amr71109105ad.40.1744850797089;
        Wed, 16 Apr 2025 17:46:37 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe4de0sm20906765ad.212.2025.04.16.17.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:46:36 -0700 (PDT)
Date: Thu, 17 Apr 2025 00:46:34 +0000
From: Michael Rubin <matchstick@neverthere.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/23] staging: gpib: u8 over uint8_t and u64 over
 uint64_t
Message-ID: <aABPat7WxeVBIOQ5@tiamat>
References: <20250409180953.398686-1-matchstick@neverthere.org>
 <2025041519-drier-decimal-8a7f@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041519-drier-decimal-8a7f@gregkh>

On Tue, Apr 15, 2025 at 04:45:58PM +0200, Greg KH wrote:
> On Wed, Apr 09, 2025 at 06:09:30PM +0000, Michael Rubin wrote:
> > Preferring u8 over uint8_t and preferring u64 over uint64_t to adhere to
> > Linux code style.
> > 
> > * Patch 1 - Patch 22:
> > 	Reported by checkpatch.pl.
> > 	CHECK: Prefer kernel type 'u8' over 'uint8_t'
> > 
> > * Patch 23:
> > 	Reported by checkpatch.pl.
> > 	CHECK: Prefer kernel type 'u64' over 'uint64_t'
> > 
> 
> Only a portion of this series could be applied, as I hit some patch
> errors that I couldn't resolve easily.  Odds are we are out of sync
> somehow, can you rebase and resend the remaining ones?

Done. Hope these are the right ones.

Thanks for your patience.

Michael Rubin
