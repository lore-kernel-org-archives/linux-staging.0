Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEA71E0DFE
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180754; cv=none; b=Cq6BYyIRpZkeYF8XhdgpKD5m5AKoUug9i/3ntJoP/utgKHC1JzmEEBz2GBgpq/m8cEmn6fadjB6wOwANmgK92mRlDKLz52mEGwplhy0iIDBMafY1m2UazREm5x1BCJB1YFzT5yUbQ9iLqlsZgoHRiDu6fXYpAPOV9SX0NYLzy2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180754; c=relaxed/simple;
	bh=lbWzrfSxoPsXNh23i35B90AErhzV6NFtqL5WnE4hLk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBmchSHDmh49no2kviqhT6zIpJWdcC4WDjbgKBEcg+tNY+qpAh5uua29hxwEYLaMxjABHi8E5yxKk+m4w8HpY+zL1u+xXXsO92MHYO4SaJXydfa7CEJvchYzg13KwmcP5bw2X57vTTfoPPfdG70dF+OKYCPScmqqB4cqJzJ2xX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Szzbnr4b; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Szzbnr4b"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22548a28d0cso90923625ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 23:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180752; x=1744785552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ghrmx2bE35yIGMxnGFmWMpdfYImfYt/E9YirEFcLv8=;
        b=Szzbnr4bCUAQNNUgYsdSgS3Khy/PFNy+t4a39FQWDExU7tl9ifGcTFfkUQLq3P9Zen
         eWrVAbpJQcjZu5sZGxU0Kv+myXXsjQo6QMZ7odW0GjQ2QiIyZQr4fel6kGihYgGyKWlv
         6gZPA9AbPbbrPzSlQoN7SRJNbRpCGvGjJORAi0VsAfXWBbAWz8dgGxZZgfnjoA0JfmVl
         5uPKvekSAO8xN8TgPFNwDwVDYt4KUtbc939tj3mr3zREDTCyXialZbMS9ToRajY8IrDP
         ZXpK3ZjbGpHknVlLxgJAlfAoJIXtRn0XDbVL3raAv6wX+ns2yQVq7fcnVDUrFiPcYIlI
         CDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180752; x=1744785552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ghrmx2bE35yIGMxnGFmWMpdfYImfYt/E9YirEFcLv8=;
        b=YQIEQWtnjWHxVnV4pKIIOGuDGVwOzjTyIlhob4+U08I4OLXMQFBIbTodelcFjXq+jT
         IHM0Crs3K6FguVWPb5Uxx3TG16XPMYHWbgXcvTJeY6RopiJK/bFdQ8IfCvjjWlNv8kkn
         2+8WRuO20Du/10bO0dIts3zYu6gW89ksYvZehPSoKDPk573bNu7dc/ykMLj6/oalSd5S
         yX4tnf9Q9hiIFpTbd9bMl1FEliB8h5sWQ5c/50wTMq6FgFNoPChCzGBvZOfTF/RRW/O+
         TbI784sF4PK4C4w6pzyrkSY91inaBrpzhTegIXEy/eU0o4OZrHwUGfAsabkzfphkK5jI
         /ToQ==
X-Gm-Message-State: AOJu0YyVLE6LxhXBvE09HrDeZrAq59fGQOnzfPlB1zE4VzXYPLQonouR
	0pxRpMfEkChVKWgBmiFI8h4XQb7dY2YUoo69BDm3ccJm9+ebfWLvHnlPmQeJog==
X-Gm-Gg: ASbGncvEU1Y+AZSrKcF71KwsmTm/7LN9ksog9xDhvJhgz9FPfdGT24u1v+jTSfzPcS3
	G/TJLJGTxUcsflgnfMfQNMhATSros3Av3O+V0XEuQfW2XmTsm0FC7LFlJ6CREnMbI1YyNJXQGz3
	K8yOvsZlFGh8aTW6QRv4Zy4HAmg/idc95jyPsj6A0TzjB5mZy+Hva8BJD/NAG3/fLF/jVjJJlIi
	l7NO1XUiytEBwSm1W6LxkQPyy+qN9RQmhaLLWWo2WtkW+pHv7OgxZZ3+Ph5fumKay0pChWx9gMi
	YefbNIdl1u79tabDGvts9/oJDEussd4Pudw+H8jA10a749/eSabMdxbK9siJDWDkFXab16q+VPx
	otOckjziO6HxtVm9d
X-Google-Smtp-Source: AGHT+IFjzbXsLisx7KV6HtAFC7qVbyvtSDdxy4cNHwSZovfA2ueyfE/nA8ZlrXUzMRtoqUKHrPLKdA==
X-Received: by 2002:a17:902:dace:b0:224:584:6f05 with SMTP id d9443c01a7336-22ac2a1a71dmr27494845ad.41.1744180752513;
        Tue, 08 Apr 2025 23:39:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62864sm4236635ad.22.2025.04.08.23.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 4/6] staging: gpib: Removing function ibAPWait
Date: Wed,  9 Apr 2025 06:39:02 +0000
Message-ID: <20250409063904.342292-5-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409063904.342292-1-matchstick@neverthere.org>
References: <20250409063904.342292-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl as CamelCase where function is undefined.

CHECK: Avoid CamelCase: <ibaAPWait>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 247a73846cfc..73d7c7ed25fc 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -22,7 +22,6 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout);
 void init_gpib_descriptor(struct gpib_descriptor *desc);
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result);
-int ibAPWait(struct gpib_board *board, int pad);
 int ibAPrsp(struct gpib_board *board, int padsad, char *spb);
 void ibAPE(struct gpib_board *board, int pad, int v);
 int ibcac(struct gpib_board *board, int sync, int fallback_to_async);
-- 
2.43.0

