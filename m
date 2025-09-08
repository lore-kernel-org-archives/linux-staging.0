Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F334221546
	for <linux-staging@lists.linux.dev>; Mon,  8 Sep 2025 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757345056; cv=none; b=Ow3lS+ZSDO8birbcFvmtS+rVAaS0HbUrfZty7b5GRg55+rO7DRr2Rv79wpi4FzzNDAeqvh1mKkMm22uA+oZpzJ4kSjveMRfM2Mk7Tl7e3hanMOtiam9uJkIoCustEFMlimJGcawaaC5XnDSYY+uEFAC0RaaWSUMUKP47BZ0wrnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757345056; c=relaxed/simple;
	bh=Ul6hlfdYbZgnkB3U4DVdpwBW0/N3398y4eK7duR9mAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg7SRnBIa6+ejCyFKpkl17po5sjb5rUrKXb3AZhdNlm4tNj0Xqrgb9WeGojYN05KJJ42jEXXMow3FyK9MV+8HImivQeLarDpWS/JrvTkFIMUbCgbZ+r1cwaAncpHrAR5Cg2A6yjbpIbrheVHtNkMgBGpYAgE/pJGsKZ9HPjfu1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rB4lwj1f; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rB4lwj1f"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3dae49b117bso3998255f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Sep 2025 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757345052; x=1757949852; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpRpJmkBBhBD5b0lfqHYrKM4X9axaME4RCmFzxuQADg=;
        b=rB4lwj1f6+TG0yotOie9MB74DqBa2FqJwl8uUUrYVSHy73HI3i393KMXDFhYzUsFmF
         fq8sG+rnZGfQW+9ZylJq1YDTWdMFA7hJxzjKKn3YJM0c3DOBxZ9Fbv+uHGLhALl/hvnz
         7rS93KNVKS0tToTAQCOqWwRbd9eOMo6NnjWhbqBzo3PMznhmIdtEhjuwFvbwKHgWJLnK
         6vlp5147II19xopBJNAY7s4FSlyaRQZWWjIREf7tCl+rDa+gtyUSq5t5Il72Ru88vtIQ
         enespTLv8LF+Fpd7rCqQxil/99UVzxxgKhDp3kugS7esWU4njsEx4ovlhlJvlfK7QLf3
         Lzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757345052; x=1757949852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpRpJmkBBhBD5b0lfqHYrKM4X9axaME4RCmFzxuQADg=;
        b=Y23WPgnbbXz6mPfoQb0JQGo6WjVEr/iUmkWTEmrt8D4eu7jK4c+2o1q4ijibadvsXR
         zbsCLSgzy3W4l4fmNV52s+7fgSzWXqGku7MD1gTV5g7BPJM35kbroVTTisGd69q89HjQ
         rVfPs0bjSB5a5Ox3V2RNL969G5KeJmUhs8A0ZI26ujvI6gGIqe2VpKZ/bmUck2pdDtim
         VPXIVWhwmjBXedmo/lkLTQTWE/D/OPVchzltdck2f95b3sf5BYDB1b3W6PYcs9nMIVcR
         ez+oryhtUecm/ieRBsbbihGtQ2HdxKjfU1K/fCwkLmU8mz6fwg3B642rm+d7Op24UMXN
         qalA==
X-Forwarded-Encrypted: i=1; AJvYcCXUIo/1ksY4nY6SuT35q1OXymGj1QIgq8LqqeikbQabID8jWxcPnO9Z1cptiSlvyx7cFTrXQUsYLqqlvM/j@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8BBbzqsP0MiAmD54h/e4/BGPLlLHOFmxA0JZqbMkLe3v7FlLF
	I95B1gHM2U41JrpD8Srghw4vfmzju6KBhM8x0WMuAJhYcz/gfvXgsc+0UifPee4PPew=
X-Gm-Gg: ASbGncuxVszicPcfn4owi+raJRg0lfUt2OVs4QQDkWkOgijR2HBzyxqv59sRuEDv1pC
	tleTwBSL/348NaFe3rH0epslVmsO3kzyZ/G5WN4LGJitIHUs/5anh3ndEFZ2PscJ1XDzcvjIusg
	XiMruLI0Sj0SawvSIg9PcCtqJwTv6mKpjcd44xu/DVwtFq2gPE4klpOO4cdxcSBHB2rj3Ux7vDu
	hd0B4oqyA+0fWLARUZXqGF9m+YbeRBb+JEVJMXObKjADIeaHEtSlAa+gy7IBE3g2bZx8YlSgByk
	zLQV6R9o5v7o91VdwsnKTy+4oQbKXoN/NT3Yu7sLKoUhoqrOXzS5vVLCFdzM5wVmkDsYT1/ZXWY
	FAoSFCiKUAxke0KdcFsZqLrZiIQ8=
X-Google-Smtp-Source: AGHT+IEn637DyEwJnrFNRHZCc2UTlG/gZ2HMTDZnWDtxeuY8lE5usCiroODZ2mgOoPTIpShA4kFmBQ==
X-Received: by 2002:a5d:5d05:0:b0:3d0:ae58:e337 with SMTP id ffacd0b85a97d-3e6423fea50mr7224457f8f.14.1757345052575;
        Mon, 08 Sep 2025 08:24:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e329475a13sm14010482f8f.14.2025.09.08.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 08:24:12 -0700 (PDT)
Date: Mon, 8 Sep 2025 18:24:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in hal_com_phycfg.c
Message-ID: <aL71GP45JuzS2XMl@stanley.mountain>
References: <20250908144641.39518-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908144641.39518-1-weibu@redadmin.org>

On Mon, Sep 08, 2025 at 11:46:41PM +0900, Akiyoshi Kurita wrote:
> The function definition for phy_StoreTxPowerByRateBase() did not
> follow the kernel coding style.
> 
> Move the closing parenthesis to the same line as the argument to fix
> the style issue reported by checkpatch.pl.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---

There are so many other functions which are declared in exactly this
same format.  Fix the others like this in the file as well in one patch.

regards,
dan carpenter

