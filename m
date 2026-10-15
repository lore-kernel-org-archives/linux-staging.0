Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB854A4409
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055783; cv=none; b=Vl/SDL/iueX0I/Odc011TZsPockdrjSydYvrvSFXxdj91DoItnh3P+ztbil1HPYWARPSNGDwuzDmvvkzL1f2JgkXyLvx1YD/F+yiQ6dg0NjHg0H8TsQy2PAJ3LWV5+/ERSL+cQNMzyp1DUsMXEC0TVz4AUcSG0skAmnY/ae1jpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055783; c=relaxed/simple;
	bh=d+LoCfQzYtpW/IWUXLFg48AdckuwZjQPlTysxuLcw7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+8HsM8bkrb3O9NSHBlSYwdTu9GmPygYV4SGhaz+BHVMdBm/mV34YOA8wk/07R/sgNzgQCq7f18GDqBwxP64LgXTQ5ugn8WYAmDT2Nl3FxhzsR32Buabo0FSCaUjLk1gEOc1kk012PBzezMjhap+yx6zsTL7VQQHIezR7HIuMnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gq1yntL4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gq1yntL4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so127666f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055777; x=1792660577; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zPswPkxM51QxAc4ujE8Pa9vdpPcFbihk+u5+fO+7z9g=;
        b=gq1yntL4eTSoTt5Ntu3IVXgjAev2kD7xHX7pIe8RRVxmb/dCsZOdOIhZb/uMsiv9+t
         YVgIAOKbNyyv3ozOKoSierS7CJ66RzuMBPPX3oM1dEfO/iIqG93cx1rbUgVdXh3to/lO
         tmkMWjOn+weNnKtEGt00iRu64BMIKWXrXw/w9O8MmsI1xBkxKT5WIPOwj9s0qDG/dm0D
         sBYZT85mWSGoEZ0B/aTmtQispiNWJuaTFZ/brzXfGe9WeAZrBzQWDLbA8rUF2h1lxYg0
         YynV1CSQJdmkwW3Z4rk2t71V3rIBP/DLXVUpH9QBkmZnPjRKsS4oTF6U/CUbAj4hqHjV
         WJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055777; x=1792660577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zPswPkxM51QxAc4ujE8Pa9vdpPcFbihk+u5+fO+7z9g=;
        b=XVHKJI6tBfMV7hvvZgOlqe3dsCZn4i6CjuTTN3CjGK9dXJe1FjasYJBOhG+/8GPIER
         EVAdmGGKBgaOcsfwrBu6R6ZlHFN9TiDSnad8wzlWDiS5mr5NgFlHnNAMy/PjaFeVOxgJ
         zMn4dYHq6Y+LZ4QTVNIpkXUQhoe0/pgpfKSR8SJxThYWOyClL6kYm21Q6VxS0ZHXGk06
         dEOOe81QGZysFhSGAtzPoPn1SVj+iCKQFxc3RkL2OKPRkPtI5evmn5RACcZSXEyeiFjS
         EsLWE4Z/OUcKVzoLz2LOcHkkdlnR2iPqIMQFC2ACtZinGXG2BurowndVP4FJ+I18Tx7r
         LWBw==
X-Forwarded-Encrypted: i=1; AKwUvBzsyeOF9t059zW2/68T3Nzie17eJ3FKR9yrsGvuFUs7gR4/H5Po09WZmfhQ2t/l3tI6bK3m5BhTNqUcds5t@lists.linux.dev
X-Gm-Message-State: AFq9FYKoELbRzapfxliYVjlqrbO1+b5E/1pj0rdcKCZvtCMUkR8EgGCm
	N72nDR21C+P0GYD/gzllA+T3NSh/yBsn9CTS5FuB4EyZxnpSFxTKNopm
X-Gm-Gg: AYBFou0b/wVJJHygo09H+rfGj6GUgsF9OCjKmY1nvy1jcQ8HuLPEilcyfylsKz21P+J
	8H8LmyU19a+r2iI9ZH5fMm3e44+z4gE99ZkRNrUztlSdZPxlLgwyMS5sugjdvEMBdAvIE+BQ6mp
	9IR7krW6RKc2o2QhZyBHU1wH0gUXlv52xuXopYQ4ja+ipKmbACGdM/G0xyeyqaixRRVwpUb9tg6
	eBIOVEb7HHjyJvRFkRE/l28BCoxqSFa2D62rAGD5IRBR3ylrC2Yo8cJ1OnarOk2NBCUMRDXUHIT
	vmKrR3yrgWYo5ex5JDc1hAakPAhkCuZBAli3iWnVHwe8OCNZpBaCrde+FBN1QiFyjn6C6efUE5b
	ct3fLESazcQ47mNZiQKRmuaXtPRFx23ONK8/GdL/nEZXYZ+VFOIYjSajq5KLLc7fS9sAsHCqecW
	drcllOmXQixvdXuPLAs06MtlFKpPtaJWhPs5BrIAe+KQq6ad2hoiCQ3j/q+nDmbPCkWwo=
X-Received: by 2002:a05:6000:46da:b0:48b:68:594a with SMTP id ffacd0b85a97d-48dbaadc11amr25711396f8f.12.1792055776837;
        Thu, 15 Oct 2026 02:16:16 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa34sm17339207f8f.20.2026.10.15.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:16:16 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:16:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: fix list iterator tracking and prune
 dead validations
Message-ID: <atCZ3PvVh6kzaGql@stanley.mountain>
References: <20261005042911.64922-1-marinela.selseth@firmwaredesign.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005042911.64922-1-marinela.selseth@firmwaredesign.org>

On Sun, Oct 04, 2026 at 11:29:11PM -0500, Marinela Tatiana Selseth wrote:
> Automated static analysis runs using 'make coccicheck' uncovered
> multiple critical logic and validation flaws inside the VME subsystem.
> The file drivers/staging/vme_user/vme.c contained repetitive
> unreachable checks testing list iterator pointers for NULL (such as if
> (!dma_ctrlr) and if (!lm)) immediately following 'list_for_each_entry'
> loop boundaries.
> Because of internal pointer arithmetic designs, these loop variables
> are mathematically guaranteed to never evaluate to NULL during loop
> processing.
> 
> Worse, if memory allocations failed for the corresponding structure
> images, the error cleanup paths ('err_alloc:') attempted to acquire
> spinlocks or mutex blocks using those same loop iterators. Since the
> traversal was already complete, these pointers held out-of-bounds,
> scrambled memory offsets, exposing the kernel to critical Null Pointer
> Dereference panics.

AI write too long wordy commit messages.  This second paragraph is
also wrong factually.
1.  The check:
        /* Check to see if we found a resource */
        if (!allocated_image) {
ensures that we hit a break and the pointer is valid.
2.  It wouldn't be a NULL pointer dereference, it would be an
invalid pointer.

> 
> Clean up this driver architecture by removing the unreachable loop
> checks entirely, dropping stale, misleading warning statements, and
> routing the post-loop lock cleanups cleanly through verified
> allocation tracking pointer references.
> 
> Assisted-by: Gemini
> Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
> ---

If the bug were real as stated in the commit message then we would
need a Fixes tag.

regards,
dan carpenter


