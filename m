Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1CA36E498
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209411; cv=none; b=OPmM/SdNg80rBhcWMHjShc45wmi0lO0IzbnyTb6CRZyDQPpdWGuWdZtX0e1rR6ajpY26PU5UnAClANXa7qF9tQxNBTdiscpofb4EMRlXc+m9P9qkYy/kx8ZU0MATNyC7nyjwjQu1K0u7OXV5UJ4dA6EwsPcYdVSpfxFLBIUGgVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209411; c=relaxed/simple;
	bh=IZa2b/bKIUVbQEsIFNcqFepsS9HbTHwv+lNxwvHjug0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihDer+ahWfBNJ+bhPs6kl9bY7D0A0SzIDtogoa2+cSR04VfkVmG0Mihrc2GrgJaqbJaQhi0wKocu1PjdJm+K2G5JTofZ4UIll7QsNe7nC05cDL0XYub+rpLGta8Kr9iShOQ2h3yjHvwV/U4TS0zmCiYbdLWGMNpevrblUPwTHYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfvqZUh3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfvqZUh3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c07ea058c0cso907032866b.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 03:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782209408; x=1782814208; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+hdGl6cvLkiqtELF0AM3JFW/5duEk4eBhpz7MLeghc=;
        b=LfvqZUh3WNsO8Z8T4MgQPo6Ax2Oe9S+LZi8dWCLTvMQzvoZO2MSH5QSLofhaXD9wYC
         EIaXxHeuD9a3t546KvSmBQd/Q30Cj9vhbgO02lB4Gl7JZ0eiO6C+Hk20RfK4pw5Xrq3S
         k87sEphyi8hEtVEFdUlxyp/+j1gk7UFFUna/VhRJNppyhmxWeFVTCXVrjm+68I1kjfWK
         7rOnl5XDkA2ydWRW30lfrYw8pbPd85lER1rspqAC+/exB4xnZQKausCv7yr/PcKR2vOL
         Qein2gt5zuFL1CDK4roZKba32WDNbqwjKy7lIxIpvFdovrdn1sNg/HFn1NIUmttSBisr
         4gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209408; x=1782814208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+hdGl6cvLkiqtELF0AM3JFW/5duEk4eBhpz7MLeghc=;
        b=J1jIRmKFPuKYTSetKrsi0IUfPHeocazausBtp5JhjkJY1jlrQa//5EwAXDKRA3n1qv
         4OLJ4+Bzh/AGPt6eDZtUhI47qxh24rlJLns+nE3jnCkZDrKnLWXqkgtXok35VDV281fu
         fzvJdQxlaukGDGCUqEJBsYRgOQKq97d1f4oKwOCMWJ4zpiPlcN361GPnju8mwKp/obPS
         jIBoesx/4pO/yqNvnBrI55gQ3mdEtNdpJkeRb77OgVk2cO/TXV8fTsgoblWScU0ktIa2
         PFxe9qn/1mzYHvxuoW2eiWtio/XMxqmovIxaIxymINObeQyd2RGDKE7+JG0ts5/cqL4N
         MYAg==
X-Gm-Message-State: AOJu0YwOGwmnnQrEJVdns4fSxUUUbMdVupeIR6CUqP9rd+wvNszjAuz9
	rwKq4uquLcvZ4zAfxYAcZN60iEr84DEQKWpHWtdrWmC/XXENHlOU0O/IjNT23w==
X-Gm-Gg: AfdE7ckBuJ2djV8sXu5Ot3vPqm52py20csbocH+PCEYfSv8K2bDAT5RR38kJf/70Yna
	AFrWmgk5R0okV8DT4qYKirGF1uCXXOX9GPNmnReUzr8xQw8uX8BjF4M2Qc6cWGFIy/6d2BrJUTw
	IQJv9PHDBBq9ztxb1024bW99QESQNeI9rMs5Se3R8pwvzkpczwqSjJFf8g7/nzwfiIcPEQi0rIx
	/4tLkhoQ8uP//X4jBZIC4sGD+8GQOoP2U1sgu2XYnXUysEMQKiijK034wTAy+xvN1blr5kWEiqG
	Gwg2mW8qGphgwShrT58Neq/SUVTftFpPkYNWJaQsxMrDQWzgE0poGVmbfD6pS6q2GcJX9pNPrc+
	XNMm5jWdp0tWIHSDs3wbuV5P7rxqdxwkMNTtyU7Nf1nYSRbn6AgxluN0HSmkORRTTy/uePhM5rf
	M106XNv6N1
X-Received: by 2002:a17:907:da2:b0:bfb:b43a:b06b with SMTP id a640c23a62f3a-c107f8af750mr103934966b.34.1782209408146;
        Tue, 23 Jun 2026 03:10:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60bbf2b3sm486957266b.39.2026.06.23.03.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:10:06 -0700 (PDT)
Date: Tue, 23 Jun 2026 13:10:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: Serhat Kumral <serhatkumral1@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, lgs201920130244@gmail.com
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: put logical continuation on
 previous line
Message-ID: <ajpbemasSine9w3i@stanley.mountain>
References: <20260623100535.5752-1-serhatkumral1@gmail.com>
 <20260623100535.5752-2-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623100535.5752-2-serhatkumral1@gmail.com>

On Tue, Jun 23, 2026 at 01:05:35PM +0300, Serhat Kumral wrote:
> Move the logical operator '&&' to the previous line in os_intfs.c
> to conform to the Linux kernel coding style guidelines.
> This fixes the checkpatch.pl warning:
> CHECK: Logical continuations should be on the previous line
> 
> Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
> ---
> Changes in v2:
>   - Dropped the third patch of the v1 series (msleep to usleep_range conversion) 
>     based on feedback from Dan Carpenter.

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

