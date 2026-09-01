Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD1A367B61
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272410; cv=none; b=NfRlsmNxprOLRKGN0KNtpX2QYTsV1r13JUJtRv/2FgtVIDntqHULl6xkR88Xnuw5r6TlDOGPBFhS/YU6x46UevJTF1fRRRNxjbuZsM7HIVLf1rTfrxLN8U1hsO+KTE1fhbzZHTGKEaKgbKgeQdx4HGrYmky6iizZG0RZEOMjTj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272410; c=relaxed/simple;
	bh=sI3arS1m5ClcMAlmrPv7uI+K1rcejtMI2bAVU044Ygc=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=hoVIpdxZUuEeBnWUZNGrlRVn9tWPOwFWopfpURuVWFQUdXHfpMAVAnj1xPCT18TGrR1AEJZKtgSHehMd6/hNxvmNv5x3t9ePCDGr3aMQLAyb2cTY06jULjLKHpmvDVk67xRI5zqshS4opLgkCSqcx4mm5WKMhZEOeb2/zZM69aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASl2hYaG; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASl2hYaG"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso3735073a12.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788272409; x=1788877209; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sI3arS1m5ClcMAlmrPv7uI+K1rcejtMI2bAVU044Ygc=;
        b=ASl2hYaGJhSnLoQYHnMG1eokx8QCemUZ8r2wvN84HCfhxi7iRjCIVDnPvgYCjyqCqH
         Bom/tgPMgju35POUQ5Ie/gigbxnt6u/lg9nP97r1xNd5pVQTJZ67c+ToIAtLjvYJ/qHF
         WjUr4cMcW61Fz3MUiB8N+SnjSDk1NPDRP/JjwQpKkq69Jzu17JVqw28718JkRFmHAqYH
         06CqXt76ao3nSVVdxo480DaB9YaAnbzjQlahpPBssjGA/wVGlQC5i5A14bMdAYf+Xw5H
         Ac4P/3paI7HEo9uc7t/WbYcj7q4VOd0dov0F3Yh40mn4QpXJtrWSRF9XniFUbo4Vp9Oa
         rubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272409; x=1788877209;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sI3arS1m5ClcMAlmrPv7uI+K1rcejtMI2bAVU044Ygc=;
        b=MAsuw09NlXnBQZJ75Gu9nPQGulB0vqAgSkL4frByA/zXW503TmWsOMv6BWC8Cuwu03
         v496IY3CjbkJVoGGTOrg0ieuBa3/zLFUXYMLhGak7wftdVPhF+qaexherA/Y6dPC88cU
         d4zyn0cSDyImDOs83S0FV1cKc9YbaKzK24GCCSN5/wz10yj1qIq0CdCIFsGLnsyv+hAj
         n6C7BtyHcqnG2pbw7vdMiCttd1iR7OJnnq2ZXN/xLcjnjfQOTLEFDhiqefj2aBO9iOXS
         LDz1Z9EDBn6MTkTUZclvT7HXkpF/T2UzEkAGxT03NZYMGFkI+y5WKb+GkVB+oxNAygum
         3UoQ==
X-Gm-Message-State: AFuF++mRGRY1G1w/snI5zsdpIUsmwO9qIZCyLR4EFoiVvrizI7VgF+db
	mTwMa8JFBbC5UQycCTAMEyC+UWJ+QqveV1ManFxDvLZTqwS37D/Xi8Ko
X-Gm-Gg: AYBFou1LxzOd248a3ms+yiXwa2+5Nfotx90CYTyeRSvjEVt75VxhG7s9MWSa5tlEZuu
	P8f2xYbhk1d8z+4qxbP6tTX40MiWIBaNGHI8R/IGKEQHxSHeINrSzB6uCiLcSfPaAg5QXo7Zqrp
	85R0EZCEmEPGZE8uShTi0+4t3yV35sRFtsdIlPbW4f/kbtjjPknfnN52f7E0LiUWT3SDYZjvWRz
	NcwHzEf5mT0dXps/p+UUUFEj8S9imWqtFUv+JQvJShkWhvPhF5njgRhaH7bjm8SN5iHDllgoBI3
	t0k6sPF35Datijlmv3Yx5daVQHP581JnvJQPrlr3GP8jANKtNttB3PPnnmkttHBgtZhSlYIV2dj
	QSA/DC1Wgzu7ckZ/0O2H68VfDIcfURU4UKwvCKMfHZrk7BjMbuX+2+qtn3lLjpkToxeR7RqKWC1
	SnRr7cBD1E7bJ2fTT/L6AqyNfLy599q01HMBzkq6+WEJbBCZIllXvN0X/UjE7RnG3jh0EKSjmcG
	xAMoxSc13NTa4Wltu2yisu2ASjRMAetYNj2vPI0bTVemITixsfDggrqqw==
X-Received: by 2002:a17:90b:2888:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39907ab0ea1mr12700245a91.4.1788272408748;
        Tue, 01 Sep 2026 07:20:08 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:f149:be84:942d:9300])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d4b336sm37722217c88.8.2026.09.01.07.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:20:08 -0700 (PDT)
Message-ID: <6a96df18.ba0ac10c.150968.da3c@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: 1 Sep 2026 19:50:09 +0530
Subject: Re: [PATCH] staging: axis-fifo: fix underflow of tx_fifo_depth in
 size check
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 10:06:00AM +0530, Greg KH wrote:=0D=0A> S=
o this is just a bug in the device tree?=0D=0A>=0D=0A> How was th=
is found and tested?=0D=0A=0D=0AYou're right, and I should have s=
aid this up front instead of making=0D=0Ayou ask.=0D=0A=0D=0AThis=
 was found by static source review with AI assistance (Claude),=0D=0A=
not from a real fault report, fuzzing, or anything hit on actual=0D=0A=
hardware. It was checked with checkpatch --strict and verified to=
=0D=0Aapply cleanly against a fresh clone, but it was never build=
-tested=0D=0Aagainst a real kernel build or run on axis-fifo hard=
ware.=0D=0A=0D=0AOn reflection your first question is the real is=
sue: tx-fifo-depth=0D=0Acomes from the devicetree, which is trust=
ed input describing the=0D=0Ahardware, not attacker-controlled da=
ta crossing a security boundary.=0D=0AA DT that lies about the FI=
FO depth is a bug in that DT, not=0D=0Asomething the driver needs=
 to defend against. I don't think this=0D=0Apatch is worth carryi=
ng -- happy to drop it.=0D=0A=0D=0A> Did you forget to add an Ass=
isted-by: tag for this patch?=0D=0A=0D=0AYes -- I should have dis=
closed the AI assistance in the commit=0D=0Amessage itself rather=
 than leaving it for you to notice and ask=0D=0Aabout. Apologies =
for that, and thank you for calling it out=0D=0Adirectly.=0D=0A=0D=0A=
Manush

