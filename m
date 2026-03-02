Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56061A6817
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 21:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487629; cv=none; b=Mgy/JtZfdV9nDddyarpr7RvhTtn65VLqbsxBCJRsQ+r56+15xpqcH2Wl82b9qNDCbMkihHaO2qrPemh8BuGV1lBnrlfWRu4hYWQTCUpgOEPEL1CdKI4b+0MwyU4cfktJRN2JMnVygslcxa7rkg9q7vs4JmyTN1XIscH+258s4Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487629; c=relaxed/simple;
	bh=zOVe6JNP5QcaSfSGe6hpHD+LMU6qyJ3IAHMzQxjTKos=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Wd8sjLK9AqpiDBKhOfO62PIwFcsXKaRTEX+rWaV1E253Ba0BhM0IM/gEF4ZgFPfCxntzCGO0gTR78uDL+GauuSD094gkin+DLWX+ZEBHP1FI/7bxpgif8HZ/mu3wOrmvGLCITY19ZS9a3PHVc4ErstBrBpWYHJxQbsz19cNi+rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0bjSzzP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0bjSzzP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483bd7354efso65964375e9.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 13:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772487627; x=1773092427; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOVe6JNP5QcaSfSGe6hpHD+LMU6qyJ3IAHMzQxjTKos=;
        b=j0bjSzzPPo4Dq8COnM7rlLdgUNM+1qDDI5Mk4EaLaTjEhWoM1RBrvkT6Ggs/C/deyY
         JasuxHLUi9J2GYwM6QlvIbpqJ53UVtR3UTUw4ki7PxSEhEOQqAiC/F30Wqzjhxqdluph
         lc9VRjvJY8WzPBSVUcQb4Oft0idztmOjTx8mfX0qlqwKkcvn1JfoTGqJfUpK+oER4MrA
         +4SdQ7KhDX8jk9RliMqEkSoA1E54T6YjalTFF+xvhhHCw1H+Uz6UldMgC6KkY1YIrnQN
         tz4E6E5Xxq4ECf4HYh5+mZ3hmvyq56S7Zz7t48NDO6ZYU0EPnZ4pNrdHXDvz6XtB0YHw
         G//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772487627; x=1773092427;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOVe6JNP5QcaSfSGe6hpHD+LMU6qyJ3IAHMzQxjTKos=;
        b=JWvu+YvCCQSvIWKJXpIofv1R0moqaqHP/8wlSRPvnHniScHtv819gVnkhkS8M5nVfz
         ra07gBuxnmEWcIwIJVa99d/707Nzn5R0iAMuFaS7fGk6q4HkwXPAW/sw4GlA+xlBUKX+
         7Wrm6OnhJaPuh4gEEGVTExG6S6i9oeG0l8ng+TsStyYvYqHsMueKfuxnduuMmrRijq0z
         WN8pU5ajFjTASzYbYOsh0xMPYKbOtP+Mmn0AR/axAwXijB8UkUEtJT182kZh17pGcAQQ
         fNK6yfKKurkJkGysbGnoVAcp/x/cG2KvVl1N//L02EX5oMLXghalaa/LM6Yk17fkBB4L
         2KVA==
X-Forwarded-Encrypted: i=1; AJvYcCV7tOaz3JTurpA/nEUtjrejs4BkEzfFhzQlymooP70yJ3bBcKvwR8XTKnlQI1hzrX9IXi7NhEEIRqg8rpkS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5lbTrszGiqfqCvOdkrCIGSK5OHs4Epqkdgfhx+h8Cn0yFksBl
	JNVBe/bvxax62I5QWl2D9ugtmf4Yhiww69KIVBsqfdOTw2fNhts/ewXi
X-Gm-Gg: ATEYQzwMu/ybsIfFeQ9q+I5CvyTWKFjUUSnGp7K+36D3tBfdxSfQE89wZyX4I3AwYSM
	hZSTJ23D+dxA2TKO6CnCM/d11D+ko3Ekob3C+qP9s1gML3WQDsMdUQzZcfsYcX5dl2eg1OYJxxg
	+FO5VRcW9W3qixTVsChTLO4YahtJCi88rtS2tC4DNKA+Wnw5i+e8OgPGc3znHEHjBtEHYD7KZlb
	MipdnU33+7z8JDWSqjOuxvUyCXML86WjCnSKQVe+mux7s96Tfi/DrHsf+iDw2ojQjVsW7VfhxHw
	QY94KFAGOfydYCZen6o842NuRh3olNP592onNsULTgl3TyOoL5bFaLk+dbndB2lCWuYBDrc4L6Q
	whNlWnin8Ftv2oq9Q1Im9J0G8U+3dDJ30abqFqVa/Ygp3bNep4iDBBsxjh/tHXKAwBnFYUJ8I7u
	K006jjpvnqBfz3/gby8XgCH9pE6Q==
X-Received: by 2002:a05:600c:3507:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-483c9bc576fmr240886155e9.27.1772487626801;
        Mon, 02 Mar 2026 13:40:26 -0800 (PST)
Received: from ?IPv6:::1? ([2a00:23ee:1cd8:7917:2ec0:d6c6:6e79:9f9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770e7sm330112625e9.9.2026.03.02.13.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 13:40:26 -0800 (PST)
Date: Mon, 2 Mar 2026 21:40:24 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <031d4c2e-1bac-4cab-a9a3-837a794b481f@gmail.com>
In-Reply-To: <DGSMDKT7X2TZ.1IYKDDVKHMYIB@gmail.com>
References: <20260301005519.2512706-1-objecting@objecting.org> <DGSM87K2CH4Z.244A6JVK7ZSK9@gmail.com> <0e6cda63-aa40-42c9-92ef-ce1fe177ba0e@gmail.com> <DGSMDKT7X2TZ.1IYKDDVKHMYIB@gmail.com>
Subject: Re: [PATCH 1/3] staging: axis-fifo: simplify resource mapping
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <031d4c2e-1bac-4cab-a9a3-837a794b481f@gmail.com>

2 Mar 2026 21:38:35 Ethan Tidmore <ethantidmore06@gmail.com>:

> On Mon Mar 2, 2026 at 3:36 PM CST, Josh Law wrote:
>> 2 Mar 2026 21:31:31 Ethan Tidmore <ethantidmore06@gmail.com>:
>>
>>> On Sat Feb 28, 2026 at 6:55 PM CST, Josh Law wrote:
>>>> Use devm_platform_ioremap_resource() to simplify the code and remove the unused struct resource pointer.
>>>>
>>>> Signed-off-by: Josh Law <objecting@objecting.org>
>>>> ---
>>>
>>> I've already told you your patches will *not* be accepted if your from:
>>> and SOB do not match, there is actually legal precedent.
>>>
>>> Thanks,
>>>
>>> ET
>>
>> Man.... Check my V2 patches, they are all fixed, Please..
>
> Sorry about that, just realized this is the old. Dan's message made this
> pop up.
>
> Thanks,
>
> Et

Well, at least one has to be merged haha, I think 2-3 has issues (according to Dan), but I will fix those tomorrow

Thanks

V/R

Josh law
