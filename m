Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB683385B6
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253560; cv=none; b=eoK/HO2azMzyGmra5dTJGdwWXSMyynt7JO5aLQqbtrPvwgq4nvsEokz0gkIEW2EY8YYGXi+vQNq7b3aeHHoPFWh7AxdwT586gpD5PdUIXzjqjuGunVO8cCz/3qTjZMQ2vKeizpUudjDTvv828XZKH0HRviryJVdf6Y32YzaC3O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253560; c=relaxed/simple;
	bh=VDo4it9UlR4Ioy8LhcAXVYqM6+ETaNhl9l00CrRvZx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LodpB1nWSIeG+9cja1/wEVsYP1RKoWPII35GxsSZRx+UQpmyZyC9asLYGER7BlESfH7gtp07DUHZg1zQ1nEawA56We7GdNi7sMFAbvJv+hNBpaILK/g/0ynqvkqLD5rw0zyPddB15HGR01toh34SqkKv2ZfaiObhw/pvwNF4fVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbEE92B3; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbEE92B3"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3613355a91.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 08:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253558; x=1785858358; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWiV0+CUdqlaiqVq42BuBLs9iZw1MGlogw86iDmjrO8=;
        b=qbEE92B3Ir6T093lEUnhJ1RicbqkiQ3MypR2Pt4Kdq8Zi/Va9vzlfjMVthwLs6qxxc
         TvWimjJ2miU4gQ2ph75KLXUZC+ZbgErGnrpu2rCWPaQuvPGdFE85zOB5CJ/2tuY+ehpn
         qdsb1fQylrWvQLgdOzMKb8xOBR+erpjGet3D5HwRaC71yZy8QYV1UJmlEmsxT3GqGtB4
         f+D0rx3xNRpI0wkuOQhwNsHZicMcHITh1hgEzsSDDhJIlnPnwJB5Un+7pNq2Avwwb26T
         HfTBmr99X7zp8oSXh5dUKtVTNke5FyaYVNr7mW9JAJL7q6y6H4OJKyPD/m4IQnSPlBJo
         ymeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253558; x=1785858358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWiV0+CUdqlaiqVq42BuBLs9iZw1MGlogw86iDmjrO8=;
        b=fGFE+8zH7VO33QwaJR1/OhftrFE7WoM2LILf6BzDc3X3nGxh7Q/qLjm0JLj21O5S9o
         YcT08ATPcvgf883Ss9oyrajFbbtGAudV8CXYUvZOzDGEH8BC0l773F9Bh27ZhaFgA20u
         urkdb0T0A4qDDIKabxy4+BxQMYjR4kAlWUtddnPXQEnJ3G4h3+tTLasTCbd9SXZ/CRTt
         8UJr/I22HIxVJW0ELCDBmQBGj+hSbp5Mti2iRJNTsxcfnQI/K5L18cwVvy9p+6HNcGYa
         Ikd6lmIiZH0Pa5cfrNmUqVtI83o1R+6BotaarjnYh9QrsAYnQBByhMXbxEa1KPt7SgdG
         UqsA==
X-Forwarded-Encrypted: i=1; AHgh+RrzgdpB8MTKn6saIqJbXnQj6ljrcwwar0ZijHDABpjn/s/MWw3zsrsX574SQbGk+CzfBs5TRDHgSFOntYqM@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/X24DYDCHBYBw9iIUjOTnHV3VazzjYEq5LtmZLuYKPIbCY/Xe
	z3T9q39VKvJ2rMU0J1bcMqjWRMg7NaihPeK4ttLYi+TqgnZwMR7lxlg/
X-Gm-Gg: AR+sD13Rj830oFk3u/pnACFQbOc/lbjABGS22IYXThr8hgIMTxkgX3zctMcFAWNf4Ep
	RZEyrtnpMspgHDc44iGcGpCBbCpjImVYdOIY8jXmW08hthgjJd7Pm/L0FrwTLsKF7BfSydbxA1D
	d5ZPqMi85cjZDscWQSSqcus19PIqOcWtdxJexRdmYc27BaVWAYxsyOoE6yuh+5+9R+vmko/fzdw
	iBnVZbrttjYCQG/xPpiUrlfh4H395j2VTEG3hGMuBOK0SVfm/BQ5i5D8FLa9ipMPZ/JoKoJzDAo
	ViW7V9v3ufsUPMwG0PxVCSsNZPfURexVaRdiB2VF2GaYT1wKuUygc5j1YRx8p3l9/swNy9ivhM4
	lhgNIznFT5jocBSd9zsJDULG5dvSjHt5WUEWEL67+gk4+jZxzRV58qrVs5M6Xyoh7JZGi0a0J1i
	oF4OazX4Y=
X-Received: by 2002:a17:90b:33cb:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-38f6a37699emr3215736a91.19.1785253558298;
        Tue, 28 Jul 2026 08:45:58 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f056202cesm4465321a91.0.2026.07.28.08.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:45:57 -0700 (PDT)
Date: Tue, 28 Jul 2026 18:45:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] staging: sm750fb: fix mono image source stride
 mismatch in lynxfb_ops_imageblit()
Message-ID: <amjOr0NiY8OMNaRf@stanley.mountain>
References: <20260728131050.37032-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728131050.37032-1-meatuni001@gmail.com>

On Tue, Jul 28, 2026 at 06:10:50PM +0500, Muhammad Bilal wrote:
> sm750_hw_imageblit() advances its monochrome source pointer by
> src_delta per scanline, and computes the correct rounded-up stride
> internally as:
> 
>         bytes_per_scan = (width + start_bit + 7) / 8;
> 
> Its only caller, lynxfb_ops_imageblit(), instead passed src_delta as
> image->width >> 3. For widths not a multiple of 8 this under-counted
> the stride, so the source pointer fell further behind the real
> per-scanline layout on every line, corrupting the rendered image.
> 
> Rather than just fixing the caller's calculation, remove src_delta
> as a parameter entirely and have sm750_hw_imageblit() advance by the
> bytes_per_scan it already computes for itself. There has only ever
> been one caller, and that caller was passing an out-of-sync
> derivative of the same width/start_bit values sm750_hw_imageblit()
> already has, so keeping stride as a separate parameter served no
> purpose beyond letting the two calculations drift apart, which is
> exactly what happened here.
> 
> Rounding up, rather than down, is the direction consistent with the
> rest of the fbdev core: struct fb_image mono bitmap data (the same
> image->data this driver receives) is walked elsewhere with byte
> strides derived from a ceiling division of width by 8. The generic
> mono bit iterator in drivers/video/fbdev/core/fb_imageblit.h advances
> scanlines with "iter->data += BITS_TO_BYTES(iter->width)", and
> BITS_TO_BYTES() (include/linux/bitops.h) is a ceiling division.
> sm750_hw_imageblit()'s own "(width + start_bit + 7) / 8" is that same
> ceiling division with an added start_bit offset, so the caller's
> ">> 3" (floor) was the one calculation out of step with how this data
> layout is handled everywhere else.
> 
> Found by code review of sm750_hw_imageblit()'s internal stride
> calculation against what its only caller was passing in, and
> confirmed with a clean -Werror build. I do not have this hardware,
> so this has not been exercised at runtime on real sm750 silicon.
> 
> Fixes: 81dee67e215b2 ("staging: sm750fb: add sm750 to staging")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
> v3: Added the version notes below, which Dan pointed out were
>     missing from v2. Added Cc: stable@vger.kernel.org, flagged by
>     Greg's patch-bot since the Fixes: tag targets an old (2015)
>     commit. Added the rounding-direction justification Dan asked
>     about, citing fb_imageblit.h's BITS_TO_BYTES() as the existing
>     kernel-wide convention for this same struct fb_image layout.
>     Moved the "no hardware" disclosure from an email reply into the
>     commit message itself, per Dan's request.

Generally the no hardware disclosure would come here under the
--- cut off line.  But I'm not going to nit pick about that, it's
fine.

I see also that the "Pitch value (in bytes)" comment supports rounding
up so this looks good to me.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


