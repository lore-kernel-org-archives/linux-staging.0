Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707983F5BF0
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730470; cv=none; b=TWdgqoyW1lOb/ISxwBi19y/hSPsxw2XewllYzJr6IshgShP11ai5nrewYv+jYzdedqik3wYalPeE4OXdQ7OPX/IwLSk9nKLFOiZ7IeW/jZw+UVA5c89aeCZJLs6V8N7rdBpGcGf3dAyKQtCEx11XxRLFNT/XkaiqvIv4JJ/Dy3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730470; c=relaxed/simple;
	bh=AQHGa7C+PsKFd92HBNOc4W0hXFzueGHdPwJA0P+13QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5zmNe9gkKXiMrxlV5pNjyeQpkpwO4WhYCo/pi6YsSOjm9HSggkC4FjW48d0L3dws9nLh2bwXdrhP5pacWBggTcgEAlfDSG5+klGRLJbBVyWEwYoWBv7ra1S3l5Rfrbho8Z9c7AlOUtNvWFjbZ1e8H4vvbNx1/IViI0L3YZHeTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCn/Z6xm; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCn/Z6xm"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so815057eec.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 14:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781730468; x=1782335268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYPxVmfK+JFkSo6OAzJGIDU9L0WOJKUthcrwdrPYEZw=;
        b=VCn/Z6xmVw0cOQqBaMxdHrn1bnsFrXWd78H92+mNcZqfTQi3IXKW4VC4duCILT9SV6
         fdUUBi4t2OJx43Teg7Rr9B1qqbPYoLTGSWenAzad4lpj89KTNDzr5KMt5oCKpLRBeWKt
         5zs7plQYfqnmjHZL5JUr9S+4eq/oWjczGcU+yiGOc7dd7z7bFYT1aPr8uovaSOXM64eN
         YhMSfdRsmILd+2Bx/6xEo48HUnsODTyWnJasg4BGT7AeCpVGBM40IFHlU+X4PUGhoO13
         XPp5EYy8PCr9GycsHVDpf19vfSL3TaINSW8yB15mlbj+/DbHu9RYXATYnYyzMnkUn8+x
         N2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781730468; x=1782335268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYPxVmfK+JFkSo6OAzJGIDU9L0WOJKUthcrwdrPYEZw=;
        b=gnLuMux+9uqqZOItnI08tT7U3azgQ9mT6G4lXlO617AAFNDixlcZKCDt0tAbSUnnrR
         VaJXfQHLpYMA2SlgAfQIAn6Ua0dWG+myTeVTRw9blcLH0TtVU16sN0debESjfOQj2jjO
         j754yg8LkJ8ClfAkkIoEpmn19zxMX2tuQ4DOj8Kux+GigyPyXU1IPgg2I3e5lMmEf2q5
         nNhOvE0nOd98+qu/XsrWO62BZ4DmTMwZaArj9Jv94+riA9S0zCc/in69Av1ia3YWaqmr
         +EvVz7z9s8vIH6mncT1zekP9ZmukWoaKGFZJYTU7ZZJ6lQz+Zly0d8l5l/EL+RFH4xyy
         CtjA==
X-Gm-Message-State: AOJu0Yz2s7fvzZVUZJeVY68Um6pOjwkhI4ZuA7T+fSZdJOQCETIwM4Ls
	mJ/9Un6ZQWJQvR+XqbpiQMBSEP/lnxfPV4+P0JPCChM/WhDT8EW7gmMK
X-Gm-Gg: AfdE7ckSzyGsYt5YFY2KYOwKmAJk/nnUG5uf5jpMVH9RbVtd94Ofsh1G3p8OIYTbDBZ
	RfGn+eXtmn1fZnSNgJHKij0Zt00gv4sTyW9j7jSsZuLVc3G6qalF6vgaIMXG9dC/H//zJqUFwZY
	Cq3BeUqgdYgViO4JmovsxP/rQWpf32rMOxRKq1sF7ATA3w2iqKM7TEemHIhI6cde9EA5koojVSi
	1fmhyoEmH5Ix/IYf8S1/oyfdvG5KodPh3IOLvpHfetJMq2O1eXF4iMXznKtcfeq1lXeAXRxX8Lb
	GM4T1knkPfxiG8Rs9qRQQF9BCrzT8UjrPf/G9iXCcadYRqWiODris770OfrKPSe0xt5Y0qtFZL/
	enNcdF+qD6ccu3FXlfMi9OAifI9CeERsKpOPnu9ztCsQ7RyF6co5HEYscaHgL7pcOu4ner0wdSV
	tI9ru5qQ==
X-Received: by 2002:a05:7301:1985:b0:307:2e1c:17f1 with SMTP id 5a478bee46e88-30bca0cebb2mr3003624eec.25.1781730468297;
        Wed, 17 Jun 2026 14:07:48 -0700 (PDT)
Received: from qchaos ([186.143.206.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48e412sm26051224eec.4.2026.06.17.14.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 14:07:47 -0700 (PDT)
From: "Pablo D. Bergamasco" <danpablo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	danpablo@gmail.com
Subject: [QUESTION] staging: octeon: is the FIXME in cvm_oct_sgmii_init stale?
Date: Wed, 17 Jun 2026 18:07:43 -0300
Message-ID: <20260617210743.1825733-1-danpablo@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

While looking at drivers/staging/octeon/ethernet-sgmii.c I noticed
a FIXME comment in cvm_oct_sgmii_init():

    cvm_oct_common_init(dev);
    /* FIXME: Need autoneg logic */
    return 0;

After tracing the code, I believe autoneg is already handled when
the interface is opened:

  cvm_oct_sgmii_open()
      -> cvm_oct_common_open()
          -> cvm_oct_phy_setup_device()
              -> phy_start()
                  -> phy_state_machine()
                      -> _phy_start_aneg()
                          -> genphy_config_aneg()

Is my analysis correct? If so, should I send a patch to remove
the stale FIXME comment?

Thanks,
Pablo D. Bergamasco
