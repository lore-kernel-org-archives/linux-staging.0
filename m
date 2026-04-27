Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A09A3B0AE6
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281459; cv=none; b=R9IC/9NJfGpjNVqQ7g34DzIUP6XSUSdL4Ko9Ua+3qHzQBx/VaKp0FEv3BpErct0RiTM+3xx/fBunkLTKiUbgLF/hZpKCIL7cHc53rMYz1KbH7cATaz18duwmvnt8OiiNE4f1xe3mZNwshjPhbc10M8+pq7xK7QiVc/ANxvIbU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281459; c=relaxed/simple;
	bh=AK5Nr9EoN5hOrQTMs6gBN4bUgtVt4eaQKkUfxTX/NVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWqtNhO43rwyd2Jm1WujotxIwSTUSx5NOw8VCkjZHr6GFwzUZEd/vBCVSWNDJf0HxMV70PRPpeQxH0/q+2Dq34ihL0H8DTn5rc8ygRg1A50Tb9grrtqXmjvTEaYibvKB3Dejd1/EOzSlx+wf+GT86Y3Mmngf+zpeFWJSPMaDNP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd68n88c; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd68n88c"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso48737825e9.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777281456; x=1777886256; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T3BZLzJKc7teyfIfzvCeVwe77Ber/OGeCZ9vw2twToE=;
        b=Vd68n88cTaa0WaKoXwLWDv7hmzT/PA9GYl3TyyTCguhsNpWIisMuyt6dT3kdlr8XDv
         RMC8eRt0NxXURcuPESkjOkspqx96sqs/h+9KPCKZQP/k4GLovOiicIxEeQSOGJNeYQva
         UDuC/0dsWdEY9e6ZECxpV5ZFuY4fbKqVZcmwDaILfoeuA9fO2Q4q8apwDIl7qYEwKfsI
         UHjNyYQvqRPMVoSiW/Lab6tX2fcRmIyM6PcJe8w992xRU5dGTAK2zIC2pFpIL9FjaPZh
         9HNl7OpyvJWttT9gnCS5vjfPmWnR6hnrOkPzoEGAoIPND1SzsizAe9s6Pg4FQ8+Gup54
         B8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281456; x=1777886256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3BZLzJKc7teyfIfzvCeVwe77Ber/OGeCZ9vw2twToE=;
        b=i24dPjRxi3YD1M+chzllRnO0Ct8Vm3cTOhFUx5rXERSVIvem5Lefk+6kA48RYqmPQ+
         JHCLF9XPdDYm2gtoYHkc7kFjC+bcqSOom+coiRVSZbb3Kq+ybrqqaKR9t2gHD6jFvJXZ
         cAFuEDWou9zRl3uaGWrZv9STfL+LReTDSDLBu3TpoPO+UnAGMHUA9Re3r2+aEgEezWdS
         HFd6zm+mevgXsyaymmCwoY9gzkACKNqn8hSEitPQGOXNjLe+YOL4n/fbQU/D0tHfQVj7
         mQKTl7ga4E7L5fr8c/3lxVykMPp/CJ3vdi57vvJ5q3w0yRj0mJ7sINkLUvMoGc8t3DRp
         4vgw==
X-Forwarded-Encrypted: i=1; AFNElJ/KC3W3YqoPL9ZPQedAjwNBqZPklVJ9tYB4TYUsjaV6ALbzNFYYNqdKo4bs0Gef/fBkW2je6wLmz8E0k90G@lists.linux.dev
X-Gm-Message-State: AOJu0YykggIdpHatG5YQPDTIQTSBBW7LmhUpPL5iZ4BTaVqzk+Z9yJOP
	yfziif1IoWFDwTuOiusoGAZ+0b8tLUqZt8Ymm1BBPByH6UqscuBmoVKa
X-Gm-Gg: AeBDiesknd4DmMmTMR/VTD12mIxSOK+XD0i7cypdt4hz++k8RW2EHvfeuRR8v0NvS9z
	AuBlhTm/XV3vO8pnCTXhT3iI0twWI9VwVVDov1cOEGz2VvLBg5RAbuMddmy+DPg5d1UWP9NGzTe
	MCEYNpNb0AqAO2yD1RNoCbs+LJ/cjchO3lHzWxQ6tQpkhmk95AyzBAw/TmnCM9wxlCmtVLSX/RM
	VflPIx2elzxqmRmAIGSo0FjaElC4hAv2YjG8rvW6odGTmFP2SwWkv6vtUbJFCPWtR2PaDpzw0fl
	Ovngfvt6wUWa66J2Is/oxrnsKT4meUgx+CpM5hdiC3iI9Vk6ST47gBuvexUSe4dpoadUbG2kXil
	8MjSkdXOArZ3USp6rAPP1kdR4me99QSLerTdPrEn1Oe011dsMX+ep4fnPzvG+DuTAfSMoTbaZnn
	46U9ahY2bJGmpcbf+HzC3SvDfREMtBcA==
X-Received: by 2002:a05:6000:2303:b0:43d:73d4:b34 with SMTP id ffacd0b85a97d-43fe3dcb1e9mr64195158f8f.16.1777281455511;
        Mon, 27 Apr 2026 02:17:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm107033148f8f.36.2026.04.27.02.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:17:34 -0700 (PDT)
Date: Mon, 27 Apr 2026 12:17:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, luka.gejak@linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix OOB write in
 HT_caps_handler()
Message-ID: <ae8pq5YzEe2wTJmx@stanley.mountain>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
 <20260427081748.3407939-2-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427081748.3407939-2-hossu.alexandru@gmail.com>

On Mon, Apr 27, 2026 at 10:17:47AM +0200, Alexandru Hossu wrote:
> HT_caps_handler() iterates pIE->length bytes and writes into
> HT_caps.u.HT_cap[], which is a fixed 26-byte array (sizeof struct
> HT_caps_element). Because pIE->length is a raw u8 from an over-the-air
> 802.11 AssocResponse frame and is never validated, a malicious AP can set
> it up to 255, causing up to 229 bytes of out-of-bounds writes into
> adjacent fields of struct mlme_ext_info.
> 
> Truncate the iteration count to the size of HT_caps.u.HT_cap using
> min_t() so that data from a longer-than-expected IE is silently ignored
> rather than written out of bounds, preserving interoperability with APs
> that pad the element.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

We need a little change log here.  I was hoping you would provide
a link to the AI review in the changelog.

I feel like the AI review is probabl wrong.  In this case the
original code corrupted memory so the code didn't "work" before, it
corrupted memory.  But I'm interested to see the AI review.

regards,
dan carpenter

