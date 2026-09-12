Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDF372ECE
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789248237; cv=pass; b=qMBimbeY3NMNobOlauoRfnUd35RyxSzstE3cO/BBLk0dxRpisNWTBAYJXZjQGxelzbtCYxTDvhpkvLgf5WdkyEEmZ3TZEj2VlT0BlCHpAQill0uVYHASgBmi9ThRicJYJDMPAwgdaqImox6+U0B3f6f0jvJIDNU2tD49Os95vLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789248237; c=relaxed/simple;
	bh=WgOhOFRovPEhiNXwXYyCOoiGvkZktGuhM4mSLhTmPvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VcNmOXdRuVa5a+UTs5ezv26oSjiRZNzEQbWa/gBLyAuSf63phtthxard1ePfoI+BMwYiasGagEcxB3p6qXkcBNYzRBiQOVIKJ9R8bUk18Oy3iseKRZ5XF/r35rmIJBYaU+L3eywQlNqzqBSYokBPGvor0TLETkiGB5SkEJt256w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ+u2HdI; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ+u2HdI"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8686f46e4adso1032394b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 14:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789248236; cv=none;
        d=google.com; s=arc-20260327;
        b=VUwZVzaIWw/uZrDoqM2Nu2f2lx+uKIkiBOC5tapPKl60dZIpe3GALmdNSK1Q1f0YrL
         7pfA2NL6tHJcSCSsgzBWvKyGWhLTvZpp8RjzM3kWl9OsCFqtutQkogm246SB54AHoc3K
         hCJDxd5fS/hrA7SFVxkwb379/tMwXS2dpppgMdWP67VFZlNmDrxsDEO3D4vXNj7KJeaw
         eUj9fjJiOFOXhkgJx9TuRx6d5XnilkA9sUE61+xhiUjw379u5VweJ2AlgQNctUbJdkE6
         z9d6YNBN93WSWOhdeGdyoU6ix0JMGXTou52D/jFt3hxBm86qYdTRDw88dMqdsIWsng08
         4YUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9vB62gwH0/QPgCAfrE86myNtpwICD7qvpc93MXHR/ew=;
        fh=YCe77j9FQum4inG8IgQESY2lGNQ/wtcylJlUGTmfzbE=;
        b=lO225o6LypW+yuHeJSVegmzakISytOZ1wVTlVIbm9uNs3WFBUjUlneFw1yPqQWp514
         053Vpmy8cqQfoXn2XYURzZVEeNVu+qyaAiggf+4QZvR+ax5JR65nwYW8AFPCrzlK1DK/
         btUggt5CP6h/PrCZyqZNI7LRgViXrcFKry56dyKUFMYnd29pUi7MoEIGP5YaAuwyQJ9S
         CbBrJiDTJbwqTVfutL14ecQCeUe7NZtq29ir32yfJBukSQDcWxRKUGxUJMcmNL0ylTAE
         YTMF2PjgEZJ+NMDV2frZOQpZPdwoy0pnI5xwkr2N6ORsMJZ2fcxJnwCVzYBFXdubY/Ar
         eZDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789248236; x=1789853036; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9vB62gwH0/QPgCAfrE86myNtpwICD7qvpc93MXHR/ew=;
        b=gZ+u2HdI67Lvo+ikEkdbx1I6i3Jl3fm/QpL6f66lot+cf0vhBemcxwIXJ7ljN01jNJ
         sQKivOl7PwExknjCwoaKS9q1hbDvqABSYYS+bs+ZYE71zMNlX9NqHXPFcpg/ddncRqAP
         Jado7r3h52OeayW/qqaFoxTf7azOJCFHZRe5pWbMvZErEjPNauPQCG4SvkYflkGsY/A9
         Ki4gNg55I0t2kquIz7KiLSjcwBMDsX/E6kMlk3P0TJ8gLnsRovxyiTh9RZQmpY0EwULt
         9qmJjS6wzTaNr+LM2jt4N0PeeQN/bRiNg129YDVUE+1lg8wWYfZWp7hSoACY3lEGZ5Jx
         wg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789248236; x=1789853036;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9vB62gwH0/QPgCAfrE86myNtpwICD7qvpc93MXHR/ew=;
        b=o9r+eQZZ+gIaR9nDrWxYV9nTQfxwj5xOkYgR0fZjEJWfPJHzcW4UqqP2qz9bi4Wj65
         g6A5HazTPKF4japF1Nw/KAsJemagt+eC01ky2GNf0rLUMFMmBD3uVtpwbWo8oiFS1ipt
         F2Yi6xXucBzjgKEKlGoiS3ETQAb27g8ie9xSKm52uA9DOUrbhtgo9/cq4OQXQ65w7dSw
         CT/K9QXO4pDZbTitg7eZhjykE9JPYsxWIVTosSJ8WPeLG3Y++YYvpr3XYV0++8pMRhcU
         AQPft+qtdmMiDQhcDfPXvBITMbBXxbPnl3VvCfz9dnMjyIXodgvd9ms7BJJoK5UjU4Zv
         sUVw==
X-Forwarded-Encrypted: i=1; AKwUvBxLLOrX8fQ2HxNRhtQNxIRxmApAnNBq0HV/mKtjGq/szw4GG6WE8FQ7QPZ/o1PsW/4LIgajMPdmmMW8u8TN@lists.linux.dev
X-Gm-Message-State: AFuF++nWbCXtbxIiOUkwdQwjdj3rBSG/87IwM+2obeR15cP46WzrZ41s
	ZztBAklEAKKGOEkwcIs98FTqxTxOWROT5NIoo9sOqwH31i2LsCGQMTndWDLb/7Z5ULqh5G2n8Bh
	vTYqjVk+NpA9R4n5rIK0J1YEyzdBN1As=
X-Gm-Gg: AYBFou31EFhP6RsxBc9hZ47onNta2wBEJyyVYBw4+GQc7JNjRxYaZqQXcXdaxxfwpUL
	eYQMTIgM553tMPCnXToX0yEw/65H8CUAAuiJ/5x6kUaMUkjwBIe7Ktn4RySRC1Q3iG9sy1fDhew
	mXnEMW2XGwty7PQ2IRBMiqene+4gjGcy3v/oNVv8+dFwmIRY2e/rZMJsBC2p2hKX4OeN9Xk9oj9
	NDnqoD00P9GpADPcVTBMojSeB77hN3O79zy/Dk0ZzCcI1CqPc1b8lYJjH2CS6WZhuHcQLOjBU6g
	0jE8QyWPWu+LygAStDwzp+8vlzolbC9ETh4MCXixrnsAiAbu5XTo4jOE+h8wGggm2zSE+UyQ5IW
	WmqsX3xujHDDIPg==
X-Received: by 2002:a05:6a21:600c:b0:3d0:9164:98a7 with SMTP id
 adf61e73a8af0-3daed1a4911mr18953244637.11.1789248235623; Sat, 12 Sep 2026
 14:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910124403.95741-1-7israr.work@gmail.com> <aqKzBTM-CdBqQzXi@stanley.mountain>
 <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com>
 <aqVSfA_Ns_plwCpK@stanley.mountain> <CAGKr8w2TSt0z2K5JDKViHVMf3fGpDtNEwqhedR10JoiXLB=MUw@mail.gmail.com>
In-Reply-To: <CAGKr8w2TSt0z2K5JDKViHVMf3fGpDtNEwqhedR10JoiXLB=MUw@mail.gmail.com>
From: Muhammad Israr <7israr.work@gmail.com>
Date: Sun, 13 Sep 2026 02:23:44 +0500
X-Gm-Features: AcwNN1XlHNmzcFazDP31zU94RhifNoUfTsEaJFMHZRfDYP5lRNqMTjTujOs1sNw
Message-ID: <CAGKr8w30ZfgS6M0UteVO9HYcRCpbkg+4PgNE7DGpUtbxjyLjhg@mail.gmail.com>
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock definitions
To: Dan Carpenter <error27@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 13, 2026 at 01:09:00AM +0000, Dan Carpenter wrote:
> [previous]

One thing before i go further is that the changes i am proposing i
can't test it
on a real MOST hardware as i don't have it i can only do a compile
test  and i also did used LLM assistance in understanding
code especially where the race problem happens so according to greg
LLM policy i can't submit this is formal patch.

The possible according me will be use another read->lock:

static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
     size_t count, loff_t *pos)
{
...
mutex_lock(&mdev->read_lock);
...
while (count > 0) {
spin_lock_irq(&mdev->list_lock);
if (list_empty(&mdev->pending_mbos)) {
spin_unlock_irq(&mdev->list_lock);
break;
}
mbo = get_top_mbo(mdev);
list_del(&mbo->list);
spin_unlock_irq(&mdev->list_lock);
...
}
mutex_unlock(&mdev->read_lock);

}

If either of you want to take the read_lock approach
forward yourselves, you're welcome to otherwise I'll keep
working on staging drivers I can actually test on real hardware.

thanks

regards,
Muhammad Israr
