Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584894B9236
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329785; cv=none; b=aOIWcwBfTH4tFcqlEhhb/rRnGqk0R5VX4R8L8x1d4Pw6lmXG7rwhkYCdOepTWdYWQhatCpzZa/LXvTfOUkdYc5YDWVAxGBeTaXAA9rC/UI1Q0YobOHntczSv5gWyjGNnpEJBHKEw7h80hhCiXSf9FnhcmlM4hKVR/bk/iGtmdWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329785; c=relaxed/simple;
	bh=N2JeCWLFfoU+fSPfPomIYnFMAghodOlr4AC/9OfNW88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=srV+J9vY2mEJipZIFpgIwpEngvUiivsxhu8FDrbutXV6hnUcI1azR7Izp3uobNJn+7JhQWwIENo4ctZtsbHlN3A5nUhqgcYGwVRAMncrwvD+MT0T/ZbbPjJxXFKLMDNX1dyLIL3CP5zNugW+x/Ih/XGz1bGmNftH4p6hYwd9Yn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5HmFKi3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5HmFKi3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so16237835e9.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792329781; x=1792934581; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEOyoCt2AD7D1bry5/d2H2T1Ku2G2ZXxRyhNNZRqt9A=;
        b=r5HmFKi33KKNKhFrwpURV2g08hOmL4lkpsQbxPKkG+hHk1JPUTEVcsDir9JAO91Qto
         toVyYs9m2R1/z+fgE55Ur6qxi3MBUJc3J+wvPl2RY3SNnjiZM38mB9d3/lhCxyOP5xJi
         6YLvEXdQmjByV8eS1Cbv04tIqQGUxW4xLdXgHaLI8pSG/WfnFLkjEUKh6+wrWeBMMDsS
         oaiHE3cxr+lyNrbwPIKnWMCwtBZZDeWIrr7hcgj12jmhTOKImQe7/83xyIUSVmhX1M1l
         KW2DpCgdRnmmo3Y1lbMMEUmkhW2JK/LuPz3PSPd46r3ViZsQGOlpQL6WHLGzlpPOBhei
         ekaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792329781; x=1792934581;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEOyoCt2AD7D1bry5/d2H2T1Ku2G2ZXxRyhNNZRqt9A=;
        b=szBjdR98P+25MzzrP/Z6RWJOs+akhnFYyVL7ZxcdmJGIsZrzUcFCrJGJtRNs5IrJ4I
         acUpC9JXEM/ZQgbi18ES5LDRgqv1LCji87jEWg5WUl1//OJlZmNfRyyTNHGQ7OAanTDB
         XU7eiXRvGIOn6Trl/d2xK/ehlSYMd96mlPfl6fqE1bSpczBe64cbzfllMcf0oYjP1Mxk
         FcyC/kvWgBYohZEz6S64cahScB1C6ZiL1UcFpMbCYH6A6CnSbVJGze9GryF8ibremwXX
         jK3SCH3vjF/pwN/Aq88axvGREIaaMMVWsMyDHQlwJzjEJCOcHNkcFCFGKNzurip5DQ0V
         W+sw==
X-Gm-Message-State: AFq9FYKVdZt0buobEgAEPKoQcdIjmmg8tVXT/U7/gcgTenSK9lEu6wNp
	1AX1htOfMF0ZVKcWjPEsjmkYgT4HKH6zUOyNjfE+avuspHom//6Uvj6f
X-Gm-Gg: AYBFou1nWkCai+cOKPmEX90b2oOMdeiNYZaPTPKbDQbqQwtsqk4emBSYyZ6MiofoBsC
	D7JDqh3tq2fWXV/z9Nj2Dq2oiiuSwpffSrNEl2uPbi8n7QIy/1Iplwt3XfEB1L74gYsRvh5lFci
	1f1F1ySX9gBugu+KToSmecBbSRFR8xbX6vwfDhZFgiyKW3BGzzZdGNBdCM054nwbXUTCBEvFbtA
	OKmKwruLrdl3A7o3uUd0LkYyxhbnVZr2Za4K8mrVqOBbGrSCXlp2c8lsq7iKWTWkcNGHXG/SnFt
	8hH2mOv3iIfS7qQI62kBNGpnsMNRnd7akQRBhtfAl8pdlEfQzMgR8Rm62mGCHtDfRPIsKGaPJcd
	LlcBB9q2qfj/dfEYqwjXdu4VyDsU7JtDBt6sWzZxbOh8aFU1Hl+Weoz0cvJ4+fmUJF+i1QEGz+G
	Q47RpLXq8WGu7AM7aEX/W/k+9orBC4cMK9mtKFmmjbNNOvFbcr/Nq75u9MaY9DhTso
X-Received: by 2002:a05:600c:1909:b0:4a1:dbdd:d56b with SMTP id 5b1f17b1804b1-4a1dbddd68emr85495375e9.19.1792329781242;
        Sun, 18 Oct 2026 06:23:01 -0700 (PDT)
Received: from ubuntu ([2c0f:f5c0:570:10ef:ebdb:1ad:9af2:42a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ccc15aa1sm195044575e9.14.2026.10.18.06.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:23:00 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:22:49 +0100
From: Comfort Oyewole <coyewole7@gmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: comedi: comedi_fops: fix alignment to match open
 parenthesis
Message-ID: <atTIKehBxn93Lcix@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix the alignment issue in order to adhere to kernel coding style

Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
---
 drivers/comedi/comedi_fops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index c09bbe04be6c..efa6dc6d40a6 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -2648,7 +2648,9 @@ static __poll_t comedi_poll(struct file *file, poll_table *wait)
 }
 
 static unsigned int comedi_buf_copy_to_user(struct comedi_subdevice *s,
-	void __user *dest, unsigned int src_offset, unsigned int n)
+					    void __user *dest,
+					    unsigned int src_offset,
+					    unsigned int n)
 {
 	struct comedi_buf_map *bm = s->async->buf_map;
 	struct comedi_buf_page *buf_page_list = bm->page_list;
-- 
2.53.0

