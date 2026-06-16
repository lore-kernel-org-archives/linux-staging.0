Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7FA409638
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595861; cv=none; b=AYH1bZxtTYXOAIfi35rCXcnt9xHSc8EZuRXizLfy+/yf5pf5/Bp3NUAmPRp3Eaj4MO4V1SxOCDoq/EqmZlresUONHJAcv3BFafnhqBcjTD4aTK2UbdLlODZoXa0rFudCxwF/OtWVYdRONi8WH+Zwqu4RPReLFXlwGDFqSZ4clls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595861; c=relaxed/simple;
	bh=55+e6fdtsRRMfwanvkCbnxqTDeeOzG6g0PhvcJQX73M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5J1ik9kAv/z7dLJxAI9XEkqdbeJdDVVz3LlF+U04vApXonbfbFPDZVJNVmXdYn4XET6RwsrrD19SomnkZolaYb6g/lp4g1JSxIaEdPFqh34GSfzCWN0o6d4k9HFSQBVME5VSHxKn0V2GHcD9X7h3HNRGkNaiE7hfCNxAxS5ymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsDpPjgr; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsDpPjgr"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8dad1718d7dso489566d6.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781595859; x=1782200659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E57Pg+g+1bSxijkpH2I7RfLXlXSv+KSQfU1n2LyZy4g=;
        b=BsDpPjgrTIaKxLiO4Z6MvjIWPjVyhSjgnmq+SbneusKFP+WFFXCekEVlUzlbWYtNMp
         4OkIbRxqTVhASVg88Fbm24QMHxnmct1bzy0foA7ckbCR1YYBtxwcDtIIAjaovxc9wYhM
         pvVyyyK4W1Gg9iqpg8sA8ArRsZlnY0GoAAUsW21osFVCca7sUBGYPTfweEnx4BAJBRkO
         zBjWhVavNCSPZt2YoESo7cOdmX22ln6V8vZ4M2Yrp+DOZF4BNzWqgg/REBd66rj98EK9
         iyJ3jc5RYwJ31FsOm/iF7bgWHOeoIhkaw3FDdyfw0wUM274ypN9ihigumHkLoy6UnJN7
         VckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595859; x=1782200659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E57Pg+g+1bSxijkpH2I7RfLXlXSv+KSQfU1n2LyZy4g=;
        b=LqOLoiVRJzwO9CQ4ncdLnvcoFbK0HrKAbeCp0QwyH77n0E5D+FgbPika1ZIQ9VAQ6A
         hEWHHgKvaj8gZipBwz8VTHC9WOtXuVjx9Fc5znDY43A4g1Hc27vzCrGz/TnJpO8Yz1kc
         FJecrfm6VT/vAU+1NygzKGPaJONh5bo2j9zal1cmFrGFCaBO3bI5u452mYVmC+6QQ28j
         uYLLKCMaso+KiGyWGAQECDORtqwXJVz52qmCVVcfv+kQpeeQ2OCWwH718/Y8YcwIxPyL
         vArpbDOeb69MYsWjutnqyPLQskfqGmEHlkAje6GPlo+HbVIBeQqupqFok4qI/W4yINHN
         HFQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+D3xlj5aaOvRUBA989e022NWHn0cS+2rhNVcvTvLl3lxs6kx2PJAnpEbj988M75AXgjkoltpofYy7dkxDN@lists.linux.dev
X-Gm-Message-State: AOJu0YwX1IIeKSm7feRS3Fv9zubNPw0zlWafAeR4KgnvZ7gcUuEOmOqc
	SDngu51C7zVx4FoDQLp0wmB6sE1/CC5nfh1fj/TqeFH61P9OL6Wcl8Pg
X-Gm-Gg: Acq92OGEOqQ4A2ma+GXZvYGjli7THDY0LbZqRKJanEWrigX6lOZx78I3is+vDMuT+YG
	xpajU2YxLh0vqrV7WZpMnHK97gHdRuh0ioUWcr50WxvKXpTdnb6uh7+BL+MJCRZ66GCXj459z8Q
	t0qgiH1YWACnHddeh7qvLrQSMsT16/hffTCH67PSUJ9raxbkAhs9KbFyG/3i20VLcJq/Fx6ueQA
	iO8nKTn5DfN0VUPJTtBqP8Yln1r2doT8DBMOJEZARl14zy1WOoXqnOoYQp0oJXqmbRdg3aAATkc
	gGFk9hwJ4T88wmYDElaNIKrKXs1quMvZvsKtAjIHynme/ycXngb3EGf4wdtvKGx0uHSUkebNMif
	O4aBJsCv8hvt/MpVWWazUC6Ge/c8wC0HO9Wnz5IknRmfttM8aKUDb58dY2sy/vbz2DB7CR4tLIq
	sBrjxH0VGjgKlKOxb8
X-Received: by 2002:a05:6214:4597:b0:8ca:207d:50c8 with SMTP id 6a1803df08f44-8da1eb41d80mr38113866d6.16.1781595859051;
        Tue, 16 Jun 2026 00:44:19 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f4557634sm25156906d6.30.2026.06.16.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:44:17 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:44:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] media: atomisp: replace kmalloc() with kmalloc_objs()
 in sh_css.c
Message-ID: <ajD-yw615X1mzaxt@stanley.mountain>
References: <20260615194548.20963-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615194548.20963-1-khomenkov@mailbox.org>

On Mon, Jun 15, 2026 at 10:45:48PM +0300, Andrei Khomenkov wrote:
> Replace arithmetic in the kmalloc() function with the kmalloc_objs()
> macro, as this calculation method is unsafe.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
> ---

Are you working against the devel-next tree?  This doesn't apply to
linux-next.

regards,
dan carpenter

