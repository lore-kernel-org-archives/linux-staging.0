Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67482495AD1
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376321; cv=none; b=szuOe7EJ4WoUiWsOjBRbLwVkLTl8Xw46sglpYiXOsRt9CzcI/jD9M4UKgjUKiV42t39DCqAiR+3AVxYgE1M6tXcS5gN8C25qxKvEDgI5Jixnf/2Ej3eYECfVu8M6Qbwx6UY6X1awgB6pkjc/PESXfk4c/ZkXzTumwlD3gfdfv4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376321; c=relaxed/simple;
	bh=kJ5ncMSvegAnNhdbhRVw2mSH3KpS7DVhK/tcxbmT4LM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HZm0CAvJO1U7PTdEdicAxKPkw3CRItApVx1AKE+E0exglru1TdXKZSXMtUwjFpvBi4mNG028dbOwIVUzi6Tnndqr1WhCW1FC4sau+WWZgY6U4+BZUzjotGec9tjTbDhfK59nQzFdC9Je0MRqtX1zRLbbkwuwC8t43csicytD7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HloP71Ig; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HloP71Ig"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a7d9d9b67bso1296763a91.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Oct 2026 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376312; x=1791981112; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kJ5ncMSvegAnNhdbhRVw2mSH3KpS7DVhK/tcxbmT4LM=;
        b=HloP71IgCDDKKffzJYf+mKyKR2yh70aCd/YPI4r+FRBLAzTOdyHzB7UZNXnn25aSfk
         XQYCVam9hFScs0xxepS3wmw94UMEfVYTm7InnOqqhj+zgC2i4iQo4ZRS2ECBS+y/z7I3
         V8fbbS7L86K3e9deuuII9P7pd8HZLYoCWbkdoH3gCSwprvoOooFo1kh5pW7Lgt32x+eP
         d1dTo7QVCnKiFOXntl/e/UZUNw37aQInSP44A8/cNjK5V3JrgJQzHNR2AX7m+XUaovn1
         ZWIouupOMNsSzH43ZLjtTh5I8vI9fqHeTEMZXQ/h9sQiHsEtITdHpCgPDKpJ+qZcXkVK
         /R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376313; x=1791981113;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJ5ncMSvegAnNhdbhRVw2mSH3KpS7DVhK/tcxbmT4LM=;
        b=nvcyyf36Gbp40sS3i392qxt1+jHno5xtF8toDOa7qAvPb8/rxQosE+xRgYtKkcm5f2
         4o27szBuIi87USURiy00sBnzUp8j8U3xoG3V3QPYNvei4X4VKcO6TM8dDp2Z6iRyr8UZ
         hslPShnJf4gg39US1bYS7S/I+u/3+vlqkDkn6VP+Jl96dwobsTyN+Yf9lhYfkSDk5XrC
         tDLPfEnoEyuZZ66vWmBOl6Y8WK1ZpyknN9CQXcYavjIt6hwZqOqCPfMhLuYjlHStF2ud
         rUN/memnDAVCyjalMqcpApqleL0SUHdplg+4JOCbX/EHnB+HhMGtrDmjErAQpm9wl53F
         iJGg==
X-Gm-Message-State: AFq9FYK8ocsJSuuAwGm195vlpN3YHVzG8J4lrK7D/2VXbn/qKHRoH3yv
	hha6z6lv0Wn+WFCbg5eIJllui9oHK97JTQWW0WBlSBi/+0MO4Jkkw9HFESoh9g==
X-Gm-Gg: AYBFou3r2DUDh/2EWUqdHw88NDqm3CNmHcfywC+tVQnzJxnfGg0cIabIhXQFR4GuTva
	8Ac7k1Ftm/G+A3jRP2cEg63hQZo0djlIjlo9oVaRHvkHwKws9RsXbwKe28PRzYzomk2TiFT/a6U
	ihGxzvy4n6nZ7IR70unz7r/Q0NARv4VSv0YXUCESBSBEzNRgYX7YLgj4ove1Wxzok95EGWoEJOS
	noORdRtmPpxb8WZfwxOEfDPD1LatHGBpbmadmzG82I89bxbOl25Jz0BPOu10BZPiFX5x4OM8FoV
	PySr2o0LohCP2jfdkmjF5YZcW+zlqY/miTTBNmGCX1whOYbt4/k8yWUlZL21VV9Q7sABK2xzsQ3
	OK59lJ8P6apFIOC4VvHb3aLwnsz3kD0NIdVwwbXsaMun/CuaqsdThHiih/C7cK8UuS+gdPaZq6D
	VBKl1jtxd6MoOfMD1mVJUU3uE/1sJNsyvnM8U3bgo3wjJfytPfy7FuFdChnS7ungaK2UuMQxUhT
	zFsZBii
X-Received: by 2002:a17:90a:1057:b0:3a8:bb56:f450 with SMTP id 98e67ed59e1d1-3a8bb570f55mr527249a91.41.1791376312526;
        Wed, 07 Oct 2026 05:31:52 -0700 (PDT)
Received: from localhost ([103.103.208.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b7727a1sm4555003a91.17.2026.10.07.05.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 18:01:49 +0530
Message-Id: <DLYLWJJD9EC0.3CLCLL4O7K9KC@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: replace uint with u32 in
 hal_intf.[ch]
From: "Pranav Desai" <contact.pranavdesai@gmail.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Pranav Desai"
 <contact.pranavdesai@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
 <20261006200751.819332-2-contact.pranavdesai@gmail.com>
 <2026100644-willing-nucleus-82ce@gregkh>
In-Reply-To: <2026100644-willing-nucleus-82ce@gregkh>

> That's very odd, shouldn't this be 'int' and return either 0 for
> success, or -ERROR value for an error?

Hi Greg,

The driver's custom _SUCCESS (1) and _FAIL (0) macros are currently hardcod=
ed into the caller logic
across multiple files. Changing rtw_hal_init() to return standard error cod=
es in this patch would invert the
caller logic and cause regressions.

Replacing the _SUCCESS/_FAIL architecture requires a driver-wide refactor. =
To avoid scope creep, I have dropped
the hal_intf.c changes from this series entirely.

I just submitted v3 focusing exclusively on explicitly typing variables in =
rtw_security.c. I will address the
_SUCCESS/_FAIL macro teardown in a separate patch series.


Thanks,

Pranav
