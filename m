Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC552D0617
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 06:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706315; cv=none; b=u6YuGZFx+KLKHLTgVNnAOWW2SVOdyHB+vOzG2DPjuCSURseCeEGbu7m9gQIo+oyih2QDpaugkuYyf4rFzRyQRG2ILnn/pu8JsQoxO71qpEuAb/aqvvCuHSK/H8FVUzoh6UhtQID23EBnYL46F4KMT/O4EP5UdNLuPqWGLKxZ0Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706315; c=relaxed/simple;
	bh=MNc6p7YjDNVx9G731O4kkfBQC/qRTbBv2lUZcHZW0p0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QLXC6hBOAw8xbfo1SPHdRvVRRkY/kZaqKfUwP1gtHSsuBqz3p557NA3+UGNqziFWpQxUTOmmxLpJacsZoHVLRYveG/koSPw2jVjimcOMIUzkL88dCGoaNAWUMaXBuN5HwaxjcuwPDPqsTcKjVYWq1CBaL1nf0ia3bifrxBeMrE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvZQasFH; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvZQasFH"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81f4e136481so1899763b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 22:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770706314; x=1771311114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl8fkH/UsuCPXzSRC1khYViFV8HIeCgDsQabT6aUr50=;
        b=QvZQasFH5efoydVdtLvXKFI57vWJhhO846naIV2XyKNyua9BvbANib2zxyN9+0IR16
         6oQa98dZqEAwyOm9pFnnNJOE9MTmpotyro+AzGUYoZwTbkgFJQS/sh7JjI1EWxs/+EOS
         N+/UPtuHBbxE+bYFdqwRplo2LFHB3mw5p8GE55oqCI3QC+oWMcNhLU546dXl6M7ZosZx
         FuCTtZtKLd71IuXLdUAE7HiGbVTbL4oIQhzWlvWy0FimHGt7MkWTKakOD6uP+GyvtnTu
         sC8lDQIVT5Ykrvfo0qK2CjND+y/zLsbDqDSw9VTOOyzfmWzaJpAjpntCIp17uLpGJ7qQ
         qxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770706314; x=1771311114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl8fkH/UsuCPXzSRC1khYViFV8HIeCgDsQabT6aUr50=;
        b=QT+bUweATlpW4tndGE3BIPqZhd1TJ1qDRB0NFDCwSIqxENn+EoW4Gpn3HejFrn2EHX
         IZM5oh9+xxv1iN/1E74aFQEkCdjOg1/yixWya0Ie0EkufhpADgJj6ESMYW96CaMt1H0H
         /9xtDC1UR9fPXlAyBhRCzJUY1eY1qxb7KDO4p9lL72uNwl1/WFYwTcMnXZmxWzd9uDO0
         Od4X0LWLV9Jyg7ggacHPTZnIssRydu/GYro8n7T7D8eVmN6OGOsfun0vJbpqdThChYGx
         LVplIoJRNSxz4rFid/YS/hF1ELqL4QpPf/HRhX+d1s4kNp+bf5dXx2bFoODVT0r1cx9Z
         t/Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUzZI7YOhMwBqdJTSu4gIquFrwwqvmhA9seEFeqdWHtN8ZZRT13lDu1mj2taQEkU0TbJ7yOzrxvFwXkq+ze@lists.linux.dev
X-Gm-Message-State: AOJu0YwIWdISHUR94HeZbDKt4XvwBnAmXXYV+PSwlQURE9c7cKTFR3a9
	WjUeHB/6t8QVpFR/L5uABLzLVCY57sZe6v0d3QmTzdmUhsYQDsJcMkfm
X-Gm-Gg: AZuq6aL2ErbfzsBJmd/IRREajpGJmyug77Y7b2n8daKH37xOiykhwltD0fD45Mnz2q7
	Xgu6TSGWpwz989h4f19ux9rW/4iNAjFkUJDyQVW2UZFH7VPQNos+RdmOCVq3wpF+tkb6v4073dZ
	IMsSvpTYk7ACfufRtwxWSg0dWjP5EB4HlwLXyDnRLX2KzNfs1cfPkwb4jItWGm2J6VLL08COxK3
	DX0r1/3IU6C1bsv9dpLtUt4DBxYZ3IeiKx0EU9qnnbNcIWXHIVtsvwNPDq3Pzc4oLKhuruYNw45
	/XUIJfTahC7E79MsU+e2erqeujnjj9evuFmh5I1cDNPhfoSX5WBSXDHTeSsYljOaevlC5g0mHMr
	lithuU6mGxooFf/onaDT9VD/wIVzUX2A/A8dgZiwjv66qzP7CZKZ+5Zeu8slHqgx72jwdVtzBnW
	m0M/pK1S0hV5wY7q6nlqbcXyUjawy3KA6enKWiNGhUPL+D4UtysKwEhFGHpa+2AeVznEeW
X-Received: by 2002:a05:6a00:4fd6:b0:81e:96c9:1325 with SMTP id d2e1a72fcca58-824417f97cbmr12492282b3a.70.1770706314074;
        Mon, 09 Feb 2026 22:51:54 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b3b80sm12154180b3a.48.2026.02.09.22.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 22:51:53 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH v4 0/2] staging: most: dim2: logging cleanup and modernization
Date: Tue, 10 Feb 2026 11:51:19 +0500
Message-ID: <20260210065121.3661-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series modernizes the logging in the dim2 driver. Following
feedback from Greg Kroah-Hartman, the driver is silenced by moving
non-critical info messages to debug level, and the remaining
error/warning messages are converted to the modern device-specific
logging API.

v4:
 - Split the work into a 2-patch series as requested by Greg KH.
 - Converted non-critical informational messages to dev_dbg() to
   ensure the driver is quiet during normal operation.
 - Converted remaining error and warning messages to dev_err() and
   dev_warn() for proper device-specific logging.

v3:
 - Removed "staging-next" and redundant "[PATCH]" from the subject line.
 - Shortened commit message lines to stay under 75 characters.
 - Added this changelog below the "---" as suggested by Ethan Tidmore.
 - Cleaned up temporary submission notes from the permanent commit body.

v2:
 - Rebased against the staging-next branch.
 - Fixed CC list to include relevant maintainers.

Zeeshan Ahmad (2):
  staging: most: dim2: move extra info messages to dev_dbg
  staging: most: dim2: convert pr_err/warn to dev_err/warn

 drivers/staging/most/dim2/dim2.c | 47 ++++++++++++++++----------------
 1 file changed, 23 insertions(+), 24 deletions(-)

-- 
2.43.0

