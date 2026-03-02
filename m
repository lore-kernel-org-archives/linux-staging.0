Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E54175A81
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 01:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772415397; cv=none; b=b4MeHllA7KcmHP8g5mpzxuaCkYEd3g4fH+gDkIIc15l6bykdn210Ntca1fr6TjPwP88/C/Fk8xHU8rojv0heHODZ2mRblyza4f3DeRmRk7qF7tCEdP+i6LC+VeWS9SGqZ1Lez4wm9NeWNClHcAIRLNN0OXbD5v7iWxuWp0hbRs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772415397; c=relaxed/simple;
	bh=HAn8Q0qD46S52DsoD8KOFk0HLdGDwh1bHqGsoxSYe94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQyk0xIkBMPOSkVyG3jEaURQCc58ZF7g9crrGQVjjR0y8x+hz+zE1pd1TI/KNNqzdVaYxFlDl925Q5OzCl2SLfU/uzzbub5Wb1ibur+7wBd9X6qrPv0Kbwoa+H+ijD56QCCEfhAeQrm52v3lYc3xIvZBY+yXyjYP9z6lvN9QHlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKxAeYBA; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKxAeYBA"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-827270d50d4so4025739b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 17:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772415396; x=1773020196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JXaV9B2nw2SEQzT6yc0N2Gk8LtML7jgrgg7/O8SJR1I=;
        b=nKxAeYBAKz9Quset1JbLTGButrGDG/Jz44z4d7JVeUDaw8ruwu9E32OGXJXkuBvYqR
         K/lVOdIA6MCP8MVtOoiw2VmtvaxcNvbCEhIxQ57B97HYl/+6ulEU8ffZtAywWMNbsCrW
         wwjtyXkrvWZ7Kq/4dIsccc6zGuT++YuS48o+udH06kOY35Edm7kAEYrdfuRdBfhIwvLY
         jBfuF8gNP/L485Dp9DUbPzmKTvYoH7HGR+RNbIrJ9yl0N6Ri6tr+ggrlr3pAzYFofHCd
         aBauwhPPSBH+JXu7IrbyG6sgh0GBG7xxryxaHiRgtbXEowXdOC5Rv/sT6PinYX3Tc5uR
         sQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772415396; x=1773020196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXaV9B2nw2SEQzT6yc0N2Gk8LtML7jgrgg7/O8SJR1I=;
        b=A6M8/FsI9iJ8b7ObEjsDp+3NdZDVNoF7sYB+0KyOBjue2v5FTvizKCN7FDe+oXP+Bp
         +F6bsfCS7u6UqDLcSfpUAq1n8KJKVj3sLiAOwXnbm6q4UMu+EoX+AtPHl+P16HV2C3yb
         2/wWuLbTh20Lm8Y8+i451TeE1RZoh2OrBnFPFkkNkS2dEiyL8h/GWwccL3MWk/GbMQqc
         0G/yBDWeb4KadKNfv8czDThZcZkeTaU8JS9b1WHk71i6I7U+I4B1ztpHbS0ufqzZiGpQ
         5Z9ojc2Jlx47wy0tC39ELusat/ogC3xLxkz7xYECdrHIrFse2WkB4KxTaBI4xMcxIlMZ
         6uNg==
X-Gm-Message-State: AOJu0YxGzFw4QX12CsAjhUD4IDphQRrhdVs1Mba56mYi3oFwAyk77IA/
	xDQXHtdSP/CBDctkczw5GofGnpavp4C1EhyZnb+fMpx2I3MGPLBSCHV6
X-Gm-Gg: ATEYQzyWTqhqtmD/elFqRYBFlVf9ht3bPzbE7aL+UvzcED57CHmYqdXBC2cXPDq+072
	KjmlOZOgYcjxF+Z1TC6pkHb05PiJTInHM8vCXAcxTrVAuxVCEUbIihqj9j84vijzHMVk0mfXSCB
	6kIg4UPOQP6MShaNl+nFwCaAsr6QypGCGngS8F/HLYi2dTVjpDh0JAQgv1v39xPjkaxLHlZ6I8z
	uOlnW250bjTpbVWT+1UsGaXMTho5Vt1Fi7evk6yKQCORDc5lUh4QdNkoyRX7N7eHN13+gUcfpt9
	TsOrWIe16M26NNzPguHVobpEbcI63+0n9+xjmxXhTSk7UWtBZ4uMlcnpsiRk+xky0kMYJYDdy9u
	M5MFErqQZUXfYVQhjWvz5cM3I/wv0tBKXthrHOSHeC2rkBSMnN3o+7aF8hj5LJI0/nWivoHPJxA
	RQKv1FPOeQiSZBxvqMCKGu5zAR13E=
X-Received: by 2002:a05:6a00:3010:b0:827:28ba:ff03 with SMTP id d2e1a72fcca58-8274da1294amr9148648b3a.44.1772415396047;
        Sun, 01 Mar 2026 17:36:36 -0800 (PST)
Received: from linux-dev.. ([104.28.157.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff324esm12202688b3a.38.2026.03.01.17.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 17:36:35 -0800 (PST)
From: Afkari Zergaw <afkarizergaw12@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Afkari Zergaw <afkarizergaw12@gmail.com>
Subject: [PATCH] Documentation: KVM: fix punctuation for e.g. and i.e.
Date: Mon,  2 Mar 2026 01:36:09 +0000
Message-ID: <20260302013610.3815-1-afkarizergaw12@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing commas after "e.g." and "i.e." in the KVM API
documentation to improve readability and follow standard
punctuation usage.

Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
---
 Documentation/virt/kvm/api.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fc5736839edd..c8500f0e913a 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6346,12 +6346,12 @@ A KVM_MEM_GUEST_MEMFD region _must_ have a valid guest_memfd (private memory) an
 userspace_addr (shared memory).  However, "valid" for userspace_addr simply
 means that the address itself must be a legal userspace address.  The backing
 mapping for userspace_addr is not required to be valid/populated at the time of
-KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
+KVM_SET_USER_MEMORY_REGION2, e.g., shared memory can be lazily mapped/allocated
 on-demand.
 
-When mapping a gfn into the guest, KVM selects shared vs. private, i.e consumes
+When mapping a gfn into the guest, KVM selects shared vs. private, i.e., consumes
 userspace_addr vs. guest_memfd, based on the gfn's KVM_MEMORY_ATTRIBUTE_PRIVATE
-state.  At VM creation time, all memory is shared, i.e. the PRIVATE attribute
+state.  At VM creation time, all memory is shared, i.e., the PRIVATE attribute
 is '0' for all gfns.  Userspace can control whether memory is shared/private by
 toggling KVM_MEMORY_ATTRIBUTE_PRIVATE via KVM_SET_MEMORY_ATTRIBUTES as needed.
 
-- 
2.43.0

