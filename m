Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5DF4218A8
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 20:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222951; cv=none; b=Rk/Vyb4aGOgF50/G377G+sv9FjfI2V3+YdSePNwYoZNgT/6zWNSzulG7e9m01Np4fbAZothCvgFUWRNOKL8YSNDP/WtUMQ0b1rebFvGjvGiBlAYqY0N2bae+/f7PwfKucCoF3gDSCEbXGZ3k0qaram6hBXWHjvcXYBmUyCUTo2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222951; c=relaxed/simple;
	bh=rMhJdt8IxJAWNFTx24wNqpH2Ye7R9gzSa0MlyRRUKzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2xrhj+lB/UCP59l58wvykqJupa60ObDkJP+3gGK+JkjwTmr3f20g3q/8qyDvBvR+wMyvrJiP8UNdOCRqG2HCVtWcjEkdJF0MLa+KrQ/JXbl++vk5ozEqIDxqcINUQsr+uWC1QqRtK9YG/QMYUCjSMiIBDNmNwfw1cNrd6GwXwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PToQLY8/; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PToQLY8/"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so643549241.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 12:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772222947; x=1772827747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=35L099EC72Osu0PGPiVEZCVNp0VZX/D582fSy7pRUEs=;
        b=PToQLY8/n2K4s7lLDGdVFzdUOPkHZW1p9aTLNIhwSfl8rzvbqtK9QQuPzSJoy4sst4
         FipoBMF/vOFflM0qsuXekVnXZVdqbejkwFs39NEEvExSEKscBpF1TMCehiNWS1Vo5DcR
         sJ0FdtxMNxxR+bmQ5UGL07s3TjuKwB3aKlSvzIJUO9QajDokgCQqGtOIRFuqO1EoXRB0
         xasuzvNJvsN9PWUpaywnERo/HVbQUsezS6r6X7FpcUpbP5Y7ZTPe07agQTyTUh0QnldQ
         oAhna/UzL5z0J/7EMUQp3vexdVLieBqAjWeM9IykQkfrJ610naAY7YIPRJs9jIEVJpTq
         aFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222947; x=1772827747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35L099EC72Osu0PGPiVEZCVNp0VZX/D582fSy7pRUEs=;
        b=nAxORGCW/JFlXCKeVMalhc/+jDsu3diUYPwGOVjDIsSpO7Fk3IKHm6jceYK6hJeu1L
         DOn73IBgV3gUGgadyYP34yuAmtd4THj/AbsG4B5+MRGvDPk/di40h0EJZ/tWhvXSetK2
         9to6sdgqOiwFyiwuMMKivd4+zsIdu9XrbwW/C4Ppdv/mLHoCE4NBHmmU2nPVUixoMGcG
         M4FiS+JJK07RbUaXUkDb1PE938fWG2fbVvYSGqXwRfrsI+lgXj+czaaFkDq8Fv++l9b0
         /meU7kt1/UIJW4TzvFYU8KWwtfWduKKVA5WKmqgz676tP/KtnHTFK3FYCDWdepTCt+4r
         Chig==
X-Forwarded-Encrypted: i=1; AJvYcCWilksGp+LPVzO6kGSkBgdq2Xcgl5wglERt/DB/g6lwoIStkxXR2tMsOhCPZ1aiwTeMn2Xf5tNlEsIWi3nC@lists.linux.dev
X-Gm-Message-State: AOJu0YwdT064PXyKu/KVM2KZ6Iz31ZWlrOuabQ8UW+3Cf5fVlYnhJtmU
	EaE70v45jeGvYhXYjllv0jUCrGdv7VVjfvym5nDbBGyGaqW7J40+ra48
X-Gm-Gg: ATEYQzwQJ1kIWnBwc5Zz5i57nSgtXGJkYrmA2zviKa5ddLciTwoJmzRoRFZ2rRJbp8m
	W2ra9R1lv5JXBhYwmjTj/gHVcw/dqbUhRbTiTQNwVCsDIotOtMB6kevIdW3eQ4K8SOSKCXTev5l
	rt1WoQP4n2qZJ5I4MdkqNyudjuAYRyi0R3P2oRRsVd5H9sbQYSRvGk+kBl1eRuXtCRfkaOsQnUN
	cy4ijb2zWsMMudnRIBFhpTF0fQqviodCSP9EsLUv+NiFWiPvuv/UuIu4YD9XE80hv0s8cMwMhtO
	f0EDGeRpusImf4VF0fuGXbWuf/kQi1F48jzhCoKSWpSk7cmO+DZYXR1apHvmdXcTEthOhn8QrSP
	eSLXEBQW7WHY3AseWGB/VaE5Dcd+w4Hgn2ptfOmmeqJuRf1XRA592PlN75/nw3F6MrqypHJYII7
	o5c70XYU+xGlBiwS46EzXbDEXW
X-Received: by 2002:a05:6102:3a11:b0:5de:db29:5c07 with SMTP id ada2fe7eead31-5ff324d892dmr2010158137.19.1772222947352;
        Fri, 27 Feb 2026 12:09:07 -0800 (PST)
Received: from nixos ([2804:1b1:b880:4e06:554b:5779:2074:421f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6f7fesm6479027137.13.2026.02.27.12.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:09:07 -0800 (PST)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org,
	ovidiu.panait.oss@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH v3 0/2] staging: axis-fifo: convert bindings to YAML
Date: Fri, 27 Feb 2026 17:08:42 -0300
Message-ID: <20260227200857.50880-1-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:
- Fixed commit message formatting and content.
- Sent as a new thread as requested by the maintainer.
- Added a more detailed explanation for boolean conversion.
- Renamed example node to fifo as requested by maintainer.

Changes since v1:
- Converted use-rx/tx-data to booleans.
- Deleted legacy text binding.
- Renamed example node to dma-controller.

Lucas Faria Mendes (2):
  dt-bindings: misc: xlnx,axi-fifo-mm-s: convert to json-schema
  staging: axis-fifo: update driver to handle boolean DT properties

 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 95 ++++++++++++++++++
 drivers/staging/axis-fifo/axis-fifo.c         | 56 +++--------
 drivers/staging/axis-fifo/axis-fifo.txt       | 96 -------------------
 3 files changed, 109 insertions(+), 138 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

-- 
2.53.0

