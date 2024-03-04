Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C693D0C0
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709556061; cv=none; b=eQQXp3bQh9rWewMwbL0tX/r6CbvgXee9kQl/1+KsR7eivd73opF7K2PZlYgI0e+lCOQXcF9LxE+wOhbfYA11Ver84YsiZW8RuF8OYzonZRQz1575FqfQiXb2icebXAqQeWosA5XxPuzbzZu8u46gle2dpuIxR0BWSHY5wTgfae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709556061; c=relaxed/simple;
	bh=Mx9yfFZlDRhEGAi6cTFQITQdKGk+82HwqJtwudyJEdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DPtu0HoJyVHtB28onU0HoPuboQ44fett5HiAEb0kMh29Tcf4XvzO5XU1ZYazCRB7pCZqYRLMaNa5LzAXpho5xWy1iyl7z7O3gg82wV4HnXjQqULIy/Q1EGL/7GgJhBZRheFeI68dtt1tVnsHqh9X/OcurlWtr4vhgfEtCH/kG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmjeNNw5; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmjeNNw5"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d311081954so49250171fa.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 04:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709556058; x=1710160858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEhyV4w+BuKmLXD3XNkF6phhykSHbp1w6rk3DbPRezw=;
        b=OmjeNNw5J/60dO+DpUXfVSgeIybHyTRwKscX/qttQzFdJDYkzXI0yNIjseH9nArIuf
         pO0s6HQCYtxKYqdqWEQ6dcPm5dpK5FF0d6SHayZ/9u8G9kleSSivFj5U+iesUh52yVR9
         Z+YwFLyNKX2C8APdfQDPcyClX0mUOjR3/V4a02vsnf3dUb2cT6P7Mc6Z49p+VEeb2Njz
         Gj8bTnG/oS0tRg0nLU7N0eBI+mI5d+Y18egw3D6I3spYqL4IejMd0wuq84RgwCTRFuD1
         z4PwbffDi2Zi0FJhXrm9093f5t48DdnOY0TE3NKENOx8PrKWdInU/1D7diuVEpcPaSw/
         DjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709556058; x=1710160858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEhyV4w+BuKmLXD3XNkF6phhykSHbp1w6rk3DbPRezw=;
        b=noHlS0WLN0cFr5QFfuhzkYYxHzoX+6pb2Tm66+VGOmm7B8npUOBpCmE2mFrioL5VbG
         85QqnhJsQAWWlPUOdrpxG75j9jHdLkX/I76FEp09LJAyg07fP7tDbrRE+uDNpFwFBUPX
         2MqOOtJAwSZdYxRqzmPKz4BBY1X6zMR1YrHGMHbY2NP4Sp9hiveDHopkDpOf2hvpuSZP
         LLEPA0TVO0GRwkg7ClAXW0gRJNzK56Ealxy4kPQjGjMYB9/sk1AbcTi34sp8yDVWFzNx
         +FrEtzwbkrmOKAb4H8BZ3Lmy9JS7/xxad5JThrdYRnyIOQyDAceUp/sCoQ58kSHsEZce
         XdVw==
X-Forwarded-Encrypted: i=1; AJvYcCVc7+tryGZ8wiWLfbeoC5Mb8JKJg15eMJi/Ws05m5VOD55PDdY09+fIebKe+qZaaSgnPjGt+YJMvPzCYmvIjWcdvOSFdqigmQX9zyYr/g==
X-Gm-Message-State: AOJu0YwW9fk4NuuZDtxdzo1h0RPM0HHk/h7g2n+vcTqIML7s0onXt4CD
	9PKRjKQD2KuyGH04+LTbzmGq47ERUbh2LveEtBBHtimZX4BPDyu0
X-Google-Smtp-Source: AGHT+IGUaO1jAX+lKG/a/1946qhk5B0/iBPmRyUgMXw4AFiNEBGtS8vbESyuqKFMzb5cTDeS+eR0GQ==
X-Received: by 2002:ac2:5196:0:b0:513:26e7:6c0d with SMTP id u22-20020ac25196000000b0051326e76c0dmr4981795lfi.67.1709556057446;
        Mon, 04 Mar 2024 04:40:57 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id dh18-20020a0564021d3200b0056760e830f0sm651747edb.81.2024.03.04.04.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 04:40:57 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	philipp.g.hortmann@gmail.com
Subject: [PATCH v2 3/5] staging: vt6655: Align parameters with parenthesis
Date: Mon,  4 Mar 2024 12:40:04 +0000
Message-Id: <20240304124006.26819-4-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304124006.26819-1-dorine.a.tipo@gmail.com>
References: <2024030317-multitude-pelvis-bcb2@gregkh>
 <20240304124006.26819-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct parameter alignment in bool card_update_tsf()

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 77662056c52c..2fb2b1da9136 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -288,7 +288,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  * Return Value: none
  */
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
-		    u64 bss_timestamp)
+		     u64 bss_timestamp)
 {
 	u64 local_tsf;
 	u64 tsf_offset = 0;
--
2.25.1

