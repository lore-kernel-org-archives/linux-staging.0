Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E085298CB2
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812175; cv=none; b=i/VcYfPFZ+9CrNCyzHAkWw3ahtduRLgQDgMiaongCzM1H1cUNhEwb18JRaZFlzfho8C0OHvP2sUisFPzN06r5nJotr9G64xZrZBB8twYypiuQ9EJcJMhoUQ1FX31XzgI9H7gtMxrZNsLmcXv0KH0KXObsOSYecKXT0wlbyLNEbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812175; c=relaxed/simple;
	bh=1YLdQ/msyd0W121tLsFiehlIe+lkIMz1cTQ0oAyZowE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JO63JL8TIxLCDYC10bKdH37OnsNwKEPMqrfmzYt0P3b4MhN6sUsFRgC7b3MDzWmoelEhIUFgEsUIM5pBEmTqdo81dQiFJJ3Bl8NF3W1+ASW6hgXxmYpDQ89wvOK8Q7dldrJybuw7GDuj72utHaZQgqKHsf25Ks9KOlCxmlIbYCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7YzyLNM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7YzyLNM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so10580835e9.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 12:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781812172; x=1782416972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YpwL670KpkXw/0Z8Fkpct/A1nyX8uS033EDlJlU/IBI=;
        b=o7YzyLNMs1K3swFp4p4uZ37cBlEoHWDKRggZpKDDRXTd2iKJS8ZJ5RvSzJ3T+Wyfa1
         GfX9TihZzla5oFZ+4qZp+aORRrI0vG9sQf3+6VnIDOCEB73MVy5sHKogfif0pSw4J3eY
         JkRq6V7HCbF5yLO7r70rK01KESYhBPeeGwn7DYcD1Lk9hySJxQ+SOvAavEwfUjlUfJEO
         kzCWVC2eEu8WRSo4fNZAiPnBJRL1/ugQR8D/ANKCEd/XWbGt+3WqmuYBLxUgRGB2FvLo
         mTXQAUTMLz5Oyy7Q8OVCa5solgcDUz92TtgXSkgSDrJGglX6y7VrKPtuKaO6DqEiQdK0
         eObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781812172; x=1782416972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpwL670KpkXw/0Z8Fkpct/A1nyX8uS033EDlJlU/IBI=;
        b=VcUhco7sX2OY/p4FFmL9tz61d+8oQfeHNKODlptefRmuxroNR7vOhc7qma49GEyR91
         ZMeDj80FhgacPMvwK1EBF9K3Na2cn3kvBpaoH+Nm3CYkxtQ4LRPP68AGPayolw5C+nze
         ZsuATmHxZdcNAU5MHcIAxeroW0KX1QF+m56nih4MEnWDN789+t2LLEB2lnBHO6ezDMdf
         N4zefi9a2ZmAwCjog4naqNr8thG23VWiB0ADTp+lSBB2MFRpD0Jj8OAA1dsXNSyfr+gT
         Z5iMiP+azzpQJqnPT01zHvMnPL51/pYkx0XV3mpIzW3selNy3qLwReTdLQpZNTTpJN1S
         rIFg==
X-Forwarded-Encrypted: i=1; AFNElJ8khXjg/TRQXmB+KUo+AzglfGWfLRu/LhineeF7E4oEbds+oV0pRqa99y2yLovAO0rBSIyd21aauDBXKRCw@lists.linux.dev
X-Gm-Message-State: AOJu0YyIG5xGfq9dWtN+TT2nUylDoJ6uDJZs4LPbB3EvAWRXc+G1fZGl
	NDC4lG4uiSvSHxuQlxBDZhnHPWrYwUaJrYj1BMTJy1c4DB09Jy2u1fu6jOJS9cvW
X-Gm-Gg: AfdE7cliS8+kPXlprpjQR1HAY8rwXM9qFQDtzYh8AKRoHNPmOk85jxFSryaYza96aej
	cIQ+I+yjAJFv/Xe1ldufQKhZeZ9o7FaK/yoOPls+6MSnTZh1M+AEJJOvqsI8qnNFOoXOedDjjsm
	Juj7ndcZFi92tRueX6y0adC3vNEI/EE7SO+QBnBbogdwpC+I9Z+wAj3vJ8Pzt/Ebh1KQycVBEK9
	IeBQQEbtOId6IWMc4zGi0mQnhlHYkumPapo0E3dqLmr9aAYZlKCIE43/9xZKQa2PJZoetgNhRNt
	qgcfH1zGT0B9wvtgydPnyDwWpOAmv7hhb/geJOICi5BdtnlpNO7ZgeRzQNrtJnc3v9E+Dq7c/zG
	HFH0SVacm8EStrVJycnYq51JSAZxWOMZQxTUiW0X2LQ2w37J4o9bwO4to8lyRyfP0HiY6dhkHw8
	Xt70tEFnbbh/I+rmtZxS9BpZdDPw==
X-Received: by 2002:a05:600c:6089:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-4923f579721mr17437325e9.22.1781812171449;
        Thu, 18 Jun 2026 12:49:31 -0700 (PDT)
Received: from localhost.localdomain ([115.187.36.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240ee9bc2sm3073735e9.1.2026.06.18.12.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:49:31 -0700 (PDT)
From: Joyeta Modak <joyetamdk@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joyeta Modak <joyetamdk@gmail.com>
Subject: [PATCH] staging: media: av7110: remove commented out macro
Date: Fri, 19 Jun 2026 01:19:00 +0530
Message-ID: <20260618194900.8771-1-joyetamdk@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

av7110_ir.c contains MODULE_AUTHOR() and MODULE_LICENSE() commented
out. This file is compiled into dvb-ttpci.ko (dvb-ttpci-objs +=
av7110_ir.o in Makefile), and the MODULE_LICENSE(), MODULE_AUTHOR()
and MODULE_DESCRIPTION() are declared in av7110.c.

These commented out lines are unchanged since before kernel moved to git
which was checked using git log. Removing them will clean up the file.

Signed-off-by: Joyeta Modak <joyetamdk@gmail.com>
---
 drivers/staging/media/av7110/av7110_ir.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
index fdae467fd..e84f9353b 100644
--- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -154,5 +154,3 @@ void av7110_ir_exit(struct av7110 *av7110)
 	rc_free_device(av7110->ir.rcdev);
 }
 
-//MODULE_AUTHOR("Holger Waechtler <holger@convergence.de>, Oliver Endriss <o.endriss@gmx.de>");
-//MODULE_LICENSE("GPL");
-- 
2.53.0

