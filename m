Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC34033372A
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395020; cv=none; b=adnEii+0GUtYQ5vwqQcZRnMI5he+ioXhkAQZTkoRM1EAfSKoyqeQMNZ863b78YKVFO5zrOHCMGQDPMQkFhCmo+LvCMhhtFAoEyGj/eEqO8BUkuFzAKmXt//un32L6HjlEg34MnuJp4WipNMOfrZZQI4H3CWpMZcZ+hXZCCauyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395020; c=relaxed/simple;
	bh=uwCaXAikQcwcWv49E99orU1oLyDZe+ymr3yfkSGbxFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MttQ04vuYHjDmm0hiNHOIYoeDy7pppfESVmAuoipdMHpTFF0luPwCqN3swP01JiAYzmikIfEP7b/FR+bPeb4GMGKQzV+YTowasMf/2tDERX9KJdmmXPGsFxHg6ezZ40H+Q+RqKcaGtnh1VxS3ONNZTLZBBKDv61fd6GXY+08Yjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGNIOTmZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGNIOTmZ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-446fea16729so599691f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777395017; x=1777999817; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0P4jgSiiU7B+JwVmDaMNH4bNWiyKiRU0eieadFucCgk=;
        b=cGNIOTmZqQk0rz2VPJbBLWUA3rUmaqbtr+8+YyOEBLtpOjR345dIx2F5t9OloDueZo
         TF3r/O4SxJtGUuq6Mt9i/SCS2rgUEi0yCKcF5PE+oHHx8dbFm2Rec/k3XoGPeVxz6/WQ
         cpcVgJAmhCO67QoKC/huHchCZVEwXHK46U4D+X5GAeJwgo8BPvRsyPVGyRCzZzQCke0K
         qACm4fQDHxR1GxMz9e3EAfClk1G5kt/V+16X1okyvrV2qKgAOmq+/tbScch+xXLUQ0ql
         Z1lp86XY1zkUvkZhkH/2jeUi60nwGE2cSpXsLHDp0vExJaBrxV1Ib61vtzrj0h05KYUw
         S0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395017; x=1777999817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0P4jgSiiU7B+JwVmDaMNH4bNWiyKiRU0eieadFucCgk=;
        b=NugupTCvcApTM2hR3DhmmutX2BBZCTWUU+WxpC3xIyMn8b8Sku3kRKE+Gm1ENIFGyd
         rHM2YNapM13AaS4hTdPMPrvO6tDQfSaYTFjZl5fxVKLBBsyPAWHIXUZN3uHJdxicmupE
         y7WA1rcv2pfTY7mRBv2w8cpkvJJG7e+EKVpr3fmxNTmBlGTfnWghU31oqZ9xaaIX6MWu
         oUt77HXT8uDOY5jSB3iLoHKr3LxQg9yQUX+oZr9c3pwN/ATPPn1US5cADpzw8YJuYr7U
         xXZ2fLxkdVbpygYVMz3yh0GXfnAE3VJy0Gql/bYmOJKEJUEBn16/3MCgPiceGSS8NVkj
         HjIA==
X-Gm-Message-State: AOJu0YzgxykR8iXuHo41CgVBOc2/I5PBRPcwTDQl8S9WkyWxIlt82fgi
	Pl0UAus17xiYjIGMb3d8vx71ONrlf0dXF95TLhyvnG+GkLum7R2/daxt
X-Gm-Gg: AeBDiesAM/CYMFvaZlU9zn77uwIzPTuNyfyaaNFCmNcCYRIeszf3Nm8fnQgig/aIbMr
	SX8wDOQeKxgyd2rOl8BXaIOumu8xwrS/Gc64IVBt07zXaxBNEkL90KhMebmgcvApcoQScOxvmKh
	Ndspjy4rlKPccLAUeui6NfAw4Iw5dlOAmPPLpiQEd0gaahykeKOXi9zWMIqvvpowO2o/7QZx8tf
	rssN3GnUtVMXvLeval3P4OcJhnZmp0mO6MnjhhRGauCpOvcK46DCfLZbejGWGI9Z9gBpD1UATli
	qJCyhq6lyQr5SkQ2QQiR2/gIltdxi7hoCpGI71BNDn4Qaebxrp/8MGkuVPFMdKf27LUrh8lVQBC
	DYbg3quworK9gY6KCiPBJJvd+VXBRiFMsEp6auWsf7sMCpSRj34HzQphiVXqmnUw4q9aFskEjVw
	waHc27yuucMVAmqw25TQdpNNJS+hAQFw==
X-Received: by 2002:a5d:64e3:0:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-4464839c806mr6321421f8f.9.1777395017132;
        Tue, 28 Apr 2026 09:50:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59ebasm7590675f8f.8.2026.04.28.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:50:16 -0700 (PDT)
Date: Tue, 28 Apr 2026 19:50:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mhanna112-code <marchanna111@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	thierry.reding@kernel.org, jonathanh@nvidia.com,
	skomatineni@nvidia.com, luca.ceresoli@bootlin.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: tegra-video: Fix function argument alignment
Message-ID: <afDlRSGwmZgjJadh@stanley.mountain>
References: <20260428154022.6997-1-marchanna111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428154022.6997-1-marchanna111@gmail.com>

On Tue, Apr 28, 2026 at 10:40:22AM -0500, Mhanna112-code wrote:
                                          ^^^^^^^^^^^^^^
Your from header needs to be fixed.

> Separate long function calls into multiple lines to comply with kernel formatting style.
> 
> This fixes the following checkpatch warnings:
> 
> CHECK: Alignment should match open parenthesis
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This isn't what the patch does.

> 
> Signed-off-by: Marc Hanna <marchanna111@gmail.com>

regards,
dan carpenter

