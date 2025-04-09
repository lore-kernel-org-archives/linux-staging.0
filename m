Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E69212B3E
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178372; cv=none; b=qd3YxBRVu6Ow3aI3pN2NI74xN9TWQiel8KA+LNVJEDBrWUSwt+5KqPHzbu6dSlQJB6Fq1DUJv51f1/uJ3eLjRh7OddjVUNd5m4mvdevhyukcIw3uLm8Ohb7BFAOQpMyLLIcaFZe7tI83z3CTS1qeAswm5hDumUYK0Xei6cuKvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178372; c=relaxed/simple;
	bh=WQs83mOR7EB3n9PAfy3Yp+mv+W8nVFvV2LX+bdPbIUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JF7U0i5aUCxrEGFVH3D1d0JhGxl2RO8D5lc/T36P4i6S4av3wf5RbBf5bwbUdePBGDtHcbCzVNPE60S942VTyUiiEwi62RARQ1GX/SpBG4WFlu43Lg7nmaNv8DTCD4QUdHJ4/Tl8I1Lml0qtDKuyPyCf097u9XAWDzM3XbPsSRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ZpqZz1u/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ZpqZz1u/"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c1138ae5so6297054b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178370; x=1744783170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Hsam7wws3fV5478xYdqXaQim59fVQl8gj8lLUlEFKc=;
        b=ZpqZz1u/mquPhjnfxfLJZaNzWAIpOiW9KzEzlfSYE67ZZPsQptuTs0l6BFXBJPYEeD
         h+OGt0P23ZS1UYbfx/PYWGHF34/IC7udqC//hbVdZqmOTrzff6hjAX35//y0pP2VL1ki
         Y8jrgwDYZycixW8oXyMBNAGdXj38HWl9lWoULeqRllTVdT7jjNLNc6iM0ZIs6Y6gbc1E
         WTLCw3AjIsDEKeLNiys7KnVRWcRMrCzEd7SlZqPCsHxUlW50zNCt/KSOtdVWFaItkCgH
         qpZWq9ir5LYR8YDHYJlQWPnRj7KQaQigEr9nNTBrCzEMpyogY1iHQpTEv+h3yu1VwSbW
         ylDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178370; x=1744783170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hsam7wws3fV5478xYdqXaQim59fVQl8gj8lLUlEFKc=;
        b=RwNVtLJlgxYc7WoGSmkuslsNHIeqr27csVmvrqNaJolfvEYLKLb6CzaeU+B/v5B9IN
         TMl3GZ42nTdXtLN8gKbv7LdPubb41AxNjZ6jHr12u/b362OPyhMn7I5dmbX5zVWguNHa
         OlDCInyn5YXVsi4errQYz5ZgIbaroVfe1X+ZPRoyU1xfpdPnBUkoh9k/fbLuGj/ovK2E
         NCiOpSDZC4LKvEGTBB4747EgjQTk/dH5TWVP/9GlR3FTbYMHp1fmda+JmcBCi+mTLP51
         BhVbQNFMhy2+4RT8fsZDHrkxQLihOFhu8L6Sg41d5nk+f1pZD3JddsUgSuviJFEMYdcx
         W1ug==
X-Gm-Message-State: AOJu0YzvgSKzQl7rFFvlsi2DwXMUEj2vL8tomQ2i43Xcyztqv6DvM44p
	DY6WPBjL+Yec7P4N9QRfJLQKhIwOZOIoCZDZ37nkn5Oe/PNI4uGsNtyi7fAk9oYK4P3IU1SAKFk
	=
X-Gm-Gg: ASbGncvJyk/qp8K+Hath7VKRwRcBHGDShSAVZBjzvBlFrBL/GKaTgG9V2h8KhlLwp7l
	E3WjmC5+1cPkV652CBDsMjcOUcNb5NMkjaO0wO/NCRXWKVXREig8RruRSEESWYrnh1UeBUi3Zqa
	ULQyErQxOcvFS2GhLix6jHGjeolBC3a6V2HIhUKqUV0t/y1PBoYM8a6X+GJGWQBg9s7o+v5JLba
	YvGr7E2hPK3rmPAWeacOpMx9tOHNNGQgaCW0aQL0eNqEC47tk+o/1qGJ+sv3Op7YLhL/jIV/RsT
	lQDfy5xVKBTaGTHmPYXuXhKQ1zf97lKSRW1X9y9EpKFaYwwBEPDF/xSlu9l8vuUD7BEDWcY038F
	ON+ZzxQ==
X-Google-Smtp-Source: AGHT+IH75nrpakEktCpqo3/kYdEUc7RDyJJvYvb0XEQUXDTdVYRKf7nF4TeIuxZn+th+xO8qRQFpCA==
X-Received: by 2002:a05:6a00:10d0:b0:73b:9be4:e64a with SMTP id d2e1a72fcca58-73bafd6d5e4mr1628393b3a.23.1744178370326;
        Tue, 08 Apr 2025 22:59:30 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2a840sm430456b3a.7.2025.04.08.22.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:30 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 20/21] staging: gpib: autospoll_ioctl_t now short
Date: Wed,  9 Apr 2025 05:59:02 +0000
Message-ID: <20250409055903.321438-21-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style to replace typedef autospoll_ioctl_t with type short.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index d32f39ddea28..6a92562ae39c 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1600,7 +1600,7 @@ static int dma_ioctl(struct gpib_board_config *config, unsigned long arg)
 static int autospoll_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 			   unsigned long arg)
 {
-	autospoll_ioctl_t enable;
+	short enable;
 	int retval;
 	struct gpib_descriptor *desc;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 0403e285eed4..c66b8d59a46b 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,7 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef short autospoll_ioctl_t;
 typedef short local_ppoll_mode_ioctl_t;
 
 // update status byte and request service
@@ -154,7 +153,7 @@ enum gpib_ioctl {
 	IB_T1_DELAY = _IOW(GPIB_CODE, 35, unsigned int),
 	IBLOC = _IO(GPIB_CODE, 36),
 
-	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, autospoll_ioctl_t),
+	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, short),
 	IBONL = _IOW(GPIB_CODE, 39, struct gpib_online_ioctl),
 	IBPP2_SET = _IOW(GPIB_CODE, 40, local_ppoll_mode_ioctl_t),
 	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
-- 
2.43.0

