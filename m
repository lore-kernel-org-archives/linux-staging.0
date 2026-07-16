Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EBA416135
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 10:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198046; cv=none; b=a+okJLJtxK3sILe9U1+OF1TdJdhfBQLibVohRJCJCc7BZTd1oTdHznu0oMOiMp1Zzn2I798u4qmTlaa/jZrox3a2SHmwbtLbL7edqUGF3S3usTExDyH7r0PY1HCN3ivK6WOmrXQ6z0n6Ruij3Ww5vttp/i4iyH/m7N0FbxVApp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198046; c=relaxed/simple;
	bh=WeL9TL4Gt8EdrX6dcZHIjgd7n84sIKeGL8Hj3EMT7zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GXu2XzwXFRYZfBBs03EAKORqgkwgM1hjIowYvmkHDGq6ZMSTq4eDb3z72oWOrqTS9eajLxT9lK87bc912c17IUKvN6jlhLdWfsnaFFFCwrgvlcKwdH/+qeEb6RK+rter2NL7gu//i4Kk0hjBH+vjmlF6W3PifR0EysZ5uhGmxM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsDwvVC7; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsDwvVC7"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c9452243cso31720571fa.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 03:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198043; x=1784802843; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlY0iE0nrfg/x1sTa2ofH+RF34ApEkPLdNPs/LgH//E=;
        b=JsDwvVC7Ejt6KGPnFY3Qv2wgX0ibxFIPPv2IbpEPM5BnnEqNXFJYeefH4gYh1zhsCD
         p5ymZdl2qRRYel7bK1m2+R4R2D2DSIsED26S2jgzci243LxlEL/IZqoMGGapyY5TpZO9
         z3A9plnSdn9LP0UTe2pVakk3VI+8tBjRLDhx3owAPezhwQFGd2Lx4zKEAEelXHnODIVP
         4r6al8rv9FmBC2GAH4KQEDjpwYQA1ZMCpBLKb2uYmSI+Xu8dwla+XMw5JgVuylYvKDnO
         GuLDufha7xpTQJKlACpYB5/4ootPsmtDqMKNVL8ZvgvHvBO5zxTHZsYuLObUFTrdEjvW
         Lnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198043; x=1784802843;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlY0iE0nrfg/x1sTa2ofH+RF34ApEkPLdNPs/LgH//E=;
        b=o32sAPe8ALIfYmwVRDeg7JWijdLLiG6Gp7MdSV5nXUe05fcyhyvhJE3UT7sdv2kDlA
         ZIdDeo0VrI3GCvZJ64qjbDOfn4iw1WO5j+E1895RR3lw3Bn8ako6Y9V6gRke48aI4stT
         vwzjOoUPKXC03HGYqOuNtKfpXockO5xZ6RHAmfD/wMwppyAcq+mAminT3VIlq6sTEYFl
         5QPOq7yVmB1F3XMxAJ6nSbLLZl86e5PNFj56f/MVOlgM6hkjnELgycjEf/w4Yl+BCQex
         ZH76MP4kTcxnBikSGa05h24popHUPeF1JIEEoeRvmxKD7FxJqegtDwTIuzfn1zADefmw
         dLyw==
X-Gm-Message-State: AOJu0YxoMNBg+luy1tGXS2PFiyb6hGueSRHILHFVgzBDgsBbOJ8LBmC9
	mh5kyCiRBv27/EgMZ0u6ms8sP4d4ucfrgT5pqcdbSnmekXE8xB3xTE51
X-Gm-Gg: AfdE7cnwis4yy6xkVp/i5MLirZwHklSpbvXXikpnjv352wjaeN+LKorrgG/7Pz0Yk0P
	LOAK9ShT60BxLZgU3o6ijBgngMYMpviXD5laZ19i4yGDLe5UjlEIB98YbmxnNLguqZnFkQENZMu
	Q3N3jA1wVqOPLk2jT63wWBDASkV6VWv+EsY2xosCkPhaHIKxWBvj35uJHD8zrT7UfB+w8e1M5Or
	NOZsb2qyQCPY96uDIMWVRgaqMHSDE/XhjoKsqYsdYvwc80aw+Jz/wbcO7wVKodgSDmWEjoxdbVc
	3Hs6ytH+aK2uf1JHedWvNpx8SFV9gUObQTECvgrEOcMcIgHR0l1dTL2lt5W5sMDvpCYSCkK1EGk
	uAuJtNTGBeGi8t8gdWG0Bc8BldlEfR4a/sa0Z7vVhfsdCPfIuIiMCghyJMltBbGs4WyTATShvRg
	dyLxY4XkGLrF2eMd5PHwEMrsMedL5W+Cd/lRAnDtQQQ9pOu5iseqvd1nxbuALrW16uTcPj2Ymvv
	BRI1qrMZhP9
X-Received: by 2002:a2e:3c0c:0:b0:39b:3018:fbb5 with SMTP id 38308e7fff4ca-39caa8af9cbmr30966761fa.26.1784198042835;
        Thu, 16 Jul 2026 03:34:02 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b1be8bsm46612611fa.17.2026.07.16.03.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:34:02 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH v4] staging: rtl8723bs: remove redundant ReadChipVersion8723B wrapper
Date: Thu, 16 Jul 2026 17:33:10 +0700
Message-ID: <20260716-remove-readchipversion8723b-wrapper-v4-1-9493b5f37c31@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260716-remove-readchipversion8723b-wrapper-16b9d8f2aaed
Content-Transfer-Encoding: 8bit

Collapse the static CamelCase helper function ReadChipVersion8723B()
directly into the main rtl8723b_read_chip_version() function.
This removes unnecessary code nesting and cleans up the CamelCase
naming violation in a single atomic change.

---
Changes in v4:
  - Format patch via b4 as suggested by Greg (no code changes). 
  
Changes in v3:
  - Merged the previous 2-patch series into a single patch as suggested
     by Nikolay. Completely removed the redundant helper instead of
    renaming it with '__' prefixes.

Changes in v2:
  - Resent the series due to submission issues with v1 (no code changes).

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>

---
Arsenii Pashchenko (1):
      staging: rtl8723bs: remove redundant ReadChipVersion8723B wrapper


---
base-commit: 4d4ac249a4f992a9c77c5187bb795f1e888d9614
change-id: 20260716-remove-readchipversion8723b-wrapper-16b9d8f2aaed

Best regards,
--  
Arsenii Pashchenko <ulijg308@gmail.com>
---

---



