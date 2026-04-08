Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3381A5B84
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659440; cv=pass; b=DtmV/SQed2fD4zKvFmzH6SgzWcNER1DCFEL1wtO8G0nbEt1yHTUYMUmeJ9Ud5UniP88bcOjFA1eBgVC3VNwZ14bpENVz1PsEpfSl62Z2/vioQza4Dl8jFz0Cd2h9oUM6Ld912aOS4tEWm8hplKfVbL43gd5X/AGgPRSfm7Si0b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659440; c=relaxed/simple;
	bh=OOswY/Ipkijjre+mn0uarCeO5cEqMPLTrmpqvF3+54c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLdlRU5kfc5tFwDRw5t6T/kjWJGy7imJGSbQsPlwjUTrkhap5cdUS6pN6i23pjgmdR9ME96rurIOFayKAklnZQOudoA2Qi7AXxqRfklZhq7HdsKMDB0Kop/2cIavZ0oNappoYOrffcvHceSGAkvCs0jVXeP0dJpjqy79OxoO+hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiBRu1wc; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiBRu1wc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488c2690057so16956435e9.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 07:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775659438; cv=none;
        d=google.com; s=arc-20240605;
        b=LDLLeDCO7fBgfDIdMqwcv/sqPGpIAMLhgnT2LgYr9ZCAn5DLb7nFVjBntNCApNI1Vy
         JeQJ9bLbFhyOn80cl0wbFULWTc30REbZ46g+po2af7rY/B2M8dQiFGSC241cJaPd61bw
         Emnb8JIonFHxQZDqQYuct1OhoYiAvjv850pr3TJSMo3YJ85MMSgdh6RQCw7lKwS2O8fc
         BGSpPzpY+n9Br2CcHArJSGZUy7EbDg4/P8wqxZPR064uaOejWWyhpAkVJ1pIyw9EQhpt
         YOssZ3EbfNFsVNmEvOgV4rU+CSx6BlBK7GnTZRZ30ZbWz1V8IdSIPwFjBfLAKI9LTIX8
         aznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0czAAXyphBQaflwQueiStfy5GAXWQrSV//xTTHBsKyY=;
        fh=xiLfEpkiTd67QNvvsrYqt0KUKKEMBAdmTzfd8I91PBg=;
        b=PU/vVITO3vkODty4iOnCmVrWbByJSVULv+epZlSR4y53jb+kXM2S/X8tJsH7gR8ZF/
         UjrL4UEgH3w++bWQShTBiU6/qaG1p3LZw4vhsNdjwIWrhbom71KDsunxMkzazi713ZNA
         FD4ZU9Dl4mhX3SfJqU9YpJcg+AYlDE/yvspGSfWX5KIfvy/wNoX1aN3wxXBYP1Ygr7pt
         D4hAlLyboMkPYgTsS9SjhDGyCJmMNRdUqTqoVbyRB5ywv3fY8/6P6AKcNA9v/Rz4ulRD
         ew/wv6RUinjCRhJRmecGIFm2UjMyqlvI+aIwvzXB0UKqLwJmCQ3ckYq6ryUsW5SRgPvH
         n2NA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775659438; x=1776264238; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0czAAXyphBQaflwQueiStfy5GAXWQrSV//xTTHBsKyY=;
        b=BiBRu1wcrlM2SeX7mG2cvY5lxOeEoYWtVvq0uaR5AgsgAYyls6q2hvyUvIMZj4Eh1W
         HN+x9S0a7zuJEW7re7scWK1gmG5Kx8aXcyi3OWfscugRzHYpdQJDiVFfmggE0y7mHs9D
         yXJ/CmOvExuvv8jPzjUreTdSa3ACd2fJPI1GCVCq0u7yfeOCdWUFmgSaXIVv9pTdt2j6
         PFgS/2LBTmqhE9iNP4KY7cEIP1mezy78RaRkwBF76tj4pCpWJvQVPyNkSdh7CgIjvPWJ
         zMLhuG5+bHnbALEdQV0wokIldZMf/9xKSYd0Nd3508+OosvyzOMZAi1kCpv04l1HujeO
         /JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775659438; x=1776264238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0czAAXyphBQaflwQueiStfy5GAXWQrSV//xTTHBsKyY=;
        b=VkGIkPJmMqOLCFgSqqWugUbDDOa6mU1pZzFbL9+aHNFrgVwV5ZEXJvvuBPwEYr9HbM
         AAAsG8KuJSw+PqjiYo6dtUGc7A1ef/+mI7NNt6jv0YKkyu5sTEijPrL5kZX4pBNIYhI0
         kiJY1GVqIYtL11ttrJ8dozhgDPwAIqrBjy9R3F5WxyNpUiMYtpy0eqS/XCeQSRmoN6mt
         oQbc5kypW3vfvzNTry9HRyfYxkEgj+C8HLNYOuhk5h3lmieMmS//qT2HkEruelKBdPY8
         Bc3hSiofD/7axiqXvrZcNI+Be9OPnAOYrwH+W3x05/7hLleSSvq2zZgqW2a3dISSfFkJ
         xyVA==
X-Forwarded-Encrypted: i=1; AJvYcCWNNSU/6A3YdyImarRv3xy6WK+dhqMhWoOJbPKaZadm7VR36bOgGb1GoDuMOVzkc5RgSr3W8aaPlCNjAc85@lists.linux.dev
X-Gm-Message-State: AOJu0YwwcX8/g2+36n8FiJafGZPNFFgX1rym/qLeto+2ZbqAuVge2icg
	1XyimkTKeDt//05sX0ahkuXkPPQPg1eZRQCL7U47dkqqUJLBUw1lNytLzSipmCOLXH7CtXorW7o
	nHWx3L+sZ9UyhxUP5u6XsY8o9wyp6wbc=
X-Gm-Gg: AeBDietS+BJEALsT6W8zQWkdfvKTeQsVmt2wPX/HIKTV9kxLDiNHYJNXEMGQ909yfRM
	UoGM7vHpQno6XCoEWE2VD8/4VOBY4Sw1sVKUl3lsdHJUcQnMEllAGPhH8TBeebgOpx+M2sqHerS
	UAZVNYHzhdaNxKM3f8JjioynRl5tA34EOnuVVnh00v9EcnONOdil533g35uOmZXvJ3B0JxjCDe1
	cF2uV1VCPGoDT5aWeKn/fUYntJixVy4zrP5F99ly2HaFAFuvRspObx9fURL53WV1Db92Xbw6hl2
	K77DKv35a98aC9BLetu/ilKEeVsJPnjRm7TwDxh+onCp7nC0OFWjLWQR5ocKV2fMXOcmmh0aPvP
	ppHmp0xluCZsCOJxqHagS7A7y8A==
X-Received: by 2002:a05:600c:638e:b0:483:6d4a:7e6d with SMTP id
 5b1f17b1804b1-488997d4dbdmr298973535e9.30.1775659437790; Wed, 08 Apr 2026
 07:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <adUeywfiQzZ5JgEd@ashevche-desk.local> <20260408134612.1380-1-joshua.crofts1@gmail.com>
 <adZlX-5rx0jtIMpD@ashevche-desk.local> <adZmWZ0SXRhHPyQ9@ashevche-desk.local>
In-Reply-To: <adZmWZ0SXRhHPyQ9@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 8 Apr 2026 16:43:53 +0200
X-Gm-Features: AQROBzA2gsi2sxeg_LLS0hIjZh4oCbfwJKIM_K4Q2Fbup6b8Hi9JApfFBX639V8
Message-ID: <CALoEA-yJTdX8rBp9EJQ63cqBPziVO7X+RtQ1RacdupW-qy18NQ@mail.gmail.com>
Subject: Re: [RFC] media: atomisp: change copy_from_compatible to iov_iter
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Apr 2026 at 16:29, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> > It doesn't change any architectural decision here. Basically you need to have
> > s3a_output_bytes to be already iov_iter at this point. So, import_ubuf() has to
> > happen somewhere else.

Yes, I know it's not an architectural change, more of a temporary
band-aid for better pointer
management, but fair, pointless for now.

> which suggests that iov_iter should be somewhere here, in the struct
> atomisp_subdev_params. But you need to read much more code and get familiar
> with this. I wouldn't expect any meaningful change by a few days, maybe by
> a few weeks as this driver is quite complicated.

I agree, the codebase is complicated, I definitely won't send any
changes at the moment
(unless they would be checkpatch.pl changes, which are low priority
ofc). However, the
iov_iter problem is intriguing and I'll surely spend some time working on it.

> In any case, thanks into trying with this, will be very appreciated
> when the task is logically finished.

Not promising anything. Thanks for your response!

-- 
Kind regards

CJD
