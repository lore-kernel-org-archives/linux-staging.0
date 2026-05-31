Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C04E37DEB6
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780239048; cv=pass; b=FKFGZvL8Fw5n1aERSWOJmdEEPFOHhDlMPhnH9+CGTKlqkakbsIyLuwAavXZDw0RHwYyPi6bm8eBjLDAiFWEVP6CYSabua/uP72liF1CD9BfNgPAKliEfIg7wj9sRS9PKNnm1x/x6QzU9muNnt5lXfgAH3+m3dazRqwNvl0psEEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780239048; c=relaxed/simple;
	bh=00TEAGz86ZinNxtNPkYkxSIq5f6e1VKR4IZ8aV+ckg8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PfqMOWcxQFiI2E64tGb+MQIOCg1ImW/NAj5ZTW9lgtiwgsZY9s4w0T8YeTLDIdhyhkzv16ODRmuVuKqZ3b0PYZbO0LXhsjtiSpE4dLjwOHhupxAiX++dd5jRcmnBC+/y3H2s/j+WpbwT61xwZG1hD8cnn142ithRx1MGzaLuWZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2rJa6s/; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o2rJa6s/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so1904254a91.1
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 07:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780239046; cv=none;
        d=google.com; s=arc-20240605;
        b=Y4ulhaeYhLy+yNQcN92sY8Du0N8XPZHiWoP7kDll2JRgyp+RHUDrnZx4yNdyfEnkRo
         omCCTVL2v/SalDqJXm5E87NOBPdl9lkqpR/RTnMgjfYWLHvEilq30EypJciYL66S3xnN
         nwCG1MKve7T9x/mm+41auvtUYDoyJ2eESxjPagB2BqzwmOS6G+x8sT2y9+K4f+xa1C4f
         fa6i2HnsdMVR9gzTylXvcBkMxiKNld8RYTp8BJaoqkjkwteQRQf9oMQE8DZJjo/7Tli7
         hk6wiUGS8pIhIrVZwTlMQA477od1wbm1sSKNRxRLJy0DlcVBLrNqAj87bCXbZ7ju3Y0H
         c+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=alr0cevSmwlVQXo691+fLjwg6MiDECX2vWqD7VKBSjg=;
        fh=L6A4FVJx/8gGrlpwqEuGi6N3E7Zc5joZuKPMO4zOSYc=;
        b=KKzHq2SJBZuI9K4OI7sdQaCJk/70StB43ckUfSFN5jkSCh6f9cxOnzPYv/rKzdVzd/
         OKBlhOI00giQyhbbghNB6muKTwHNczK8cYF2xCu3HXmK6+tO4BNWdeQLnKKCYgzhvOS2
         8WLbwVipE4UZLJE6loX+Shl3UiO2H458aZrwFc3eA1O+PsVOmr2fZrTm4O0qsb4dn3Qv
         LHHXRLTWssddJp0G6gAj+uFJPeO6LdDzcxa5kbdrvcw8Bkft0iPM9HXojxLWOTIk6EUi
         /WdqJxfzO9htCIRTL1cI2UVIVGjycx5xIyZfF45lbm3TUL3CxigbmXI79yRiHPfYWIU8
         espQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780239046; x=1780843846; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=alr0cevSmwlVQXo691+fLjwg6MiDECX2vWqD7VKBSjg=;
        b=o2rJa6s/FAA+IAyBeElRu3pFkFBBS28KpPzGyJ5KBJW6odoS6F4CVMCG5rwE8lHAxA
         2joxyMNYoBQ8LfjP05kc3hKtin8KbPHJovtrVxPYKXFZHPM9jTPLF3srcD6zJLVXT9Ha
         PyKrazgV5DhqDBP4kF6IjU04kA/XH28bWnquMvR80IguWSqMUK0By/otFlr2T6ncHdsZ
         aupgDY4mt+ApOJtpBcVFlwhnAQm1sLcLOOuONmPJ3Ezx2P38Oid7lEg8i08wk/wQZ5Xq
         4RJ6oTKH4Ksdip1LUWnXrMwNGzAKSH2/tAbi28rxbsMZeIsYkolXVW3yRbAN3tCQKFlP
         vFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780239046; x=1780843846;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alr0cevSmwlVQXo691+fLjwg6MiDECX2vWqD7VKBSjg=;
        b=hCKagLRPAGQ3qHEiiuk+++rcioQNFW4Hp2dYjtWN8Iag7qiGA6Wh8EfzX0uCt7KcGx
         89IqipgeQ7+OcCOlT7hqU5sAhI9GRUIc+hbNGtwloOru2n9612WyeMrwI85TUcYweQ9p
         eZRndq49ftu4VeJxvvMdtCHtAt6ooX+sLXJwSclro8pus/amhLB6QX7Uc9U+COJfQFAG
         1CuHUsN5YLFRa48NogCH2/T9se5fNTgR0F/KAEBWdbvh8wEMsavkCVIoUwWeBbQkJmys
         96L/qM3UM8+rnpHKiKHnOZ0Awc3KLJ8kEJNXa9HNi9R2kjyJhzVZyoTNVP/MOKjheIsD
         9X0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/337OoHlETlPxTERqKeckGPDr04KoBzMPMit1xgd0dDU2wCYKLwdbmOeuei/4uAjpQPT4UI8RUxpBMjuX0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Zwn4lIEX8A0PqEY7S5Lhn9vaZxJa79ZrvP1LHhuI7iSwgEAT
	aBb5w1r7goy9UgBunwRQrRYQYnLEfZPdHv9be5E8+Z8HkFr1KYuKFTm883NjB3ZH5gYhYPWsRgC
	isfWVQrPKUgjuJjKu/5vq3KogzrkE6kE=
X-Gm-Gg: Acq92OEOLrUxcB1lQKAHJhto3dTPLWBPdfXQbaXV7fh/LchjHCGS7AFJgxWsooWYZHQ
	LRs7jsVW1qas/RJ+2VYa1MZ0QPxsGADTsdKfmvSMukykb1x91bWjNyzlAxhuAd/2VxUZ3PHyZrt
	5M2lyNKruNOakk5EPC2XL0pCkdQzSQC3t583ub+4Zrb0YnLzsxSNxoCGbe9QM1R8e5kgNpDhRTu
	GzcLTr/RG7opn4RTQZPBJg6JfqaDgtPPTdz/n5EKSBLSIByUV1usW1MXyyT5YI0diLoXXqcbWCX
	OyVPwrMuluB5Wj7a3PIogKavzRiTq4g=
X-Received: by 2002:a17:90a:d2cf:b0:36d:649b:ea46 with SMTP id
 98e67ed59e1d1-36d649beaffmr5225695a91.2.1780239046249; Sun, 31 May 2026
 07:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Grewstad <dogestad24@gmail.com>
Date: Sun, 31 May 2026 20:20:35 +0530
X-Gm-Features: AVHnY4I0bdqKDSDpbxtaHikPCrAQjQXtcW7k-UTC0757o0c6aHNjTsyA3G1MFds
Message-ID: <CAD03fjaBJGtNATBxaYO-PAxdKC=HxYgE+M7HQ_a0O+3Sp9Mruw@mail.gmail.com>
Subject: [RFC] drivers/staging/axis-fifo: TODO file and subsystem direction
To: gregkh@linuxfoundation.org
Cc: jic23@kernel.org, jacobsfeder@gmail.com, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hjk@hansjkoch.de, davem@davemloft.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear Maintainers,

I am interested in contributing to the Xilinx AXI-Stream FIFO driver
located in drivers/staging/axis-fifo.

While reviewing the driver, I noticed that it does not currently
contain a TODO file describing the work required for graduation from
staging. I would like to create such a file, but before doing so I
would appreciate guidance on the expected long-term direction for the
driver.

The driver currently exposes a custom userspace ABI through a
miscdevice. While this provides a generic interface to the FIFO, it
does not integrate with existing kernel subsystem tooling. One possible
incremental improvement in this area could be a transition from
miscdevice to a proper character device (cdev) interface, to allow for
a more clearly defined and maintainable userspace ABI.

Some possible directions that came to mind are:

- UIO, if the intent is to provide userspace control over a generic
  AXI-stream FIFO with minimal kernel policy.
- IIO, for data acquisition or SDR-oriented applications that could
  benefit from existing buffer infrastructure and userspace tooling.
- Networking, for packet-oriented AXI-stream use cases.

Before drafting a TODO file and proposing patches, I would like to
understand whether there is a preferred subsystem model for this
hardware, or whether the current architecture is expected to remain in
place.

Any guidance would be greatly appreciated.

Thank you,

Arihan Bhor
