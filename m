Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C137E5E1
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761314; cv=pass; b=fDYyvjt8FCpWU2Nmo1rS9yXUih3Px3aBrYwUxHen7l7RXssqJNoZ8RM1iJj67dQjQbHz14i2JBPgD7LPzuNiRuo9SWke8F0Bzdf8a99QGvIvEw2HTbWsgqCR67HCKsRpIX7NlymBx9rI249ruAkFV0vZn9P3UjgRtOnVC1DKdMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761314; c=relaxed/simple;
	bh=D52xDxlcqI/RQ3ynxyqFDlEyKqGQSfoIzfbY99oQqZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2AnFjGWP/OnJo+OxyhlwkaIbFVXJUqymniEe6ZV5r7VzYIb/7QMkNi7JJtD5onKLM6bq2UAk0g++EcPz8kJ3GeW55pf6Y0uPrjd0xEgwy4g8oXo+YRO462Yn6V9+RjbOeWy06eWqzB0bY9RUnaZdshVcx1WljR5dYTOhHU0Qi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTgGo4hR; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTgGo4hR"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-46add2afca9so1917311fac.1
        for <linux-staging@lists.linux.dev>; Sun, 06 Sep 2026 23:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788761312; cv=none;
        d=google.com; s=arc-20260327;
        b=iTtUltFiv6SLLjBVJ2ceKSUYaljw2J6r6dUR0EACmKVn9aJNNz0U1QwtiUIVIM2pQ4
         13ds+RYSiLDSp3zDGFC30RbgvrKhguWLN/bXKNvMUliMpWYRs8kuia7cMBaRwA1DsNwD
         1e0mgad5qOcS5RYwY6zV5klio6WOIGW2r5S/LxLvAaGxzhXZtnU+DsNfxtPOw2+9h4zx
         09gqHbDl5oMOs9Szkk/R/G2swVpXX/ulQDXetDWBvm6peNw1yaHoAzyo+2Wt7ixmgmJm
         +upSniL9rUoC1km36WzJ8/nj1tARePvUi9S0t+N93FT8w5BbrxJQ1Or4eOvQQTxO2clF
         huLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D52xDxlcqI/RQ3ynxyqFDlEyKqGQSfoIzfbY99oQqZY=;
        fh=QLGa/vTX210mB4gXQei38CcAWJzP0cKH3OwMKvb5Kns=;
        b=sEPh0G+0f8KSMx6KH5P5SMhYPrcxZUxg898xeEeuIAgRmfsNpaj5qQAZ3hooqGXHsF
         UnNF+OsiDHWTKFIVShUxzsNexgQyFaGTK/08Ju6dwiuV+H2QAG5dxEXcVk6VORCrb49D
         +Ra8s+J1l9Px9lfHmp2xMOFWcVV3YUkLjPKRUKbBS/KlMvmvkS96lMWFveKRtyhPKrPg
         WiTBpbAWkIrpUoZy/ao+LnmAHBYDUbsBFBTU7MV4Ed+lPxNMbM4lD7jWulr4Ca3/eozP
         u6yY8on6CHO/tYesDIj4uOoXadPMPI6NiMgrhlvx6zk0qgKA8IrZqvnuFYr1FweRuYIe
         zOWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761312; x=1789366112; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D52xDxlcqI/RQ3ynxyqFDlEyKqGQSfoIzfbY99oQqZY=;
        b=RTgGo4hRX07BuD/y0dBH9PJhYwrHvxW2WeZgqumBBSXbtK+5hDxUhj4hgfQwbJN0lQ
         gAnDU/e7envMLT5iJUj98XPeUNGipBXsbPcx4OD9h1hyAt4ylrbQ/xhOicDoLlQJLcbD
         R84ZbNA1kCEsbY7AfOA4lANFyoTPotUnQwhNt/S1FB+MQBc1WbKFYiEr7Fzk2wARfU5Z
         chT/Ztg+gZK3d+qy8tMeGQOHUQqOuXfE0NgavrAxwV7v0WhHGTAbzqMgbk8/DmQHTHEs
         JN4msY8HazcutqNqOb44+L7DZQH6WzgMmtrtpao22ekdQeG8/nZYXR8CD6GEBHLNbqdf
         /URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761312; x=1789366112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D52xDxlcqI/RQ3ynxyqFDlEyKqGQSfoIzfbY99oQqZY=;
        b=s0LI3Dri+yH8+hWSBJBlrO+VTDf5cWn9/apRSWeXZzMZroqhpnVm3xjl0f12ah/NjB
         FS6cmyLdIuCSy/+b9MSyjio1PPTn2e4AJgwzDZPXvjiOUySNQwKJ1c18nyfiqIwi79st
         W5NQDs7aAWGcc2wv2mEQABve60vmiGSTv+MKh0OVgytlM8k4SSx50UJkX5cITAT91hFK
         iokG8qowZSqigMbaD6050rnIe+qM8tXcKs7GmIMeqtAMlb2ZM8FVdlLh3FHlRMxAoOgd
         Gw3b+FczcVe/p4bX9egDC6T7BGTElG1mVAGKDb+kpw1/lEPI7quZaMXzB1rvyMULrCn5
         uWPg==
X-Forwarded-Encrypted: i=1; AKwUvBz0MMvNelZS6uW27UlSgRbgw9su1r73lfde5PsNL7rj0L59U5+FvEKLS/EEbhZMxBApxHduZndVIy6nHt2d@lists.linux.dev
X-Gm-Message-State: AFuF++kEj/PRvz8WohwGBH5gByszd6dc2TN1xel0Xs/HM0otZhlT2lO1
	5IY2XiLssDmQW1MexP4jCXvaUxVYYZdH4qViWyIWCtdxxwgXLiDKbmBwFto21Nbm8kI+zeHDiQz
	K1vCP/KNGFv2Cq7Sb6Xej0Ouxn/ghlu0=
X-Gm-Gg: AYBFou1D8rnEu8JCGgIxJQXRIEmO7+MFZz8Xg/y9HrEAnxX2uSFo3ZNgOoZfd27Y54t
	hd+3a/3hoWMqixdgBaj26yJcYPtj9PAwPiTuArCBCs1Wv6X5jQwaxtZ976v/g0Ipv0tm08Ci0eh
	tHvhq0yn7hENHyrCLrah6l5w7DE/IyyC5PIqaKa6aQ5OKSpLg1xwfnRRw1cZbOH26ETDNXdqERl
	BYt9VxXFJLtPFQsK4MBMQXukpQrrqH2+wAXEDCe3MAiEQ64IlkKN9Nft/bV2rHDeig+k52fAc2G
	WViTsKKcw8b5N9jxkGjgtYiLEvwvhDsO8CjATBJju+eIhQ==
X-Received: by 2002:a05:6870:3210:b0:46a:6e07:28a1 with SMTP id
 586e51a60fabf-4755135293dmr15159931fac.12.1788761312125; Sun, 06 Sep 2026
 23:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
 <20260906114049.32912-3-abdelnasserhussein11@gmail.com> <20260906185025.6a0d1240@jic23-huawei>
In-Reply-To: <20260906185025.6a0d1240@jic23-huawei>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Mon, 7 Sep 2026 09:08:21 +0300
X-Gm-Features: AcwNN1WnirY3cqNKZJJwKb645fYo2XIsR3KNHFtMCzd3d6BaT1y3Wiu5R7VGG9s
Message-ID: <CANpqX3Y2njgY4KbJmfa5WgJ6_WpfeC1=xRwnj3LUUiZphMxFLw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] staging: iio: adc: ad7816: Use DMA-safe buffer for
 SPI read
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thanks a lot for the detailed explanation and for taking the time to
explain the underlying architecture. I really appreciate the mentoring
and the pointer to Wolfram Sang's talk; I will definitely watch it.

I will rewrite the commit message to properly explain the cache line
sharing and VMAP_STACK issues, rather than implying stack memory is
magically not cache-coherent. I will also fix the misleading "correct
the sizeof" wording.
I am preparing v5 with these updates and will send it shortly.

Thanks,
Abdelnasser
