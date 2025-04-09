Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2191E7C09
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178364; cv=none; b=IH89eSHUZ4zvAIZGx1Sv3NcaaYQiQLKipzjx/Y0sGvMt7F6yJ+TXHkMotvApTnb7OYqJijGqqTAjs6erhP9Ekb7PczPAAkxtaQBneN6juTx+ZRYFroMAOXhj+siulsB2TG11+R/GLzVhVSQ3/rU5go7wDtDNBLl/T582KmHofYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178364; c=relaxed/simple;
	bh=DyFt2+uyue0P+cm4YTjmTcgXbSDc0WT/k4eV/cY4q0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyMC3W905XXDRbmGgoJgNmlHLgGrFvRW32lCBBZMTDFIzzP8tpJZzhON0fga/L70A8WOBdfRzrErOp9gf2Bqo9Jujihbs5wAkCH84BWQOCgXwnQW1dF4fXGv5MG2crnfbB5bHpOhUMsFMIrIwxafmxfysUAw4MZP6P01OoIFE+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=UbSMRXK/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="UbSMRXK/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7370a2d1981so5444353b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178362; x=1744783162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/nJaV/Y7GI363GYCtXUAn1aXn1N+OacFtZoTBjJ5uU=;
        b=UbSMRXK/ty5BlQWMejudlUoz3JfQ3fGrnnWtqOtr0uu9tE/eauLc1+eP2ADvAJQd50
         opFMUCHPGFeLnnXj8tDSRy6O0jpVarVt2BcNA2EP8bQqmAOz53HiQ1beL2V0f3Q2lllI
         hFh6IXsshv+a5eczpSAj7pzUFnxdMwk8P1fxer9qurkiSvBmpPIV92r9A5nSDFJpjRgl
         tRQVris28XCJDfGegd4e6gYfvIxn6RIJnIy/fjZPxxwBqzgn9XZQOli/w1NMN28JQ5a7
         6rRc2qjRxS3K5clQdGPDMT1kQKfLJB8kwrEYM7ttvzGgRyAUMMKHdBqRFPGWJ3940A6f
         3N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178362; x=1744783162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/nJaV/Y7GI363GYCtXUAn1aXn1N+OacFtZoTBjJ5uU=;
        b=usuzW7WvzqgrHvc4qe0eShJ2wewXzyLcnGilxPQ0URjY0YnpzjZHqhvFBB3XRQ5hIx
         EE+gtQ4TVJRATvk7ph9e4NjWQozJCzgA5aATUYvvZ6Ov+YM97Hk7BSjc5aCr9g0fzpjU
         g5bNCgTV/6tfy+TDzWqnpTHcZyje7GSzU9woPNEm0w5dZpLdzCaSN2WLFCkBXdJYsiFS
         dt1PJiE8LmSpmYOKbrgSF0TunOGy9E4oGiwx4SIOFUEDbLYExte2QViCmge3rypKieE2
         HF7FU1tA3+WMVnawsyv2jjqeKLKeGwIdguxIZskp0u6+qG8aPeeKQ7NcLp5jRWQfHhOk
         YKwQ==
X-Gm-Message-State: AOJu0YxJuYW2F/+Mqo7jGDYhO1s2GIN5WwL5XHSymG9opF+Hs2pz1vuc
	TxMOt+j2lpEb2VTpV8DOhbL2QlSwJi7HlmXiYkG2jnU8/XwRW/O15HrNBQmEtA==
X-Gm-Gg: ASbGncveZmLRRkmNIR+yWy5Dw8iDzJ9SKgkv6YHTOhGEvTqjmJSNxmyhX66gHVdtmo/
	NIHhI9UlQOL0qUrOFXo83kSoZ3aYe2VZWAkbj6r2RUmO64wX7YM9pI21eP1OHc3zX1KCLUmL+TB
	mNDWGYcTionHYaRYN+khreX+rSU7WVfC/rehIkZLbFh4A6Qf7cIfbgSLaWmT0tu8n5JB2bOFJou
	0Lrfsl9cHe5+AU9Yf/QDp8OpB6bUfHBuPkL0/ZdGl0ZLxCBtrhQhzi65PsmXtbovGjBhBvhawdJ
	+0F6XA0uLxJRxo+OZ4iYhckDGItWXPjFB8HmKCNftkt070PCSitGsQl45ubPXByUPGZy7HK0RLD
	SwvvekA==
X-Google-Smtp-Source: AGHT+IGTSYyhxmuxAeXj1ewKl8XgTsU3tZLEhbSXU6xsRIIdS6DmWr47BGlO2BCBnc9TSU/AyWnBKQ==
X-Received: by 2002:a05:6a20:d04e:b0:1f5:9208:3ac7 with SMTP id adf61e73a8af0-2015b00f7b4mr2059829637.41.1744178361921;
        Tue, 08 Apr 2025 22:59:21 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a2b8sm396075a12.58.2025.04.08.22.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:21 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 13/21] staging: gpib: Using struct gpib_pad_ioctl
Date: Wed,  9 Apr 2025 05:58:55 +0000
Message-ID: <20250409055903.321438-14-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_pad_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 3939c85fb533..2fc93a3c4b00 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1438,7 +1438,7 @@ static int line_status_ioctl(struct gpib_board *board, unsigned long arg)
 static int pad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg)
 {
-	pad_ioctl_t cmd;
+	struct gpib_pad_ioctl cmd;
 	int retval;
 	struct gpib_descriptor *desc;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index df428899ba3f..7cb09cac6cd0 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -92,10 +92,10 @@ struct gpib_ppoll_config_ioctl {
 	unsigned clear_ist : 1;
 };
 
-typedef struct {
+struct gpib_pad_ioctl {
 	unsigned int handle;
 	unsigned int pad;
-} pad_ioctl_t;
+};
 
 typedef struct {
 	unsigned int handle;
@@ -134,7 +134,7 @@ enum gpib_ioctl {
 	IBGTS = _IO(GPIB_CODE, 11),
 	IBCAC = _IOW(GPIB_CODE, 12, int),
 	IBLINES = _IOR(GPIB_CODE, 14, short),
-	IBPAD = _IOW(GPIB_CODE, 15, pad_ioctl_t),
+	IBPAD = _IOW(GPIB_CODE, 15, struct gpib_pad_ioctl),
 	IBSAD = _IOW(GPIB_CODE, 16, sad_ioctl_t),
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
-- 
2.43.0

