Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6125A492E4A
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240344; cv=pass; b=tMU+AHuK3hn9JAUtT3UkYXnwv9eppYPcvQukh3x7mZkQ70m+MPwXKFxpWj7goVy+YTt4Na9yka3JTsa/FWeOrxrB2aTVv68ZXb78CgzGRXT9NODrBaU93wEfso6dQBqTWwHDuJsaOuot7g2ZBF8O8rMT5ykIpe8qsPTEhjKWLoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240344; c=relaxed/simple;
	bh=u+xWrGD8mImT1Cc4PS08HKI81seYVirb45TJpAtTjAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o45V6e2QV9b/e0AX57FJuNl0odUKknA1PUc4UKCz8v3TtBjTNubMOFcv1xtAr4G7/Lv4yaC+Mhd5SRJcX+OdrqfPFGX6AjMDZ3DzsBSDLA2/V3Yhc9gbbbP0yvlIpn/7IQZqcoxkxqHNlfJmmcxiWiGfvkrXppLXvucKFAqXlfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G61IT2XK; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G61IT2XK"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2007120a91.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 12:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240343; cv=none;
        d=google.com; s=arc-20260327;
        b=W/9tEGdVfK5Qsy01SHfdLm7Baqeh63/V/pbJyHMps1AT56Pr4i0GAeClXIjd6xmqk2
         nrLyA/1el34pUmiowdT1QvIQRJHMkVUeSOuvHqLTH/H0SxDzP+YD2s/l77ZLJW26l0z3
         KhrMLNPHgK00mWe7uTZNeeigiwSIm8yzj/q/itvFUXgJqPxGV+nv5dPRZK/oiHFI1UT7
         ikGk1PsPMCE17EV4Q6PQTc/OqLOCBhdU8xMJiCP5VuOvthC9MKubcYSTMtvn5HciPqFU
         y/+0MOO9trZy9CxCdwzrmtQLDCJ0AvWdU8TLDYgmXThgNrLz7rw+iiDKDEZ+s/UUsq16
         aXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/KtTlnq25tSukH1If3c69APSfMIY3/nD2byRCukec/E=;
        fh=61Blt53wYSeNZGXbvzRoOtY2EZtLyjhc//zKc4K1EeY=;
        b=QmQTXtgStlUSfY2/9699CRj0n+bx26/zp1+Zw67vHQIo7dosTT0VnidoiwXULyXuaP
         ckE/NA3zhw9Ly5J14vmfSOIoJCRDR8PibQ0YsyikYGBjCpdkbpyfc0FK6/T2VIyowAcq
         Cmgt7Ex0UtYRwZ+/MZPnksynvEom+r38NvoP06OMQF1BryQNNC3XV+JKjX8EC1GWuTD0
         vEPDsofT0wKHZFyN7XSkr//zYWPI8O015ects5bhNixTygaeVPqm2YefCkoqQz5C7gc1
         0yDU0lXr+GjtokL+SXd9VrRpm1bIwz2iOhsjzLftcY34vcBsiBms5Y9x4pvzkhLpaB5T
         cD+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240343; x=1789845143; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/KtTlnq25tSukH1If3c69APSfMIY3/nD2byRCukec/E=;
        b=G61IT2XKG78G1r91B7298ft9jHyyjG8EgOvK6+qxboX59594coc9Tnn8GSZzPLLqU3
         yDHCW/8x7OzuSTU8A7T49TfLfRteBQkxH6k2U48SsSXwIqGMJu5Y+LMAIzcArNxMZ7A0
         uoAwDKeiipj5lJfS7S04oVW4BKIYJ0w2sdizME56dalA/AyvufkC5ZTyk8D2Ug/dwdhW
         cT6ZldKKSBGQhr/0FklzIfVgRvo0HB7dqoqD2K3aON1HWVyDub8QJB1toofcqZ23vx3/
         iV3Fj3tIB+FzFsCgQKmZMuJFAHSYnRjQPI/a4Q0oZchPr7NeRs20KF6H+1t3upk46UdL
         p6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240343; x=1789845143;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/KtTlnq25tSukH1If3c69APSfMIY3/nD2byRCukec/E=;
        b=hyqTXZhNJFiqG5Wi1zhzodfF7IgzUeQu+HyevI8/ZwTENC7GztiKOeUrd00b+PdtOU
         RwQ+uTJg+AopQOURWE/C6ZDN+IGhdvB/CY/0RpH4fdyXBUl5ZDZXlR7yvFDdCfRTKqkW
         jFYkIEwdJfnk3SJrSeHa8swKTmNEWS25IndTOynAtO2aDkX7Brc7fqsw0mf3fCSmSEW2
         IkQOzG4BtOkPYUWH26m0DMgBdQR40hdAjS9EI7F8Th6AQTwhbNF3no6gpyITrtayjhWC
         DfzFrChqhiELIB3GQp2AmmauIRYMbvOjo16WVsEFXKzq/IZcfyxOeQfzr5AhR4E1AtjK
         36Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzZo43Vne2QhNp/t4cJ7VjEFTt41R46yXF/gfAPzC5lqLhL2fVhYbwgyOx5Ck7fafQnjNkIxIvzlbHY5DzV@lists.linux.dev
X-Gm-Message-State: AFuF++nR8ctp/QjN5KIPxD6po3OIeM0GwlW4CxOP3yR4wCNRC/be2pWH
	yntVM50C9+1EyhJEWkyfRvaXaX053yuSysUk9wg27DrH3xvwpDLR+T4UMW7BTlxcQMvduukY+oj
	S+vyFeUJKfJ7Dqd9IuMh8OQuLnytzR+Y=
X-Gm-Gg: AYBFou1tpXEcMsrFxnHH9PDHR5yuryqLmuBqsaow72Aa1ysGjbzB4r8RZr564D4zoEc
	La5EHB20WUlMRW2VK6MG9afBKHsBmEGY8bkT7rxvTZJL7abnH5I7Ls1WO4AaRSAx/B2TGS3woer
	lQURlkJ27z49zEiswB0TMHKYwPJzSuOoyQL50hItf0y1qTrbAfxQDyqpKvHDflWQRCmGtO641uY
	teY2HdGJdaVJvHUnT+YzgMDNCt5+r8imUrVqxj/QuPO4m6DmFTVAI1BXTz7rDVXOQoun72vRGKg
	Ev9usLOj6ENnEEubBjcgrSai9JJp1YDI6j5FNURx3bXOZmEa+sSmEHzsWco3dh6aDNNnOpy3SbH
	eTnzQl/5AmGV69weujarKmHY=
X-Received: by 2002:a17:90b:3885:b0:398:c794:ca26 with SMTP id
 98e67ed59e1d1-39d9c3944aamr16279860a91.25.1789240342643; Sat, 12 Sep 2026
 12:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910124403.95741-1-7israr.work@gmail.com> <aqKzBTM-CdBqQzXi@stanley.mountain>
 <CAGKr8w2e4YGF41X5mv5Mf2FDvoezpzeKmFMKaHKf43eypCKdFg@mail.gmail.com> <aqVSfA_Ns_plwCpK@stanley.mountain>
In-Reply-To: <aqVSfA_Ns_plwCpK@stanley.mountain>
From: Muhammad Israr <7israr.work@gmail.com>
Date: Sun, 13 Sep 2026 00:12:11 +0500
X-Gm-Features: AcwNN1VUFJ5oW7vzR94ZpY5ACDu7fbIXWq2PXETpg099etoVmWp67h8nKH2Oho4
Message-ID: <CAGKr8w2TSt0z2K5JDKViHVMf3fGpDtNEwqhedR10JoiXLB=MUw@mail.gmail.com>
Subject: Re: [PATCH] staging: most: video: add comments to mutex and spinlock definitions
To: Dan Carpenter <error27@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 13, 2026 at 12:09:00PM +0000, Dan Carpenter wrote:
> Imagine one thread is calling get_top_mbo() which reads:
> list_first_entry(&mdev->pending_mbos, struct mbo, list);
> but the other thread is calling:
> list_del(&mbo->list);
> It's a race condition.

Right, that's the exact interleaving the mutex prevents  with
read_lock held for the whole of comp_vdev_read(), a second thread
can never be inside get_top_mbo() while a first is inside
list_del(), since both calls happen inside the same
mutex-protected function body.
I'll write it up and send it as a patch.

regards,
Muhammad Israr
