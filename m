Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAC033EAEB
	for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 04:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772253722; cv=none; b=kBNEPYwGvbAvrUjyMhG56/wAlZWOJg+q55QD9PdmyAqZsv1c1Ec/DLw44yaWZTq3AsAiIWqRxrcoNgLHul3dsV8YzS7J8Mm2hzJn0GTim22qa9osRPe7faKTryFyLEVp0rIXXY6CozGPVkdQr8h2z4OFzLk85YCPaK2c397EJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772253722; c=relaxed/simple;
	bh=08dn1ZeHjBwAEbLfVNlcoim4nX5jYOek/32iAum5lKw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=liZIyrIgsiNL4XLUrvPZvEfza/ivqKy797oVKbuX+fcoqTyrQk+h3aLTL2q/OVqfLSBW3nxIXjEY8aFPlaLZaWefpOktaujsBF7UDz0FSJi/NprOdE88o4vVc3oq/KBU/bZbHEHhomWmxxHvrXngxbfSTUlMw3kioqZbc9PnWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2tAaqYI; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2tAaqYI"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7986e538decso26872217b3.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 20:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772253721; x=1772858521; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08dn1ZeHjBwAEbLfVNlcoim4nX5jYOek/32iAum5lKw=;
        b=b2tAaqYISL3jo8SK/mRYoFZVPR3TkuWu6PF5BRlzuevyZVOaQboFYI0VCTAXADCx1V
         Erwis2RElTC2uW2ttnDWDJD012o3VgvOxP9yY2KGez9dK03NaIMMn8LYZYYQBMZpRTee
         O/UFFCmZFY9nJQGmuo9qffP/0PHSLqWJs3cuOLPkSQyyCU+Wg71LzffSIGzrdEyQmmH3
         e+bgLQT9MxSJtKA6UwqXRymg4dypWGBgvrAtajayfaZ8sgpWpcxQubD60E9oi0W9wxV1
         fDmxhnuY/m/iQFND8kDPmGdmq3mHj3BqWsEva4+2PqsFD1SpGF/KYy2VNQcmbl0O+YD1
         Nq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772253721; x=1772858521;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08dn1ZeHjBwAEbLfVNlcoim4nX5jYOek/32iAum5lKw=;
        b=rzOxxKSKYvPvTAteg+j40R3pNANc9TqjT+j1B8MVruyEw//j8Ol+Q8bsU+gfKnahWg
         kCbneZc1oIkggLmQA3IG0eabS3MI94GuN0HF/B3+JRM2jJeZ6Erx4MlKibSU4E3XEk2V
         rq+8nIJt2N2XmSjC/2F3kBMQJAOmFswGDOyc2n9fBf/P9PP1y81MVALK1CKun6a03mLL
         v2Ug9zbYXsqHUsmqGw28DI1zjiYZTH//1SWz7FYnniNsOnAXUVzK0tRLdNIgZ94RwDDm
         I9als+OFCInSiQxwdWmgiVqbirqb/MspI2tQFlygmpqksaapzqqPWV+Z2rUlf/f4g8Eq
         EURg==
X-Gm-Message-State: AOJu0YyHFp94/7hK4erTGK0/f/z10YzIwZUPXKTBceS9uQ+LFGO3P6HQ
	sjDVaCy8Y7bxZ9Ex63x+PjSYvmv9xf5HWLwWKhrKyCdcumk66fz0UA2B
X-Gm-Gg: ATEYQzwAqlUAlV9XoZn7Q/h8qNM0uztC96FMiS+geVslvxa6aOp/2cONolbPpNLqBif
	FIQOKKVGnJPU0gubREa85wF8sL41xsfYdMGU9BpcMSucG2dQPXYn+MT013Wqgl0LZp+d236IEXv
	e1u0xjDzH6BaGpKe7fVd6Cz7GHefko4neNG6riZYPcFVGCQtl6Xt3d0no7w9bAziHGBNHgmmdbf
	SHBoUCh6TYB8ib+lLnQbiAWimQbtKjV2ShsaACSZ3KWpeCdS7Bwhd63NH1DJuga+pQAHjVEFyIg
	OQbQqsrYaSq2AHaHua8pfeCN1y7InOhSmGG5DJCAhlPgz41em9hblFR13Ftu7uBqhmAQM6Zj0AA
	n7pXADO+sBv2TReH/Rs4y2CLo09ZtOuTfy00gNSUeCjlwU2ZursgOyZPAC/CZ5FJgrNnBZ3MitC
	mv7Zz6jraV0grv3qJvYr/KcIxgxjmQaOcls+qEkkdWFYYmz5/IS8lUXLY7eevaLezhy3WyxnTC2
	TDgUOjo+Rg3kUuiQ/C903saN1JLKnJ2
X-Received: by 2002:a05:690c:c232:b0:798:1219:c779 with SMTP id 00721157ae682-798855fe09emr45017317b3.66.1772253720652;
        Fri, 27 Feb 2026 20:42:00 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ac3c0dsm28430257b3.12.2026.02.27.20.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 20:42:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 22:41:41 -0600
Message-Id: <DGQBI6RTZBZZ.2WTGT860M6SI7@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove RTL8188E references
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikunj Kantaria" <niktechgig@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260227172734.2266911-1-niktechgig@gmail.com>
In-Reply-To: <20260227172734.2266911-1-niktechgig@gmail.com>

On Fri Feb 27, 2026 at 11:27 AM CST, Nikunj Kantaria wrote:
> Remove all references to RTL8188E chip from the driver code.
> This includes renaming variables, deleting unused macros and
> struct members, and updating comments to reflect that this
> driver is specifically for RTL8723BS.
>
> This addresses the TODO item to remove leftover code for
> other chips.
>
> Signed-off-by: techy-Nik <niktechgig@gmail.com>
> Signed-off-by: Nikunj Kantaria <niktechgig@gmail.com>
> ---

Just have one SOB which is your real name. Also, this looks like the
same diff you sent before but you didn't version it. Look at this
resource on how to make a v2:

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks,

ET
