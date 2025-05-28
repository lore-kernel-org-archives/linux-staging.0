Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6262797A1
	for <linux-staging@lists.linux.dev>; Wed, 28 May 2025 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426930; cv=none; b=btmyivGjSws8Dqsc07ga9fUdF+7h80SRTxNyxvhd5rD4fS8LeG1IX71Kvx99FWO9o492stT2HSkC28EEhQMzoR1/JC6bUm++iXnPq+Z2OBvWS7lwtHZhe7I32NPP7VpoF4/o6Evl89bxKkBpy2B6AXF6IVx4dI4SXcHV2Ci60OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426930; c=relaxed/simple;
	bh=K6LuZnoG9l9tErcwlPRRYLNk1X769nTvgY4Ttx/vpuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZCmi19l9iCDqZ3dTVunnbaSy/rW9Zt2bnVti9c2MLqP3RVgeO4icvllgjHJR/2Ag0T5uIWc7XtwV8/WPWUAe0OqxEaLXzvUQLndA0kbfwNPoPKSdp6ZzBC7jpHRcyXwY9lQ6OPSNb6BLleRv0kMqdb4gjE6LXGMIgH4mlfUFOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MO+nWesH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MO+nWesH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso56807745e9.2
        for <linux-staging@lists.linux.dev>; Wed, 28 May 2025 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748426925; x=1749031725; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXZzj7zT/aoC0USaD96wdCURxHjN4LGV2uTI7X0jaRg=;
        b=MO+nWesHkPgvCP4tDnwuDGD7reas0j5Bk8Bm2Qk3WxnPPdRrENbBwHVikLsktEFhcU
         qh03NWA1zFByRwfiDQ7Lq/eZ93ls2qMkw3ms01IRi79vMm4WMZVmSXZkMibVfH8dyiJU
         sXzHbi+jEP+GT+v24AEFjVTpVjP3zKiq/M9sngS/15ERH+Kf8GeYAogKdX1eSXF6qP2g
         mYFnY4rsEvft2oNFlp7zkeH+dCqlHMDd+RWy8IsK8hDeqRvdPKhYJGnXdZuAOGGw5ImP
         Okf1PgnZCZXkVRzLDJvfSU+7oczqM7KwSAvJ8PPlyq/9tCgU6Sq00Dt+iaPtbTyznxfL
         ImwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748426925; x=1749031725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXZzj7zT/aoC0USaD96wdCURxHjN4LGV2uTI7X0jaRg=;
        b=TK2kTMIffwZvdjnzcf6pNzNBeqIa9BHATS3FZaqFZUEtP4a11pOaElS+e+yY+b769+
         Z101w7mpAo/1vllC3yJObllt07vz5CXAR7Gs6Vth2BlNDkBsi61DmM9XIfzQ5v2G2x+s
         fMD1i6EfB2ulT0sJGhYu1skloEBxHTW1GPRGseaKjVa4d1X7uFkuC87OhLheVWqb4Xd4
         6XKRwWfgN4mdUMkRXrfcpNiJlJGHqvRhet5bw2T7rvy6laqZd+EKDD27+6O+Tcj2AtIg
         ielqFlKlqAxsx99bBcfjPJTnKYOR1UFx1YpLE7o7Ux1SIIK8qiXtisqeahdxu/w2cBcP
         GvQw==
X-Gm-Message-State: AOJu0YxS+AqQIZcFBWCI1B0W7gO1c4zNdVk3SxcoG+XORAUfp6+YKx4I
	JHJjJEDxE02cx/1POL0UhpXtFhzxDow4SU/iV9u37YuZo2diGKFVzKndnY57+0ydhr0=
X-Gm-Gg: ASbGncsED8UbmCuk9tcMeOeJamdNBT+SrdrI7PcmF2IxKe21Btl4z0XQEulIaAqGZSt
	FdXIgUPqgft5heD7xX+xnsYH4ntXeyqO6G0pXyOustHWXsWDlyw2ZrjG4ltNypJxDtxkYbZ5RqH
	emXToypnqk+adrKFjc0aPjfDFi4x5j1V04H1hqGXcAfHFza/0GnsE/uT1Kr2WdzO8es7tz9U/nl
	HOmwzOuZUTkzww2DlmOdiGswlP+jN0quHwBX3UWORsCsBdvoeQ/JuKjgszqE7qhhm2khoUrXkFV
	j0A//sfkXCr9iZLjE3vZ9XBPov1momgAg2eZ272evEgOd61yPrRHh7Ma
X-Google-Smtp-Source: AGHT+IH1cqD8JfGDs8gNDNG0gb2rXylng5BHr1nRy86mzCRj9b/g68TecwmVmLDn832A+JGk0SdlRA==
X-Received: by 2002:a05:600c:648a:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-44c92f21e1fmr126046605e9.24.1748426924877;
        Wed, 28 May 2025 03:08:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4500e1d3c94sm16176005e9.28.2025.05.28.03.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:08:44 -0700 (PDT)
Date: Wed, 28 May 2025 13:08:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shawn Hua <shawnhuasz@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	pkshih@realtek.com, akpm@linux-foundation.org,
	yixuanhuashawn@berkeley.edu
Subject: Re: [PATCH] staging: rtl8723bs: fix checkpatch issues in
 rtw_pwrctrl.c
Message-ID: <aDbgqBKV-bIJXDjN@stanley.mountain>
References: <20250528091914.2963-1-yixuanhuashawn@berkeley.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528091914.2963-1-yixuanhuashawn@berkeley.edu>

On Wed, May 28, 2025 at 05:19:14PM +0800, Shawn Hua wrote:
> This patch addresses several style issues in rtw_pwrctrl.c, as reported by checkpat
> ch.pl. I’ve fixed most warnings and errors, but left CamelCase and one type of CHECK unresolved.
> 
> I’m new to kernel development and submitting this for learning purposes. Please let me know if this type of patch is still helpful, or if it should be reworked or dropped.

Emails and patches should line wrap at 74 characters.

> 
> Best regards,
> Shawn Hua
> -----

Don't start your patch with an email, we don't want that in the git log.

> This patch fixes ~80 checkpatch.pl style issues, including spacing, indentation, and alignment.
> 
> Remaining issues:
> - CamelCase warnings were left unchanged to avoid breaking interface consistency across related files.
> - One CHECK regarding alignment with open parenthesis could not be resolved despite several attempts.

Don't list the things you haven't done.

> 
> No functional changes were made.
> 

This does too many things at once.  Also start with the latest code.
Some of these are already fixed.

regards,
dan carpenter

