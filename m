Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F183EC2DD
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 12:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526549; cv=none; b=CjkWMSkiHIY3qfEGqY4BPjTU5a3OeSqIKNC9Ba8x6vPOHqKOWgZJsXEfbHY7ZG30KkjNlz1xLn6zUom8v82O4qqVl+ujHanLyiq0KphVt9luDDGI3Br3/n2BE96BUbk+FJGS+keZ7ehBHxR7N2KwY+pF3ifKxcs8hR0XZldeerQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526549; c=relaxed/simple;
	bh=yxYkc8LlaFlAm5Ty/OPt9BFpsKVaa2jVKTCyyD+FqJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FoPfckociRASlouw1gnP4c5dFyRXvMeWFzCJsG5fwElfC95DuKN+3VunnoqK3d3tjoKNQSksDdvYRIGBKXlHsXfQZ5yCnZoch38ykv+HqkrHeDCBTN9aOiqcEFz5sJmlOSXbo5jlbhLLoldqXBhPisMzu2slqUtDxgXim99HUCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmdAL22l; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmdAL22l"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c859a374903so857708a12.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 05:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526546; x=1782131346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSUHQnyDJHuH1noieWmfYI5zMHkPgBmwIZkiDH+Xv+s=;
        b=FmdAL22lNHVcXwMd6BoCwiXTvUbsKueFZQ8va8Sp83WtcEelaTZ9aruZxWf6pe2tNZ
         qbEZrXlZ1lZeOvN5xZ7vt1/hjkDG8NTvU12jSKug6cLhjFlcJklFdK3n3k/zt4m9Ht3R
         rr8ulZb0an1AGXlUEkCOFZPuVwbiGj0Lmf9Jz0ZA3qy17q6HmLHpKbuTC5WKmH4WX//q
         fLQzq9lZm41ts1FE3bmw4LVi06PeYV7QOVzEu3LIMR/M5ShKcOB+RiN9JivKec1mCvEs
         qjec0eUEqIYSQvKx2nDeLgg/SvnXutsiT9e1SJmIObE7YTJ9gD/86t90rB35SkD/TCr8
         8jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526546; x=1782131346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSUHQnyDJHuH1noieWmfYI5zMHkPgBmwIZkiDH+Xv+s=;
        b=WwdA9tCFhbwiVcguLrNRvvOIY+yHHX2uPiCJlqCimUR7ZHnUOjyaBPueGR2rbDHaNq
         LwhErSUsV/NnxUO/f/CEl/baPXAPFLWTZ6zXjzdRcqHdFnppo2rbJgXKkWiioWqCO/pa
         itEf/nvbJsk2y83UIU1Uvuk/GDebPmETqlvbWE5gOJiQ6z3bPFmbdzJiu2/0TYt8LGz4
         sp6JdpB5WYX8p2SOa8YgHhyu8etcBGITtW4KTWvSIqTi4iYsD15ScYSeekx+DT9sJqhH
         FXnoYQRfIdgaeLa96RXPYMWicvwIMWRV/zAYM1aK4S7zEnOZcCT3Ol1FoefTMTJoPsxi
         aktg==
X-Gm-Message-State: AOJu0YzGvs6J15bWZAYFh9dVukAAG628MjHVq5VpKqoG3bqSwXdKWwaL
	r1uPx40U15VKF93twt+Of35nwiKXzEIyRwkx0c3ijwnzkCsDqHeo7PdO8TfzopPkhnk=
X-Gm-Gg: Acq92OHGQ+ilfPQ2mXntGnBJx7ULsGesG4PF67KxtuQGm+jd2WXjpb2EH+VEQdlzABZ
	+xyBy6/EPpdaxjsFr7YnH+eoJF8XVutktcNvtTQEOZVhm6eQNu9MnungZGECcehrVnt5Ekh90dh
	PhSLKDeAQTNep2WhcvAHq4gXwVeyoAHfAIZEWIhc7RM+pHn57NosZonEFKDEUT6xr7yUrGdV8Nn
	Lr0fqamK/TjqfrdokjI6c+Z5aDJBzfqgY4u9py0WuH0WLJo0kMgTCYP3t4EHxKv10Cy/bHvpZTF
	Voe8TZCwxq4SDdXUn7q0+Wpk6yhQdflMF1wTLfH9zoK3z0/2/DqGJvUk9e9ToQ1iGm+I3RtfRCH
	81Z6HBxsBEvt9g5ZfSH9y/IVBPrGrdj/YgMeNskLO/g6GOvoJqOoSt1qyBojuym85nf+9XhejZ8
	m4nVO80HK9ffIIBra82eArhzoIfkPoiHwI0Upg5EpFJDJbgXfOGf0=
X-Received: by 2002:a05:6a20:4c8:b0:3b4:8625:55eb with SMTP id adf61e73a8af0-3b7840856dbmr16918532637.40.1781526545789;
        Mon, 15 Jun 2026 05:29:05 -0700 (PDT)
Received: from localhost.localdomain ([103.87.58.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651a0090sm8701926a12.26.2026.06.15.05.29.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 05:29:05 -0700 (PDT)
From: Devansh Soni <devanshsoni874@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Devansh Soni <devanshsoni874@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: wrap long pointer arithmetic line
Date: Mon, 15 Jun 2026 17:58:22 +0530
Message-ID: <20260615122822.31103-1-devanshsoni874@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap a long pointer arithmetic line to resolve a checkpatch.pl
line length warning.

Signed-off-by: Devansh Soni <devanshsoni874@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25e..d727a00f2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -184,7 +184,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
+			    ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
-- 
2.54.0

