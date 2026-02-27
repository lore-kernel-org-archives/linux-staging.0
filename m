Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3061136A004
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 18:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215894; cv=none; b=dQ8LaiANshS/VSk+Vogwh2t+8ZJR6M88xuEEDkDZ3wQ8KKNy4qovVFGbHzJGRTXzWc9aqDwpGfFF20cXgKeENTomz0+p+6krSZBE2ZpuTxWNzbVfb+1RDehIDG4q+q1JCX2DeSXoaXxUos4cQKAHH/WsztO0wVhQM3KRtqMfyPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215894; c=relaxed/simple;
	bh=fo3B7oB+sSB2hiVzZsjwPQUbVGa7umwme652FxS3D3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6Bwip3xezUscTUL+rA7pQcb0EEa2G5MGJ84EYJ0f3qneanJgo5duVT+lg2V2ai5n0xy/W3xfinhgSBLrcsmwgC9RvtpuhOffGUpwpq2z9MQ7/RYhMkrZZpN6T1vz2FJq7KgHiqifLLv3IQl2av7iJWhrbBh/rJAmmeXcP71JwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnorQEnX; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnorQEnX"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5637886c92aso1236503e0c.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 10:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772215891; x=1772820691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFYNoM2NcR8ueNygCdVE4wkvg/ukLjVQh5FqKAEJNlg=;
        b=SnorQEnXg3HSLmfTV1/fcfdozrX/1qXjhcQcfkbOZvM1Ug8PW+STHYg0EXhq35ovkR
         iBftyq6Ta9Do9O++uI49ShS0/7jM43FhlkaeiFmwLGf9zindCtPZLJ/xaE3MwCZXPDJo
         8VuhxrmSz5Ek+9h9uOzBj9SWF690RBAavccHruPUq6GfqPcb5sWotkZlTokIS/cpL21s
         Rq5xtc6svdKsepgnWyd3Dz2fLG+fTTwPInxtNWcYK37+P1hsVR1N2oKnbuXp43cnfhFv
         oHSdrGtufc6spesfmF19QJ0OWYiArd4ef0ljMmy02PvRXYATccJvwRiWVzeoxCFf0pLK
         Vpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215891; x=1772820691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QFYNoM2NcR8ueNygCdVE4wkvg/ukLjVQh5FqKAEJNlg=;
        b=EY+nh73GhGCU/lIdaGOQSfdXLs1qNQAyB4k10cnGvSHNmY50g2oBfys6FZYnaYFjgm
         Q0geLYjp7d4V2Ntkp9PIFUQW/O5sDDFlOPd6B+Z+psgI60dWr1VqDlTEcbU5Fv0b3ZLt
         ntCjswvy3kU5WhwNXg89dtL7FXg+z/hVFZNOGFI5kiey6zVkvYEVF6gyhBhxufjAcDeg
         p1QDbCfhSr4r0p9+N9nD+s9FTDR5GyN9c+9JGcRS4XrOm/Pw1jObV+NKxn2nhEkJzxL6
         Cn3uGckuQbaoWeKQZqoeCCyweYNcnfZ3/GCP+5TNRneu8O236hwHlCmkSBVChiNG6uBL
         H2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXTA1CGO0bUMZ2Bi4Y4ObgGE47gK6RLMjaccSdrsAes2CnEzd/W4YbA3n5yheWcaVJzG6bPeTJE1JPBaool@lists.linux.dev
X-Gm-Message-State: AOJu0YxmwlJ/vq63tE8jawaCu1lfB8LSIuWUW0cE0x1reIxQrm3RcWsC
	zivmXsMQUbvUKQlVwhkuWml2L36bYxB/UmVCOv2ldaAZf/eQvcBIy8paTQ/hoWPrsY4=
X-Gm-Gg: ATEYQzwoDbR0emFKPmE+UcIo6oEnccFfKC0sjRuqWnmwZZJMRdwg/daCFRqD+i2g7Qm
	whS2/D0t2WUkMQ8cKTv8LLNt2rDycyUU3uzyWN5VNJTVPxI96s1lMAYFua8UzL6X4hmzaLyf2zj
	5XCg1SxVTZdqeatfaqAj4/LQauepbQMvAgWY4/4Lf4Qaock7CKYdIEQsMNuIF1RXAycgxBNMEXe
	1uQ/EC7Jy0kewHL9ebS514/k0Ml4FpcEjsikinASIuhxUuW51a3Q5t74Ds8+nYXvjmLhzrCuZad
	WlXzkmCxi0umwHjT1LMzF1diD5fbw0jSkJ9lAaDVuAfRK/oyBoDqcCQO4Ex2W7JD7gEdrQp3UNZ
	Dvtm3cBZEhf5m43NzNGWuRdkFfOPtfcnNYtYkRZo7lvv++/nzbbLiWii9Zry6e+3YV2gigQm/n5
	mfyQbBD73HiCR4Fa76W8enLAu2UZ/uDqbjXko=
X-Received: by 2002:a05:6122:4592:b0:566:fe6c:e1c1 with SMTP id 71dfb90a1353d-56aa09ec858mr2079192e0c.3.1772215891120;
        Fri, 27 Feb 2026 10:11:31 -0800 (PST)
Received: from nixos ([2804:1b1:b880:4e06:554b:5779:2074:421f])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a92049d05sm7452905e0c.12.2026.02.27.10.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:11:30 -0800 (PST)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ovidiu.panait.oss@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH v2 0/3] staging: axis-fifo: convert bindings to YAML and fix style
Date: Fri, 27 Feb 2026 15:10:42 -0300
Message-ID: <20260227181051.36207-1-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227-unboxed-customary-7ce6eda1858c@spud>
References: <20260227-unboxed-customary-7ce6eda1858c@spud>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the Xilinx AXI-Stream FIFO bindings from legacy
text format to a modern YAML json-schema. Additionally, it fixes
coding style issues in the driver and updates it to match the new
binding's boolean properties.

Changes since v1:
- Converted xlnx,use-rx-data and xlnx,use-tx-data to booleans in the
  YAML schema and the driver code.
- Removed the rigid 32-bit data width check in the driver to better
  align with hardware description principles.
- Renamed the example node to "dma-controller" and reordered the 
  'reg' property.
- Deleted the legacy text binding file that was replaced by the YAML 
  schema.
- Fixed a checkpatch.pl alignment warning.

Lucas Faria Mendes (3):
  staging: axis-fifo: fix alignment to match open parenthesis
  dt-bindings: misc: xlnx,axi-fifo-mm-s: convert to json-schema
  staging: axis-fifo: fix alignment and handle boolean properties

 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 91 ++++++++++++++++++
 drivers/staging/axis-fifo/axis-fifo.c         | 58 +++--------
 drivers/staging/axis-fifo/axis-fifo.txt       | 96 -------------------
 3 files changed, 106 insertions(+), 139 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

-- 
2.53.0

